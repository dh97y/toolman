package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysRole;
import com.hzy.toolman.db.domain.system.SysUserRole;
import com.hzy.toolman.db.domain.system.SysUserRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysUserRoleMapper {
    long countByExample(SysUserRoleExample example);

    int deleteByExample(SysUserRoleExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysUserRole record);

    int insertSelective(SysUserRole record);

    SysUserRole selectOneByExample(SysUserRoleExample example);

    SysUserRole selectOneByExampleSelective(@Param("example") SysUserRoleExample example, @Param("selective") SysUserRole.Column ... selective);

    List<SysUserRole> selectByExampleSelective(@Param("example") SysUserRoleExample example, @Param("selective") SysUserRole.Column ... selective);

    List<SysUserRole> selectByExample(SysUserRoleExample example);

    SysUserRole selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") SysUserRole.Column ... selective);

    SysUserRole selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysUserRole record, @Param("example") SysUserRoleExample example);

    int updateByExample(@Param("record") SysUserRole record, @Param("example") SysUserRoleExample example);

    int updateByPrimaryKeySelective(SysUserRole record);

    int updateByPrimaryKey(SysUserRole record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    List<SysRole> getSysRoleByUserId(Long userId);

    List<Long> getRoleIdsByUserId(Long userId);

    int batchSave(List<SysUserRole> sysUserRoles);

    int batchRemoveByUserId(Long[] userIds);

    int batchRemoveByRoleId(Long[] roleIds);

}