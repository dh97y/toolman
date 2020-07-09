package com.hzy.toolman.system.service;

import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.domain.UserOnline;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-06 22:53
 **/
public interface SessionService {

    List<UserOnline> list();

    boolean forceLogout(String sessionId);

    List<SysUser> listOnlineUser();

}
