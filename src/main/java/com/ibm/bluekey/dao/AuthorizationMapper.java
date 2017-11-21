package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.Authorization;
import com.ibm.bluekey.bean.AuthorizationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AuthorizationMapper {
    long countByExample(AuthorizationExample example);

    int deleteByExample(AuthorizationExample example);

    int deleteByPrimaryKey(Integer authRoleId);

    int insert(Authorization record);

    int insertSelective(Authorization record);

    List<Authorization> selectByExample(AuthorizationExample example);

    Authorization selectByPrimaryKey(Integer authRoleId);

    int updateByExampleSelective(@Param("record") Authorization record, @Param("example") AuthorizationExample example);

    int updateByExample(@Param("record") Authorization record, @Param("example") AuthorizationExample example);

    int updateByPrimaryKeySelective(Authorization record);

    int updateByPrimaryKey(Authorization record);
}