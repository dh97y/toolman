package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.db.dao.common.TbClassesHomeworkMapper;
import com.hzy.toolman.db.domain.common.TbClassesHomeworkExample;
import com.hzy.toolman.system.service.SysClassesHomeworkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-09 18:31
 **/
@Service
public class SysClassesHomeworkServiceImpl implements SysClassesHomeworkService {

    @Resource
    private TbClassesHomeworkMapper tbClassesHomeworkMapper;

    @Override
    public Long getClassesIdByHomeworkId(Long homeworkId) {
        TbClassesHomeworkExample example = new TbClassesHomeworkExample();
        example.createCriteria().andHomeworkIdEqualTo(homeworkId);
        return tbClassesHomeworkMapper.selectOneByExample(example).getClassesId();
    }
}
