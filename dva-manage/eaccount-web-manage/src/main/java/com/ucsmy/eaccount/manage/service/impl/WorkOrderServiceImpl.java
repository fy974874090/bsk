package com.ucsmy.eaccount.manage.service.impl;

import com.ucsmy.core.tool.interceptor.domain.PageInfo;
import com.ucsmy.core.tool.interceptor.domain.PageRequest;
import com.ucsmy.core.utils.SpringSecurityUtils;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.dao.ManageUserAccountDao;
import com.ucsmy.eaccount.manage.dao.WorkOrderDao;
import com.ucsmy.eaccount.manage.dao.WorkOrderDetailDao;
import com.ucsmy.eaccount.manage.entity.SelectOption;
import com.ucsmy.eaccount.manage.entity.WorkOrder;
import com.ucsmy.eaccount.manage.ext.AntdPageInfo;
import com.ucsmy.eaccount.manage.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WorkOrderServiceImpl extends BasicServiceImpl<WorkOrder, WorkOrderDao> implements WorkOrderService {

    private static final Integer SUCCESS_NUM = 1;

    private static final Integer ADMIN = 0;
    private static final Integer CONSUMER = 1;
    private static final Integer WOKER = 2;

    @Autowired //自动装配 代替get/set
    private ManageUserAccountDao userAccountDao;

    @Autowired
    private WorkOrderDao workOrderDao;

    @Autowired
    private WorkOrderDetailDao workOrderDetailDao;

    @Override
    public List<SelectOption> getWorkers() {
        return userAccountDao.getWorkers();
    }

    /*@Transacational 是否开启事务，默认不配置不开启，这里只用了readonly = false*/@Override
    @Transactional(readOnly = false)

    public String distributeWorker(String aid, String worker) {
        String msg = SUCCESS_NUM.equals(workOrderDao.distributeWorker(aid, worker)) ? "success" : "failed";
        String operator = SpringSecurityUtils.getUserByContext().getUsername();
        workOrderDetailDao.updateOrderProcess(aid, "D", "将工单分配到【" + worker + "】,请等待员工确认!", operator);
        return msg;
    }
/*显示列表
*
 */
    @Override
    public AntdPageInfo<WorkOrder> getOrderList(PageRequest pageRequest) {
//判断用户权限是否拥有
        String username = SpringSecurityUtils.getUserByContext().getUsername();
        Integer roleLevel = userAccountDao.getRoleLevelByUsername(username);

        if (roleLevel == null) {
            return null;
        }

        List<WorkOrder> orderList = workOrderDao.getOrderList(username, roleLevel.intValue(), pageRequest.getOffset(), pageRequest.getSize());
        long count = workOrderDao.getOrderCount(username, roleLevel.intValue());
        PageInfo<WorkOrder> workOrderPageInfo = new PageInfo<>();
        workOrderPageInfo.setData(orderList);
        workOrderPageInfo.setCount(count);
        return new AntdPageInfo<WorkOrder>(workOrderPageInfo, pageRequest);
    }

    @Override
    @Transactional(readOnly = false)
    public Integer updateWorkOrder(String aid, String title, String content, String product) {
        return workOrderDao.updateWorkOrder(aid, title, content, product);
    }

    /**
     * @Transacational 是否开启事务，默认不配置不开启，这里只用了readonly = false
     * 表示当前请求使用的数据库连接不是只读的数据库连接，只读的数据库连接只能执行select语句，不能执行update delete insert
     * @param id
     * @return
     */
    @Override
    @Transactional(readOnly = false)
    public RetMsg delete(String id) {
        int row = workOrderDao.deleteByWorkOrderId(id);
        return row > 0 ? RetMsg.success("删除成功!") : RetMsg.error("删除失败!");
    }
}