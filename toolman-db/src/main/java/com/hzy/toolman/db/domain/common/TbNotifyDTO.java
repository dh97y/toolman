package com.hzy.toolman.db.domain.common;

import java.util.Arrays;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-08 00:10
 **/
public class TbNotifyDTO extends TbNotify {

    private Long[] userIds;

    private String isRead;

    private String before;

    private String sender;

    public Long[] getUserIds() {
        return userIds;
    }

    public void setUserIds(Long[] userIds) {
        this.userIds = userIds;
    }

    public String getIsRead() {
        return isRead;
    }

    public void setIsRead(String isRead) {
        this.isRead = isRead;
    }

    public String getBefore() {
        return before;
    }

    public void setBefore(String before) {
        this.before = before;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    @Override
    public String toString() {
        return super.toString() + "\nTbNotifyDTO{" +
                "userIds=" + Arrays.toString(userIds) +
                ", isRead='" + isRead + '\'' +
                ", before='" + before + '\'' +
                ", sender='" + sender + '\'' +
                '}';
    }
}
