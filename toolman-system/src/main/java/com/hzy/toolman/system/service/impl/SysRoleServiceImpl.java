package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.db.dao.system.SysRoleMapper;
import com.hzy.toolman.db.dao.system.SysRoleMenuMapper;
import com.hzy.toolman.db.dao.system.SysUserRoleMapper;
import com.hzy.toolman.db.domain.system.*;
import com.hzy.toolman.system.service.SysRoleService;
import com.hzy.toolman.system.vo.SysRoleVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-04 21:06
 **/
@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Resource
    private SysRoleMapper sysRoleMapper;

    @Resource
    private SysUserRoleMapper sysUserRoleMapper;

    @Resource
    private SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public SysRole getSysRoleByRoleId(Long roleId) {
        return sysRoleMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public List<SysRole> list() {
        return sysRoleMapper.selectByExample(new SysRoleExample());
    }

    @Override
    public List<SysRole> listByUserId(Long userId) {
        List<Long> roleIds = sysUserRoleMapper.getRoleIdsByUserId(userId);
        SysRoleExample example = new SysRoleExample();
        example.setOrderByClause("role_id");
        List<SysRole> sysRoles = sysRoleMapper.selectByExample(example);
        for (SysRole sysRole : sysRoles) {
            sysRole.setRoleSign("false");
            for (Long roleId : roleIds) {
                if (Objects.equals(sysRole.getRoleId(), roleId)) {
                    sysRole.setRoleSign("true");
                    break;
                }
            }
        }
        return sysRoles;
    }

    @Override
    public int save(SysRoleVo sysRole) {
        sysRole.setGmtCreate(new Date());
        sysRole.setGmtModified(new Date());
        int count = sysRoleMapper.insertSelective(sysRole);
        List<Long> menuIds = sysRole.getMenuIds();
        Long roleId = sysRole.getRoleId();
        List<SysRoleMenu> sysRoleMenus = new ArrayList<>();
        for (Long menuId : menuIds) {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setRoleId(roleId);
            sysRoleMenu.setMenuId(menuId);
            sysRoleMenus.add(sysRoleMenu);
        }
        sysRoleMenuMapper.deleteByPrimaryKey(roleId);
        if (sysRoleMenus.size() > 0) {
            sysRoleMenuMapper.batchSave(sysRoleMenus);
        }
        return count;
    }

    @Override
    public int update(SysRoleVo sysRole) {
        sysRole.setGmtModified(new Date());
        int count = sysRoleMapper.updateByPrimaryKeySelective(sysRole);
        List<Long> menuIds = sysRole.getMenuIds();
        Long roleId = sysRole.getRoleId();
        SysRoleMenuExample example = new SysRoleMenuExample();
        example.createCriteria().andRoleIdEqualTo(roleId);
        sysRoleMenuMapper.deleteByExample(example);
        List<SysRoleMenu> sysRoleMenus = new ArrayList<>();
        for (Long menuId : menuIds) {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setRoleId(roleId);
            sysRoleMenu.setMenuId(menuId);
            sysRoleMenus.add(sysRoleMenu);
        }
        if (sysRoleMenus.size() > 0) {
            sysRoleMenuMapper.batchSave(sysRoleMenus);
        }
        return count;
    }

    @Override
    public int remove(Long roleId) {
        int count = sysRoleMapper.deleteByPrimaryKey(roleId);
        SysUserRoleExample sysUserRoleExample = new SysUserRoleExample();
        sysUserRoleExample.createCriteria().andRoleIdEqualTo(roleId);
        sysUserRoleMapper.deleteByExample(sysUserRoleExample);

        SysRoleMenuExample sysRoleMenuExample = new SysRoleMenuExample();
        sysRoleMenuExample.createCriteria().andRoleIdEqualTo(roleId);
        sysRoleMenuMapper.deleteByExample(sysRoleMenuExample);
        return count;
    }

    @Override
    public int batchRemove(Long[] roleIds) {
        int count = sysRoleMapper.batchRemove(roleIds);
        sysRoleMenuMapper.batchRemoveByRoleId(roleIds);
        sysUserRoleMapper.batchRemoveByRoleId(roleIds);
        return count;
    }

    @Override
    public SysRole getSysRoleByRoleName(String roleName) {
        SysRoleExample example = new SysRoleExample();
        example.createCriteria().andRoleNameEqualTo(roleName);
        return sysRoleMapper.selectOneByExample(example);
    }
}
