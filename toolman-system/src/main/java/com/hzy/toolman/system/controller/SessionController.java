package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.system.domain.UserOnline;
import com.hzy.toolman.system.service.SessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-06 22:52
 **/
@RequestMapping("/sys/online")
@Controller
public class SessionController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SessionController.class);

    private String prefix = "system/online";

    @Autowired
    private SessionService sessionService;

    @RequiresPermissions("sys:online:online")
    @GetMapping()
    public String online() {
        return prefix + "/online";
    }

    @RequiresPermissions("sys:online:online")
    @RequestMapping("/list")
    @ResponseBody
    public List<UserOnline> list() {
        return sessionService.list();
    }

    @RequiresPermissions("sys:online:remove")
    @RequestMapping("/forceLogout/{sessionId}")
    @ResponseBody
    public R forceLogout(@PathVariable("sessionId") String sessionId,
                         RedirectAttributes redirectAttributes) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            sessionService.forceLogout(sessionId);
            return R.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return R.error();
        }
    }

}
