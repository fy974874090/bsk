package com.ucsmy.eaccount.manage.web;

import com.ucsmy.core.controller.BasicController;
import com.ucsmy.eaccount.manage.entity.ManageOrganization;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.service.ManageOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 废弃
 */
@RestController
@RequestMapping("sys/organization")
public class ManageOrganizationController extends BasicController<ManageOrganization, ManageOrganizationService> {

    @RequestMapping( value = "listAll", method = RequestMethod.POST )
    public RetMsg find() {
        return RetMsg.success(service.get());
    }

}
