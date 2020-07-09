package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.common.TbNotify;
import com.hzy.toolman.db.domain.common.TbNotifyDTO;
import com.hzy.toolman.db.domain.system.SysDict;
import com.hzy.toolman.system.service.SysDictService;
import com.hzy.toolman.system.service.SysNotifyRecordService;
import com.hzy.toolman.system.service.SysNotifyService;
import com.hzy.toolman.system.vo.SysNotifyVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description: 通知管理页面控制器
 * @author: hzy
 * @create: 2020-07-07 17:26
 **/
@RequestMapping("/sys/notify")
@Controller
public class SysNotifyController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysNotifyController.class);

    private String prefix = "system/notify";

    @Autowired
    private SysNotifyService sysNotifyService;

    @Autowired
    private SysNotifyRecordService sysNotifyRecordService;

    @Autowired
    private SysDictService sysDictService;

    @RequiresPermissions("sys:notify:notify")
    @GetMapping()
    public String sysNotify() {
        return prefix + "/notify";
    }

    @RequiresPermissions("sys:notify:notify")
    @GetMapping("/list")
    @ResponseBody
    public Page<TbNotify> list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        List<TbNotify> tbNotifies = sysNotifyService.list(query);
        int total = sysNotifyService.count(query);
        Page<TbNotify> page = new Page<>(tbNotifies, total);
        return page;
    }

    @RequiresPermissions("sys:notify:add")
    @GetMapping("/add")
    public String toAddPage() {
        return prefix + "/add";
    }

    @Log("添加通知")
    @RequiresPermissions("sys:notify:add")
    @PostMapping("/save")
    @ResponseBody
    public R save(TbNotifyDTO tbNotifyDTO) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        tbNotifyDTO.setCreateBy(getSysUserId());
        if (sysNotifyService.save(tbNotifyDTO) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:notify:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(@PathVariable("id") Long id, Model model) {
        TbNotify tbNotify = sysNotifyService.getTbNotifyById(id);
        List<SysDict> sysDicts = sysDictService.getSysDictListByType("notify_type");
        String type = tbNotify.getType();
        for (SysDict sysDict : sysDicts) {
            if (type.equals(sysDict.getName())) {
                sysDict.setRemarks("checked");
            }
        }
        model.addAttribute("sysDicts", sysDicts);
        model.addAttribute("notify", tbNotify);
        return prefix + "/edit";
    }

    @Log("更新通知")
    @RequiresPermissions("sys:notify:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(TbNotify tbNotify) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysNotifyService.update(tbNotify) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("删除通知")
    @RequiresPermissions("sys:notify:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysNotifyService.remove(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @Log("批量删除通知")
    @RequiresPermissions("sys:notify:remove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysNotifyService.batchRemove(ids) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

    @GetMapping("/message")
    @ResponseBody
    public Page<TbNotifyDTO> message() {
        Map<String, Object> params = new HashMap<>(16);
        params.put("offset", 0);
        params.put("limit", 3);
        Query query = new Query(params);
        query.put("userId", getSysUserId());
        query.put("isRead", SystemConstant.NOTIFY_READ_NO);
        return sysNotifyService.selfList(query);
    }

    @GetMapping("/selfNotify")
    public String selfNotify() {
        return prefix + "/selfNotify";
    }

    @GetMapping("/selfList")
    @ResponseBody
    public Page<TbNotifyDTO> selfList(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        query.put("userId", getSysUserId());
        return sysNotifyService.selfList(query);
    }

    @RequiresPermissions("sys:notify:edit")
    @GetMapping("/read/{id}")
    public String read(@PathVariable("id") Long id, Model model) {
        TbNotify tbNotify = sysNotifyService.getTbNotifyById(id);
        // 更改阅读状态
        SysNotifyVo sysNotifyVo = new SysNotifyVo();
        sysNotifyVo.setNotifyId(id);
        sysNotifyVo.setUserId(getSysUserId());
        sysNotifyVo.setReadDate(new Date());
        sysNotifyVo.setIsRead(SystemConstant.NOTIFY_READ_YES);
        sysNotifyRecordService.changeRead(sysNotifyVo);
        model.addAttribute("notify", tbNotify);
        return prefix + "/read";
    }

}
