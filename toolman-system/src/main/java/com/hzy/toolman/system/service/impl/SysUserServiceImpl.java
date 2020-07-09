package com.hzy.toolman.system.service.impl;

import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.core.utils.*;
import com.hzy.toolman.db.dao.common.TbUserClassesMapper;
import com.hzy.toolman.db.dao.system.SysDeptMapper;
import com.hzy.toolman.db.dao.system.SysFileMapper;
import com.hzy.toolman.db.dao.system.SysUserMapper;
import com.hzy.toolman.db.dao.system.SysUserRoleMapper;
import com.hzy.toolman.db.domain.system.*;
import com.hzy.toolman.system.service.SysDeptService;
import com.hzy.toolman.system.service.SysUserService;
import com.hzy.toolman.system.vo.SysUserVo;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.*;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 16:05
 **/
@Service
public class SysUserServiceImpl implements SysUserService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Resource
    private SysUserRoleMapper sysUserRoleMapper;

    @Resource
    private SysDeptMapper sysDeptMapper;

    @Resource
    private SysFileMapper sysFileMapper;

    @Autowired
    private SysDeptService sysDeptService;

    @Resource
    private TbUserClassesMapper tbUserClassesMapper;

    @Value("${toolman.uploadPath}")
    private String uploadPath;

    @Override
    public List<SysUser> getSysUserByUsername(String username) {
        SysUserExample example = new SysUserExample();
        example.or().andUsernameEqualTo(username).andStatusEqualTo(1);
        return sysUserMapper.selectByExample(example);
    }

    @Override
    public SysUserVo getSysUserVoByUserId(Long userId) {
        List<Long> sysRoleIds = sysUserRoleMapper.getRoleIdsByUserId(userId);
        SysUser sysUser = sysUserMapper.selectByPrimaryKey(userId);
        SysUserVo sysUserVo = JSONUtils.convert(sysUser, SysUserVo.class);
        if (sysUser.getDeptId() != null) {
            sysUserVo.setDeptName(sysDeptMapper.selectByPrimaryKey(sysUser.getDeptId()).getName());
        }
        sysUserVo.setRoleIds(sysRoleIds);
        return sysUserVo;
    }

    @Override
    public int adminResetPwd(SysUser sysUser) throws Exception {
        if ("admin".equals(sysUser.getUsername())) {
            throw new Exception("该账户为超级管理员，不可重置");
        }
        sysUser.setPassword(MD5Utils.encrypt(sysUser.getUsername(), sysUser.getPassword()));
        return sysUserMapper.updateByPrimaryKeySelective(sysUser);
    }

    @Override
    public int resetPwdByUser(SysUserVo sysUserVo, SysUser sysUser) throws Exception {
        if (Objects.equals(sysUserVo.getUserId(), sysUser.getUserId())) { // 检测账号是否是当前登录账号
            if (Objects.equals(MD5Utils.encrypt(sysUser.getUsername(), sysUserVo.getPwdOld()), sysUser.getPassword())) { // 新旧密码对比
                sysUser.setPassword(MD5Utils.encrypt(sysUser.getUsername(), sysUserVo.getPwdNew()));
                return sysUserMapper.updateByPrimaryKeySelective(sysUser);
            } else {
                throw new Exception("输入的旧密码有误");
            }
        } else {
            throw new Exception("修改的不是当前登录账号");
        }
    }

    @Override
    public int updatePersonal(SysUser sysUser) {
        return sysUserMapper.updateByPrimaryKeySelective(sysUser);
    }

    @Override
    public Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long userId) throws Exception {
        String fileName = file.getOriginalFilename();
        fileName = FileUtils.renameToUUID(fileName);
        SysFile sysFile = new SysFile();
        sysFile.setType(FileType.fileType(fileName));
        sysFile.setUrl("/files/" + fileName);
        sysFile.setCreateDate(new Date());
        sysFile.setUpdateDate(new Date());
        // 获取图片后缀
        String suffix = fileName.substring((fileName.lastIndexOf(".") + 1));
        String[] str = avatar_data.split(",");
        //获取截取的x坐标
        int x = (int) Math.floor(Double.parseDouble(str[0].split(":")[1]));
        //获取截取的y坐标
        int y = (int) Math.floor(Double.parseDouble(str[1].split(":")[1]));
        //获取截取的高度
        int h = (int) Math.floor(Double.parseDouble(str[2].split(":")[1]));
        //获取截取的宽度
        int w = (int) Math.floor(Double.parseDouble(str[3].split(":")[1]));
        //获取旋转的角度
        int r = Integer.parseInt(str[4].split(":")[1].replaceAll("}", ""));
        try {
            BufferedImage cutImage = ImageUtils.cutImage(file, x, y, w, h, suffix);
            BufferedImage rotateImage = ImageUtils.rotateImage(cutImage, r);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            boolean flag = ImageIO.write(rotateImage, suffix, out);
            byte[] b = out.toByteArray();
            FileUtils.uploadFile(b, uploadPath, fileName);
        } catch (Exception e) {
            throw new Exception("图片裁剪错误！！");
        }
        Map<String, Object> result = new HashMap<>();
        if (sysFileMapper.insertSelective(sysFile) > 0) {
            SysUser sysUser = new SysUser();
            sysUser.setUserId(userId);
            sysUser.setPicId(sysFile.getId());
            sysUser.setGmtModified(new Date());
            if (sysUserMapper.updateByPrimaryKeySelective(sysUser) > 0) {
                result.put("url", sysFile.getUrl());
            }
        }
        return result;
    }

    @Override
    public List<SysUser> list(Map<String, Object> map) {
        String deptIdStr = "";
        if (map.get("deptId") != null) {
            deptIdStr = map.get("deptId").toString();
        }
        if (StringUtils.isNotBlank(deptIdStr)) {
            Long deptId = Long.parseLong(deptIdStr);
            List<Long> childrenIds = sysDeptService.listChildrenIds(deptId);
            childrenIds.add(deptId);
            map.put("deptId", null);
            map.put("deptIds", childrenIds);
        }
        return sysUserMapper.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return sysUserMapper.count(map);
    }

    @Override
    public int save(SysUserVo sysUser) {
        sysUser.setGmtCreate(new Date());
        sysUser.setGmtModified(new Date());
        int count = sysUserMapper.insertSelective(sysUser);
        Long userId = sysUser.getUserId();
        List<Long> roleIds = sysUser.getRoleIds();
        SysUserRoleExample example = new SysUserRoleExample();
        example.createCriteria().andUserIdEqualTo(userId);
        sysUserRoleMapper.deleteByExample(example);
        List<SysUserRole> sysUserRoles = new ArrayList<>();
        for (Long roleId : roleIds) {
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(userId);
            sysUserRole.setRoleId(roleId);
            sysUserRoles.add(sysUserRole);
        }
        if (sysUserRoles.size() > 0) {
            sysUserRoleMapper.batchSave(sysUserRoles);
        }
        return count;
    }

    @Override
    public int update(SysUserVo sysUser) {
        sysUser.setGmtModified(new Date());
        int count = sysUserMapper.updateByPrimaryKeySelective(sysUser);
        Long userId = sysUser.getUserId();
        List<Long> roleIds = sysUser.getRoleIds();
        SysUserRoleExample example = new SysUserRoleExample();
        example.createCriteria().andUserIdEqualTo(userId);
        sysUserRoleMapper.deleteByExample(example);
        List<SysUserRole> sysUserRoles = new ArrayList<>();
        for (Long roleId : roleIds) {
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(userId);
            sysUserRole.setRoleId(roleId);
            sysUserRoles.add(sysUserRole);
        }
        if (sysUserRoles.size() > 0) {
            sysUserRoleMapper.batchSave(sysUserRoles);
        }
        return count;
    }

    @Override
    public int remove(Long userId) {
        return sysUserMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public int batchRemove(Long[] userIds) {
        int count = sysUserMapper.batchRemove(userIds);
        sysUserRoleMapper.batchRemoveByUserId(userIds);
        return count;
    }

    @Override
    public boolean exist(Map<String, Object> params) {
        List<SysUser> sysUsers = sysUserMapper.list(params);
        boolean exist = sysUsers.size() > 0;
        return exist;
    }

    @Override
    public Tree<SysDept> getTree() {
        List<Tree<SysDept>> trees = new ArrayList<>();
        List<SysDept> sysDepts = sysDeptMapper.selectByExample(new SysDeptExample());
        Long[] parentDeptId = sysDeptMapper.getParentDeptId();
        Long[] allDeptId = sysUserMapper.getAllDeptId();
        Long[] deptIds = (Long[]) ArrayUtils.addAll(parentDeptId, allDeptId);
        for (SysDept sysDept : sysDepts) {
            if (!ArrayUtils.contains(deptIds, sysDept.getDeptId())) {
                continue;
            }
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysDept.getDeptId().toString());
            tree.setParentId(sysDept.getParentId().toString());
            tree.setText(sysDept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "dept");
            tree.setState(state);
            trees.add(tree);
        }
        List<SysUser> sysUsers = sysUserMapper.selectByExample(new SysUserExample());
        for (SysUser sysUser : sysUsers) {
            Tree<SysDept> tree = new Tree<>();
            tree.setId(sysUser.getUserId().toString());
            tree.setParentId(sysUser.getDeptId().toString());
            tree.setText(sysUser.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "user");
            tree.setState(state);
            trees.add(tree);
        }
        Tree<SysDept> sysDeptAndSysUserTree = BuildTree.build(trees);
        return sysDeptAndSysUserTree;
    }

    @Override
    public List<SysUser> getTeacherByClassesId(Long id) {
        Long[] teacherIds = tbUserClassesMapper.getTeacherIdsByClassesId(id);
        List<SysUser> teachers = new ArrayList<>();
        if (teacherIds != null && teacherIds.length != 0) {
            teachers = sysUserMapper.getTeachers(teacherIds);
        }
        return teachers;
    }
}
