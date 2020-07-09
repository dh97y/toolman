package com.hzy.toolman.system;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.MD5Utils;
import com.hzy.toolman.db.dao.common.TbClassesMapper;
import com.hzy.toolman.db.dao.common.TbStudentMapper;
import com.hzy.toolman.db.dao.common.TbUserClassesMapper;
import com.hzy.toolman.db.dao.system.SysUserMapper;
import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.db.domain.common.TbStudent;
import com.hzy.toolman.db.domain.system.*;
import com.hzy.toolman.system.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;
import java.util.*;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 15:20
 **/
@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest
public class DbTest {

    @Resource
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysDeptService sysDeptService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysDictService sysDictService;

    @Autowired
    private SysClassesService sysClassesService;

    @Resource
    private TbClassesMapper tbClassesMapper;

    @Autowired
    private SysStudentService sysStudentService;

    @Resource
    private TbStudentMapper tbStudentMapper;

    @Resource
    private TbUserClassesMapper tbUserClassesMapper;

    @Test
    public void testSysStudentService() {
        Long[] ids = {1L, 2L, 4L, 5L, 6L, 3L};
        int i = tbStudentMapper.countByClassesIds(ids);
        System.out.println(i);
    }

    @Test
    public void testSysClassesService() {
        Tree<TbClasses> tree = sysClassesService.getTreeByClassId(3L);
        System.out.println(tree);
    }

    @Test
    public void testSysDictService() {
        List<SysDict> notify_type = sysDictService.getSysDictListByType("notify_type");
        for (SysDict sysDict : notify_type) {
            System.out.println(sysDict);
        }
    }

    @Test
    public void testSysRoleService() {
        List<SysRole> sysRoles = sysRoleService.listByUserId(1L);
        for (SysRole sysRole : sysRoles) {
            System.out.println(sysRole);
        }
    }

    @Test
    public void test() {
        Long[] ids = {3L, 10L};
        List<SysUser> teachers = sysUserMapper.getTeachers(ids);
        for (SysUser teacher : teachers) {
            System.out.println(teacher);
        }
    }

    @Test
    public void testSysMenuService() {
        Map<String, Object> params = new HashMap<>();
//        params.put("sort", "order_num");
        List<SysMenu> list = sysMenuService.list(params);
        for (SysMenu sysMenu : list) {
            System.out.println(sysMenu);
        }
    }

    @Test
    public void testSysUserMapper() {
        Tree<SysDept> tree = sysUserService.getTree();
        System.out.println(tree);
    }


}
