package com.hzy.toolman.core.exception;

import com.hzy.toolman.core.constant.SystemConstant;
import com.hzy.toolman.core.service.SysLogService;
import com.hzy.toolman.core.utils.HttpServletUtils;
import com.hzy.toolman.core.utils.R;
import com.hzy.toolman.core.utils.ShiroUtils;
import com.hzy.toolman.db.domain.system.SysLog;
import com.hzy.toolman.db.domain.system.SysUser;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @projectName: toolman
 * @description: 全局异常处理器
 * @author: hzy
 * @create: 2020-07-04 23:04
 **/
@RestControllerAdvice
public class GlobalExceptionHandler {

    private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @Autowired
    private SysLogService sysLogService;

    @ExceptionHandler(AuthorizationException.class)
    public Object handleAuthorizationException(AuthorizationException e, HttpServletRequest request) {
        logger.error(e.getMessage(), e);
        if (HttpServletUtils.jsAjax(request)) {
            return R.error(403, "未授权");
        }
        return new ModelAndView("error/403");
    }

    @ExceptionHandler(Exception.class)
    public Object handleException(Exception e, HttpServletRequest request) {
        SysLog sysLog = new SysLog();
        sysLog.setGmtCreate(new Date());
        sysLog.setOperation(SystemConstant.LOG_ERROR);
        sysLog.setMethod(request.getRequestURL().toString());
        sysLog.setParams(e.toString());
        SysUser sysUser = ShiroUtils.getSysUser();
        if (null != sysUser) {
            sysLog.setUserId(sysUser.getUserId());
            sysLog.setUsername(sysUser.getUsername());
        }
        sysLogService.save(sysLog);
        logger.error(e.getMessage(), e);
        if (HttpServletUtils.jsAjax(request)) {
            return R.error(500, "服务器错误，请联系管理员");
        }
        return new ModelAndView("error/500");
    }

}
