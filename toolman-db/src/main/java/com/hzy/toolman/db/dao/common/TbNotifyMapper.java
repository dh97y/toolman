package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbNotify;
import com.hzy.toolman.db.domain.common.TbNotifyDTO;
import com.hzy.toolman.db.domain.common.TbNotifyExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TbNotifyMapper {
    long countByExample(TbNotifyExample example);

    int deleteByExample(TbNotifyExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbNotify record);

    int insertSelective(TbNotify record);

    TbNotify selectOneByExample(TbNotifyExample example);

    TbNotify selectOneByExampleSelective(@Param("example") TbNotifyExample example, @Param("selective") TbNotify.Column ... selective);

    List<TbNotify> selectByExampleSelective(@Param("example") TbNotifyExample example, @Param("selective") TbNotify.Column ... selective);

    List<TbNotify> selectByExample(TbNotifyExample example);

    TbNotify selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbNotify.Column ... selective);

    TbNotify selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbNotify record, @Param("example") TbNotifyExample example);

    int updateByExample(@Param("record") TbNotify record, @Param("example") TbNotifyExample example);

    int updateByPrimaryKeySelective(TbNotify record);

    int updateByPrimaryKey(TbNotify record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    List<TbNotify> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int batchRemove(Long[] ids);

    List<TbNotifyDTO> getNotifyListByUserIdAndNoRead(Map<String, Object> map);

    int countDTO(Map<String, Object> map);

}