package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.TypeName;
import cn.edu.seu.agriculture.entity.TypeNameExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TypeNameMapper {
    long countByExample(TypeNameExample example);

    int deleteByExample(TypeNameExample example);

    int insert(TypeName record);

    int insertSelective(TypeName record);

    List<TypeName> selectByExample(TypeNameExample example);

    int updateByExampleSelective(@Param("record") TypeName record, @Param("example") TypeNameExample example);

    int updateByExample(@Param("record") TypeName record, @Param("example") TypeNameExample example);
}