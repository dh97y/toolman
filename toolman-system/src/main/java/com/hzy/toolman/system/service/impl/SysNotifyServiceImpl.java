package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.utils.DateUtils;
import com.hzy.toolman.db.dao.common.TbNotifyMapper;
import com.hzy.toolman.db.dao.common.TbNotifyRecordMapper;
import com.hzy.toolman.db.dao.system.SysUserMapper;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.common.TbNotify;
import com.hzy.toolman.db.domain.common.TbNotifyDTO;
import com.hzy.toolman.db.domain.common.TbNotifyRecord;
import com.hzy.toolman.db.domain.common.TbNotifyRecordExample;
import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.service.SessionService;
import com.hzy.toolman.system.service.SysDictService;
import com.hzy.toolman.system.service.SysNotifyService;
import com.hzy.toolman.system.vo.SysNotifyVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 17:27
 **/
@Service
public class SysNotifyServiceImpl implements SysNotifyService {

    @Resource
    private TbNotifyMapper tbNotifyMapper;

    @Resource
    private TbNotifyRecordMapper tbNotifyRecordMapper;

    @Resource
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysDictService sysDictService;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private SimpMessagingTemplate template;

    @Override
    public List<TbNotify> list(Map<String, Object> map) {
        List<TbNotify> tbNotifies = tbNotifyMapper.list(map);
        for (TbNotify tbNotify : tbNotifies) {
            // tb_notify里的type字段存储的是sys_dict里type字段对应的value字段的值
            tbNotify.setType(sysDictService.getDictNameByTypeAndValue("notify_type", tbNotify.getType()));
        }
        return tbNotifies;
    }

    @Override
    public int count(Map<String, Object> map) {
        return sysDictService.count(map);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int save(TbNotifyDTO tbNotifyDTO) {
        tbNotifyDTO.setUpdateDate(new Date());
        tbNotifyDTO.setStatus("1");
        int count = tbNotifyMapper.insertSelective(tbNotifyDTO);
        Long[] userIds = tbNotifyDTO.getUserIds();
        Long id = tbNotifyDTO.getId();
        List<TbNotifyRecord> tbNotifyRecords = new ArrayList<>();
        for (Long userId : userIds) {
            TbNotifyRecord record = new TbNotifyRecord();
            record.setNotifyId(id);
            record.setUserId(userId);
            record.setIsRead(0);
            tbNotifyRecords.add(record);
        }
        tbNotifyRecordMapper.batchSave(tbNotifyRecords);
        // 给在线用户发通知
        ThreadPoolExecutor executor = new ThreadPoolExecutor(1, 1,
                0, TimeUnit.MILLISECONDS, new LinkedBlockingDeque<>());
        executor.execute(new Runnable() {
            @Override
            public void run() {
                List<SysUser> sysUsers = sessionService.listOnlineUser();
                for (SysUser sysUser : sysUsers) {
                    for (Long userId : userIds) {
                        if (userId.equals(sysUser.getUserId())) {
                            template.convertAndSendToUser(sysUser.toString(),
                                    "/queue/notifications", "新消息：" + tbNotifyDTO.getTitle());
                        }
                    }
                }
            }
        });
        executor.shutdown();
        return count;
    }

    @Override
    public TbNotify getTbNotifyById(Long id) {
        TbNotify tbNotify = tbNotifyMapper.selectByPrimaryKey(id);
        // tb_notify里的type字段存储的是sys_dict里type字段对应的value字段的值
        tbNotify.setType(sysDictService.getDictNameByTypeAndValue("notify_type", tbNotify.getType()));
        return tbNotify;
    }

    @Override
    public int update(TbNotify tbNotify) {
        return tbNotifyMapper.updateByPrimaryKeySelective(tbNotify);
    }

    @Override
    public int remove(Long id) {
        TbNotifyRecordExample example = new TbNotifyRecordExample();
        example.createCriteria().andNotifyIdEqualTo(id);
        tbNotifyRecordMapper.deleteByExample(example);
        return tbNotifyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        tbNotifyRecordMapper.batchRemoveByNotifyId(ids);
        return tbNotifyMapper.batchRemove(ids);
    }

    @Override
    public Page<TbNotifyDTO> selfList(Map<String, Object> map) {
        List<TbNotifyDTO> tbNotifies = tbNotifyMapper.getNotifyListByUserIdAndNoRead(map);
        for (TbNotifyDTO tbNotify : tbNotifies) {
            tbNotify.setBefore(DateUtils.getTimeBefore(tbNotify.getUpdateDate()));
            tbNotify.setSender(sysUserMapper.selectByPrimaryKey(tbNotify.getCreateBy()).getName());
        }
        Page<TbNotifyDTO> page = new Page<>(tbNotifies, tbNotifyMapper.countDTO(map));
        return page;
    }
}
