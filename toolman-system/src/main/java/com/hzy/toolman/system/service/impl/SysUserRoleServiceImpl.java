package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.db.dao.system.SysUserRoleMapper;
import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.system.service.SysUserRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-04 21:11
 **/
@Service
public class SysUserRoleServiceImpl implements SysUserRoleService {

    @Resource
    private SysUserRoleMapper sysUserRoleMapper;

    @Override
    public List<SysRole> getSysRoleByUserId(Long userId) {
        return sysUserRoleMapper.getSysRoleByUserId(userId);
    }
}
