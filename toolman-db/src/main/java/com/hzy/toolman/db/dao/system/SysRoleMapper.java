package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.db.domain.system.SysRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysRoleMapper {
    long countByExample(SysRoleExample example);

    int deleteByExample(SysRoleExample example);

    int deleteByPrimaryKey(Long roleId);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectOneByExample(SysRoleExample example);

    SysRole selectOneByExampleSelective(@Param("example") SysRoleExample example, @Param("selective") SysRole.Column ... selective);

    List<SysRole> selectByExampleSelective(@Param("example") SysRoleExample example, @Param("selective") SysRole.Column ... selective);

    List<SysRole> selectByExample(SysRoleExample example);

    SysRole selectByPrimaryKeySelective(@Param("roleId") Long roleId, @Param("selective") SysRole.Column ... selective);

    SysRole selectByPrimaryKey(Long roleId);

    int updateByExampleSelective(@Param("record") SysRole record, @Param("example") SysRoleExample example);

    int updateByExample(@Param("record") SysRole record, @Param("example") SysRoleExample example);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    int batchRemove(Long[] roleIds);

}