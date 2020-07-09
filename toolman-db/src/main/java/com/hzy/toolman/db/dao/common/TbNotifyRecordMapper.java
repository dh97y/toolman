package com.hzy.toolman.db.dao.common;

import com.hzy.toolman.db.domain.common.TbNotifyRecord;
import com.hzy.toolman.db.domain.common.TbNotifyRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbNotifyRecordMapper {
    long countByExample(TbNotifyRecordExample example);

    int deleteByExample(TbNotifyRecordExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbNotifyRecord record);

    int insertSelective(TbNotifyRecord record);

    TbNotifyRecord selectOneByExample(TbNotifyRecordExample example);

    TbNotifyRecord selectOneByExampleSelective(@Param("example") TbNotifyRecordExample example, @Param("selective") TbNotifyRecord.Column ... selective);

    List<TbNotifyRecord> selectByExampleSelective(@Param("example") TbNotifyRecordExample example, @Param("selective") TbNotifyRecord.Column ... selective);

    List<TbNotifyRecord> selectByExample(TbNotifyRecordExample example);

    TbNotifyRecord selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") TbNotifyRecord.Column ... selective);

    TbNotifyRecord selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbNotifyRecord record, @Param("example") TbNotifyRecordExample example);

    int updateByExample(@Param("record") TbNotifyRecord record, @Param("example") TbNotifyRecordExample example);

    int updateByPrimaryKeySelective(TbNotifyRecord record);

    int updateByPrimaryKey(TbNotifyRecord record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    int batchSave(List<TbNotifyRecord> tbNotifyRecords);

    int batchRemoveByNotifyId(Long[] ids);

}