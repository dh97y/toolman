package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.service.SysFileService;
import com.hzy.toolman.core.service.SysLogService;
import com.hzy.toolman.core.utils.*;
import com.hzy.toolman.db.domain.system.SysFile;
import com.hzy.toolman.db.domain.system.SysLog;
import com.hzy.toolman.db.domain.system.SysMenu;
import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.system.service.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @projectName: toolman
 * @description: 登录页面控制器
 * @author: hzy
 * @create: 2020-07-03 23:07
 **/
@RequestMapping("/sys")
@Controller
public class LoginController extends BaseController {

    private final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysFileService sysFileService;

    @Autowired
    private SysLogService sysLogService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @GetMapping({"/", ""})
    public String welcome() {
        return "redirect:/sys/login";
    }

    @Log("请求访问主页")
    @GetMapping("/index")
    public String index(Model model) {
        List<Tree<SysMenu>> sysMenus = sysMenuService.listSysMenuTree(getSysUserId());
        model.addAttribute("sysMenus", sysMenus);
        model.addAttribute("name", getSysUser().getName());
        SysFile sysFile = sysFileService.getSysFileById(getSysUser().getPicId());
        if (sysFile != null && sysFile.getUrl() != null) {
            if (sysFileService.isExist(sysFile.getUrl())) {
                model.addAttribute("picUrl", sysFile.getUrl());
            } else {
                model.addAttribute("picUrl", "/img/photo_s.jpg");
            }
        } else {
            model.addAttribute("picUrl", "/img/photo_s.jpg");
        }
        model.addAttribute("username", getSysUser().getUsername());
        return "index_v1";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @Log("登录")
    @PostMapping("/login")
    @ResponseBody
    public R ajaxLogin(String username, String password, String verify, HttpServletRequest request) {
        try {
            // 从session中获取随机数
            String random = (String) request.getSession().getAttribute(RandomValidateCodeUtil.RANDOMCODEKEY);
            if (StringUtils.isBlank(verify)) {
                return R.error("请输入验证码");
            }
            if (!random.toLowerCase().equals(verify.toLowerCase())) {
                return R.error("请输入正确的验证码");
            }
        } catch (Exception e) {
            logger.error("验证码校验失败", e);
            return R.error("验证码校验失败");
        }
        password = MD5Utils.encrypt(username, password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return R.ok();
        } catch (AuthenticationException e) {
            return R.error("用户名或密码错误");
        }
    }

    @GetMapping("/logout")
    public String logout() {
        ShiroUtils.logout();
        return "redirect:/sys/login";
    }

    @GetMapping("/main")
    public String main(Model model) {
        SysLog sysLog = sysLogService.getLastLoginInfoByUserId(getSysUserId());
        SysRole sysRole = sysUserRoleService.getSysRoleByUserId(getSysUserId()).get(0);
        model.addAttribute("name", getSysUser().getName());
        model.addAttribute("roleName", sysRole.getRoleName());
        if (sysLog.getIp() != null) {
            model.addAttribute("lastLoginIp", sysLog.getIp());
        }
        model.addAttribute("systemInfo", SystemInfoUtil.getSystemInfo());
        return "main";
    }

    /**
     * 生成验证码
     */
    @GetMapping(value = "/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            logger.error("获取验证码失败>>>> ", e);
        }
    }
}
