package com.ucsmy.eaccount.manage.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    /**
     * 用户注册
     *
     * @param username 用户名
     * @param password 用户密码
     * @param slat     加权
     * @return
     */
    int register(@Param("userId") String userId, @Param("username") String username, @Param("password") String password, @Param("slat") String slat);

}
