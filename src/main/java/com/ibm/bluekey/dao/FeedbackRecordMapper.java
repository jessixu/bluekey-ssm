package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.FeedbackRecord;
import com.ibm.bluekey.bean.FeedbackRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FeedbackRecordMapper {
    long countByExample(FeedbackRecordExample example);

    int deleteByExample(FeedbackRecordExample example);

    int deleteByPrimaryKey(Integer fId);

    int insert(FeedbackRecord record);

    int insertSelective(FeedbackRecord record);

    List<FeedbackRecord> selectByExample(FeedbackRecordExample example);

    FeedbackRecord selectByPrimaryKey(Integer fId);

    int updateByExampleSelective(@Param("record") FeedbackRecord record, @Param("example") FeedbackRecordExample example);

    int updateByExample(@Param("record") FeedbackRecord record, @Param("example") FeedbackRecordExample example);

    int updateByPrimaryKeySelective(FeedbackRecord record);

    int updateByPrimaryKey(FeedbackRecord record);
}