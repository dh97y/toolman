package com.hzy.toolman.system.vo;

import com.hzy.toolman.db.domain.common.TbClasses;

import java.io.Serializable;
import java.util.Arrays;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 15:10
 **/
public class SysClassesVo extends TbClasses implements Serializable {

    private static final long serialVersionUID = 1L;

    private String[] stuIds;

    private String[] stuNames;

    private String[] teachIds;

    private String[] teachName;

    public String[] getStuIds() {
        return stuIds;
    }

    public void setStuIds(String[] stuIds) {
        this.stuIds = stuIds;
    }

    public String[] getStuNames() {
        return stuNames;
    }

    public void setStuNames(String[] stuNames) {
        this.stuNames = stuNames;
    }

    public String[] getTeachIds() {
        return teachIds;
    }

    public void setTeachIds(String[] teachIds) {
        this.teachIds = teachIds;
    }

    public String[] getTeachName() {
        return teachName;
    }

    public void setTeachName(String[] teachName) {
        this.teachName = teachName;
    }

    @Override
    public String toString() {
        return "SysClassesVo{" +
                "stuIds=" + Arrays.toString(stuIds) +
                ", stuNames=" + Arrays.toString(stuNames) +
                ", teachIds=" + Arrays.toString(teachIds) +
                ", teachName=" + Arrays.toString(teachName) +
                '}';
    }
}
