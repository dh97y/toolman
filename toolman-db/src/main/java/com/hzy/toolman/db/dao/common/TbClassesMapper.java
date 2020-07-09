package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbClasses;
import com.hzy.toolman.db.domain.common.TbClassesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbClassesMapper {
    long countByExample(TbClassesExample example);

    int deleteByExample(TbClassesExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbClasses record);

    int insertSelective(TbClasses record);

    TbClasses selectOneByExample(TbClassesExample example);

    TbClasses selectOneByExampleSelective(@Param("example") TbClassesExample example, @Param("selective") TbClasses.Column ... selective);

    List<TbClasses> selectByExampleSelective(@Param("example") TbClassesExample example, @Param("selective") TbClasses.Column ... selective);

    List<TbClasses> selectByExample(TbClassesExample example);

    TbClasses selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbClasses.Column ... selective);

    TbClasses selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbClasses record, @Param("example") TbClassesExample example);

    int updateByExample(@Param("record") TbClasses record, @Param("example") TbClassesExample example);

    int updateByPrimaryKeySelective(TbClasses record);

    int updateByPrimaryKey(TbClasses record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    Long[] getAllClassesId();

    int batchRemove(Long[] ids);

    List<TbClasses> getClassesByUserId(Long userId);
}