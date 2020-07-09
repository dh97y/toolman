package com.hzy.toolman.system.service;

import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.db.domain.system.SysUserRole;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-04 21:10
 **/
public interface SysUserRoleService {

    List<SysRole> getSysRoleByUserId(Long userId);

}
