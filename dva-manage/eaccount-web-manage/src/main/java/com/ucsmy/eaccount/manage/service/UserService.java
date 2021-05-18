package com.ucsmy.eaccount.manage.service;

import com.alibaba.fastjson.JSONObject;
import com.ucsmy.core.utils.RSAUtils;
import com.ucsmy.core.utils.StringUtils;
import com.ucsmy.core.utils.UUIDGenerator;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired//代替get/set
    private UserDao userDao;

    /**
     * 用户注册
     *
     * @param json#username 用户名
     * @param json#password 用户密码
     * @return
     */
    public RetMsg register(JSONObject json) {

        String username = json.getString("username");
        String password = json.getString("password");
        String confirmPassword = json.getString("password");

        /**
         * RSAUtils数据RSA加密解密
         * StringUtils转换字符
         */
        password = RSAUtils.decryptBySession(password).getData();
        confirmPassword = RSAUtils.decryptBySession(confirmPassword).getData();
        //判断是否为空
        if (StringUtils.isEmpty(password) || StringUtils.isEmpty(confirmPassword))
            return RetMsg.error("密码不能为空");

        if (!password.equals(confirmPassword))
            return RetMsg.error("新密码与确认密码输入不相同");
        String slat = StringUtils.getRandom(6);
        String dbpassword = StringUtils.passwordEncrypt(username, password, slat);
//UUIDGenerator生成唯一编码
        try {
            String userId = UUIDGenerator.generate();
            userDao.register(userId,username, dbpassword, slat);

        } catch (Exception e) {
            RetMsg.error("注册失败!");
        }

        return RetMsg.success("注册成功!");
    }
}
