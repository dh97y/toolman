package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbHomework;
import com.hzy.toolman.db.domain.common.TbHomeworkExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TbHomeworkMapper {
    long countByExample(TbHomeworkExample example);

    int deleteByExample(TbHomeworkExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbHomework record);

    int insertSelective(TbHomework record);

    TbHomework selectOneByExample(TbHomeworkExample example);

    TbHomework selectOneByExampleSelective(@Param("example") TbHomeworkExample example, @Param("selective") TbHomework.Column ... selective);

    List<TbHomework> selectByExampleSelective(@Param("example") TbHomeworkExample example, @Param("selective") TbHomework.Column ... selective);

    List<TbHomework> selectByExample(TbHomeworkExample example);

    TbHomework selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbHomework.Column ... selective);

    TbHomework selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbHomework record, @Param("example") TbHomeworkExample example);

    int updateByExample(@Param("record") TbHomework record, @Param("example") TbHomeworkExample example);

    int updateByPrimaryKeySelective(TbHomework record);

    int updateByPrimaryKey(TbHomework record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    List<TbHomework> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int batchRemove(Long[] ids);

}