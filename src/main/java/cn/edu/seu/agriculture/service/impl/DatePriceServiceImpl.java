package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.DatePriceMapper;
import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.entity.DatePriceExample;
import cn.edu.seu.agriculture.exception.DBAccessException;
import cn.edu.seu.agriculture.exception.DataNotExistException;
import cn.edu.seu.agriculture.exception.PathInvalidException;
import cn.edu.seu.agriculture.service.DatePriceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.sql.Date;

@Service
public class DatePriceServiceImpl implements DatePriceService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DatePriceMapper datePriceMapper;

    @Override
    public List<Map<String,Object>> getPriceListByInfo(String province,
                                                String market,
                                                String type,
                                                String name)
    {
        try{
            if(province == null || province.equals("")
            || market == null|| market.equals("")
            || type == null || type.equals("")
            || name == null || name.equals("")){
                throw new PathInvalidException("URL path is invalid!");
            }
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
            if (list == null || list.isEmpty()){
                throw new DataNotExistException("No data is stored in database!");
            }
            List<Map<String,Object>> json = new ArrayList<>();
            List<String> dateList = new ArrayList<>();
            List<Double> priceList = new ArrayList<>();
            for(DatePrice dp : list){
                dateList.add(new Date(dp.getDate().getTime()).toString());
                priceList.add(dp.getPrice());
            }
            Map<String,Object> xMap = new HashMap<>();
            Map<String,Object> yMap = new HashMap<>();
            xMap.put("date",dateList);
            yMap.put("price",priceList);
            json.add(xMap);
            json.add(yMap);
            return json;
        }catch (PathInvalidException e1){
            throw e1;
        }catch (DataNotExistException e2){
            throw e2;
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            throw new DBAccessException("Exception while access the database: "+ e.getMessage());
        }
    }
}
