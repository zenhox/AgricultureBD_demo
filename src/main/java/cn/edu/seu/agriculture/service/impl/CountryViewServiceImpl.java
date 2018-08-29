package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.CountryViewMapper;
import cn.edu.seu.agriculture.entity.CountryView;
import cn.edu.seu.agriculture.entity.CountryViewExample;
import cn.edu.seu.agriculture.entity.CountryViewKey;
import cn.edu.seu.agriculture.service.CountryViewService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountryViewServiceImpl implements CountryViewService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CountryViewMapper countryViewMapper;

    @Override
    public JSONObject getCountryViewPrice(String type, String name) {
        CountryViewKey countryViewKey = new CountryViewKey(type,name);
        CountryView countryView = countryViewMapper.selectByPrimaryKey(countryViewKey);
        String jsonStr = countryView.getAveragePrice();
        JSONObject reJson = new JSONObject(jsonStr);
        return reJson;
    }
}
