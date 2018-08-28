package cn.edu.seu.agriculture.service;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import java.util.ArrayList;

public interface TocSearchService {
    public ArrayList getProvinceList();

    public ArrayList getMarketByProvince(String province);

    public ArrayList getTypeByArea(String province, String market);

    public ArrayList getNameByAreaAndType(String province,String market,String type);
}
