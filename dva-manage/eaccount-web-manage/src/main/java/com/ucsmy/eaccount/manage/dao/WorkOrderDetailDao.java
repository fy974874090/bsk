package com.ucsmy.eaccount.manage.dao;

import com.ucsmy.core.dao.BasicDao;
import com.ucsmy.eaccount.manage.entity.WorkOrderDetail;
import com.ucsmy.eaccount.manage.entity.WorkOrderWithDetails;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkOrderDetailDao extends BasicDao<WorkOrderDetail> {
    WorkOrderWithDetails getDetails(@Param("aid") String aid);

    int updateOrderProcess(@Param("orderId") String orderId,
                           @Param("dealType") String dealType,
                           @Param("dealAnswer") String dealAnswer,
                           @Param("operator") String operator);
}
