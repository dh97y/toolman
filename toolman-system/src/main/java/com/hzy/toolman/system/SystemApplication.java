package com.hzy.toolman.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-03 15:06
 **/
@SpringBootApplication(scanBasePackages = {"com.hzy.toolman.db", "com.hzy.toolman.core",
        "com.hzy.toolman.system"})
@ServletComponentScan
@MapperScan({"com.hzy.toolman.db.dao.system", "com.hzy.toolman.db.dao.common"})
@EnableTransactionManagement
@EnableCaching
public class SystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(SystemApplication.class, args);
        System.out.println("============================================启动完成====================================================");
    }

}
