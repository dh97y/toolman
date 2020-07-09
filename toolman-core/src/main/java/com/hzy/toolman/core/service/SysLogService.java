package com.hzy.toolman.core.service;

import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.system.SysLog;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 00:02
 **/
public interface SysLogService {

    int save(SysLog sysLog);

    int delete(Long id);

    int batchDelete(Long[] ids);

    SysLog getLastLoginInfoByUserId(Long userId);

    Page<SysLog> queryList(Query query);

}
