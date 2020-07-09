package com.hzy.toolman.system.vo;

import com.hzy.toolman.db.domain.system.SysUser;

import java.util.List;

/**
 * @projectName: toolman
 * @description: 与前台交互的封装对象
 * @author: hzy
 * @create: 2020-07-05 21:00
 **/
public class SysUserVo extends SysUser {

    private String deptName;

    private List<Long> roleIds;

    private String pwdOld;

    private String pwdNew;

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public List<Long> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<Long> roleIds) {
        this.roleIds = roleIds;
    }

    public String getPwdOld() {
        return pwdOld;
    }

    public void setPwdOld(String pwdOld) {
        this.pwdOld = pwdOld;
    }

    public String getPwdNew() {
        return pwdNew;
    }

    public void setPwdNew(String pwdNew) {
        this.pwdNew = pwdNew;
    }

    @Override
    public String toString() {
        return super.toString() + "\nSysUserVo{" +
                "deptName='" + deptName + '\'' +
                ", roleIds=" + roleIds +
                ", pwdOld='" + pwdOld + '\'' +
                ", pwdNew='" + pwdNew + '\'' +
                '}';
    }
}
