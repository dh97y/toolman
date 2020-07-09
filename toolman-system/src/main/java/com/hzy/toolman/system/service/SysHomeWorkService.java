package com.hzy.toolman.system.service;

import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.common.TbHomework;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-09 11:09
 **/
public interface SysHomeWorkService {

    int save(MultipartFile file, Long userId, Long classesId, TbHomework homework) throws Exception;

    List<TbHomework> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    TbHomework getHomeworkById(Long id);

    int update(MultipartFile file, Long classesId, TbHomework tbHomework) throws Exception;

    int remove(Long id);

    int batchRemove(Long[] ids);
}
