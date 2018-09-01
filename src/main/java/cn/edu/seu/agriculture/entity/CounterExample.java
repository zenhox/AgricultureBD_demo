package cn.edu.seu.agriculture.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class CounterExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CounterExample() {
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

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
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

        public Criteria andCrawtimeIsNull() {
            addCriterion("crawTime is null");
            return (Criteria) this;
        }

        public Criteria andCrawtimeIsNotNull() {
            addCriterion("crawTime is not null");
            return (Criteria) this;
        }

        public Criteria andCrawtimeEqualTo(Date value) {
            addCriterionForJDBCDate("crawTime =", value, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("crawTime <>", value, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeGreaterThan(Date value) {
            addCriterionForJDBCDate("crawTime >", value, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("crawTime >=", value, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeLessThan(Date value) {
            addCriterionForJDBCDate("crawTime <", value, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("crawTime <=", value, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeIn(List<Date> values) {
            addCriterionForJDBCDate("crawTime in", values, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("crawTime not in", values, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("crawTime between", value1, value2, "crawtime");
            return (Criteria) this;
        }

        public Criteria andCrawtimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("crawTime not between", value1, value2, "crawtime");
            return (Criteria) this;
        }

        public Criteria andMarketcounterIsNull() {
            addCriterion("marketCounter is null");
            return (Criteria) this;
        }

        public Criteria andMarketcounterIsNotNull() {
            addCriterion("marketCounter is not null");
            return (Criteria) this;
        }

        public Criteria andMarketcounterEqualTo(Integer value) {
            addCriterion("marketCounter =", value, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterNotEqualTo(Integer value) {
            addCriterion("marketCounter <>", value, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterGreaterThan(Integer value) {
            addCriterion("marketCounter >", value, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("marketCounter >=", value, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterLessThan(Integer value) {
            addCriterion("marketCounter <", value, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterLessThanOrEqualTo(Integer value) {
            addCriterion("marketCounter <=", value, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterIn(List<Integer> values) {
            addCriterion("marketCounter in", values, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterNotIn(List<Integer> values) {
            addCriterion("marketCounter not in", values, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterBetween(Integer value1, Integer value2) {
            addCriterion("marketCounter between", value1, value2, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andMarketcounterNotBetween(Integer value1, Integer value2) {
            addCriterion("marketCounter not between", value1, value2, "marketcounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterIsNull() {
            addCriterion("typeCounter is null");
            return (Criteria) this;
        }

        public Criteria andTypecounterIsNotNull() {
            addCriterion("typeCounter is not null");
            return (Criteria) this;
        }

        public Criteria andTypecounterEqualTo(Integer value) {
            addCriterion("typeCounter =", value, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterNotEqualTo(Integer value) {
            addCriterion("typeCounter <>", value, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterGreaterThan(Integer value) {
            addCriterion("typeCounter >", value, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("typeCounter >=", value, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterLessThan(Integer value) {
            addCriterion("typeCounter <", value, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterLessThanOrEqualTo(Integer value) {
            addCriterion("typeCounter <=", value, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterIn(List<Integer> values) {
            addCriterion("typeCounter in", values, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterNotIn(List<Integer> values) {
            addCriterion("typeCounter not in", values, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterBetween(Integer value1, Integer value2) {
            addCriterion("typeCounter between", value1, value2, "typecounter");
            return (Criteria) this;
        }

        public Criteria andTypecounterNotBetween(Integer value1, Integer value2) {
            addCriterion("typeCounter not between", value1, value2, "typecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterIsNull() {
            addCriterion("nameCounter is null");
            return (Criteria) this;
        }

        public Criteria andNamecounterIsNotNull() {
            addCriterion("nameCounter is not null");
            return (Criteria) this;
        }

        public Criteria andNamecounterEqualTo(Integer value) {
            addCriterion("nameCounter =", value, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterNotEqualTo(Integer value) {
            addCriterion("nameCounter <>", value, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterGreaterThan(Integer value) {
            addCriterion("nameCounter >", value, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("nameCounter >=", value, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterLessThan(Integer value) {
            addCriterion("nameCounter <", value, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterLessThanOrEqualTo(Integer value) {
            addCriterion("nameCounter <=", value, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterIn(List<Integer> values) {
            addCriterion("nameCounter in", values, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterNotIn(List<Integer> values) {
            addCriterion("nameCounter not in", values, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterBetween(Integer value1, Integer value2) {
            addCriterion("nameCounter between", value1, value2, "namecounter");
            return (Criteria) this;
        }

        public Criteria andNamecounterNotBetween(Integer value1, Integer value2) {
            addCriterion("nameCounter not between", value1, value2, "namecounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterIsNull() {
            addCriterion("crawCounter is null");
            return (Criteria) this;
        }

        public Criteria andCrawcounterIsNotNull() {
            addCriterion("crawCounter is not null");
            return (Criteria) this;
        }

        public Criteria andCrawcounterEqualTo(Integer value) {
            addCriterion("crawCounter =", value, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterNotEqualTo(Integer value) {
            addCriterion("crawCounter <>", value, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterGreaterThan(Integer value) {
            addCriterion("crawCounter >", value, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("crawCounter >=", value, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterLessThan(Integer value) {
            addCriterion("crawCounter <", value, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterLessThanOrEqualTo(Integer value) {
            addCriterion("crawCounter <=", value, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterIn(List<Integer> values) {
            addCriterion("crawCounter in", values, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterNotIn(List<Integer> values) {
            addCriterion("crawCounter not in", values, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterBetween(Integer value1, Integer value2) {
            addCriterion("crawCounter between", value1, value2, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andCrawcounterNotBetween(Integer value1, Integer value2) {
            addCriterion("crawCounter not between", value1, value2, "crawcounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterIsNull() {
            addCriterion("dailyCounter is null");
            return (Criteria) this;
        }

        public Criteria andDailycounterIsNotNull() {
            addCriterion("dailyCounter is not null");
            return (Criteria) this;
        }

        public Criteria andDailycounterEqualTo(Integer value) {
            addCriterion("dailyCounter =", value, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterNotEqualTo(Integer value) {
            addCriterion("dailyCounter <>", value, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterGreaterThan(Integer value) {
            addCriterion("dailyCounter >", value, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("dailyCounter >=", value, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterLessThan(Integer value) {
            addCriterion("dailyCounter <", value, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterLessThanOrEqualTo(Integer value) {
            addCriterion("dailyCounter <=", value, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterIn(List<Integer> values) {
            addCriterion("dailyCounter in", values, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterNotIn(List<Integer> values) {
            addCriterion("dailyCounter not in", values, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterBetween(Integer value1, Integer value2) {
            addCriterion("dailyCounter between", value1, value2, "dailycounter");
            return (Criteria) this;
        }

        public Criteria andDailycounterNotBetween(Integer value1, Integer value2) {
            addCriterion("dailyCounter not between", value1, value2, "dailycounter");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
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
}