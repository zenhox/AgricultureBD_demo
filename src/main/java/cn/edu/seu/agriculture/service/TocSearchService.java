package cn.edu.seu.agriculture.service;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import java.util.ArrayList;

public interface TocSearchService {

    /**
     * 得到全国省市列表
     * ＠author 郑浩
     * @return　全国省市列表
     */
    public ArrayList getProvinceList();

    /**
     * 得到特定省份下的市场列表
     * ＠author 郑浩
     * @param province  省市
     * @return 市场列表
     */
    public ArrayList getMarketByProvince(String province);

    /**
     * 得到特定区域下的商品种类列表
     * ＠author 郑浩
     * @param province
     * @param market
     * @return 商品种类列表
     */
    public ArrayList getTypeByArea(String province, String market);


    /**
     * 得到该品类下的
     * ＠author 郑浩
     * @param province
     * @param market
     * @param type
     * @return
     */
    public ArrayList getNameByAreaAndType(String province,String market,String type);
}
