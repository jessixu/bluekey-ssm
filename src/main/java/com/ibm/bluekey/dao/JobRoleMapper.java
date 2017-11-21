package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.JobRole;
import com.ibm.bluekey.bean.JobRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface JobRoleMapper {
    long countByExample(JobRoleExample example);

    int deleteByExample(JobRoleExample example);

    int deleteByPrimaryKey(Integer jId);

    int insert(JobRole record);

    int insertSelective(JobRole record);

    List<JobRole> selectByExample(JobRoleExample example);

    JobRole selectByPrimaryKey(Integer jId);

    int updateByExampleSelective(@Param("record") JobRole record, @Param("example") JobRoleExample example);

    int updateByExample(@Param("record") JobRole record, @Param("example") JobRoleExample example);

    int updateByPrimaryKeySelective(JobRole record);

    int updateByPrimaryKey(JobRole record);
}