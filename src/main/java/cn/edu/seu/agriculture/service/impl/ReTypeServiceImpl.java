package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.service.ReTypeService;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReTypeServiceImpl implements ReTypeService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
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
}
