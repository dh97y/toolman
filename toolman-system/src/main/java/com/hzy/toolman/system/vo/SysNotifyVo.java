package com.hzy.toolman.system.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 19:17
 **/
public class SysNotifyVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     *  编号
     */
    private Long id;
    //通知通告ID
    private Long notifyId;
    //接受人
    private Long userId;
    //阅读标记
    private Integer isRead;
    //阅读时间
    private Date readDate;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNotifyId() {
        return notifyId;
    }

    public void setNotifyId(Long notifyId) {
        this.notifyId = notifyId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Date getReadDate() {
        return readDate;
    }

    public void setReadDate(Date readDate) {
        this.readDate = readDate;
    }

    @Override
    public String toString() {
        return "SysNotifyVo{" +
                "id=" + id +
                ", notifyId=" + notifyId +
                ", userId=" + userId +
                ", isRead=" + isRead +
                ", readDate=" + readDate +
                '}';
    }
}
