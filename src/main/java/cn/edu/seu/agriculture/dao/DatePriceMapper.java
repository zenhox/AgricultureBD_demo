package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.entity.DatePriceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DatePriceMapper {
    long countByExample(DatePriceExample example);

    int deleteByExample(DatePriceExample example);

    int insert(DatePrice record);

    int insertSelective(DatePrice record);

    List<DatePrice> selectByExample(DatePriceExample example);

    int updateByExampleSelective(@Param("record") DatePrice record, @Param("example") DatePriceExample example);

    int updateByExample(@Param("record") DatePrice record, @Param("example") DatePriceExample example);
}