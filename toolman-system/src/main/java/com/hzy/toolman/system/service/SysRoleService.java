package com.hzy.toolman.system.service;

import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.vo.SysRoleVo;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-04 21:05
 **/
public interface SysRoleService {

    SysRole getSysRoleByRoleId(Long roleId);

    List<SysRole> list();

    List<SysRole> listByUserId(Long userId);

    int save(SysRoleVo sysRole);

    int update(SysRoleVo sysRole);

    int remove(Long roleId);

    int batchRemove(Long[] roleIds);

    SysRole getSysRoleByRoleName(String roleName);
}
