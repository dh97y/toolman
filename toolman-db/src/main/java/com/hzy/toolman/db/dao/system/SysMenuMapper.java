package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysMenu;
import com.hzy.toolman.db.domain.system.SysMenuExample;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface SysMenuMapper {
    long countByExample(SysMenuExample example);

    int deleteByExample(SysMenuExample example);

    int deleteByPrimaryKey(Long menuId);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectOneByExample(SysMenuExample example);

    SysMenu selectOneByExampleSelective(@Param("example") SysMenuExample example, @Param("selective") SysMenu.Column ... selective);

    List<SysMenu> selectByExampleSelective(@Param("example") SysMenuExample example, @Param("selective") SysMenu.Column ... selective);

    List<SysMenu> selectByExample(SysMenuExample example);

    SysMenu selectByPrimaryKeySelective(@Param("menuId") Long menuId, @Param("selective") SysMenu.Column ... selective);

    SysMenu selectByPrimaryKey(Long menuId);

    int updateByExampleSelective(@Param("record") SysMenu record, @Param("example") SysMenuExample example);

    int updateByExample(@Param("record") SysMenu record, @Param("example") SysMenuExample example);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);

    /*
    * ====================================================== Edit By hzy ========================================================
    * */

    List<String> listUserPerms(Long id);

    List<SysMenu> listSysMenuByUserId(Long id);

    List<Long> listSysMenuIdByRoleId(Long roleId);
}