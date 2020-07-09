package com.hzy.toolman;

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
 * @create: 2020-07-03 15:43
 **/
@SpringBootApplication(scanBasePackages = {"com.hzy.toolman"})
@ServletComponentScan
@MapperScan("com.hzy.toolman.db.dao")
@EnableTransactionManagement
@EnableCaching
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
