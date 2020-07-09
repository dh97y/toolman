package com.hzy.toolman.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-04 17:44
 **/
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {

    String value() default "";

}
