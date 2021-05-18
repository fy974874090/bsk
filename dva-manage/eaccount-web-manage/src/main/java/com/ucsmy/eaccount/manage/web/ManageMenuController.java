package com.ucsmy.eaccount.manage.web;

import com.ucsmy.core.controller.BasicController;
import com.ucsmy.eaccount.manage.entity.ManageMenu;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.service.ManageMenuService;
import org.springframework.web.bind.annotation.*;

@RestController//暴露处理对象
@RequestMapping("sys/menu")//映射URL请求
public class ManageMenuController extends BasicController<ManageMenu, ManageMenuService> {
//更新菜单
    @RequestMapping( value = "updateResources", method = RequestMethod.POST )
    public RetMsg updateResources(@RequestBody ManageMenu entity) {
        return service.updateResources(entity);
    }
//当前角色菜单
    @RequestMapping( value = "getRoleMenu/{id}", method = RequestMethod.POST )
    public RetMsg getRoleMenu(@PathVariable("id") String roleId) {
        return RetMsg.success(service.getByRoleId(roleId));
    }

}
