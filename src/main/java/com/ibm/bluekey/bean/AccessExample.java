package com.ibm.bluekey.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AccessExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AccessExample() {
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

        public Criteria andAccessIdIsNull() {
            addCriterion("access_id is null");
            return (Criteria) this;
        }

        public Criteria andAccessIdIsNotNull() {
            addCriterion("access_id is not null");
            return (Criteria) this;
        }

        public Criteria andAccessIdEqualTo(Integer value) {
            addCriterion("access_id =", value, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdNotEqualTo(Integer value) {
            addCriterion("access_id <>", value, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdGreaterThan(Integer value) {
            addCriterion("access_id >", value, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("access_id >=", value, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdLessThan(Integer value) {
            addCriterion("access_id <", value, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdLessThanOrEqualTo(Integer value) {
            addCriterion("access_id <=", value, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdIn(List<Integer> values) {
            addCriterion("access_id in", values, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdNotIn(List<Integer> values) {
            addCriterion("access_id not in", values, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdBetween(Integer value1, Integer value2) {
            addCriterion("access_id between", value1, value2, "accessId");
            return (Criteria) this;
        }

        public Criteria andAccessIdNotBetween(Integer value1, Integer value2) {
            addCriterion("access_id not between", value1, value2, "accessId");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andShortTitleIsNull() {
            addCriterion("short_title is null");
            return (Criteria) this;
        }

        public Criteria andShortTitleIsNotNull() {
            addCriterion("short_title is not null");
            return (Criteria) this;
        }

        public Criteria andShortTitleEqualTo(String value) {
            addCriterion("short_title =", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotEqualTo(String value) {
            addCriterion("short_title <>", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleGreaterThan(String value) {
            addCriterion("short_title >", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleGreaterThanOrEqualTo(String value) {
            addCriterion("short_title >=", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleLessThan(String value) {
            addCriterion("short_title <", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleLessThanOrEqualTo(String value) {
            addCriterion("short_title <=", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleLike(String value) {
            addCriterion("short_title like", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotLike(String value) {
            addCriterion("short_title not like", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleIn(List<String> values) {
            addCriterion("short_title in", values, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotIn(List<String> values) {
            addCriterion("short_title not in", values, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleBetween(String value1, String value2) {
            addCriterion("short_title between", value1, value2, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotBetween(String value1, String value2) {
            addCriterion("short_title not between", value1, value2, "shortTitle");
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

        public Criteria andFunctionEqualTo(String value) {
            addCriterion("function =", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotEqualTo(String value) {
            addCriterion("function <>", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionGreaterThan(String value) {
            addCriterion("function >", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionGreaterThanOrEqualTo(String value) {
            addCriterion("function >=", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionLessThan(String value) {
            addCriterion("function <", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionLessThanOrEqualTo(String value) {
            addCriterion("function <=", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionLike(String value) {
            addCriterion("function like", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotLike(String value) {
            addCriterion("function not like", value, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionIn(List<String> values) {
            addCriterion("function in", values, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotIn(List<String> values) {
            addCriterion("function not in", values, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionBetween(String value1, String value2) {
            addCriterion("function between", value1, value2, "function");
            return (Criteria) this;
        }

        public Criteria andFunctionNotBetween(String value1, String value2) {
            addCriterion("function not between", value1, value2, "function");
            return (Criteria) this;
        }

        public Criteria andPlatformIsNull() {
            addCriterion("platform is null");
            return (Criteria) this;
        }

        public Criteria andPlatformIsNotNull() {
            addCriterion("platform is not null");
            return (Criteria) this;
        }

        public Criteria andPlatformEqualTo(String value) {
            addCriterion("platform =", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformNotEqualTo(String value) {
            addCriterion("platform <>", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformGreaterThan(String value) {
            addCriterion("platform >", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformGreaterThanOrEqualTo(String value) {
            addCriterion("platform >=", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformLessThan(String value) {
            addCriterion("platform <", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformLessThanOrEqualTo(String value) {
            addCriterion("platform <=", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformLike(String value) {
            addCriterion("platform like", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformNotLike(String value) {
            addCriterion("platform not like", value, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformIn(List<String> values) {
            addCriterion("platform in", values, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformNotIn(List<String> values) {
            addCriterion("platform not in", values, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformBetween(String value1, String value2) {
            addCriterion("platform between", value1, value2, "platform");
            return (Criteria) this;
        }

        public Criteria andPlatformNotBetween(String value1, String value2) {
            addCriterion("platform not between", value1, value2, "platform");
            return (Criteria) this;
        }

        public Criteria andApplyStepIsNull() {
            addCriterion("apply_step is null");
            return (Criteria) this;
        }

        public Criteria andApplyStepIsNotNull() {
            addCriterion("apply_step is not null");
            return (Criteria) this;
        }

        public Criteria andApplyStepEqualTo(String value) {
            addCriterion("apply_step =", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepNotEqualTo(String value) {
            addCriterion("apply_step <>", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepGreaterThan(String value) {
            addCriterion("apply_step >", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepGreaterThanOrEqualTo(String value) {
            addCriterion("apply_step >=", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepLessThan(String value) {
            addCriterion("apply_step <", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepLessThanOrEqualTo(String value) {
            addCriterion("apply_step <=", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepLike(String value) {
            addCriterion("apply_step like", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepNotLike(String value) {
            addCriterion("apply_step not like", value, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepIn(List<String> values) {
            addCriterion("apply_step in", values, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepNotIn(List<String> values) {
            addCriterion("apply_step not in", values, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepBetween(String value1, String value2) {
            addCriterion("apply_step between", value1, value2, "applyStep");
            return (Criteria) this;
        }

        public Criteria andApplyStepNotBetween(String value1, String value2) {
            addCriterion("apply_step not between", value1, value2, "applyStep");
            return (Criteria) this;
        }

        public Criteria andUrlIsNull() {
            addCriterion("url is null");
            return (Criteria) this;
        }

        public Criteria andUrlIsNotNull() {
            addCriterion("url is not null");
            return (Criteria) this;
        }

        public Criteria andUrlEqualTo(String value) {
            addCriterion("url =", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotEqualTo(String value) {
            addCriterion("url <>", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlGreaterThan(String value) {
            addCriterion("url >", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlGreaterThanOrEqualTo(String value) {
            addCriterion("url >=", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlLessThan(String value) {
            addCriterion("url <", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlLessThanOrEqualTo(String value) {
            addCriterion("url <=", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlLike(String value) {
            addCriterion("url like", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotLike(String value) {
            addCriterion("url not like", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlIn(List<String> values) {
            addCriterion("url in", values, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotIn(List<String> values) {
            addCriterion("url not in", values, "url");
            return (Criteria) this;
        }

        public Criteria andUrlBetween(String value1, String value2) {
            addCriterion("url between", value1, value2, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotBetween(String value1, String value2) {
            addCriterion("url not between", value1, value2, "url");
            return (Criteria) this;
        }

        public Criteria andOtherUrlIsNull() {
            addCriterion("other_url is null");
            return (Criteria) this;
        }

        public Criteria andOtherUrlIsNotNull() {
            addCriterion("other_url is not null");
            return (Criteria) this;
        }

        public Criteria andOtherUrlEqualTo(String value) {
            addCriterion("other_url =", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlNotEqualTo(String value) {
            addCriterion("other_url <>", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlGreaterThan(String value) {
            addCriterion("other_url >", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlGreaterThanOrEqualTo(String value) {
            addCriterion("other_url >=", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlLessThan(String value) {
            addCriterion("other_url <", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlLessThanOrEqualTo(String value) {
            addCriterion("other_url <=", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlLike(String value) {
            addCriterion("other_url like", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlNotLike(String value) {
            addCriterion("other_url not like", value, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlIn(List<String> values) {
            addCriterion("other_url in", values, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlNotIn(List<String> values) {
            addCriterion("other_url not in", values, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlBetween(String value1, String value2) {
            addCriterion("other_url between", value1, value2, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andOtherUrlNotBetween(String value1, String value2) {
            addCriterion("other_url not between", value1, value2, "otherUrl");
            return (Criteria) this;
        }

        public Criteria andApplyEmailIsNull() {
            addCriterion("apply_email is null");
            return (Criteria) this;
        }

        public Criteria andApplyEmailIsNotNull() {
            addCriterion("apply_email is not null");
            return (Criteria) this;
        }

        public Criteria andApplyEmailEqualTo(String value) {
            addCriterion("apply_email =", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailNotEqualTo(String value) {
            addCriterion("apply_email <>", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailGreaterThan(String value) {
            addCriterion("apply_email >", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailGreaterThanOrEqualTo(String value) {
            addCriterion("apply_email >=", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailLessThan(String value) {
            addCriterion("apply_email <", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailLessThanOrEqualTo(String value) {
            addCriterion("apply_email <=", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailLike(String value) {
            addCriterion("apply_email like", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailNotLike(String value) {
            addCriterion("apply_email not like", value, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailIn(List<String> values) {
            addCriterion("apply_email in", values, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailNotIn(List<String> values) {
            addCriterion("apply_email not in", values, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailBetween(String value1, String value2) {
            addCriterion("apply_email between", value1, value2, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andApplyEmailNotBetween(String value1, String value2) {
            addCriterion("apply_email not between", value1, value2, "applyEmail");
            return (Criteria) this;
        }

        public Criteria andLeadTimeIsNull() {
            addCriterion("lead_time is null");
            return (Criteria) this;
        }

        public Criteria andLeadTimeIsNotNull() {
            addCriterion("lead_time is not null");
            return (Criteria) this;
        }

        public Criteria andLeadTimeEqualTo(String value) {
            addCriterion("lead_time =", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeNotEqualTo(String value) {
            addCriterion("lead_time <>", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeGreaterThan(String value) {
            addCriterion("lead_time >", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeGreaterThanOrEqualTo(String value) {
            addCriterion("lead_time >=", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeLessThan(String value) {
            addCriterion("lead_time <", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeLessThanOrEqualTo(String value) {
            addCriterion("lead_time <=", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeLike(String value) {
            addCriterion("lead_time like", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeNotLike(String value) {
            addCriterion("lead_time not like", value, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeIn(List<String> values) {
            addCriterion("lead_time in", values, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeNotIn(List<String> values) {
            addCriterion("lead_time not in", values, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeBetween(String value1, String value2) {
            addCriterion("lead_time between", value1, value2, "leadTime");
            return (Criteria) this;
        }

        public Criteria andLeadTimeNotBetween(String value1, String value2) {
            addCriterion("lead_time not between", value1, value2, "leadTime");
            return (Criteria) this;
        }

        public Criteria andParentPartIsNull() {
            addCriterion("parent_part is null");
            return (Criteria) this;
        }

        public Criteria andParentPartIsNotNull() {
            addCriterion("parent_part is not null");
            return (Criteria) this;
        }

        public Criteria andParentPartEqualTo(Integer value) {
            addCriterion("parent_part =", value, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartNotEqualTo(Integer value) {
            addCriterion("parent_part <>", value, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartGreaterThan(Integer value) {
            addCriterion("parent_part >", value, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartGreaterThanOrEqualTo(Integer value) {
            addCriterion("parent_part >=", value, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartLessThan(Integer value) {
            addCriterion("parent_part <", value, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartLessThanOrEqualTo(Integer value) {
            addCriterion("parent_part <=", value, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartIn(List<Integer> values) {
            addCriterion("parent_part in", values, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartNotIn(List<Integer> values) {
            addCriterion("parent_part not in", values, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartBetween(Integer value1, Integer value2) {
            addCriterion("parent_part between", value1, value2, "parentPart");
            return (Criteria) this;
        }

        public Criteria andParentPartNotBetween(Integer value1, Integer value2) {
            addCriterion("parent_part not between", value1, value2, "parentPart");
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