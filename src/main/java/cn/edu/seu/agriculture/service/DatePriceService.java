package cn.edu.seu.agriculture.service;

import cn.edu.seu.agriculture.entity.DatePrice;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface DatePriceService {

    /**
     * 根据地域品种返回全部在库数据
     * @author 郑浩
     * @param province
     * @param market
     * @param type
     * @param name
     * @return　该品种在该市场下近期的价格变动
     * List[0] 是日期序列, List[1] 是价格序列
     */
    public List<Map<String,Object>> getPriceListByInfo(String province,  //省份
                                                     String market,
                                                     String type,      //品种
                                                     String name);     //名字

    /**
     *　根据地域,　输入,　返回一定时间范围内的数据
     * @param province
     * @param market
     * @param type
     * @param name　　　
     * @param src  查询数据的起始时间
     * @param dst　　查询数据的结束时间
     * @return
     * List[0] 是日期序列, List[1] 是价格序列
     */
    public List<Map<String,Object>> getPriceListByInfo(String province,
                                                       String market,
                                                       String type,
                                                       String name,
                                                       String src,  // "yyyy-mm-dd"
                                                       String dst); // "yyyy-mm-dd"

    /**
     *　根据地域,　输入,　返回一定时间范围内的数据
     * @param province
     * @param market
     * @param type
     * @param name　　　
     * @param src  查询数据的起始时间
     * @param dst　　查询数据的结束时间
     * @return
     */
    public List<DatePrice> getDetailPriceListByInfo(String province,
                                              String market,
                                              String type,
                                              String name,
                                              String src,  // "yyyy-mm-dd"
                                              String dst); // "yyyy-mm-dd"

    /**
     * 根据地域和品种，返回近 ** day ** 天的数据
     * @param province
     * @param market
     * @param type
     * @param name
     * @param day
     * @return
     * List[0] 是日期序列, List[1] 是价格序列
     */
    public List<Map<String,Object>> getPriceListByInfo(String province,
                                                       String market,
                                                       String type,
                                                       String name,
                                                       int  day);


}
