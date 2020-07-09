package com.hzy.toolman.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 01:27
 **/
@Controller
public class TestController {

    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "hello";
    }

}
