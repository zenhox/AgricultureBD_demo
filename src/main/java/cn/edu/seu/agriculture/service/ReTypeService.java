package cn.edu.seu.agriculture.service;

import cn.edu.seu.agriculture.entity.DatePrice;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface ReTypeService {
    /**
     * 类型转换
     * @author 郑浩
     * @param list  java list map object
     * @return  java json object
     */
    public JSONObject toJson(List<Map<String, Object>> list);


    /**
     * 例如: 将 List<></>
     * @param head
     * @param body
     * @return
     */
    public String toCsv(List<DatePrice> body);
}
