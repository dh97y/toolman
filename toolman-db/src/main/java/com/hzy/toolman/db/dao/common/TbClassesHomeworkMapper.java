package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbClassesHomework;
import com.hzy.toolman.db.domain.common.TbClassesHomeworkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbClassesHomeworkMapper {
    long countByExample(TbClassesHomeworkExample example);

    int deleteByExample(TbClassesHomeworkExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbClassesHomework record);

    int insertSelective(TbClassesHomework record);

    TbClassesHomework selectOneByExample(TbClassesHomeworkExample example);

    TbClassesHomework selectOneByExampleSelective(@Param("example") TbClassesHomeworkExample example, @Param("selective") TbClassesHomework.Column ... selective);

    List<TbClassesHomework> selectByExampleSelective(@Param("example") TbClassesHomeworkExample example, @Param("selective") TbClassesHomework.Column ... selective);

    List<TbClassesHomework> selectByExample(TbClassesHomeworkExample example);

    TbClassesHomework selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbClassesHomework.Column ... selective);

    TbClassesHomework selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbClassesHomework record, @Param("example") TbClassesHomeworkExample example);

    int updateByExample(@Param("record") TbClassesHomework record, @Param("example") TbClassesHomeworkExample example);

    int updateByPrimaryKeySelective(TbClassesHomework record);

    int updateByPrimaryKey(TbClassesHomework record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    int batchRemove(Long[] ids);
}