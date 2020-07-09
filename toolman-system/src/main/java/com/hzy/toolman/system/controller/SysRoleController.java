package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.system.service.SysRoleService;
import com.hzy.toolman.system.vo.SysRoleVo;
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
 * @create: 2020-07-05 22:40
 **/
@RequestMapping("/sys/role")
@Controller
public class SysRoleController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysRoleController.class);

    private String prefix = "system/role";

    @Autowired
    private SysRoleService sysRoleService;

    @RequiresPermissions("sys:role:role")
    @GetMapping()
    public String role() {
        return prefix + "/role";
    }

    @RequiresPermissions("sys:role:role")
    @GetMapping("/list")
    @ResponseBody
    public List<SysRole> list() {
        return sysRoleService.list();
    }

    @RequiresPermissions("sys:role:add")
    @GetMapping("/add")
    public String toAddPage() {
        return prefix + "/add";
    }

    @Log("添加角色")
    @RequiresPermissions("sys:role:add")
    @PostMapping("/save")
    @ResponseBody
    public R add(SysRoleVo sysRole) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        sysRole.setUserIdCreate(getSysUserId());
        if (sysRoleService.save(sysRole) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:role:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(@PathVariable("id") Long id, Model model) {
        SysRole sysRole = sysRoleService.getSysRoleByRoleId(id);
        model.addAttribute("sysRole", sysRole);
        return prefix + "/edit";
    }

    @Log("更新角色")
    @RequiresPermissions("sys:role:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(SysRoleVo sysRole) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysRoleService.update(sysRole) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("删除角色")
    @RequiresPermissions("sys:role:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysRoleService.remove(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @Log("批量删除角色")
    @RequiresPermissions("sys:role:batchRemove")
    @PostMapping("batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysRoleService.batchRemove(ids) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

}
