package com.hzy.toolman.system.service;

import com.hzy.toolman.db.domain.common.TbStudent;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 16:17
 **/
public interface SysStudentService {

    List<TbStudent> getStudentByClassesId(Long classesId);

    List<TbStudent> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(TbStudent tbStudent);

    TbStudent getStudentById(Long id);

    boolean exist(String stuId);

    int update(TbStudent tbStudent);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
