package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.BuildTree;
import com.hzy.toolman.db.dao.common.TbClassesMapper;
import com.hzy.toolman.db.dao.common.TbStudentMapper;
import com.hzy.toolman.db.dao.common.TbUserClassesMapper;
import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.db.domain.common.TbClassesExample;
import com.hzy.toolman.db.domain.common.TbStudent;
import com.hzy.toolman.db.domain.common.TbStudentExample;
import com.hzy.toolman.system.service.SysClassesService;
import com.hzy.toolman.system.vo.SysClassesVo;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 13:53
 **/
@Service
public class SysClassesServiceImpl implements SysClassesService {

    @Resource
    private TbClassesMapper tbClassesMapper;

    @Resource
    private TbStudentMapper tbStudentMapper;

    @Resource
    private TbUserClassesMapper tbUserClassesMapper;

    @Override
    public List<TbClasses> list() {
        TbClassesExample example = new TbClassesExample();
        example.setOrderByClause("name asc");
        return tbClassesMapper.selectByExample(example);
    }

    @Override
    public int save(SysClassesVo sysClassesVo) throws Exception {
        if (sysClassesVo.getTeachIds() == null || sysClassesVo.getTeachIds().length == 0) {
            throw new RuntimeException("请选择教师");
        }
        sysClassesVo.setGmtCreate(new Date());
        sysClassesVo.setGmtModified(new Date());
        int count = tbClassesMapper.insertSelective(sysClassesVo);
        Long id = sysClassesVo.getId();
        String[] teachIds = sysClassesVo.getTeachIds();
        tbUserClassesMapper.batchSave(teachIds, id);
        if (sysClassesVo.getStuIds() != null && sysClassesVo.getStuIds().length != 0) {
            String[] stuIds = sysClassesVo.getStuIds();
            tbStudentMapper.batchUpdate(stuIds, id);
        }
        return count;
    }

    @Override
    public int update(SysClassesVo sysClassesVo) throws Exception {
        if (sysClassesVo.getTeachIds() == null || sysClassesVo.getTeachIds().length == 0) {
            throw new RuntimeException("请选择教师");
        }
        sysClassesVo.setGmtModified(new Date());
        int count = tbClassesMapper.updateByPrimaryKeySelective(sysClassesVo);
        Long id = sysClassesVo.getId();
        String[] teachIds = sysClassesVo.getTeachIds();
        tbUserClassesMapper.batchDeleteByUserId(id);
        tbUserClassesMapper.batchSave(teachIds, id);
        if (sysClassesVo.getStuIds() != null && sysClassesVo.getStuIds().length != 0) {
            String[] stuIds = sysClassesVo.getStuIds();
            tbStudentMapper.batchUpdate(stuIds, id);
        }
        return count;
    }

