package com.ibm.bluekey.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserExample() {
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

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("Email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("Email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("Email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("Email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("Email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("Email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("Email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("Email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("Email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("Email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("Email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("Email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("Email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("Email not between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andFunctionIsNull() {
            addCriterion("function is null");
            return (Criteria) this;
        }

        public Criteria andFunctionIsNotNull() {
            addCriterion("function is not null");
            return (Criteria) this;
        }

        public Criteria andFunctionEqualTo(Integer value) {
            addCriterion("function =", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotEqualTo(Integer value) {
            addCriterion("function <>", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionGreaterThan(Integer value) {
            addCriterion("function >", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionGreaterThanOrEqualTo(Integer value) {
            addCriterion("function >=", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionLessThan(Integer value) {
            addCriterion("function <", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionLessThanOrEqualTo(Integer value) {
            addCriterion("function <=", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionIn(List<Integer> values) {
            addCriterion("function in", values, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotIn(List<Integer> values) {
            addCriterion("function not in", values, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionBetween(Integer value1, Integer value2) {
            addCriterion("function between", value1, value2, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotBetween(Integer value1, Integer value2) {
            addCriterion("function not between", value1, value2, "function");
            return (Criteria) this;
        }

        public Criteria andBuIsNull() {
            addCriterion("BU is null");
            return (Criteria) this;
        }

        public Criteria andBuIsNotNull() {
            addCriterion("BU is not null");
            return (Criteria) this;
        }

        public Criteria andBuEqualTo(Integer value) {
            addCriterion("BU =", value, "bu");
            return (Criteria) this;
        }

        public Criteria andBuNotEqualTo(Integer value) {
            addCriterion("BU <>", value, "bu");
            return (Criteria) this;
        }

        public Criteria andBuGreaterThan(Integer value) {
            addCriterion("BU >", value, "bu");
            return (Criteria) this;
        }

        public Criteria andBuGreaterThanOrEqualTo(Integer value) {
            addCriterion("BU >=", value, "bu");
            return (Criteria) this;
        }

        public Criteria andBuLessThan(Integer value) {
            addCriterion("BU <", value, "bu");
            return (Criteria) this;
        }

        public Criteria andBuLessThanOrEqualTo(Integer value) {
            addCriterion("BU <=", value, "bu");
            return (Criteria) this;
        }

        public Criteria andBuIn(List<Integer> values) {
            addCriterion("BU in", values, "bu");
            return (Criteria) this;
        }

        public Criteria andBuNotIn(List<Integer> values) {
            addCriterion("BU not in", values, "bu");
            return (Criteria) this;
        }

        public Criteria andBuBetween(Integer value1, Integer value2) {
            addCriterion("BU between", value1, value2, "bu");
            return (Criteria) this;
        }

        public Criteria andBuNotBetween(Integer value1, Integer value2) {
            addCriterion("BU not between", value1, value2, "bu");
            return (Criteria) this;
        }

        public Criteria andRememberIsNull() {
            addCriterion("remember is null");
            return (Criteria) this;
        }

        public Criteria andRememberIsNotNull() {
            addCriterion("remember is not null");
            return (Criteria) this;
        }

        public Criteria andRememberEqualTo(String value) {
            addCriterion("remember =", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberNotEqualTo(String value) {
            addCriterion("remember <>", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberGreaterThan(String value) {
            addCriterion("remember >", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberGreaterThanOrEqualTo(String value) {
            addCriterion("remember >=", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberLessThan(String value) {
            addCriterion("remember <", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberLessThanOrEqualTo(String value) {
            addCriterion("remember <=", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberLike(String value) {
            addCriterion("remember like", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberNotLike(String value) {
            addCriterion("remember not like", value, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberIn(List<String> values) {
            addCriterion("remember in", values, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberNotIn(List<String> values) {
            addCriterion("remember not in", values, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberBetween(String value1, String value2) {
            addCriterion("remember between", value1, value2, "remember");
            return (Criteria) this;
        }

        public Criteria andRememberNotBetween(String value1, String value2) {
            addCriterion("remember not between", value1, value2, "remember");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleIsNull() {
            addCriterion("authorization_role is null");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleIsNotNull() {
            addCriterion("authorization_role is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleEqualTo(Integer value) {
            addCriterion("authorization_role =", value, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleNotEqualTo(Integer value) {
            addCriterion("authorization_role <>", value, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleGreaterThan(Integer value) {
            addCriterion("authorization_role >", value, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleGreaterThanOrEqualTo(Integer value) {
            addCriterion("authorization_role >=", value, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleLessThan(Integer value) {
            addCriterion("authorization_role <", value, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleLessThanOrEqualTo(Integer value) {
            addCriterion("authorization_role <=", value, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleIn(List<Integer> values) {
            addCriterion("authorization_role in", values, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleNotIn(List<Integer> values) {
            addCriterion("authorization_role not in", values, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleBetween(Integer value1, Integer value2) {
            addCriterion("authorization_role between", value1, value2, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andAuthorizationRoleNotBetween(Integer value1, Integer value2) {
            addCriterion("authorization_role not between", value1, value2, "authorizationRole");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorIsNull() {
            addCriterion("update_operator is null");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorIsNotNull() {
            addCriterion("update_operator is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorEqualTo(String value) {
            addCriterion("update_operator =", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorNotEqualTo(String value) {
            addCriterion("update_operator <>", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorGreaterThan(String value) {
            addCriterion("update_operator >", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorGreaterThanOrEqualTo(String value) {
            addCriterion("update_operator >=", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorLessThan(String value) {
            addCriterion("update_operator <", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorLessThanOrEqualTo(String value) {
            addCriterion("update_operator <=", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorLike(String value) {
            addCriterion("update_operator like", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorNotLike(String value) {
            addCriterion("update_operator not like", value, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorIn(List<String> values) {
            addCriterion("update_operator in", values, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorNotIn(List<String> values) {
            addCriterion("update_operator not in", values, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorBetween(String value1, String value2) {
            addCriterion("update_operator between", value1, value2, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andUpdateOperatorNotBetween(String value1, String value2) {
            addCriterion("update_operator not between", value1, value2, "updateOperator");
            return (Criteria) this;
        }

        public Criteria andActivedIsNull() {
            addCriterion("actived is null");
            return (Criteria) this;
        }

        public Criteria andActivedIsNotNull() {
            addCriterion("actived is not null");
            return (Criteria) this;
        }

        public Criteria andActivedEqualTo(Integer value) {
            addCriterion("actived =", value, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedNotEqualTo(Integer value) {
            addCriterion("actived <>", value, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedGreaterThan(Integer value) {
            addCriterion("actived >", value, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedGreaterThanOrEqualTo(Integer value) {
            addCriterion("actived >=", value, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedLessThan(Integer value) {
            addCriterion("actived <", value, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedLessThanOrEqualTo(Integer value) {
            addCriterion("actived <=", value, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedIn(List<Integer> values) {
            addCriterion("actived in", values, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedNotIn(List<Integer> values) {
            addCriterion("actived not in", values, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedBetween(Integer value1, Integer value2) {
            addCriterion("actived between", value1, value2, "actived");
            return (Criteria) this;
        }

        public Criteria andActivedNotBetween(Integer value1, Integer value2) {
            addCriterion("actived not between", value1, value2, "actived");
            return (Criteria) this;
        }

        public Criteria andDeletedIsNull() {
            addCriterion("deleted is null");
            return (Criteria) this;
        }

        public Criteria andDeletedIsNotNull() {
            addCriterion("deleted is not null");
            return (Criteria) this;
        }

        public Criteria andDeletedEqualTo(Integer value) {
            addCriterion("deleted =", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedNotEqualTo(Integer value) {
            addCriterion("deleted <>", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedGreaterThan(Integer value) {
            addCriterion("deleted >", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedGreaterThanOrEqualTo(Integer value) {
            addCriterion("deleted >=", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedLessThan(Integer value) {
            addCriterion("deleted <", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedLessThanOrEqualTo(Integer value) {
            addCriterion("deleted <=", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedIn(List<Integer> values) {
            addCriterion("deleted in", values, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedNotIn(List<Integer> values) {
            addCriterion("deleted not in", values, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedBetween(Integer value1, Integer value2) {
            addCriterion("deleted between", value1, value2, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedNotBetween(Integer value1, Integer value2) {
            addCriterion("deleted not between", value1, value2, "deleted");
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