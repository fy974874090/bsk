package com.ucsmy.core.tool.captcha;

import com.ucsmy.core.vo.RetMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class CaptchaController {

    @Autowired
    private CaptchaService captchaService;

    public CaptchaController(CaptchaService captchaService) {
        this.captchaService = captchaService;
    }

    @GetMapping(value = "captcha")
    @ResponseBody
    public RetMsg captcha(String securityCode) throws IOException {
        return RetMsg.success(captchaService.getCaptcha(securityCode));
    }

}