    @Override
    public int remove(Long id) throws Exception {
        TbStudentExample example = new TbStudentExample();
        example.createCriteria().andClassesIdEqualTo(id);
        long count = tbStudentMapper.countByExample(example);
        if (count > 0) {
            throw new RuntimeException("该班级下含有学生，不可删除");
        }
        return tbClassesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchRemove(Long[] ids) throws Exception {
        int count = tbStudentMapper.countByClassesIds(ids);
        if (count > 0) {
            throw new RuntimeException("选中的班级下含有学生，不可删除");
        }
        return tbClassesMapper.batchRemove(ids);
    }

    @Override
    public Tree<TbClasses> getTree() {
        List<Tree<TbClasses>> trees = new ArrayList<>();
        List<TbClasses> tbClasses = tbClassesMapper.selectByExample(new TbClassesExample());
        Long[] allClassesId = tbClassesMapper.getAllClassesId();
        Long[] studentClassesId = tbStudentMapper.getAllClassesId();
        Long[] classesIds = (Long[]) ArrayUtils.addAll(allClassesId, studentClassesId);
        for (TbClasses tbClass : tbClasses) {
            if (!ArrayUtils.contains(classesIds, tbClass.getId())) {
                continue;
            }
            Tree<TbClasses> tree = new Tree<>();
            tree.setId(tbClass.getId().toString());
            tree.setParentId("0");
            tree.setText(tbClass.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "classes");
            tree.setState(state);
            trees.add(tree);
        }
        List<TbStudent> tbStudents = tbStudentMapper.selectByExample(new TbStudentExample());
        for (TbStudent tbStudent : tbStudents) {
            Tree<TbClasses> tree = new Tree<>();
            tree.setId(tbStudent.getStuId());
            if (Objects.equals(tbStudent.getClassesId(), 0L)) {
                tree.setParentId("0");
            } else {
                tree.setParentId(tbStudent.getClassesId().toString());
            }
            tree.setText(tbStudent.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "stu");
            tree.setState(state);
            trees.add(tree);
        }
        Tree<TbClasses> classesTree = BuildTree.build(trees);
        return classesTree;
    }

    @Override
    public Tree<TbClasses> getTreeByClassId(Long id) {
        List<Tree<TbClasses>> trees = new ArrayList<>();
        List<TbClasses> tbClasses = tbClassesMapper.selectByExample(new TbClassesExample());
        Long[] allClassesId = tbClassesMapper.getAllClassesId();
        Long[] studentClassesId = tbStudentMapper.getAllClassesId();
        Long[] classesIds = (Long[]) ArrayUtils.addAll(allClassesId, studentClassesId);
        for (TbClasses tbClass : tbClasses) {
            if (!ArrayUtils.contains(classesIds, tbClass.getId())) {
                continue;
            }
            Tree<TbClasses> tree = new Tree<>();
            tree.setId(tbClass.getId().toString());
            tree.setParentId("0");
            tree.setText(tbClass.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "classes");
            tree.setState(state);
            trees.add(tree);
        }
        List<TbStudent> tbStudents = tbStudentMapper.selectByExample(new TbStudentExample());
        for (TbStudent tbStudent : tbStudents) {
            Tree<TbClasses> tree = new Tree<>();
            tree.setId(tbStudent.getStuId());
            if (Objects.equals(tbStudent.getClassesId(), 0L)) {
                tree.setParentId("0");
            } else {
                tree.setParentId(tbStudent.getClassesId().toString());
            }
            tree.setText(tbStudent.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "stu");
            if (Objects.equals(tbStudent.getClassesId(), id)) {
//                for (Tree<TbClasses> tbClassesTree : trees) {
//                    if (Objects.equals(tbClassesTree.getId(), tree.getParentId())) {
//                        tbClassesTree.setChecked(true);
//                        Map<String, Object> pState = tbClassesTree.getState();
//                        pState.put("selected", true);
//                        tbClassesTree.setState(pState);
//                    }
//                }
                state.put("selected", true);
                tree.setChecked(true);
            }
            tree.setState(state);
            trees.add(tree);
        }
        Tree<TbClasses> classesTree = BuildTree.build(trees);
        return classesTree;
    }

    @Override
    public Tree<TbClasses> getClassesTree(Long userId) {
        List<Tree<TbClasses>> trees = new ArrayList<>();
        List<TbClasses> tbClasses = tbClassesMapper.getClassesByUserId(userId);
        for (TbClasses tbClass : tbClasses) {
            Tree<TbClasses> tree = new Tree<>();
            tree.setId(tbClass.getId().toString());
            tree.setParentId("0");
            tree.setText(tbClass.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "classes");
            tree.setState(state);
            trees.add(tree);
        }
        Tree<TbClasses> classesTree = BuildTree.build(trees);
        return classesTree;
    }

    @Override
    public TbClasses getClassesById(Long id) {
        return tbClassesMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<TbClasses> listByUserId(Long userId) {
        return tbClassesMapper.listByUserId(userId);
    }
}
