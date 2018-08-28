package cn.edu.seu.agriculture.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface DatePriceService {

    /**
     * 根据地域品种返回近期价格数据
     * @author 郑浩
     * @param province
     * @param market
     * @param type
     * @param name
     * @return　该品种在该市场下近期的价格变动
     */
    public List<Map<String,Object>> getPriceListByInfo(String province,  //省份
                                                     String market,
                                                     String type,      //品种
                                                     String name);     //名字
}
