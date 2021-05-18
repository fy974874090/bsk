package com.ucsmy.eaccount.manage.dao;

import com.ucsmy.core.dao.BasicDao;
import com.ucsmy.eaccount.manage.entity.WorkOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository//标识dao层的类为spring bean
//@Param  mybaits输入参数映射
public interface WorkOrderDao extends BasicDao<WorkOrder> {
    int distributeWorker(@Param("aid") String aid, @Param("worker") String worker);

    int finishOrder(@Param("aid") String aid);

    List<WorkOrder> getOrderList(@Param("username") String username, @Param("level") int level, @Param("offset") int offset, @Param("size") int size);

    long getOrderCount(@Param("username") String username, @Param("level") int intValue);

    Integer updateWorkOrder(@Param("aid") String aid,
                            @Param("title") String title,
                            @Param("content") String content,
                            @Param("product") String product);

    int deleteByWorkOrderId(@Param("id") String id);
}
