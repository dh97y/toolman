package com.hzy.toolman.core.exception;

/**
 * @projectName: toolman
 * @description: 自定义异常
 * @author: hzy
 * @create: 2020-07-05 00:18
 **/
public class TMException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private String msg;
    private int code = 500;

    public TMException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public TMException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public TMException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public TMException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

}
