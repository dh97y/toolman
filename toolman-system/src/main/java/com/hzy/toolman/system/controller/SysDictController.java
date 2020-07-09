package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.system.SysDict;
import com.hzy.toolman.system.service.SysDictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 15:58
 **/
@RequestMapping("/sys/dict")
@Controller
public class SysDictController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysDictController.class);

    private String prefix = "system/dict";

    @Autowired
    private SysDictService sysDictService;

    @RequiresPermissions("sys:dict:dict")
    @GetMapping()
    public String dict() {
        return prefix + "/dict";
    }

    @RequiresPermissions("sys:dict:dict")
    @GetMapping("/list")
    @ResponseBody
    public Page<SysDict> list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        List<SysDict> sysDicts = sysDictService.list(query);
        int total = sysDictService.count(query);
        Page<SysDict> page = new Page<>(sysDicts, total);
        return page;
    }

    @RequiresPermissions("sys:dict:dict")
    @GetMapping("/list/{type}")
    @ResponseBody
    public List<SysDict> listByType(@PathVariable("type") String type) {
        Map<String, Object> map = new HashMap<>(16);;
        map.put("type", type);
        List<SysDict> sysDicts = sysDictService.list(map);
        return sysDicts;
    }

    @RequiresPermissions("sys:dict:add")
    @GetMapping("/add")
    public String toAddPage() {
        return prefix + "/add";
    }

    @Log("添加数据字典")
    @RequiresPermissions("sys:dict:add")
    @PostMapping("/save")
    @ResponseBody
    public R add(SysDict sysDict) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        sysDict.setCreateBy(Integer.parseInt(getSysUserId().toString()));
        if (sysDictService.save(sysDict) > 0) {
            return R.ok();
        }
        return R.error(1, "添加失败");
    }

    @RequiresPermissions("sys:dict:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(@PathVariable("id") Long id, Model model) {
        SysDict sysDict = sysDictService.getSysDictById(id);
        model.addAttribute("sysDict", sysDict);
        return prefix + "/edit";
    }

    @Log("更新数据字典")
    @RequiresPermissions("sys:dict:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(SysDict sysDict) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        sysDict.setUpdateBy(getSysUserId());
        if (sysDictService.update(sysDict) > 0) {
            return R.ok();
        }
        return R.error(1, "更新失败");
    }

    @Log("删除数据字典")
    @RequiresPermissions("sys:dict:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysDictService.delete(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @Log("批量删除数据字典")
    @RequiresPermissions("sys:dict:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysDictService.batchRemove(ids) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

    @Log("添加同种类型的数据字典")
    @RequiresPermissions("sys:dict:add")
    @GetMapping("/add/{type}/{description}")
    public String alreadyAdd(@PathVariable("type") String type, @PathVariable("description") String description,
                             Model model) {
        model.addAttribute("type", type);
        model.addAttribute("description", description);
        return prefix + "/add";
    }

    @RequiresPermissions("sys:dict:dict")
    @GetMapping("/type")
    @ResponseBody
    public List<SysDict> listType() {
        return sysDictService.listType();
    }

}
