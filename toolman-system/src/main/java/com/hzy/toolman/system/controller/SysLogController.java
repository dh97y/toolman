package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.core.service.SysLogService;
import com.hzy.toolman.db.domain.system.SysLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-06 23:33
 **/
@RequestMapping("/sys/log")
@Controller
public class SysLogController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysLogController.class);

    private String prefix = "system/log";

    @Autowired
    private SysLogService sysLogService;

    @RequiresPermissions("sys:log:log")
    @GetMapping()
    public String log() {
        return prefix + "/log";
    }

    @RequiresPermissions("sys:log:log")
    @GetMapping("/list")
    @ResponseBody
    public Page<SysLog> list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        Page<SysLog> page = sysLogService.queryList(query);
        return page;
    }

    @RequiresPermissions("sys:log:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysLogService.delete(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @RequiresPermissions("sys:log:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysLogService.batchDelete(ids) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

}
