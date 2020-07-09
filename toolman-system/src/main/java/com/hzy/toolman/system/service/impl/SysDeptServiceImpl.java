package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.BuildTree;
import com.hzy.toolman.db.dao.common.TbUserClassesMapper;
import com.hzy.toolman.db.dao.system.SysDeptMapper;
import com.hzy.toolman.db.dao.system.SysRoleMapper;
import com.hzy.toolman.db.dao.system.SysUserMapper;
import com.hzy.toolman.db.domain.system.*;
import com.hzy.toolman.system.service.SysDeptService;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 11:56
 **/
@Service
public class SysDeptServiceImpl implements SysDeptService {

    @Resource
    private SysDeptMapper sysDeptMapper;

    @Resource
    private TbUserClassesMapper tbUserClassesMapper;

    @Resource
    private SysUserMapper sysUserMapper;

    @Override
    public List<SysDept> getSysDeptList() {
        return sysDeptMapper.selectByExample(new SysDeptExample());
    }

    @Override
    public SysDept getSysDeptByDeptId(Long deptId) {
        return sysDeptMapper.selectByPrimaryKey(deptId);
    }

    @Override
    public int save(SysDept sysDept) {
        return sysDeptMapper.insertSelective(sysDept);
    }

    @Override
    public int update(SysDept sysDept) {
        return sysDeptMapper.updateByPrimaryKeySelective(sysDept);
    }

    @Override
    public int remove(Long deptId) {
        return sysDeptMapper.deleteByPrimaryKey(deptId);
    }

    @Override
    public int batchRemove(Long[] deptIds) {
        return sysDeptMapper.batchRemove(deptIds);
    }

    @Override
    public boolean checkDeptHasChild(Long deptId) {
        SysDeptExample example = new SysDeptExample();
        example.createCriteria().andParentIdEqualTo(deptId);
        long count = sysDeptMapper.countByExample(example);
        return count > 0 ? true : false;
    }

    @Override
    public boolean checkDeptHasUser(Long deptId) {
        int count = sysUserMapper.getDeptUserNumber(deptId);
        return count > 0 ? true : false;
    }


    @Override
    public Tree<SysDept> getTree() {
        List<Tree<SysDept>> trees = new ArrayList<>();
        List<SysDept> sysDepts = sysDeptMapper.selectByExample(new SysDeptExample());
        for (SysDept sysDept : sysDepts) {
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysDept.getDeptId().toString());
            tree.setParentId(sysDept.getParentId().toString());
            tree.setText(sysDept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级节点为0
        Tree<SysDept> deptTree = BuildTree.build(trees);
        return deptTree;
    }

    @Override
    public List<Long> listChildrenIds(Long parentId) {
        SysDeptExample example = new SysDeptExample();
        List<SysDept> sysDepts = sysDeptMapper.selectByExample(example);
        return treeSysDeptList(sysDepts, parentId);
    }

    @Override
    public Tree<SysDept> getTreeByRoleId(Long roleId) {
        List<Tree<SysDept>> trees = new ArrayList<>();
        List<SysDept> sysDepts = sysDeptMapper.selectByExample(new SysDeptExample());
        Long[] parentDeptId = sysDeptMapper.getParentDeptId();
        Long[] allDeptId = sysUserMapper.getAllDeptIdByRoleId(roleId);
        Long[] deptIds = (Long[]) ArrayUtils.addAll(parentDeptId, allDeptId);
        for (SysDept sysDept : sysDepts) {
            if (!ArrayUtils.contains(deptIds, sysDept.getDeptId())) {
                continue;
            }
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysDept.getDeptId().toString());
            tree.setParentId(sysDept.getParentId().toString());
            tree.setText(sysDept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "dept");
            tree.setState(state);
            trees.add(tree);
        }
        List<SysUser> sysUsers = sysUserMapper.getSysUsersByRoleId(roleId);
        for (SysUser sysUser : sysUsers) {
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysUser.getUserId().toString());
            tree.setParentId(sysUser.getDeptId().toString());
            tree.setText(sysUser.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "teacher");
            tree.setState(state);
            trees.add(tree);
        }
        Tree<SysDept> sysDeptTree = BuildTree.build(trees);
        return sysDeptTree;
    }

    @Override
    public Tree<SysDept> getSelectTreeByRoleId(Long roleId, Long classesId) {
        List<Tree<SysDept>> trees = new ArrayList<>();
        List<SysDept> sysDepts = sysDeptMapper.selectByExample(new SysDeptExample());
        Long[] parentDeptId = sysDeptMapper.getParentDeptId();
        Long[] allDeptId = sysUserMapper.getAllDeptIdByRoleId(roleId);
        Long[] deptIds = (Long[]) ArrayUtils.addAll(parentDeptId, allDeptId);
        for (SysDept sysDept : sysDepts) {
            if (!ArrayUtils.contains(deptIds, sysDept.getDeptId())) {
                continue;
            }
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysDept.getDeptId().toString());
            tree.setParentId(sysDept.getParentId().toString());
            tree.setText(sysDept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "dept");
            tree.setState(state);
            trees.add(tree);
        }
        List<SysUser> sysUsers = sysUserMapper.getSysUsersByRoleId(roleId);
        Long[] teacherIds = tbUserClassesMapper.getTeacherIdsByClassesId(classesId);
        for (SysUser sysUser : sysUsers) {
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysUser.getUserId().toString());
            tree.setParentId(sysUser.getDeptId().toString());
            tree.setText(sysUser.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "teacher");
            for (Long teacherId : teacherIds) {
                if (Objects.equals(teacherId, sysUser.getUserId())) {
                    state.put("selected", true);
                    tree.setChecked(true);
                }
            }
            tree.setState(state);
            trees.add(tree);
        }
        Tree<SysDept> sysDeptTree = BuildTree.build(trees);
        return sysDeptTree;
    }

    List<Long> treeSysDeptList(List<SysDept> sysDepts, long pid) {
        List<Long> childIds = new ArrayList<>();
        for (SysDept sysDept : sysDepts) {
            //遍历出父id等于参数的id，add进子节点集合
            if (sysDept.getParentId() == pid) {
                //递归遍历下一级
                treeSysDeptList(sysDepts, sysDept.getDeptId());
                childIds.add(sysDept.getDeptId());
            }
        }
        return childIds;
    }

}
