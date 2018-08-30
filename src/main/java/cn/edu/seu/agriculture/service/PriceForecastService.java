package cn.edu.seu.agriculture.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface PriceForecastService {


    /**
     * 价格预测, 预测未来 **day** 天的价格
     * @param province  省份
     * @param market    市场
     * @param type      类型
     * @param name      品名
     * @param day       所需要预测的时间
     * @return          预测结果
     * 返回的是  30 + day 的json.
     * 30 是预测过程中涉及到的历史值以及计算过程中他们的预测值, day 是纯粹的未来预测值
     */
    public  List<Map<String,Object>> forecast(String province,
                               String market,
                               String type,
                               String name,
                               int day) throws Exception;


    /**
     * 价格预测, 预测未来 ** 7 **天的价格
     * @param province  省份
     * @param market    市场
     * @param type      类型
     * @param name      品名
     * @return  reList  预测结果
     * 返回的是  30 + 7 的json.
     * 30 是预测过程中涉及到的历史值以及计算过程中他们的预测值, 7 是纯粹的未来预测值
     */
    public  List<Map<String,Object>> forecast(String province,
                                  String market,
                                  String type,
                                  String name) throws ParseException;
}
