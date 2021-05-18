package com.ucsmy.eaccount.manage.service.impl;

import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.dao.ManageRoleDao;
import com.ucsmy.eaccount.manage.entity.ManageRole;
import com.ucsmy.eaccount.manage.service.ManageRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ManageRoleServiceImpl extends BasicServiceImpl<ManageRole, ManageRoleDao> implements ManageRoleService {
//更新权限
    @Override
    @Transactional//@Transacational 是否开启事务，默认不配置不开启，
    public RetMsg updateMenu(ManageRole role) {
        dao.updateMenu(role);
        return RetMsg.success("更新权限成功");
    }
//显示列表
    @Override
    public List<ManageRole> getRoleExcludeConsumer() {
        List<ManageRole> roles = super.get();
//使用 stream().filter()过滤List对象   获取所有角色权限信息   Collectors.toList()用来结束Stream流。
        List<ManageRole> list = roles.stream().filter(role -> !CONSUMER.equals(role.getLevel())).collect(Collectors.toList());

        return list;
    }
}
