package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.Counter;
import cn.edu.seu.agriculture.entity.CounterExample;
import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CounterMapper {
    long countByExample(CounterExample example);

    int deleteByExample(CounterExample example);

    int deleteByPrimaryKey(Date crawtime);

    int insert(Counter record);

    int insertSelective(Counter record);

    List<Counter> selectByExample(CounterExample example);

    Counter selectByPrimaryKey(Date crawtime);

    int updateByExampleSelective(@Param("record") Counter record, @Param("example") CounterExample example);

    int updateByExample(@Param("record") Counter record, @Param("example") CounterExample example);

    int updateByPrimaryKeySelective(Counter record);

    int updateByPrimaryKey(Counter record);
}