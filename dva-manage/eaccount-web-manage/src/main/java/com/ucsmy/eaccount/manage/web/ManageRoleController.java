package com.ucsmy.eaccount.manage.web;

import com.ucsmy.core.controller.BasicController;
import com.ucsmy.eaccount.manage.entity.ManageRole;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.service.ManageRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController//暴露处理对象
@RequestMapping("sys/role")//映射URL的请求
public class ManageRoleController extends BasicController<ManageRole, ManageRoleService> {

    @Autowired //自动装配 代替get/set
    private ManageRoleService manageRoleService;
    //更新菜单
//@PostMapping（ value = "updateMenu"）
    @RequestMapping( value = "updateMenu", method = RequestMethod.POST )
    public RetMsg updateMenu(@RequestBody ManageRole entity) {
        return service.updateMenu(entity);
    }
//搜索
    @RequestMapping( value = "listAll", method = RequestMethod.POST )
    public RetMsg find() {
        return RetMsg.success(manageRoleService.getRoleExcludeConsumer());
    }

}
