package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.service.ReTypeService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

@Service
public class ReTypeServiceImpl implements ReTypeService {
    @Override
    public String toJson(List<Map<String, Object>> list) {
        JSONArray json_arr=new JSONArray();
        for (Map<String, Object> map : list) {
            JSONObject json_obj=new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                try {
                    json_obj.put(key,value);
                } catch (JSONException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            json_arr.put(json_obj);
        }
        return json_arr.toString();
    }
}
