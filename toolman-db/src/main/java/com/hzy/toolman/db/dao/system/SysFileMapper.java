package com.hzy.toolman.db.dao.system;

import com.hzy.toolman.db.domain.system.SysFile;
import com.hzy.toolman.db.domain.system.SysFileExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysFileMapper {
    long countByExample(SysFileExample example);

    int deleteByExample(SysFileExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysFile record);

    int insertSelective(SysFile record);

    SysFile selectOneByExample(SysFileExample example);

    SysFile selectOneByExampleSelective(@Param("example") SysFileExample example, @Param("selective") SysFile.Column ... selective);

    List<SysFile> selectByExampleSelective(@Param("example") SysFileExample example, @Param("selective") SysFile.Column ... selective);

    List<SysFile> selectByExample(SysFileExample example);

    SysFile selectByPrimaryKeySelective(@Param("id") Long id, @Param("selective") SysFile.Column ... selective);

    SysFile selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysFile record, @Param("example") SysFileExample example);

    int updateByExample(@Param("record") SysFile record, @Param("example") SysFileExample example);

    int updateByPrimaryKeySelective(SysFile record);

    int updateByPrimaryKey(SysFile record);
}