package com.hzy.toolman.system.controller;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.core.utils.FileUtils;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.db.domain.common.TbHomework;
import com.hzy.toolman.system.service.SysClassesHomeworkService;
import com.hzy.toolman.system.service.SysClassesService;
import com.hzy.toolman.system.service.SysHomeWorkService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-09 11:08
 **/
@RequestMapping("/sys/teach/homework")
@Controller
public class SysHomeWorkController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SysHomeWorkController.class);

    @Autowired
    private SysHomeWorkService sysHomeWorkService;

    @Autowired
    private SysClassesHomeworkService sysClassesHomeworkService;

    @Autowired
    private SysClassesService sysClassesService;

    @Value("${toolman.teach_upload_path}")
    private String teach_upload_path;

    @RequiresPermissions("sys:teach:homework")
    @GetMapping()
    public String homework() {
        return "system/teach/homework/homework";
    }

    @RequiresPermissions("sys:teach:homework")
    @GetMapping("/list")
    @ResponseBody
    public Page<TbHomework> list(@RequestParam Map<String, Object> params) {
        params.put("createBy", getSysUserId());
        Query query = new Query(params);
        List<TbHomework> list = sysHomeWorkService.list(query);
        int total = sysHomeWorkService.count(query);
        Page<TbHomework> page = new Page<>(list, total);
        return page;
    }

    @RequiresPermissions("sys:teach:homework:add")
    @GetMapping("/add")
    public String toAddPage() {
        return "system/teach/homework/add";
    }

    @Log("上传作业")
    @RequiresPermissions("sys:teach:homework:add")
    @PostMapping("/add")
    @ResponseBody
    public R save(TbHomework tbHomework, @RequestParam("files") MultipartFile file,
                  @RequestParam("classesId") Long classesId, HttpServletRequest request) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            if (sysHomeWorkService.save(file, getSysUserId(), classesId, tbHomework) > 0) {
                return R.ok();
            }
            return R.error(1, "保存失败");
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @RequiresPermissions("sys:teach:homework:edit")
    @GetMapping("/edit/{id}")
    public String toEditPage(@PathVariable("id") Long id, Model model) {
        TbHomework homework = sysHomeWorkService.getHomeworkById(id);
        Long classesId = sysClassesHomeworkService.getClassesIdByHomeworkId(id);
        List<TbClasses> classes = sysClassesService.listByUserId(getSysUserId());
        model.addAttribute("homework", homework);
        model.addAttribute("classes", classes);
        model.addAttribute("classesId", classesId);
        return "system/teach/homework/edit";
    }

    @Log("更新作业")
    @RequiresPermissions("sys:tecah:homework:edit")
    @PostMapping("/update")
    @ResponseBody
    public R update(@RequestParam("files") MultipartFile file, TbHomework tbHomework,
                    @RequestParam("classesId") Long classesId, HttpServletRequest request) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        try {
            if (sysHomeWorkService.update(file, classesId, tbHomework) > 0) {
                return R.ok();
            }
            return R.error(1, "更新失败");
        } catch (Exception e) {
            return R.error(1, e.getMessage());
        }
    }

    @Log("删除作业")
    @RequiresPermissions("sys:teach:homework:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(@RequestParam("id") Long id) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysHomeWorkService.remove(id) > 0) {
            return R.ok();
        }
        return R.error(1, "删除失败");
    }

    @Log("批量删除作业")
    @RequiresPermissions("sys:teach:homework:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    public R batchRemove(@RequestParam("ids[]") Long ids[]) {
        if (SystemConstant.DEMO_ACCOUNT.equals(getSysUsername())) {
            return R.error(1, SystemConstant.DEMO_ACCOUNT_TIP);
        }
        if (sysHomeWorkService.batchRemove(ids) > 0) {
            return R.ok();
        }
        return R.error(1, "批量删除失败");
    }

    @RequiresPermissions("sys:teach:homework:download")
    @GetMapping("/exist")
    @ResponseBody
    public R exist(@RequestParam("id") Long id) {
        TbHomework homework = sysHomeWorkService.getHomeworkById(id);
        if (!StringUtils.isNotBlank(homework.getUrl())) {
            return R.error(1, "文件不存在");
        }
        String url = homework.getUrl();
        url = url.replace("/files/", "");;
        String filePath = teach_upload_path + url;
        File file = new File(filePath);
        if (!file.exists()) {
            return R.error(1, "文件不存在");
        }
        return R.ok();
    }

    @RequiresPermissions("sys:teach:homework:download")
    @GetMapping("/download/{id}")
    public void download(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        TbHomework homework = sysHomeWorkService.getHomeworkById(id);
        if (!StringUtils.isNotBlank(homework.getUrl())) {
            response.sendRedirect("/404");
            return;
        }
        String url = homework.getUrl();
        url = url.replace("/files/", "");;
        String filePath = teach_upload_path + url;
        File file = new File(filePath);
        if (!file.exists()) {
            response.sendRedirect("/404");
            return;
        }
        response.setContentType("application/force-download");
        response.setContentType("multipart/form-data;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;fileName="
                + new String(homework.getName().getBytes("GBK"), StandardCharsets.ISO_8859_1)
                + "." + url.substring(url.lastIndexOf(".") + 1));
        byte[] buffer = new byte[1024];
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        OutputStream os = null;
        try {
            os = response.getOutputStream();
            fis = new FileInputStream(file);
            bis = new BufferedInputStream(fis);
            int i = bis.read(buffer);
            while (i != -1) {
                os.write(buffer);
                i = bis.read(buffer);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(404);
        } finally {
            bis.close();
            fis.close();
        }
    }


}
