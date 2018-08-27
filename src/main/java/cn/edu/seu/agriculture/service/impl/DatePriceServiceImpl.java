package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.DatePriceMapper;
import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.entity.DatePriceExample;
import cn.edu.seu.agriculture.service.DatePriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DatePriceServiceImpl implements DatePriceService {

    @Autowired
    private DatePriceMapper datePriceMapper;

    @Override
    public List<Map<Date,Double>> getPriceListByInfo(String province,
                                                String market,
                                                String type,
                                                String name)
    {
        //创建查询模板
        DatePriceExample example = new DatePriceExample();
        /**
         * Implement the example.
         */
        example.createCriteria()
                .andProvinceEqualTo(province)
                .andMarketEqualTo(market)
                .andTypeEqualTo(type)
                .andNameEqualTo(name);
        example.setOrderByClause("date ASC");
        List<DatePrice> list = datePriceMapper.selectByExample(example);
        List<Map<Date,Double>> json = new ArrayList<>();
        for(DatePrice dp : list){
            Map<java.util.Date,Double> map = new HashMap();
            map.put(dp.getDate(),dp.getPrice());
            json.add(map);
        }
        return json;
    }
}
