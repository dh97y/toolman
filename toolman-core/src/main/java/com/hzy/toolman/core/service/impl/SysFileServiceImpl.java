package com.hzy.toolman.core.service.impl;

import com.hzy.toolman.core.service.SysFileService;
import com.hzy.toolman.db.dao.system.SysFileMapper;
import com.hzy.toolman.db.domain.system.SysFile;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 00:01
 **/
@Service
public class SysFileServiceImpl implements SysFileService {
    @Resource
    private SysFileMapper sysFileMapper;

    @Value("${toolman.uploadPath}")
    private String uploadPath;

    @Override
    public SysFile getSysFileById(Long id) {
        return sysFileMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean isExist(String url) {
        boolean isExist = false;
        if (!StringUtils.isEmpty(url)) {
            String filePath = url.replace("/files/", "");
            filePath = uploadPath + filePath;
            File file = new File(filePath);
            if (file.exists()) {
                isExist = true;
            }
        }
        return isExist;
    }
}
