package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.SendRecord;
import com.ibm.bluekey.bean.SendRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SendRecordMapper {
    long countByExample(SendRecordExample example);

    int deleteByExample(SendRecordExample example);

    int deleteByPrimaryKey(Integer recordId);

    int insert(SendRecord record);

    int insertSelective(SendRecord record);

    List<SendRecord> selectByExample(SendRecordExample example);

    SendRecord selectByPrimaryKey(Integer recordId);

    int updateByExampleSelective(@Param("record") SendRecord record, @Param("example") SendRecordExample example);

    int updateByExample(@Param("record") SendRecord record, @Param("example") SendRecordExample example);

    int updateByPrimaryKeySelective(SendRecord record);

    int updateByPrimaryKey(SendRecord record);
}