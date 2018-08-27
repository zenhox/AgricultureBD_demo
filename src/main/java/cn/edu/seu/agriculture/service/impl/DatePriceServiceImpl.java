package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.DatePriceMapper;
import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.entity.DatePriceExample;
import cn.edu.seu.agriculture.service.DatePriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class DatePriceServiceImpl implements DatePriceService {

    @Autowired
    private DatePriceMapper datePriceMapper;

    @Override
    public ArrayList<Double> getPriceListByInfo(String province,
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
        List<DatePrice> list = datePriceMapper.selectByExample(example);
        ArrayList<Double> priceList = new ArrayList<>();
        for(DatePrice dp : list){
            priceList.add(dp.getPrice());
        }
        return priceList;
    }
}
