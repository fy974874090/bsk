package com.ucsmy.eaccount.manage.service;

import com.ucsmy.core.service.BasicService;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.entity.ManageRole;

import java.util.List;

public interface ManageRoleService extends BasicService<ManageRole> {

    Integer CONSUMER = 2;

    RetMsg updateMenu(ManageRole role);

    /**
     * 获取所有除开消费者的角色
     *
     * @return
     */
    List<ManageRole> getRoleExcludeConsumer();
}
