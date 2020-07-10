package com.hzy.toolman.system.service;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.system.vo.SysClassesVo;

import java.util.List;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 13:53
 **/
public interface SysClassesService {

    List<TbClasses> list();

    int save(SysClassesVo sysClassesVo) throws Exception;

    int update(SysClassesVo sysClassesVo) throws Exception;

    int remove(Long id) throws Exception;

    int batchRemove(Long[] ids) throws Exception;

    Tree<TbClasses> getTree();

    Tree<TbClasses> getTreeByClassId(Long id);

    TbClasses getClassesById(Long id);

    Tree<TbClasses> getClassesTree(Long userId);

    List<TbClasses> listByUserId(Long userId);
}
