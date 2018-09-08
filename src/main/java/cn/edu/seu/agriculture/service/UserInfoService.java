package cn.edu.seu.agriculture.service;

import java.util.List;

public interface UserInfoService {

    /**
     * 得到用户的查询偏好
     * @return  [省， 市，  种类  , 名字]
     */
    public List<String> getLikeList(int userId);
}
