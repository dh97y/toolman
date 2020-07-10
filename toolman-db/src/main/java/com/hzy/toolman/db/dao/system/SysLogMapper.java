package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.system.SysLog;
import com.hzy.toolman.db.domain.system.SysLogExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SysLogMapper {
    long countByExample(SysLogExample example);

    int deleteByExample(SysLogExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysLog record);

    int insertSelective(SysLog record);

    SysLog selectOneByExample(SysLogExample example);

    SysLog selectOneByExampleSelective(@Param("example") SysLogExample example, @Param("selective") SysLog.Column ... selective);

    List<SysLog> selectByExampleSelective(@Param("example") SysLogExample example, @Param("selective") SysLog.Column ... selective);

    List<SysLog> selectByExample(SysLogExample example);

    SysLog selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") SysLog.Column ... selective);

    SysLog selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysLog record, @Param("example") SysLogExample example);

    int updateByExample(@Param("record") SysLog record, @Param("example") SysLogExample example);

    int updateByPrimaryKeySelective(SysLog record);

    int updateByPrimaryKey(SysLog record);

    /*
     * ====================================================== Edit By hzy ========================================================
     * */

    SysLog getLastLoginInfoByUserId(Long userId);

    int count(Map<String,Object> map);

    List<SysLog> list(Map<String, Object> map);

    int batchRemove(Long[] ids);

}