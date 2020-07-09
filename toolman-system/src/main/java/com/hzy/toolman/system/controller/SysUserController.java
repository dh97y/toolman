package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.core.utils.MD5Utils;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.system.SysDept;
import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.service.SysRoleService;
import com.hzy.toolman.system.service.SysUserService;
import com.hzy.toolman.system.vo.SysUserVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 00:28
 **/
@RequestMapping("/sys/user")
@Controller
public class SysUserController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysUserController.class);

    private String prefix = "system/user";

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysRoleService sysRoleService;

    @RequiresPermissions("sys:user:user")
    @GetMapping()
    public String sysUser() {
        return prefix + "/user";
    }

    @RequiresPermissions("sys:user:user")
    @GetMapping("/list")
    @ResponseBody
    public Page<SysUser> list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        List<SysUser> sysUsers = sysUserService.list(query);
        int total = sysUserService.count(query);
        return new Page<>(sysUsers, total);
    }

    @RequiresPermissions("sys:user:add")
    @GetMapping("/add")
    public String toAddPage(Model model) {
        List<SysRole> sysRoles = sysRoleService.list();
        model.addAttribute("sysRoles", sysRoles);
        return prefix + "/add";
    }

    @Log("添加用户")
    @RequiresPermissions("sys:user:add")
    @PostMapping("/add")
    @ResponseBody
    public R add(SysUserVo sysUser) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        sysUser.setPassword(MD5Utils.encrypt(sysUser.getUsername(), sysUser.getPassword()));
        sysUser.setUserIdCreate(getSysUserId());
        if (sysUserService.save(sysUser) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:user:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(Model model, @PathVariable("id") Long id) {
        SysUserVo sysUser = sysUserService.getSysUserVoByUserId(id);
        model.addAttribute("sysUser", sysUser);
        List<SysRole> sysRoles = sysRoleService.listByUserId(id);
        model.addAttribute("sysRoles", sysRoles);
        return prefix + "/edit";
    }

    @Log("更新用户")
    @RequiresPermissions("sys:user:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(SysUserVo sysUser) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysUserService.update(sysUser) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @PostMapping("/exist")
    @ResponseBody
    public boolean exist(@RequestParam Map<String, Object> params) {
        // username存在返回false
        return !sysUserService.exist(params);
    }

    @Log("删除用户")
    @RequiresPermissions("sys:user:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysUserService.remove(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @Log("批量删除用户")
    @RequiresPermissions("sys:user:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] userIds) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysUserService.batchRemove(userIds) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

    @RequiresPermissions("sys:user:resetPwd")
    @GetMapping("/resetPwd/{id}")
    public String toResetPwdPage(@PathVariable("id") Long userId, Model model) {
        SysUser sysUser = sysUserService.getSysUserVoByUserId(userId);
        model.addAttribute("sysUser", sysUser);
        return prefix + "/reset_pwd";
    }

    @Log("管理员更改密码")
    @RequiresPermissions("sys:user:resetPwd")
    @PostMapping("/adminResetPwd")
    @ResponseBody
    public R adminResetPwd(SysUser sysUser) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            sysUserService.adminResetPwd(sysUser);
            return R.ok();
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @GetMapping("/personal")
    public String personal(Model model) {
        SysUserVo sysUser = sysUserService.getSysUserVoByUserId(getSysUserId());
        model.addAttribute("sysUser", sysUser);
        return prefix + "/personal";
    }

    @Log("用户自行更改密码")
    @PostMapping("/resetPwd")
    @ResponseBody
    public R resetPwdByUser(SysUserVo sysUser) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            sysUserService.resetPwdByUser(sysUser, getSysUser());
            return R.ok();
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @Log("用户自行更改信息")
    @PostMapping("/updatePersonal")
    @ResponseBody
    public R updatePersonal(SysUser sysUser) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysUserService.updatePersonal(sysUser) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("用户上传头像")
    @PostMapping("/uploadImg")
    @ResponseBody
    public R uploadImg(@RequestParam("avatar_file")MultipartFile file, String avatar_data,
                       HttpServletRequest request) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        Map<String, Object> result = new HashMap<>();
        try {
            result = sysUserService.updatePersonalImg(file, avatar_data, getSysUserId());
        } catch (Exception e) {
            return R.error("更新图像失败");
        }
        if (result != null && result.size() > 0) {
            return R.ok(result);
        }
        return R.error("更新图像失败");
    }

    @RequiresPermissions("sys:user:user")
    @GetMapping("/treeView")
    public String treeView() {
        return prefix + "/userTree";
    }

    @RequiresPermissions("sys:user:user")
    @GetMapping("/tree")
    @ResponseBody
    public Tree<SysDept> tree() {
        return sysUserService.getTree();
    }

}
