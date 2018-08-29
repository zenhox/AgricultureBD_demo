package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.CountryView;
import cn.edu.seu.agriculture.entity.CountryViewExample;
import cn.edu.seu.agriculture.entity.CountryViewKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CountryViewMapper {
    long countByExample(CountryViewExample example);

    int deleteByExample(CountryViewExample example);

    int deleteByPrimaryKey(CountryViewKey key);

    int insert(CountryView record);

    int insertSelective(CountryView record);

    List<CountryView> selectByExampleWithBLOBs(CountryViewExample example);

    List<CountryView> selectByExample(CountryViewExample example);

    CountryView selectByPrimaryKey(CountryViewKey key);

    int updateByExampleSelective(@Param("record") CountryView record, @Param("example") CountryViewExample example);

    int updateByExampleWithBLOBs(@Param("record") CountryView record, @Param("example") CountryViewExample example);

    int updateByExample(@Param("record") CountryView record, @Param("example") CountryViewExample example);

    int updateByPrimaryKeySelective(CountryView record);

    int updateByPrimaryKeyWithBLOBs(CountryView record);
}