package com.hzy.toolman.system.service;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.db.domain.system.SysDept;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 11:54
 **/
public interface SysDeptService {

    List<SysDept> getSysDeptList();

    SysDept getSysDeptByDeptId(Long deptId);

    int save(SysDept sysDept);

    int update(SysDept sysDept);

    int remove(Long deptId);

    int batchRemove(Long[] deptIds);

    boolean checkDeptHasChild(Long deptId);

    boolean checkDeptHasUser(Long deptId);

    Tree<SysDept> getTree();

    List<Long> listChildrenIds(Long parentId);

    Tree<SysDept> getTreeByRoleId(Long roleId);

    Tree<SysDept> getSelectTreeByRoleId(Long roleId, Long classesId);

}
