package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.Bu;
import com.ibm.bluekey.bean.BuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BuMapper {
    long countByExample(BuExample example);

    int deleteByExample(BuExample example);

    int deleteByPrimaryKey(Integer buId);

    int insert(Bu record);

    int insertSelective(Bu record);

    List<Bu> selectByExample(BuExample example);

    Bu selectByPrimaryKey(Integer buId);

    int updateByExampleSelective(@Param("record") Bu record, @Param("example") BuExample example);

    int updateByExample(@Param("record") Bu record, @Param("example") BuExample example);

    int updateByPrimaryKeySelective(Bu record);

    int updateByPrimaryKey(Bu record);
}