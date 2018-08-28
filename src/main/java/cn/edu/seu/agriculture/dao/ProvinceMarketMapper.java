package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.ProvinceMarket;
import cn.edu.seu.agriculture.entity.ProvinceMarketExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProvinceMarketMapper {
    long countByExample(ProvinceMarketExample example);

    int deleteByExample(ProvinceMarketExample example);

    int insert(ProvinceMarket record);

    int insertSelective(ProvinceMarket record);

    List<ProvinceMarket> selectByExample(ProvinceMarketExample example);

    int updateByExampleSelective(@Param("record") ProvinceMarket record, @Param("example") ProvinceMarketExample example);

    int updateByExample(@Param("record") ProvinceMarket record, @Param("example") ProvinceMarketExample example);
}