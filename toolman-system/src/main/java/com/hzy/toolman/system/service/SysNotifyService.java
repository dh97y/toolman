package com.hzy.toolman.system.service;

import com.hzy.toolman.core.domain.Page;
import com.hzy.toolman.db.domain.Query;
import com.hzy.toolman.db.domain.common.TbNotify;
import com.hzy.toolman.db.domain.common.TbNotifyDTO;
import com.hzy.toolman.system.vo.SysNotifyVo;

import java.util.List;
import java.util.Map;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 17:27
 **/
public interface SysNotifyService {

    List<TbNotify> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(TbNotifyDTO tbNotifyDTO);

    TbNotify getTbNotifyById(Long id);

    int update(TbNotify tbNotify);

    int remove(Long id);

    int batchRemove(Long[] ids);

    Page<TbNotifyDTO> selfList(Map<String, Object> map);
}
