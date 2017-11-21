package com.ibm.bluekey.dao;

import com.ibm.bluekey.bean.MailTemplate;
import com.ibm.bluekey.bean.MailTemplateExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MailTemplateMapper {
    long countByExample(MailTemplateExample example);

    int deleteByExample(MailTemplateExample example);

    int deleteByPrimaryKey(Integer tempId);

    int insert(MailTemplate record);

    int insertSelective(MailTemplate record);

    List<MailTemplate> selectByExampleWithBLOBs(MailTemplateExample example);

    List<MailTemplate> selectByExample(MailTemplateExample example);

    MailTemplate selectByPrimaryKey(Integer tempId);

    int updateByExampleSelective(@Param("record") MailTemplate record, @Param("example") MailTemplateExample example);

    int updateByExampleWithBLOBs(@Param("record") MailTemplate record, @Param("example") MailTemplateExample example);

    int updateByExample(@Param("record") MailTemplate record, @Param("example") MailTemplateExample example);

    int updateByPrimaryKeySelective(MailTemplate record);

    int updateByPrimaryKeyWithBLOBs(MailTemplate record);

    int updateByPrimaryKey(MailTemplate record);
}