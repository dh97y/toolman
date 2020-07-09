package com.hzy.toolman.system.aspect;

import com.hzy.toolman.core.annotation.Log;
import com.hzy.toolman.core.service.SysLogService;
import com.hzy.toolman.core.utils.HttpContextUtils;
import com.hzy.toolman.core.utils.IPUtils;
import com.hzy.toolman.core.utils.JSONUtils;
import com.hzy.toolman.core.utils.ShiroUtils;
import com.hzy.toolman.db.domain.system.SysLog;
import com.hzy.toolman.db.domain.system.SysUser;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-04 22:15
 **/
@Aspect
@Component
public class LogAspect {

    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Autowired
    private SysLogService sysLogService;

    @Pointcut("@annotation(com.hzy.toolman.core.annotation.Log)")
    public void logPointcut() {
    }

    @Around("logPointcut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        // 执行方法
        Object result = point.proceed();
        // 执行时长（毫秒）
        long time = System.currentTimeMillis() - beginTime;
        // 异步保存日志
        saveSysLog(point, time);
        return result;
    }

    public void saveSysLog(ProceedingJoinPoint joinPoint, long time) throws InterruptedException {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        SysLog sysLog = new SysLog();
        Log syslog = method.getAnnotation(Log.class);
        if (syslog != null) {
            // 注解上的描述
            sysLog.setOperation(syslog.value());
        }
        // 请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        sysLog.setMethod(className + "." + methodName + "()");
        // 请求的参数
        Object[] args = joinPoint.getArgs();
        try {
            String params = JSONUtils.beanToJson(args[0]).substring(0, 4999);
            sysLog.setParams(params);
        } catch (Exception e) {

        }
        // 获取request
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        // 设置IP地址
        sysLog.setIp(IPUtils.getIpAddr(request));
        // 用户名
        SysUser sysUser = ShiroUtils.getSysUser();
        if (null == sysUser) {
            if (null != sysLog.getParams()) {
                sysLog.setUserId(-1L);
                sysLog.setUsername(sysLog.getParams());
            } else {
                sysLog.setUserId(-1L);
                sysLog.setUsername("获取用户信息为空");
            }
        } else {
            sysLog.setUserId(ShiroUtils.getUserId());
            sysLog.setUsername(ShiroUtils.getSysUser().getUsername());
        }
        sysLog.setTime((int) time);
        // 系统当前时间
        Date date = new Date();
        sysLog.setGmtCreate(date);
        // 保存系统日志
        sysLogService.save(sysLog);
    }

}
