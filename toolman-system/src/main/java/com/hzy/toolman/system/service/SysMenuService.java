package com.hzy.toolman.system.service;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.db.domain.system.SysMenu;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 17:17
 **/
public interface SysMenuService {

    List<Tree<SysMenu>> listSysMenuTree(Long id);

    List<SysMenu> list(Map<String, Object> params);

    Set<String> listUserPerms(Long userId);

    SysMenu getSysMenuByMenuId(Long menuId);

    int add(SysMenu sysMenu);

    int update(SysMenu sysMenu);

    int remove(Long menuId);

    Tree<SysMenu> getTree();

    Tree<SysMenu> getTreeByRoleId(Long roleId);

}
