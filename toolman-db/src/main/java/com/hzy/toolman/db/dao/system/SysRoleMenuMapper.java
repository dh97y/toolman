package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysRoleMenu;
import com.hzy.toolman.db.domain.system.SysRoleMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysRoleMenuMapper {
    long countByExample(SysRoleMenuExample example);

    int deleteByExample(SysRoleMenuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysRoleMenu record);

    int insertSelective(SysRoleMenu record);

    SysRoleMenu selectOneByExample(SysRoleMenuExample example);

    SysRoleMenu selectOneByExampleSelective(@Param("example") SysRoleMenuExample example, @Param("selective") SysRoleMenu.Column ... selective);

    List<SysRoleMenu> selectByExampleSelective(@Param("example") SysRoleMenuExample example, @Param("selective") SysRoleMenu.Column ... selective);

    List<SysRoleMenu> selectByExample(SysRoleMenuExample example);

    SysRoleMenu selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") SysRoleMenu.Column ... selective);

    SysRoleMenu selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysRoleMenu record, @Param("example") SysRoleMenuExample example);

    int updateByExample(@Param("record") SysRoleMenu record, @Param("example") SysRoleMenuExample example);

    int updateByPrimaryKeySelective(SysRoleMenu record);

    int updateByPrimaryKey(SysRoleMenu record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    int batchSave(@Param("sysRoleMenus") List<SysRoleMenu> sysRoleMenus);

    int batchRemoveByRoleId(Long[] roleIds);

}