package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.Access;
import com.ibm.bluekey.bean.AccessExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccessMapper {
    long countByExample(AccessExample example);

    int deleteByExample(AccessExample example);

    int deleteByPrimaryKey(Integer accessId);

    int insert(Access record);

    int insertSelective(Access record);

    List<Access> selectByExample(AccessExample example);
    
    List<Access> selectAccessLikeSearch(String search);
    
    List<Access> selectAccessLikeSearchOnlyTitle(String search);//只模糊查询tital

    Access selectByPrimaryKey(Integer accessId);

    int updateByExampleSelective(@Param("record") Access record, @Param("example") AccessExample example);

    int updateByExample(@Param("record") Access record, @Param("example") AccessExample example);

    int updateByPrimaryKeySelective(Access record);

    int updateByPrimaryKey(Access record);
}