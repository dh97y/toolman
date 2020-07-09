package com.hzy.toolman.core.service;

import com.hzy.toolman.db.domain.system.SysFile;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-05 00:01
 **/
public interface SysFileService {

    SysFile getSysFileById(Long id);

    /**
     * 判断一个文件是否存在
     * @param url SysFile中存的路径
     * @return
     */
    Boolean isExist(String url);

}
