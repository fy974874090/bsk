package com.ucsmy.eaccount.manage.web;

import com.ucsmy.core.controller.BasicController;
import com.ucsmy.core.utils.RSAUtils;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.entity.ManageUserAccount;
import com.ucsmy.eaccount.manage.entity.ManageUserProfile;
import com.ucsmy.eaccount.manage.service.ManageUserAccountService;
import com.ucsmy.eaccount.manage.service.ManageUserProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 用户管理
 */
@RestController
@RequestMapping("sys/user")//映射URL的请求
public class ManageUserController extends BasicController<ManageUserProfile, ManageUserProfileService> {

    @Autowired//自动装配 代替get/set
    private ManageUserAccountService accountService;
//修改密码
    @RequestMapping(value = "updatePassword", method = RequestMethod.POST)//映射URL的请求
    //@PostMapping(value = "updatePassword")
    //@RequestBody接受前端传递的对象
    public RetMsg updatePassword(@RequestBody ManageUserAccount entity) {
        ManageUserAccount account = accountService.getById(entity.getId());
        if (account == null) {
            return RetMsg.error("用户不存在");
        }
        account.setPassword(RSAUtils.decryptBySession(entity.getPassword()).getData());
        return accountService.updatePassword(account);
    }
//强制下线下线
    @RequestMapping(value = "shotOff", method = RequestMethod.POST)//请求参数绑定到你控制器的方法参数上
    public RetMsg shotOff(@RequestParam String username) {
        return accountService.shotOff(username);
    }
//修改信息
    @RequestMapping(value = "updateStatus/{id}", method = RequestMethod.POST)
    public RetMsg updateStatus(@PathVariable(value = "id") String id) {
        return accountService.updateStatus(id);
    }

}
