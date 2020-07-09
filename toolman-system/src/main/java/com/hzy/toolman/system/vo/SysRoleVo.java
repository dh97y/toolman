package com.hzy.toolman.system.vo;

import com.hzy.toolman.db.domain.system.SysRole;

import java.util.List;

/**
 * @projectName: toolman
 * @description: 与前台交互的封装对象
 * @author: hzy
 * @create: 2020-07-05 23:20
 **/
public class SysRoleVo extends SysRole {

    private List<Long> menuIds;

    public List<Long> getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(List<Long> menuIds) {
        this.menuIds = menuIds;
    }

    @Override
    public String toString() {
        return super.toString() + "\nSysRoleVo{" +
                "menuIds=" + menuIds +
                '}';
    }
}
