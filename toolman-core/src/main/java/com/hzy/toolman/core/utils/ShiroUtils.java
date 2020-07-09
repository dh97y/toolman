package com.hzy.toolman.core.utils;

import com.hzy.toolman.db.domain.system.SysUser;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.Collection;
import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 17:08
 **/
public class ShiroUtils {

    @Autowired
    private static SessionDAO sessionDAO;

    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    public static SysUser getSysUser() {
        Object principal = getSubject().getPrincipal();
        SysUser sysUser = new SysUser();
        try {
            if (principal != null) {
                PropertyUtils.copyProperties(sysUser, principal);
            }
        } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
            e.printStackTrace();
        }
        return sysUser;
    }

    public static Long getUserId() {
        return getSysUser().getUserId();
    }

    public static void logout() {
        getSubject().logout();
    }

    public static List<Principal> getPrincipals() {
        List<Principal> principals = null;
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        return principals;
    }

}
