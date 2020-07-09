package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.utils.FileUtils;
import com.hzy.toolman.db.dao.common.TbClassesHomeworkMapper;
import com.hzy.toolman.db.dao.common.TbHomeworkMapper;
import com.hzy.toolman.db.domain.common.TbClassesHomework;
import com.hzy.toolman.db.domain.common.TbClassesHomeworkExample;
import com.hzy.toolman.db.domain.common.TbHomework;
import com.hzy.toolman.db.domain.common.TbHomeworkExample;
import com.hzy.toolman.system.service.SysHomeWorkService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-09 11:10
 **/
@Service
public class SysHomeWorkServiceImpl implements SysHomeWorkService {

    @Resource
    private TbHomeworkMapper tbHomeworkMapper;

    @Resource
    private TbClassesHomeworkMapper tbClassesHomeworkMapper;

    @Value("${toolman.teach_upload_path}")
    private String uploadPath;

    @Override
    public int save(MultipartFile file, Long userId, Long classesId, TbHomework homework) throws Exception {
        if (Objects.equals(classesId, -1L)) {
            throw new RuntimeException("请选择班级");
        }
        homework.setCreateBy(userId);
        homework.setCreateDate(new Date());
        homework.setUpdateDate(new Date());
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename(); // 获取文件名称
            fileName = FileUtils.renameToUUID(fileName);
            homework.setUrl("/files/" + fileName);
            FileUtils.uploadFile(file.getBytes(), uploadPath, fileName);
        }
        int count = tbHomeworkMapper.insertSelective(homework);
        if (count > 0) {
            TbClassesHomework tbClassesHomework = new TbClassesHomework();
            tbClassesHomework.setClassesId(classesId);
            tbClassesHomework.setHomeworkId(homework.getId());
            tbClassesHomeworkMapper.insertSelective(tbClassesHomework);
        }
        return count;
    }

    @Override
    public List<TbHomework> list(Map<String, Object> map) {
        return tbHomeworkMapper.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return tbHomeworkMapper.count(map);
    }

    @Override
    public TbHomework getHomeworkById(Long id) {
        return tbHomeworkMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(MultipartFile file, Long classesId, TbHomework tbHomework) throws Exception {
        if (Objects.equals(classesId, -1L)) {
            throw new RuntimeException("请选择班级");
        }
        tbHomework.setUpdateDate(new Date());
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename(); // 获取文件名称
            fileName = FileUtils.renameToUUID(fileName);
            tbHomework.setUrl("/files/" + fileName);
            FileUtils.uploadFile(file.getBytes(), uploadPath, fileName);
        }
        int count = tbHomeworkMapper.updateByPrimaryKeySelective(tbHomework);
        if (count > 0) {
            TbClassesHomeworkExample example = new TbClassesHomeworkExample();
            example.createCriteria().andClassesIdEqualTo(classesId).andHomeworkIdEqualTo(tbHomework.getId());
            tbClassesHomeworkMapper.deleteByExample(example);
            TbClassesHomework tbClassesHomework = new TbClassesHomework();
            tbClassesHomework.setClassesId(classesId);
            tbClassesHomework.setHomeworkId(tbHomework.getId());
            tbClassesHomeworkMapper.insertSelective(tbClassesHomework);
        }
        return count;
    }

    @Override
    public int remove(Long id) {
        int count = tbHomeworkMapper.deleteByPrimaryKey(id);
        TbClassesHomeworkExample example = new TbClassesHomeworkExample();
        example.createCriteria().andHomeworkIdEqualTo(id);
        tbClassesHomeworkMapper.deleteByExample(example);
        return count;
    }

    @Override
    public int batchRemove(Long[] ids) {
        int count = tbHomeworkMapper.batchRemove(ids);
        tbClassesHomeworkMapper.batchRemove(ids);
        return count;
    }
}
