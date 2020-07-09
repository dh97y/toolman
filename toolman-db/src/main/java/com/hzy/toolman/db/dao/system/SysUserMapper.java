package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.db.domain.system.SysUserExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SysUserMapper {
    long countByExample(SysUserExample example);

    int deleteByExample(SysUserExample example);

    int deleteByPrimaryKey(Long userId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectOneByExample(SysUserExample example);

    SysUser selectOneByExampleSelective(@Param("example") SysUserExample example, @Param("selective") SysUser.Column ... selective);

    List<SysUser> selectByExampleSelective(@Param("example") SysUserExample example, @Param("selective") SysUser.Column ... selective);

    List<SysUser> selectByExample(SysUserExample example);

    SysUser selectByPrimaryKeySelective(@Param("userId") Long userId, @Param("selective") SysUser.Column ... selective);

    SysUser selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") SysUser record, @Param("example") SysUserExample example);

    int updateByExample(@Param("record") SysUser record, @Param("example") SysUserExample example);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    List<SysUser> list(Map<String, Object> map);

    int count(Map<String,Object> map);

    int batchRemove(Long[] userIds);

    int getDeptUserNumber(Long deptId);

    Long[] getAllDeptId();

    Long[] getAllDeptIdByRoleId(Long roleId);

    List<SysUser> getSysUsersByRoleId(Long roleId);

    List<SysUser> getTeachers(Long[] teacherIds);
}