package cn.edu.seu.agriculture.service;

import com.auth0.jwt.interfaces.DecodedJWT;

import javax.servlet.http.HttpServletResponse;

public interface AuthenticateService {
    /**
     *  先认证用户名密码， 认证通过修改cookie, 返回0
     *  用户名不存在返回 1
     *  密码错误返回 2
     * @param username
     * @param password
     * @return
     */
    public int login(String username, String password, HttpServletResponse response);

    /**
     * 先验证， 验证通过返回用户id， 验证失败返回-1
     * @param cookieValue  用于认证的cookie
     * @return
     */
    public int authenticate(String cookieValue);
}
