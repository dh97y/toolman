package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.db.dao.common.TbNotifyRecordMapper;
import com.hzy.toolman.db.domain.common.TbNotify;
import com.hzy.toolman.db.domain.common.TbNotifyRecord;
import com.hzy.toolman.db.domain.common.TbNotifyRecordExample;
import com.hzy.toolman.system.service.SysNotifyRecordService;
import com.hzy.toolman.system.vo.SysNotifyVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 00:28
 **/
@Service
public class SysNotifyRecordServiceImpl implements SysNotifyRecordService {

    @Resource
    private TbNotifyRecordMapper tbNotifyRecordMapper;

    @Override
    public int changeRead(SysNotifyVo sysNotifyVo) {
        TbNotifyRecord tbNotifyRecord = new TbNotifyRecord();
        tbNotifyRecord.setIsRead(sysNotifyVo.getIsRead());
        tbNotifyRecord.setReadDate(sysNotifyVo.getReadDate());
        TbNotifyRecordExample example = new TbNotifyRecordExample();
        example.createCriteria().
                andNotifyIdEqualTo(sysNotifyVo.getNotifyId()).andUserIdEqualTo(sysNotifyVo.getUserId());
        return tbNotifyRecordMapper.updateByExampleSelective(tbNotifyRecord, example);
    }

}
