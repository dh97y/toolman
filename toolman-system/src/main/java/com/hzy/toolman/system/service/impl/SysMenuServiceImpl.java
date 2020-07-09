package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.BuildTree;
import com.hzy.toolman.db.dao.system.SysMenuMapper;
import com.hzy.toolman.db.dao.system.SysRoleMenuMapper;
import com.hzy.toolman.db.domain.system.SysMenu;
import com.hzy.toolman.db.domain.system.SysMenuExample;
import com.hzy.toolman.system.service.SysMenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.*;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 17:24
 **/
@Service
public class SysMenuServiceImpl implements SysMenuService {

    @Resource
    private SysMenuMapper sysMenuMapper;

    @Override
    public List<Tree<SysMenu>> listSysMenuTree(Long id) {
        List<Tree<SysMenu>> menuTrees = new ArrayList<>();
        List<SysMenu> sysMenus = sysMenuMapper.listSysMenuByUserId(id);
        for (SysMenu sysMenu : sysMenus) {
            Tree<SysMenu> tree = new Tree<>();
            tree.setId(sysMenu.getMenuId().toString());
            tree.setParentId(sysMenu.getParentId().toString());
            tree.setText(sysMenu.getName());
            Map<String, Object> attributes = new HashMap<>(16);
            attributes.put("url", sysMenu.getUrl());
            attributes.put("icon", sysMenu.getIcon());
            tree.setAttributes(attributes);
            menuTrees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        List<Tree<SysMenu>> list = BuildTree.buildList(menuTrees, "0");
        return list;
    }

    @Override
    public List<SysMenu> list(Map<String, Object> params) {
        String sort = "";
        SysMenuExample example = new SysMenuExample();
        if (params.get("sort") != null) {
            sort = params.get("sort").toString();
            example.setOrderByClause(sort);
        }
        List<SysMenu> sysMenus = sysMenuMapper.selectByExample(example);
        return sysMenus;
    }

    @Override
    public Set<String> listUserPerms(Long userId) {
        List<String> perms = sysMenuMapper.listUserPerms(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms) {
            if (StringUtils.isNotBlank(perm)) {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    @Override
    public SysMenu getSysMenuByMenuId(Long menuId) {
        return sysMenuMapper.selectByPrimaryKey(menuId);
    }

    @Override
    public int add(SysMenu sysMenu) {
        sysMenu.setGmtCreate(new Date());
        sysMenu.setGmtModified(new Date());
        return sysMenuMapper.insertSelective(sysMenu);
    }

    @Override
    public int remove(Long menuId) {
        return sysMenuMapper.deleteByPrimaryKey(menuId);
    }

    @Override
    public int update(SysMenu sysMenu) {
        sysMenu.setGmtModified(new Date());
        return sysMenuMapper.updateByPrimaryKeySelective(sysMenu);
    }

    @Override
    public Tree<SysMenu> getTree() {
        List<Tree<SysMenu>> trees = new ArrayList<>();
        List<SysMenu> sysMenus = sysMenuMapper.selectByExample(new SysMenuExample());
        for (SysMenu sysMenu : sysMenus) {
            Tree<SysMenu> tree = new Tree<>();
            tree.setId(sysMenu.getMenuId().toString());
            tree.setParentId(sysMenu.getParentId().toString());
            tree.setText(sysMenu.getName());
            trees.add(tree);
        }
        // 默认顶级节点为0
        Tree<SysMenu> menuTree = BuildTree.build(trees);
        return menuTree;
    }

    @Override
    public Tree<SysMenu> getTreeByRoleId(Long roleId) {
        List<SysMenu> sysMenus = sysMenuMapper.selectByExample(new SysMenuExample());
        List<Long> sysMenuIds = sysMenuMapper.listSysMenuIdByRoleId(roleId);
        List<Long> temp = sysMenuIds;
        for (SysMenu sysMenu : sysMenus) {
            if (temp.contains(sysMenu.getParentId())) {
                sysMenuIds.remove(sysMenu.getParentId());
            }
        }
        List<Tree<SysMenu>> trees = new ArrayList<>();
        List<SysMenu> sysMenuList = sysMenuMapper.selectByExample(new SysMenuExample());
        for (SysMenu sysMenu : sysMenuList) {
            Tree<SysMenu> tree = new Tree<>();
            tree.setId(sysMenu.getMenuId().toString());
            tree.setParentId(sysMenu.getParentId().toString());
            tree.setText(sysMenu.getName());
            Map<String, Object> state = new HashMap<>();
            Long menuId = sysMenu.getMenuId();
            if (sysMenuIds.contains(menuId)) {
                state.put("selected", true);
            } else {
                state.put("selected", false);
            }
            tree.setState(state);
            trees.add(tree);
        }
        Tree<SysMenu> menuTree = BuildTree.build(trees);
        return menuTree;
    }
}
