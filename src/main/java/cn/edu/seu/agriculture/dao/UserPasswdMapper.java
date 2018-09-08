package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.UserPasswd;
import cn.edu.seu.agriculture.entity.UserPasswdExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPasswdMapper {
    long countByExample(UserPasswdExample example);

    int deleteByExample(UserPasswdExample example);

    int insert(UserPasswd record);

    int insertSelective(UserPasswd record);

    List<UserPasswd> selectByExample(UserPasswdExample example);

    int updateByExampleSelective(@Param("record") UserPasswd record, @Param("example") UserPasswdExample example);

    int updateByExample(@Param("record") UserPasswd record, @Param("example") UserPasswdExample example);
}