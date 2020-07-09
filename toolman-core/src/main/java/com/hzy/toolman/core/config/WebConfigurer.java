package com.hzy.toolman.core.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-06 18:52
 **/
@Component
public class WebConfigurer extends WebMvcConfigurerAdapter {

    @Value("${toolman.uploadPath}")
    private String uploadPath;

    @Value("${toolman.teach_upload_path}")
    private String teach_upload_path;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/files/**").addResourceLocations("file:///" + teach_upload_path)
                .addResourceLocations("file:///" + uploadPath);
    }
}
