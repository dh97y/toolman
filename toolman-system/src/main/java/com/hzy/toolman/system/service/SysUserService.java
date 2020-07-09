package com.hzy.toolman.system.service;


import com.hzy.toolman.core.domain.Tree;
import com.hzy.toolman.db.domain.system.SysDept;
import com.hzy.toolman.db.domain.system.SysUser;
import com.hzy.toolman.system.vo.SysUserVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 16:01
 **/
public interface SysUserService {

    List<SysUser> getSysUserByUsername(String username);

    SysUserVo getSysUserVoByUserId(Long userId);

    List<SysUser> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SysUserVo sysUser);

    int update(SysUserVo sysUser);

    int remove(Long userId);

    int batchRemove(Long[] userIds);

    boolean exist(Map<String, Object> params);

    int adminResetPwd(SysUser sysUser) throws Exception;

    int resetPwdByUser(SysUserVo sysUserVo, SysUser sysUser) throws Exception;

    int updatePersonal(SysUser sysUser);

    Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long userId) throws Exception;

    Tree<SysDept> getTree();

    List<SysUser> getTeacherByClassesId(Long id);

}
