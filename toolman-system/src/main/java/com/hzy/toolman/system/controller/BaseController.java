package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.utils.ShiroUtils;
import com.hzy.toolman.db.domain.system.SysUser;
import org.springframework.stereotype.Controller;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 00:26
 **/
@Controller
public class BaseController {

    public SysUser getSysUser() {
        return ShiroUtils.getSysUser();
    }

    public Long getSysUserId() {
        return getSysUser().getUserId();
    }

    public String getSysUsername() {
        return getSysUser().getUsername();
    }

}
