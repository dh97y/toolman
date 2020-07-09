package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysDept;
import com.hzy.toolman.db.domain.system.SysDeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysDeptMapper {
    long countByExample(SysDeptExample example);

    int deleteByExample(SysDeptExample example);

    int deleteByPrimaryKey(Long deptId);

    int insert(SysDept record);

    int insertSelective(SysDept record);

    SysDept selectOneByExample(SysDeptExample example);

    SysDept selectOneByExampleSelective(@Param("example") SysDeptExample example, @Param("selective") SysDept.Column ... selective);

    List<SysDept> selectByExampleSelective(@Param("example") SysDeptExample example, @Param("selective") SysDept.Column ... selective);

    List<SysDept> selectByExample(SysDeptExample example);

    SysDept selectByPrimaryKeySelective(@Param("deptId") Long deptId, @Param("selective") SysDept.Column ... selective);

    SysDept selectByPrimaryKey(Long deptId);

    int updateByExampleSelective(@Param("record") SysDept record, @Param("example") SysDeptExample example);

    int updateByExample(@Param("record") SysDept record, @Param("example") SysDeptExample example);

    int updateByPrimaryKeySelective(SysDept record);

    int updateByPrimaryKey(SysDept record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    int batchRemove(Long[] deptIds);

    Long[] getParentDeptId();

}