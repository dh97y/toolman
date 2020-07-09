package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.db.domain.common.TbStudent;
import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.service.SysClassesService;
import com.hzy.toolman.system.service.SysStudentService;
import com.hzy.toolman.system.service.SysUserService;
import com.hzy.toolman.system.vo.SysClassesVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 13:43
 **/
@RequestMapping("/sys/teach/classes")
@Controller
public class SysClassesController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysClassesController.class);

    @Autowired
    private SysClassesService sysClassesService;

    @Autowired
    private SysStudentService sysStudentService;

    @Autowired
    private SysUserService sysUserService;

    @RequiresPermissions("sys:teach:classes")
    @GetMapping()
    public String classes() {
        return "system/teach/classes/classes";
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/list")
    @ResponseBody
    public List<TbClasses> list() {
        List<TbClasses> list = sysClassesService.list();
        return list;
    }

    @RequiresPermissions("sys:teach:classes:add")
    @GetMapping("/add")
    public String toAddPage() {
        return "system/teach/classes/add";
    }

    @Log("添加班级")
    @RequiresPermissions("sys:teach:classes:add")
    @PostMapping("/save")
    @ResponseBody
    public R save(SysClassesVo sysClassesVo) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            if (sysClassesService.save(sysClassesVo) > 0) {
                return R.ok();
            }
            return R.error(1, "添加失败");
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @RequiresPermissions("sys:teach:classes:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(@PathVariable("id") Long id, Model model) {
        TbClasses classes = sysClassesService.getClassesById(id);
        List<TbStudent> students = sysStudentService.getStudentByClassesId(id);
        StringBuilder stuNames = new StringBuilder();
        StringBuilder stuIds = new StringBuilder();
        for (int i = 0; i < students.size(); i++) {
            if (i == students.size() - 1) {
                stuNames.append(students.get(i).getName());
                stuIds.append(students.get(i).getStuId());
                break;
            }
            stuNames.append(students.get(i).getName() + ",");
            stuIds.append(students.get(i).getStuId() + ",");
        }
        List<SysUser> teachers = sysUserService.getTeacherByClassesId(id);
        StringBuilder teachIds = new StringBuilder();
        StringBuilder teachNames = new StringBuilder();
        for (int i = 0; i < teachers.size(); i++) {
            if (i == teachers.size() - 1) {
                teachNames.append(teachers.get(i).getName());
                teachIds.append(teachers.get(i).getUserId());
                break;
            }
            teachNames.append(teachers.get(i).getName() + ",");
            teachIds.append(teachers.get(i).getUserId() + ",");
        }
        model.addAttribute("classes", classes);
        model.addAttribute("stuNames", stuNames);
        model.addAttribute("stuIds", stuIds);
        model.addAttribute("teachIds", teachIds);
        model.addAttribute("teachNames", teachNames);
        return "system/teach/classes/edit";
    }

    @Log("更新班级")
    @RequiresPermissions("sys:teach:classes:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(SysClassesVo classes) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            if (sysClassesService.update(classes) > 0) {
                return R.ok();
            }
            return R.error(1, "更新失败");
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @Log("删除班级")
    @RequiresPermissions("sys:teach:clasess:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            if (sysClassesService.remove(id) > 0) {
                return R.ok();
            }
            return R.error(1, "删除失败");
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @Log("批量删除班级")
    @RequiresPermissions("sys:teach:classes:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            if (sysClassesService.batchRemove(ids) > 0) {
                return R.ok();
            }
            return R.error(1, "批量删除失败");
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/treeView")
    public String treeView() {
        return "system/teach/classes/studentTree";
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/treeView/{id}")
    public String treeView(@PathVariable("id") Long id, Model model) {
        model.addAttribute("id", id);
        return "system/teach/classes/studentTree";
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/classesTree")
    @ResponseBody
    public Tree<TbClasses> classesTree() {
        return sysClassesService.getClassesTree(getSysUserId());
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/tree")
    @ResponseBody
    public Tree<TbClasses> tree() {
        return sysClassesService.getTree();
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/tree/{id}")
    @ResponseBody
    public Tree<TbClasses> tree(@PathVariable("id") Long id) {
        return sysClassesService.getTreeByClassId(id);
    }

}
