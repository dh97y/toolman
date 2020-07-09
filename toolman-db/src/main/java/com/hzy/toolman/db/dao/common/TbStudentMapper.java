package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbStudent;
import com.hzy.toolman.db.domain.common.TbStudentExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TbStudentMapper {
    long countByExample(TbStudentExample example);

    int deleteByExample(TbStudentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbStudent record);

    int insertSelective(TbStudent record);

    TbStudent selectOneByExample(TbStudentExample example);

    TbStudent selectOneByExampleSelective(@Param("example") TbStudentExample example, @Param("selective") TbStudent.Column ... selective);

    List<TbStudent> selectByExampleSelective(@Param("example") TbStudentExample example, @Param("selective") TbStudent.Column ... selective);

    List<TbStudent> selectByExample(TbStudentExample example);

    TbStudent selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbStudent.Column ... selective);

    TbStudent selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbStudent record, @Param("example") TbStudentExample example);

    int updateByExample(@Param("record") TbStudent record, @Param("example") TbStudentExample example);

    int updateByPrimaryKeySelective(TbStudent record);

    int updateByPrimaryKey(TbStudent record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    Long[] getAllClassesId();

    int batchUpdate(String[] stuIds, Long classesId);

    int countByClassesIds(Long[] ids);

    List<TbStudent> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int batchRemove(Long[] ids);
}