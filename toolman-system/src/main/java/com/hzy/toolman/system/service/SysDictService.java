package com.hzy.toolman.system.service;

import com.hzy.toolman.db.domain.system.SysDict;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 16:00
 **/
public interface SysDictService {

    List<SysDict> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SysDict sysDict);

    int update(SysDict sysDict);

    int delete(Long id);

    int batchRemove(Long[] ids);

    SysDict getSysDictById(Long id);

    List<SysDict> listType();

    String getDictNameByTypeAndValue(String type, String value);

    List<SysDict> getSysDictListByType(String type);

}
