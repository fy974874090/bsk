package com.ucsmy.eaccount.manage.web;

import com.ucsmy.core.controller.BasicController;
import com.ucsmy.eaccount.manage.entity.ManageResources;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.service.ManageResourcesService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController//暴露处理器
@RequestMapping("sys/resources")//映射URL的请求
public class ManageResourcesController extends BasicController<ManageResources, ManageResourcesService> {

    @RequestMapping( value = "getByMenuId/{id}", method = RequestMethod.POST )//  @PathVariable 可以将url花括号中的参数名称获取并映射到形参中
    public RetMsg getByMenuId(@PathVariable("id") String menuId) {
        return RetMsg.success(service.getByMenuId(menuId));
    }

}
