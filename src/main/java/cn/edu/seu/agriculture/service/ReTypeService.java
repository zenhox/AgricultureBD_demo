package cn.edu.seu.agriculture.service;

import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface ReTypeService {
    public JSONObject toJson(List<Map<String, Object>> list);
}
