package cn.edu.seu.agriculture.service.impl;


import cn.edu.seu.agriculture.service.DatePriceService;
import cn.edu.seu.agriculture.service.PriceForecastService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class PriceForecastServiceImpl implements PriceForecastService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private static final double Alpha = 0.7;
    private static final int HISTORY_LEN = 30;

    @Autowired
    private DatePriceService datePriceService;

    @Override
    public List<Map<String,Object>> forecast(String province,
                                             String market,
                                             String type,
                                             String name,
                                             int day) throws ParseException {
        List<Map<String,Object>> priceListMap = datePriceService.getPriceListByInfo(
                                                                province,market,type,name,HISTORY_LEN);
        Map<String, Object> dateMap = priceListMap.get(0);
        Map<String, Object> priceMap = priceListMap.get(1);
        List<String> dateList = new ArrayList<>();
        List<Double> priceList = new ArrayList<>();
        if(dateMap.containsKey("date"))
            dateList = (List<String>) dateMap.get("date");
        if(priceMap.containsKey("price"))
            priceList = (List<Double>) priceMap.get("price");
        if(dateList.size() == 0 || priceList.size() == 0){
            logger.debug("In forecast method: Map to list error!");
            return null;
        }else {
            /**
             * 指数移动平均值预测算法
             */
            DecimalFormat df = new DecimalFormat("0.00");
            ArrayList<Double> forecastPriceList = new ArrayList<>();
            int historyLen = dateList.size();
            Double S_0 = (priceList.get(0) + priceList.get(1) + priceList.get(2)) / 3;
            String doubleStr = df.format(S_0);
            forecastPriceList.add(Double.valueOf(doubleStr));
            for (int i=1; i<historyLen;i++){
                Double Si = Alpha*priceList.get(i) + (1-Alpha)*forecastPriceList.get(i-1);
                String temp = df.format(Si);
                forecastPriceList.add(Double.valueOf(temp));
            }// 到这里 过去值已经都拟合好了
            Double S_n = Alpha*priceList.get(priceList.size()-1)
                                        + (1-Alpha)*forecastPriceList.get(forecastPriceList.size()-1);
            doubleStr = df.format(S_n);
            forecastPriceList.add(Double.valueOf(doubleStr));
            for (int j=1; j<day; j++){
                Double Sj = Alpha * forecastPriceList.get(forecastPriceList.size()-1)
                                        + (1-Alpha)*forecastPriceList.get(forecastPriceList.size()-2);
                String temp = df.format(Sj);
                forecastPriceList.add(Double.valueOf(temp));
            }
            /**
             * 开始添加日期列表
             */
            ArrayList<String> forecastDateList = new ArrayList<>();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            for (String date : dateList){
                Date d = format.parse(date);
                forecastDateList.add(new java.sql.Date(d.getTime()).toString());
            }
            Date lastDay = format.parse(dateList.get(dateList.size()-1));
            Calendar cal = Calendar.getInstance();
            cal.setTime(lastDay);
            cal.add(Calendar.DAY_OF_YEAR, 1);
            Date today = cal.getTime();
            forecastDateList.add(new java.sql.Date(today.getTime()).toString());
            for(int r=1;r<day;r++){
                Date temp = format.parse(forecastDateList.get(forecastDateList.size()-1));
                cal.setTime(temp);
                cal.add(Calendar.DAY_OF_YEAR, 1);
                forecastDateList.add(new java.sql.Date(cal.getTime().getTime()).toString());
            }
            /**现在
             * forecastPriceList 是 HISTORY_LEN + day 的列表
             * forecastDateList 是 HISTORY_LEN + day 的列表
             */
            List<Map<String,Object>> json = new ArrayList<>();
            Map<String,Object> xMap = new HashMap<>();
            Map<String,Object> yMap = new HashMap<>();
            xMap.put("date",forecastDateList);
            yMap.put("price",forecastPriceList);
            json.add(xMap);   // [0] 是日期
            json.add(yMap);   // [1] 是价格
            return json;
        }
    }

    @Override
    public List<Map<String,Object>> forecast(String province,
                                             String market,
                                             String type,
                                             String name) throws ParseException {
        return forecast(province,market,type,name,7);
    }
}
