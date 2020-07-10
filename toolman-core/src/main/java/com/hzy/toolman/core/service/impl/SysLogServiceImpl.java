package com.hzy.toolman.core.service.impl;

import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.core.service.SysLogService;
import com.hzy.toolman.db.dao.system.SysLogMapper;
import com.hzy.toolman.db.domain.system.SysLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 00:02
 **/
@Service
public class SysLogServiceImpl implements SysLogService {
    @Resource
    private SysLogMapper sysLogMapper;

    @Override
    public int save(SysLog sysLog) {
        return sysLogMapper.insertSelective(sysLog);
    }

    @Override
    public int delete(Long id) {
        return sysLogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(Long[] ids) {
        return sysLogMapper.batchRemove(ids);
    }

    @Override
    public SysLog getLastLoginInfoByUserId(Long userId) {
        return sysLogMapper.getLastLoginInfoByUserId(userId);
    }

    @Override
    public Page<SysLog> queryList(Map<String, Object> map) {
        int total = sysLogMapper.count(map);
        List<SysLog> sysLogs = sysLogMapper.list(map);
        Page<SysLog> page = new Page<>();
        page.setTotal(total);
        page.setRows(sysLogs);
        return page;
    }

}
