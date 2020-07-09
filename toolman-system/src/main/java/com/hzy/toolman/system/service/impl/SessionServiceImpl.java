package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.domain.UserOnline;
import com.hzy.toolman.system.service.SessionService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-06 22:53
 **/
@Service
public class SessionServiceImpl implements SessionService {

    private final SessionDAO sessionDAO;

    @Autowired
    public SessionServiceImpl(SessionDAO sessionDAO) {
        this.sessionDAO = sessionDAO;
    }

    @Override
    public List<UserOnline> list() {

        List<UserOnline> list = new ArrayList<>();
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            UserOnline userOnline = new UserOnline();
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            } else {
                SimplePrincipalCollection principalCollection =
                        (SimplePrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                SysUser sysUser = (SysUser) principalCollection.getPrimaryPrincipal();
                userOnline.setUsername(sysUser.getUsername());
            }
            userOnline.setId((String) session.getId());
            userOnline.setHost(session.getHost());
            userOnline.setStartTimestamp(session.getStartTimestamp());
            userOnline.setLastAccessTime(session.getLastAccessTime());
            userOnline.setTimeout(session.getTimeout());
            list.add(userOnline);
        }
        return list;
    }

    @Override
    public boolean forceLogout(String sessionId) {
        Session session = sessionDAO.readSession(sessionId);
        session.setTimeout(0);
        return true;
    }

    @Override
    public List<SysUser> listOnlineUser() {
        List<SysUser> sysUsers = new ArrayList<>();
        SysUser sysUser;
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            SimplePrincipalCollection principalCollection = new SimplePrincipalCollection();
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            } else {
                principalCollection = (SimplePrincipalCollection) session
                        .getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                sysUser = (SysUser) principalCollection.getPrimaryPrincipal();
                sysUsers.add(sysUser);
            }
        }
        return sysUsers;
    }
}
