package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.utils.MD5Utils;
import com.hzy.toolman.db.dao.common.TbStudentMapper;
import com.hzy.toolman.db.domain.common.TbStudent;
import com.hzy.toolman.db.domain.common.TbStudentExample;
import com.hzy.toolman.system.service.SysStudentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 16:17
 **/
@Service
public class SysStudentServiceImpl implements SysStudentService {

    @Resource
    private TbStudentMapper tbStudentMapper;

    @Override
    public List<TbStudent> getStudentByClassesId(Long classesId) {
        TbStudentExample example = new TbStudentExample();
        example.createCriteria().andClassesIdEqualTo(classesId);
        List<TbStudent> tbStudents = tbStudentMapper.selectByExampleSelective(example, TbStudent.Column.stuId, TbStudent.Column.name);
        return tbStudents;
    }

    @Override
    public List<TbStudent> list(Map<String, Object> map) {
        return tbStudentMapper.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return tbStudentMapper.count(map);
    }

    @Override
    public int save(TbStudent tbStudent) {
        tbStudent.setGmtCreate(new Date());
        tbStudent.setGmtModified(new Date());
        // 初始密码为学号
        tbStudent.setPassword(MD5Utils.encrypt(tbStudent.getStuId(), tbStudent.getStuId()));
        return tbStudentMapper.insertSelective(tbStudent);
    }

    @Override
    public TbStudent getStudentById(Long id) {
        return tbStudentMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean exist(String stuId) {
        TbStudentExample example = new TbStudentExample();
        example.createCriteria().andStuIdEqualTo(stuId);
        long count = tbStudentMapper.countByExample(example);
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int update(TbStudent tbStudent) {
        tbStudent.setGmtModified(new Date());
        return tbStudentMapper.updateByPrimaryKeySelective(tbStudent);
    }

    @Override
    public int remove(Long id) {
        return tbStudentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        return tbStudentMapper.batchRemove(ids);
    }
}
