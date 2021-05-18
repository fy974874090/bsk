package com.ucsmy.eaccount.manage.service;

import com.ucsmy.core.service.BasicService;
import com.ucsmy.core.tool.interceptor.domain.PageRequest;
import com.ucsmy.eaccount.manage.entity.SelectOption;
import com.ucsmy.eaccount.manage.entity.WorkOrder;
import com.ucsmy.eaccount.manage.ext.AntdPageInfo;

import java.util.List;

public interface WorkOrderService extends BasicService<WorkOrder> {
    /**
     * 获取所有的员工
     *
     * @return 所有员工的集合
     */
    List<SelectOption> getWorkers();
//分配
    String distributeWorker(String aid, String worker);

    AntdPageInfo<WorkOrder> getOrderList(PageRequest pageRequest);

    /**
     * 更新工单描述
     *
     * @param aid
     * @param title
     * @param content
     * @param product
     * @return
     */
    Integer updateWorkOrder(String aid, String title, String content, String product);
}
