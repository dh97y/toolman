package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.system.SysMenu;
import com.hzy.toolman.system.service.SysMenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description: 菜单页面控制器
 * @author: hzy
 * @create: 2020-07-04 17:05
 **/
@RequestMapping("/sys/menu")
@Controller
public class SysMenuController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysMenuController.class);

    private String prefix = "system/menu";

    @Autowired
    private SysMenuService sysMenuService;

    @RequiresPermissions("sys:menu:menu")
    @GetMapping()
    public String sysMenu() {
        return prefix + "/menu";
    }

    @RequiresPermissions("sys:menu:menu")
    @RequestMapping("/list")
    @ResponseBody
    public List<SysMenu> list(@RequestParam Map<String, Object> params) {
        List<SysMenu> sysMenus = sysMenuService.list(params);
        return sysMenus;
    }

    @RequiresPermissions("sys:menu:add")
    @GetMapping("/add/{pId}")
    public String toAddPage(Model model, @PathVariable("pId") Long pId) {
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "根目录");
        } else {
            model.addAttribute("pName", sysMenuService.getSysMenuByMenuId(pId).getName());
        }
        return prefix + "/add";
    }

    @Log("添加菜单")
    @RequiresPermissions("sys:menu:add")
    @PostMapping("/add")
    @ResponseBody
    public R add(SysMenu sysMenu) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysMenuService.add(sysMenu) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:menu:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(Model model, @PathVariable("id") Long id) {
        SysMenu sysMenu = sysMenuService.getSysMenuByMenuId(id);
        Long pId = sysMenu.getParentId();
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "根目录");
        } else {
            model.addAttribute("pName", sysMenuService.getSysMenuByMenuId(pId).getName());
        }
        model.addAttribute("sysMenu", sysMenu);
        return prefix + "/edit";
    }

    @Log("更新菜单")
    @RequiresPermissions("sys:menu:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(SysMenu sysMenu) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysMenuService.update(sysMenu) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("删除菜单")
    @RequiresPermissions("sys:menu:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysMenuService.remove(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @GetMapping("/tree")
    @ResponseBody
    public Tree<SysMenu> tree() {
        return sysMenuService.getTree();
    }

    @GetMapping("/tree/{roleId}")
    @ResponseBody
    public Tree<SysMenu> tree(@PathVariable("roleId") Long roleId) {
        return sysMenuService.getTreeByRoleId(roleId);
    }

}
