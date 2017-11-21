package com.ibm.bluekey.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AuthorizationExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AuthorizationExample() {
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

        public Criteria andAuthRoleIdIsNull() {
            addCriterion("auth_role_id is null");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdIsNotNull() {
            addCriterion("auth_role_id is not null");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdEqualTo(Integer value) {
            addCriterion("auth_role_id =", value, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdNotEqualTo(Integer value) {
            addCriterion("auth_role_id <>", value, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdGreaterThan(Integer value) {
            addCriterion("auth_role_id >", value, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("auth_role_id >=", value, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdLessThan(Integer value) {
            addCriterion("auth_role_id <", value, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdLessThanOrEqualTo(Integer value) {
            addCriterion("auth_role_id <=", value, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdIn(List<Integer> values) {
            addCriterion("auth_role_id in", values, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdNotIn(List<Integer> values) {
            addCriterion("auth_role_id not in", values, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdBetween(Integer value1, Integer value2) {
            addCriterion("auth_role_id between", value1, value2, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andAuthRoleIdNotBetween(Integer value1, Integer value2) {
            addCriterion("auth_role_id not between", value1, value2, "authRoleId");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightIsNull() {
            addCriterion("organization_right is null");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightIsNotNull() {
            addCriterion("organization_right is not null");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightEqualTo(String value) {
            addCriterion("organization_right =", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightNotEqualTo(String value) {
            addCriterion("organization_right <>", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightGreaterThan(String value) {
            addCriterion("organization_right >", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightGreaterThanOrEqualTo(String value) {
            addCriterion("organization_right >=", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightLessThan(String value) {
            addCriterion("organization_right <", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightLessThanOrEqualTo(String value) {
            addCriterion("organization_right <=", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightLike(String value) {
            addCriterion("organization_right like", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightNotLike(String value) {
            addCriterion("organization_right not like", value, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightIn(List<String> values) {
            addCriterion("organization_right in", values, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightNotIn(List<String> values) {
            addCriterion("organization_right not in", values, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightBetween(String value1, String value2) {
            addCriterion("organization_right between", value1, value2, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andOrganizationRightNotBetween(String value1, String value2) {
            addCriterion("organization_right not between", value1, value2, "organizationRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightIsNull() {
            addCriterion("role_right is null");
            return (Criteria) this;
        }

        public Criteria andRoleRightIsNotNull() {
            addCriterion("role_right is not null");
            return (Criteria) this;
        }

        public Criteria andRoleRightEqualTo(String value) {
            addCriterion("role_right =", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightNotEqualTo(String value) {
            addCriterion("role_right <>", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightGreaterThan(String value) {
            addCriterion("role_right >", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightGreaterThanOrEqualTo(String value) {
            addCriterion("role_right >=", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightLessThan(String value) {
            addCriterion("role_right <", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightLessThanOrEqualTo(String value) {
            addCriterion("role_right <=", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightLike(String value) {
            addCriterion("role_right like", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightNotLike(String value) {
            addCriterion("role_right not like", value, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightIn(List<String> values) {
            addCriterion("role_right in", values, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightNotIn(List<String> values) {
            addCriterion("role_right not in", values, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightBetween(String value1, String value2) {
            addCriterion("role_right between", value1, value2, "roleRight");
            return (Criteria) this;
        }

        public Criteria andRoleRightNotBetween(String value1, String value2) {
            addCriterion("role_right not between", value1, value2, "roleRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightIsNull() {
            addCriterion("access_right is null");
            return (Criteria) this;
        }

        public Criteria andAccessRightIsNotNull() {
            addCriterion("access_right is not null");
            return (Criteria) this;
        }

        public Criteria andAccessRightEqualTo(String value) {
            addCriterion("access_right =", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightNotEqualTo(String value) {
            addCriterion("access_right <>", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightGreaterThan(String value) {
            addCriterion("access_right >", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightGreaterThanOrEqualTo(String value) {
            addCriterion("access_right >=", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightLessThan(String value) {
            addCriterion("access_right <", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightLessThanOrEqualTo(String value) {
            addCriterion("access_right <=", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightLike(String value) {
            addCriterion("access_right like", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightNotLike(String value) {
            addCriterion("access_right not like", value, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightIn(List<String> values) {
            addCriterion("access_right in", values, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightNotIn(List<String> values) {
            addCriterion("access_right not in", values, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightBetween(String value1, String value2) {
            addCriterion("access_right between", value1, value2, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAccessRightNotBetween(String value1, String value2) {
            addCriterion("access_right not between", value1, value2, "accessRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightIsNull() {
            addCriterion("auth_right is null");
            return (Criteria) this;
        }

        public Criteria andAuthRightIsNotNull() {
            addCriterion("auth_right is not null");
            return (Criteria) this;
        }

        public Criteria andAuthRightEqualTo(String value) {
            addCriterion("auth_right =", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightNotEqualTo(String value) {
            addCriterion("auth_right <>", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightGreaterThan(String value) {
            addCriterion("auth_right >", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightGreaterThanOrEqualTo(String value) {
            addCriterion("auth_right >=", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightLessThan(String value) {
            addCriterion("auth_right <", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightLessThanOrEqualTo(String value) {
            addCriterion("auth_right <=", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightLike(String value) {
            addCriterion("auth_right like", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightNotLike(String value) {
            addCriterion("auth_right not like", value, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightIn(List<String> values) {
            addCriterion("auth_right in", values, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightNotIn(List<String> values) {
            addCriterion("auth_right not in", values, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightBetween(String value1, String value2) {
            addCriterion("auth_right between", value1, value2, "authRight");
            return (Criteria) this;
        }

        public Criteria andAuthRightNotBetween(String value1, String value2) {
            addCriterion("auth_right not between", value1, value2, "authRight");
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

        public Criteria andCreateOperatorIsNull() {
            addCriterion("create_operator is null");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorIsNotNull() {
            addCriterion("create_operator is not null");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorEqualTo(String value) {
            addCriterion("create_operator =", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorNotEqualTo(String value) {
            addCriterion("create_operator <>", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorGreaterThan(String value) {
            addCriterion("create_operator >", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorGreaterThanOrEqualTo(String value) {
            addCriterion("create_operator >=", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorLessThan(String value) {
            addCriterion("create_operator <", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorLessThanOrEqualTo(String value) {
            addCriterion("create_operator <=", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorLike(String value) {
            addCriterion("create_operator like", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorNotLike(String value) {
            addCriterion("create_operator not like", value, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorIn(List<String> values) {
            addCriterion("create_operator in", values, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorNotIn(List<String> values) {
            addCriterion("create_operator not in", values, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorBetween(String value1, String value2) {
            addCriterion("create_operator between", value1, value2, "createOperator");
            return (Criteria) this;
        }

        public Criteria andCreateOperatorNotBetween(String value1, String value2) {
            addCriterion("create_operator not between", value1, value2, "createOperator");
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