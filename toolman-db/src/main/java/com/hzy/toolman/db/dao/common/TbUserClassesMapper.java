package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbUserClasses;
import com.hzy.toolman.db.domain.common.TbUserClassesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbUserClassesMapper {
    long countByExample(TbUserClassesExample example);

    int deleteByExample(TbUserClassesExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbUserClasses record);

    int insertSelective(TbUserClasses record);

    TbUserClasses selectOneByExample(TbUserClassesExample example);

    TbUserClasses selectOneByExampleSelective(@Param("example") TbUserClassesExample example, @Param("selective") TbUserClasses.Column ... selective);

    List<TbUserClasses> selectByExampleSelective(@Param("example") TbUserClassesExample example, @Param("selective") TbUserClasses.Column ... selective);

    List<TbUserClasses> selectByExample(TbUserClassesExample example);

    TbUserClasses selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbUserClasses.Column ... selective);

    TbUserClasses selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbUserClasses record, @Param("example") TbUserClassesExample example);

    int updateByExample(@Param("record") TbUserClasses record, @Param("example") TbUserClassesExample example);

    int updateByPrimaryKeySelective(TbUserClasses record);

    int updateByPrimaryKey(TbUserClasses record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    int batchSave(String[] teachIds, Long id);

    int batchDeleteByUserId(Long classesId);

    Long[] getTeacherIdsByClassesId(Long classesId);
}