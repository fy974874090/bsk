package com.ucsmy.eaccount.manage.web;

import com.alibaba.fastjson.JSONObject;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @Autowired //自动装配 代替get/set
    private UserService userService;

    @PostMapping("sys/user/register")//映射post请求
    /*@RequestBody接受前端传递的对象
    *注册
    *
    */
    public RetMsg userRegister(@RequestBody JSONObject json){
        return userService.register(json);
    }

}
