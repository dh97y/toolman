package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.db.dao.system.SysDictMapper;
import com.hzy.toolman.db.domain.system.SysDict;
import com.hzy.toolman.db.domain.system.SysDictExample;
import com.hzy.toolman.system.service.SysDictService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 16:00
 **/
@Service
public class SysDictServiceImpl implements SysDictService {

    @Resource
    private SysDictMapper sysDictMapper;

    @Override
    public List<SysDict> list(Map<String, Object> map) {
        return sysDictMapper.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return sysDictMapper.count(map);
    }

    @Override
    public int save(SysDict sysDict) {
        sysDict.setCreateDate(new Date());
        sysDict.setUpdateDate(new Date());
        return sysDictMapper.insertSelective(sysDict);
    }

    @Override
    public int update(SysDict sysDict) {
        sysDict.setUpdateDate(new Date());
        return sysDictMapper.updateByPrimaryKeySelective(sysDict);
    }

    @Override
    public int delete(Long id) {
        return sysDictMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        return sysDictMapper.batchRemove(ids);
    }

    @Override
    public SysDict getSysDictById(Long id) {
        return sysDictMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SysDict> listType() {
        SysDictExample example = new SysDictExample();
        example.setDistinct(true);
        return sysDictMapper.selectByExampleSelective(example, SysDict.Column.type, SysDict.Column.description);
    }

    @Override
    public String getDictNameByTypeAndValue(String type, String value) {
        SysDictExample example = new SysDictExample();
        SysDictExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo(type).andValueEqualTo(value);
        List<SysDict> sysDicts = sysDictMapper.selectByExampleSelective(example, SysDict.Column.name);
        return sysDicts.get(0).getName();
    }

    @Override
    public List<SysDict> getSysDictListByType(String type) {
        SysDictExample example = new SysDictExample();
        example.createCriteria().andTypeEqualTo(type);
        return sysDictMapper.selectByExample(example);
    }
}
