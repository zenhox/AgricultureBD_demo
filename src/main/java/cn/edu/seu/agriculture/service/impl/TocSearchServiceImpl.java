package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.CategoryRelatedMapper;
import cn.edu.seu.agriculture.dao.CountryViewMapper;
import cn.edu.seu.agriculture.entity.*;
import cn.edu.seu.agriculture.service.TocSearchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class TocSearchServiceImpl implements TocSearchService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CategoryRelatedMapper provinceMarketMapper;

    @Autowired
    private CountryViewMapper countryViewMapper;

    @Override
    public ArrayList getProvinceList() {
        CategoryRelatedExample example = new CategoryRelatedExample();
        example.createCriteria().andProvinceIsNotNull();
        example.setDistinct(true);
        List<CategoryRelated> provinceMarketList =  provinceMarketMapper.selectByExample(example);
        ArrayList<String> reList = new ArrayList<>();
        for(CategoryRelated pm : provinceMarketList){
            reList.add(pm.getProvince());
        }
        HashSet h = new HashSet(reList);
        reList.clear();
        reList.addAll(h);
        return reList;
    }

    @Override
    public ArrayList getMarketByProvince(String province) {
        CategoryRelatedExample example = new CategoryRelatedExample();
        example.createCriteria().andProvinceEqualTo(province);
        example.setDistinct(true);
        List<CategoryRelated> provinceMarketList =  provinceMarketMapper.selectByExample(example);
        ArrayList<String> reList = new ArrayList<>();
        for(CategoryRelated pm : provinceMarketList){
            reList.add(pm.getMarket());
        }
        HashSet h = new HashSet(reList);
        reList.clear();
        reList.addAll(h);
        return reList;
    }

    @Override
    public ArrayList getTypeByArea(String province, String market) {
        CategoryRelatedExample example = new CategoryRelatedExample();
        example.createCriteria()
                .andProvinceEqualTo(province)
                .andMarketEqualTo(market);
        example.setDistinct(true);
        List<CategoryRelated> provinceMarketList =  provinceMarketMapper.selectByExample(example);
        ArrayList<String> reList = new ArrayList<>();
        for(CategoryRelated pm : provinceMarketList){
            reList.add(pm.getType());
        }
        HashSet h = new HashSet(reList);
        reList.clear();
        reList.addAll(h);
        return reList;
    }

    @Override
    public ArrayList getNameByAreaAndType(String province, String market, String type) {
        CategoryRelatedExample example = new CategoryRelatedExample();
        example.createCriteria()
                .andProvinceEqualTo(province)
                .andMarketEqualTo(market)
                .andTypeEqualTo(type);
        example.setDistinct(true);
        List<CategoryRelated> provinceMarketList =  provinceMarketMapper.selectByExample(example);
        ArrayList<String> reList = new ArrayList<>();
        for(CategoryRelated pm : provinceMarketList){
            reList.add(pm.getName());
        }
        HashSet h = new HashSet(reList);
        reList.clear();
        reList.addAll(h);
        return reList;
    }



    @Override
    public ArrayList getTypeByDate(String date_str) {
        CountryViewExample example = new CountryViewExample();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date date = format.parse(date_str);
            example.createCriteria().andDateEqualTo(date);
        } catch (ParseException e) {
            logger.error(e.getMessage());
        }
        List<CountryView>  query = countryViewMapper.selectByExample(example);
        ArrayList<String> reList = new ArrayList<>();
        for (CountryView cv : query){
            reList.add(cv.getType());
        }
        HashSet h = new HashSet(reList);
        reList.clear();
        reList.addAll(h);
        return reList;
    }

    @Override
    public ArrayList getNameByType(String date_str, String  type) {
        CountryViewExample example = new CountryViewExample();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date date = format.parse(date_str);
            example.createCriteria()
                    .andDateEqualTo(date)
                    .andTypeEqualTo(type);
        } catch (ParseException e) {
            logger.error(e.getMessage());
        }
        List<CountryView>  query = countryViewMapper.selectByExample(example);
        ArrayList<String> reList = new ArrayList<>();
        for (CountryView cv : query){
            reList.add(cv.getName());
        }
        HashSet h = new HashSet(reList);
        reList.clear();
        reList.addAll(h);
        return reList;
    }
}
