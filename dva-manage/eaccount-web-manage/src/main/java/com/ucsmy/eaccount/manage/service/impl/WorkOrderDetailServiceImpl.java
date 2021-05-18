package com.ucsmy.eaccount.manage.service.impl;

import com.ucsmy.eaccount.manage.dao.WorkOrderDao;
import com.ucsmy.eaccount.manage.dao.WorkOrderDetailDao;
import com.ucsmy.eaccount.manage.entity.WorkOrderDetail;
import com.ucsmy.eaccount.manage.entity.WorkOrderWithDetails;
import com.ucsmy.eaccount.manage.service.WorkOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class WorkOrderDetailServiceImpl extends BasicServiceImpl<WorkOrderDetail, WorkOrderDetailDao> implements WorkOrderDetailService {

    private static final Integer SUCCESS_NUM = 1;

    @Autowired//自动装配 代替get/set
    private WorkOrderDao workOrderDao;
    //自动装配 代替get/set
    @Autowired
    private WorkOrderDetailDao workOrderDetailDao;

    @Override
    public WorkOrderWithDetails getDetails(String aid) {
        return workOrderDetailDao.getDetails(aid);
    }

    @Override
    @Transactional(readOnly = false) /*@Transacational 是否开启事务，默认不配置不开启，这里只用了readonly = false*/
    public String updateOrderProcess(String aid, String dealType, String dealAnswer, String operator) {
        boolean isSuccess = SUCCESS_NUM.equals(workOrderDetailDao.updateOrderProcess(aid, dealType, dealAnswer, operator));
        if ("完成".equalsIgnoreCase(dealType)) {
            workOrderDao.finishOrder(aid);
        }
        return isSuccess ? "success" : "failed";
    }
}