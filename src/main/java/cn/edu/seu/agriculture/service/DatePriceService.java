package cn.edu.seu.agriculture.service;

import java.util.ArrayList;

public interface DatePriceService {

    public ArrayList<Double> getPriceListByInfo(String province,  //省份
                                                String market,
                                                String type,      //品种
                                                String name);     //名字
}
