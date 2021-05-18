package com.ucsmy.eaccount.manage.service;

import com.ucsmy.core.service.BasicService;
import com.ucsmy.eaccount.manage.entity.WorkOrderDetail;
import com.ucsmy.eaccount.manage.entity.WorkOrderWithDetails;

public interface WorkOrderDetailService extends BasicService<WorkOrderDetail> {
    WorkOrderWithDetails getDetails(String aid);

    /**
     * 更新订单状态
     *
     * @param aid        工单ID
     * @param dealType   处理类型
     * @param dealAnswer 处理回答
     * @param operator   操作人员
     * @return
     */
    String updateOrderProcess(String aid, String dealType, String dealAnswer, String operator);
}
