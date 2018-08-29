package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.CategoryRelatedMapper;
import cn.edu.seu.agriculture.entity.CategoryRelated;
import cn.edu.seu.agriculture.entity.CategoryRelatedExample;
import cn.edu.seu.agriculture.service.TocSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class TocSearchServiceImpl implements TocSearchService {

    @Autowired
    private CategoryRelatedMapper provinceMarketMapper;

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
}
