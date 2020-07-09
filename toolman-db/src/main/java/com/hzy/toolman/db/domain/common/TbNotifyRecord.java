package com.hzy.toolman.db.domain.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class TbNotifyRecord {
    private Long id;

    private Long notifyId;

    private Long userId;

    private Integer isRead;

    private Date readDate;

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
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", notifyId=").append(notifyId);
        sb.append(", userId=").append(userId);
        sb.append(", isRead=").append(isRead);
        sb.append(", readDate=").append(readDate);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TbNotifyRecord other = (TbNotifyRecord) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getNotifyId() == null ? other.getNotifyId() == null : this.getNotifyId().equals(other.getNotifyId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getIsRead() == null ? other.getIsRead() == null : this.getIsRead().equals(other.getIsRead()))
            && (this.getReadDate() == null ? other.getReadDate() == null : this.getReadDate().equals(other.getReadDate()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getNotifyId() == null) ? 0 : getNotifyId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getIsRead() == null) ? 0 : getIsRead().hashCode());
        result = prime * result + ((getReadDate() == null) ? 0 : getReadDate().hashCode());
        return result;
    }

    public enum Column {
        id("id", "id", "BIGINT", false),
        notifyId("notify_id", "notifyId", "BIGINT", false),
        userId("user_id", "userId", "BIGINT", false),
        isRead("is_read", "isRead", "TINYINT", false),
        readDate("read_date", "readDate", "DATE", false);

        private static final String BEGINNING_DELIMITER = "`";

        private static final String ENDING_DELIMITER = "`";

        private final String column;

        private final boolean isColumnNameDelimited;

        private final String javaProperty;

        private final String jdbcType;

        public String value() {
            return this.column;
        }

        public String getValue() {
            return this.column;
        }

        public String getJavaProperty() {
            return this.javaProperty;
        }

        public String getJdbcType() {
            return this.jdbcType;
        }

        Column(String column, String javaProperty, String jdbcType, boolean isColumnNameDelimited) {
            this.column = column;
            this.javaProperty = javaProperty;
            this.jdbcType = jdbcType;
            this.isColumnNameDelimited = isColumnNameDelimited;
        }

        public String desc() {
            return this.getEscapedColumnName() + " DESC";
        }

        public String asc() {
            return this.getEscapedColumnName() + " ASC";
        }

        public static Column[] excludes(Column ... excludes) {
            ArrayList<Column> columns = new ArrayList<>(Arrays.asList(Column.values()));
            if (excludes != null && excludes.length > 0) {
                columns.removeAll(new ArrayList<>(Arrays.asList(excludes)));
            }
            return columns.toArray(new Column[]{});
        }

        public String getEscapedColumnName() {
            if (this.isColumnNameDelimited) {
                return new StringBuilder().append(BEGINNING_DELIMITER).append(this.column).append(ENDING_DELIMITER).toString();
            } else {
                return this.column;
            }
        }

        public String getAliasedEscapedColumnName() {
            return this.getEscapedColumnName();
        }
    }
}