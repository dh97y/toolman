package com.hzy.toolman.db.domain.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TbNotifyRecordExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbNotifyRecordExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public TbNotifyRecordExample orderBy(String orderByClause) {
        this.setOrderByClause(orderByClause);
        return this;
    }

    public TbNotifyRecordExample orderBy(String ... orderByClauses) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < orderByClauses.length; i++) {
            sb.append(orderByClauses[i]);
            if (i < orderByClauses.length - 1) {
                sb.append(" , ");
            }
        }
        this.setOrderByClause(sb.toString());
        return this;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria(this);
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public static Criteria newAndCreateCriteria() {
        TbNotifyRecordExample example = new TbNotifyRecordExample();
        return example.createCriteria();
    }

    public TbNotifyRecordExample when(boolean condition, IExampleWhen then) {
        if (condition) {
            then.example(this);
        }
        return this;
    }

    public TbNotifyRecordExample when(boolean condition, IExampleWhen then, IExampleWhen otherwise) {
        if (condition) {
            then.example(this);
        } else {
            otherwise.example(this);
        }
        return this;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("id = ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("id <> ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("id > ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("id >= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("id < ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("id <= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andNotifyIdIsNull() {
            addCriterion("notify_id is null");
            return (Criteria) this;
        }

        public Criteria andNotifyIdIsNotNull() {
            addCriterion("notify_id is not null");
            return (Criteria) this;
        }

        public Criteria andNotifyIdEqualTo(Long value) {
            addCriterion("notify_id =", value, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("notify_id = ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andNotifyIdNotEqualTo(Long value) {
            addCriterion("notify_id <>", value, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdNotEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("notify_id <> ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andNotifyIdGreaterThan(Long value) {
            addCriterion("notify_id >", value, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdGreaterThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("notify_id > ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andNotifyIdGreaterThanOrEqualTo(Long value) {
            addCriterion("notify_id >=", value, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdGreaterThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("notify_id >= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andNotifyIdLessThan(Long value) {
            addCriterion("notify_id <", value, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdLessThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("notify_id < ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andNotifyIdLessThanOrEqualTo(Long value) {
            addCriterion("notify_id <=", value, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdLessThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("notify_id <= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andNotifyIdIn(List<Long> values) {
            addCriterion("notify_id in", values, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdNotIn(List<Long> values) {
            addCriterion("notify_id not in", values, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdBetween(Long value1, Long value2) {
            addCriterion("notify_id between", value1, value2, "notifyId");
            return (Criteria) this;
        }

        public Criteria andNotifyIdNotBetween(Long value1, Long value2) {
            addCriterion("notify_id not between", value1, value2, "notifyId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Long value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("user_id = ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Long value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("user_id <> ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Long value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("user_id > ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("user_id >= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Long value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("user_id < ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Long value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("user_id <= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Long> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Long> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Long value1, Long value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Long value1, Long value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andIsReadIsNull() {
            addCriterion("is_read is null");
            return (Criteria) this;
        }

        public Criteria andIsReadIsNotNull() {
            addCriterion("is_read is not null");
            return (Criteria) this;
        }

        public Criteria andIsReadEqualTo(Integer value) {
            addCriterion("is_read =", value, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("is_read = ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIsReadNotEqualTo(Integer value) {
            addCriterion("is_read <>", value, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadNotEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("is_read <> ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIsReadGreaterThan(Integer value) {
            addCriterion("is_read >", value, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadGreaterThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("is_read > ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIsReadGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_read >=", value, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadGreaterThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("is_read >= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIsReadLessThan(Integer value) {
            addCriterion("is_read <", value, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadLessThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("is_read < ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIsReadLessThanOrEqualTo(Integer value) {
            addCriterion("is_read <=", value, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadLessThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("is_read <= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andIsReadIn(List<Integer> values) {
            addCriterion("is_read in", values, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadNotIn(List<Integer> values) {
            addCriterion("is_read not in", values, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadBetween(Integer value1, Integer value2) {
            addCriterion("is_read between", value1, value2, "isRead");
            return (Criteria) this;
        }

        public Criteria andIsReadNotBetween(Integer value1, Integer value2) {
            addCriterion("is_read not between", value1, value2, "isRead");
            return (Criteria) this;
        }

        public Criteria andReadDateIsNull() {
            addCriterion("read_date is null");
            return (Criteria) this;
        }

        public Criteria andReadDateIsNotNull() {
            addCriterion("read_date is not null");
            return (Criteria) this;
        }

        public Criteria andReadDateEqualTo(Date value) {
            addCriterionForJDBCDate("read_date =", value, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("read_date = ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andReadDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("read_date <>", value, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateNotEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("read_date <> ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andReadDateGreaterThan(Date value) {
            addCriterionForJDBCDate("read_date >", value, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateGreaterThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("read_date > ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andReadDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("read_date >=", value, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateGreaterThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("read_date >= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andReadDateLessThan(Date value) {
            addCriterionForJDBCDate("read_date <", value, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateLessThanColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("read_date < ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andReadDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("read_date <=", value, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateLessThanOrEqualToColumn(TbNotifyRecord.Column column) {
            addCriterion(new StringBuilder("read_date <= ").append(column.getEscapedColumnName()).toString());
            return (Criteria) this;
        }

        public Criteria andReadDateIn(List<Date> values) {
            addCriterionForJDBCDate("read_date in", values, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("read_date not in", values, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("read_date between", value1, value2, "readDate");
            return (Criteria) this;
        }

        public Criteria andReadDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("read_date not between", value1, value2, "readDate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {
        private TbNotifyRecordExample example;

        protected Criteria(TbNotifyRecordExample example) {
            super();
            this.example = example;
        }

        public TbNotifyRecordExample example() {
            return this.example;
        }

        @Deprecated
        public Criteria andIf(boolean ifAdd, ICriteriaAdd add) {
            if (ifAdd) {
                add.add(this);
            }
            return this;
        }

        public Criteria when(boolean condition, ICriteriaWhen then) {
            if (condition) {
                then.criteria(this);
            }
            return this;
        }

        public Criteria when(boolean condition, ICriteriaWhen then, ICriteriaWhen otherwise) {
            if (condition) {
                then.criteria(this);
            } else {
                otherwise.criteria(this);
            }
            return this;
        }

        @Deprecated
        public interface ICriteriaAdd {
            Criteria add(Criteria add);
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }

    public interface ICriteriaWhen {
        void criteria(Criteria criteria);
    }

    public interface IExampleWhen {
        void example(com.hzy.toolman.db.domain.common.TbNotifyRecordExample example);
    }
}