package com.ucsmy.eaccount.manage.web;

import com.ucsmy.core.utils.SpringSecurityUtils;
import com.ucsmy.core.utils.StringUtils;
import com.ucsmy.eaccount.config.properties.UcsmyProperties;
import com.ucsmy.core.vo.RetMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 *登录
 */
@Controller//封装用户请求后分发
public class ManageLoginController {

    private final static String ERROR_URI = "javax.servlet.error.request_uri";

    @Autowired//代替getset
    private UcsmyProperties properties;

    @RequestMapping(value = {"index", "", "login", "403"}, produces = "text/html")
    public String login(HttpServletRequest request) {
        // 如果设置了重定向地址，重定向到指定服务器（前后端分离）
        if(StringUtils.isNotEmpty(properties.getRedirect().getPageUrl())) {
            String errorUri = (String) request.getAttribute(ERROR_URI);
            return "redirect:".concat(properties.getRedirect().getPageUrl()).concat(errorUri == null ? "" : errorUri);
        }
        request.setAttribute("loginMsg", SpringSecurityUtils.getWebUserData(request));
        return "index";
    }

    @RequestMapping(value = {"index", "", "login"})
    @ResponseBody//获取前端数据
    public Object index(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> retData = SpringSecurityUtils.getWebUserData(request);
        if(retData.get("username") == null) {
            response.setStatus(HttpStatus.UNAUTHORIZED.value());
        }
        return RetMsg.success(retData);
    }

}
