package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysDict;
import com.hzy.toolman.db.domain.system.SysDictExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SysDictMapper {
    long countByExample(SysDictExample example);

    int deleteByExample(SysDictExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysDict record);

    int insertSelective(SysDict record);

    SysDict selectOneByExample(SysDictExample example);

    SysDict selectOneByExampleSelective(@Param("example") SysDictExample example, @Param("selective") SysDict.Column ... selective);

    List<SysDict> selectByExampleSelective(@Param("example") SysDictExample example, @Param("selective") SysDict.Column ... selective);

    List<SysDict> selectByExample(SysDictExample example);

    SysDict selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") SysDict.Column ... selective);

    SysDict selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysDict record, @Param("example") SysDictExample example);

    int updateByExample(@Param("record") SysDict record, @Param("example") SysDictExample example);

    int updateByPrimaryKeySelective(SysDict record);

    int updateByPrimaryKey(SysDict record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    List<SysDict> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int batchRemove(Long[] ids);

}