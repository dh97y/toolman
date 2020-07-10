package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.utils.MD5Utils;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.db.domain.common.TbStudent;
import com.hzy.toolman.system.service.SysClassesService;
import com.hzy.toolman.system.service.SysStudentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 13:42
 **/
@RequestMapping("/sys/teach/student")
@Controller
public class SysStudentController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysStudentController.class);

    @Autowired
    private SysStudentService sysStudentService;

    @Autowired
    private SysClassesService sysClassesService;

    @RequiresPermissions("sys:teach:student")
    @GetMapping()
    public String student() {
        return "system/teach/student/student";
    }

    @RequiresPermissions("sys:teach:student")
    @GetMapping("/list")
    @ResponseBody
    public Page<TbStudent> list(@RequestParam Map<String, Object> params) {
        params.put("userId", getSysUserId());
        Query query = new Query(params);
        List<TbStudent> list = sysStudentService.list(query);
        int total = sysStudentService.count(query);
        Page<TbStudent> page = new Page<>(list, total);
        return page;
    }

    @RequiresPermissions("sys:teach:student:add")
    @GetMapping("/add")
    public String toAddPage() {
        return "system/teach/student/add";
    }

    @Log("添加学生")
    @RequiresPermissions("sys:teach:student:add")
    @PostMapping("/add")
    @ResponseBody
    public R save(TbStudent tbStudent) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (Objects.equals(tbStudent.getClassesId(), -1L)) {
            return R.error(1, "请选择班级");
        }
        if (sysStudentService.save(tbStudent) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:teach:student:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(@PathVariable("id") Long id, Model model) {
        TbStudent student = sysStudentService.getStudentById(id);
        List<TbClasses> classes = sysClassesService.listByUserId(getSysUserId());
        model.addAttribute("student", student);
        model.addAttribute("classes", classes);
        return "system/teach/student/edit";
    }

    @Log("更新学生")
    @RequiresPermissions("sys:teach:student:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(TbStudent tbStudent) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysStudentService.update(tbStudent) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("删除学生")
    @RequiresPermissions("sys:teach:student:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysStudentService.remove(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @Log("批量删除学生")
    @RequiresPermissions("sys:teach:student:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysStudentService.batchRemove(ids) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

    @RequiresPermissions("sys:teach:student")
    @PostMapping("/exist")
    @ResponseBody
    public boolean exist(@RequestParam String stuId) {
        // 返回true为存在，取反返回给前台
        return !sysStudentService.exist(stuId);
    }

    @RequiresPermissions("sys:teach:student:resetPwd")
    @GetMapping("/resetPwd/{id}")
    public String toResetPwdPage(@PathVariable("id") Long id, Model model) {
        TbStudent student = sysStudentService.getStudentById(id);
        model.addAttribute("student", student);
        return "system/teach/student/reset_pwd";
    }

    @Log("管理员更改密码")
    @RequiresPermissions("sys:user:resetPwd")
    @PostMapping("/adminResetPwd")
    @ResponseBody
    public R adminResetPwd(TbStudent tbStudent) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        tbStudent.setPassword(MD5Utils.encrypt(tbStudent.getStuId(), tbStudent.getPassword()));
        if (sysStudentService.update(tbStudent) > 0) {
            return R.ok();
        }
        return R.error(1, "更改失败");
    }

}
