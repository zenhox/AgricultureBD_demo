package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.service.ReTypeService;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.spi.DateFormatProvider;
import java.util.List;
import java.util.Map;

@Service
public class ReTypeServiceImpl implements ReTypeService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final String SYMBOL_RETURN = "\n";
    private static final String SYMBOL_SPIT_COMMA = ",";
    private static final String SYMBOL_SPIT_BAR = "-";

    @Override
    public JSONObject toJson(List<Map<String, Object>> list) {
        JSONObject json_obj=new JSONObject();
        for (Map<String, Object> map : list) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                try {
                    json_obj.put(key,value);
                } catch (JSONException e) {
                    logger.error(e.getMessage());
                }
            }
        }
        return json_obj;
    }

    @Override
    public String toCsv( List<DatePrice> body) {

        //动画所需的head可以手动添加，为方便数据查询，删除了头部的功能
        //String reCsv = head + SYMBOL_RETURN;
        String reCsv = "";
        for (DatePrice dp : body){
            String item = dp.getName() + SYMBOL_SPIT_COMMA;
            item = item
                    + dp.getProvince() + SYMBOL_SPIT_BAR
                    + dp.getMarket() + SYMBOL_SPIT_BAR
                    + dp.getType() + SYMBOL_SPIT_COMMA;
            item = item
                    + dp.getPrice() + SYMBOL_SPIT_COMMA;
            item = item
                    + new Date(dp.getDate().getTime()).toString() + SYMBOL_RETURN;
            reCsv += item;
        }
        return reCsv;
    }
}
