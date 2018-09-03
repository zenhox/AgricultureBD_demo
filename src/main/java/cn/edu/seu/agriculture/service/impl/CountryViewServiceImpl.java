package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.CountryViewMapper;
import cn.edu.seu.agriculture.entity.CountryView;
import cn.edu.seu.agriculture.entity.CountryViewKey;
import cn.edu.seu.agriculture.exception.PathInvalidException;
import cn.edu.seu.agriculture.service.CountryViewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class CountryViewServiceImpl implements CountryViewService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CountryViewMapper countryViewMapper;

    @Override
    public String getCountryViewPrice(String date, String type, String name) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dt = null;
        try {
            dt = format.parse(date);
        } catch (ParseException e) {
            throw new PathInvalidException("日期输入有误!");
        }
        CountryViewKey countryViewKey = new CountryViewKey(dt,type,name);

        CountryView countryView =  countryViewMapper.selectByPrimaryKey(countryViewKey);
        String query = countryView.getAveragePrice();
        /**
         * TODO translate query to what we needed!
         */
        return  query;
    }
}
