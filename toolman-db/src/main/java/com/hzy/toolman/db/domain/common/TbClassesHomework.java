package com.hzy.toolman.db.domain.common;

import java.util.ArrayList;
import java.util.Arrays;

public class TbClassesHomework {
    private Long id;

    private Long classesId;

    private Long homeworkId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getClassesId() {
        return classesId;
    }

    public void setClassesId(Long classesId) {
        this.classesId = classesId;
    }

    public Long getHomeworkId() {
        return homeworkId;
    }

    public void setHomeworkId(Long homeworkId) {
        this.homeworkId = homeworkId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", classesId=").append(classesId);
        sb.append(", homeworkId=").append(homeworkId);
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
        TbClassesHomework other = (TbClassesHomework) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getClassesId() == null ? other.getClassesId() == null : this.getClassesId().equals(other.getClassesId()))
            && (this.getHomeworkId() == null ? other.getHomeworkId() == null : this.getHomeworkId().equals(other.getHomeworkId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getClassesId() == null) ? 0 : getClassesId().hashCode());
        result = prime * result + ((getHomeworkId() == null) ? 0 : getHomeworkId().hashCode());
        return result;
    }

    public enum Column {
        id("id", "id", "BIGINT", false),
        classesId("classes_id", "classesId", "BIGINT", false),
        homeworkId("homework_id", "homeworkId", "BIGINT", false);

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