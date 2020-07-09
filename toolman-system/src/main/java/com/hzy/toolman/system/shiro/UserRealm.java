package com.hzy.toolman.system.shiro;

import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.core.utils.ShiroUtils;
import com.hzy.toolman.system.service.SysMenuService;
import com.hzy.toolman.system.service.SysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 17:05
 **/
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysUserService sysUserService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Long userId = ShiroUtils.getUserId();
        Set<String> perms = sysMenuService.listUserPerms(userId);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(perms);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());

        SysUser sysUser = sysUserService.getSysUserByUsername(username).get(0);

        // 账号不存在
        if (sysUser == null) {
            throw new UnknownAccountException("账号或密码不正确");
        }

        // 密码错误
        if (!password.equals(sysUser.getPassword())) {
            throw new IncorrectCredentialsException("账号或密码不正确");
        }

        // 账号锁定
        if (sysUser.getStatus() == 0) {
            throw new LockedAccountException("账号已被锁定，请联系管理员");
        }

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(sysUser, password, getName());
        return info;
    }
}
