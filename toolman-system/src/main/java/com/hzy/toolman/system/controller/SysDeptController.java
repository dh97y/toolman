package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.system.SysDept;
import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.service.SysDeptService;
import com.hzy.toolman.system.service.SysRoleService;
import com.hzy.toolman.system.service.SysUserService;
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
 * @create: 2020-07-05 11:44
 **/
@RequestMapping("/sys/dept")
@Controller
public class SysDeptController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysDeptController.class);

    private String prefix = "system/dept";

    @Autowired
    private SysDeptService sysDeptService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysUserService sysUserService;

    @RequiresPermissions("sys:dept:dept")
    @GetMapping()
    public String dept() {
        return prefix + "/dept";
    }

    @RequiresPermissions("sys:dept:dept")
    @GetMapping("/list")
    @ResponseBody
    public List<SysDept> list() {
        return sysDeptService.getSysDeptList();
    }

    @RequiresPermissions("sys:dept:add")
    @GetMapping("/add/{pId}")
    public String toAddPage(@PathVariable("pId") Long pId, Model model) {
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "总部门");
        } else {
            model.addAttribute("pName", sysDeptService.getSysDeptByDeptId(pId).getName());
        }
        return prefix + "/add";
    }

    @Log("添加部门")
    @RequiresPermissions("sys:dept:add")
    @PostMapping("/save")
    @ResponseBody
    public R save(SysDept sysDept) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysDeptService.save(sysDept) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:dept:edit")
    @GetMapping("/edit/{deptId}")
    public String toEditPage(@PathVariable("deptId") Long deptId, Model model) {
        SysDept sysDept = sysDeptService.getSysDeptByDeptId(deptId);
        model.addAttribute("sysDept", sysDept);
        if (SystemConstant.DEPT_ROOT_ID.equals(sysDept.getParentId())) {
            model.addAttribute("parentDeptName", "无");
        } else {
            SysDept pSysDept = sysDeptService.getSysDeptByDeptId(sysDept.getParentId());
            model.addAttribute("parentDeptName", pSysDept.getName());
        }
        return prefix + "/edit";
    }

    @Log("更新部门")
    @RequiresPermissions("sys:dept:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(SysDept sysDept) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysDeptService.update(sysDept) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("删除部门")
    @RequiresPermissions("sys:dept:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long deptId) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysDeptService.checkDeptHasChild(deptId)) {
            return R.error(1, "包含下级部门，无法修改");
        }
        if (sysDeptService.checkDeptHasUser(deptId)) {
            return R.error(1, "包含用户，无法修改");
        } else {
            if (sysDeptService.remove(deptId) > 0) {
                return R.ok();
            }
        }
        return R.error(1, "删除失败");
    }

    @GetMapping("/tree")
    @ResponseBody
    public Tree<SysDept> tree() {
        return sysDeptService.getTree();
    }

    @GetMapping("/treeView")
    public String treeView() {
        return prefix + "/deptTree";
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/treeView_teacher")
    public String treeView_teacher() {
        return "system/teach/classes/teacherTree";
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/treeTeacher")
    @ResponseBody
    public Tree<SysDept> treeTeacher() {
        SysRole sysRole = sysRoleService.getSysRoleByRoleName("教师");
        return sysDeptService.getTreeByRoleId(sysRole.getRoleId());
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/treeView_teacher/{id}")
    public String treeView_teacher(@PathVariable("id") Long id, Model model) {
        model.addAttribute("id", id);
        return "system/teach/classes/teacherTree";
    }

    @RequiresPermissions("sys:teach:classes")
    @GetMapping("/treeTeacher/{id}")
    @ResponseBody
    public Tree<SysDept> treeTeacher(@PathVariable("id") Long id) {
        SysRole sysRole = sysRoleService.getSysRoleByRoleName("教师");
        return sysDeptService.getSelectTreeByRoleId(sysRole.getRoleId(), id);
    }

}
