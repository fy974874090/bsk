package com.ucsmy.eaccount.manage.web;

import com.alibaba.fastjson.JSONObject;
import com.ucsmy.core.controller.BasicController;
import com.ucsmy.core.utils.SpringSecurityUtils;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.entity.WorkOrderDetail;
import com.ucsmy.eaccount.manage.service.WorkOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController//暴露处理对象
@RequestMapping("sys/work/detail")//映射URL的请求
public class WorkOrderDetailController extends BasicController<WorkOrderDetail, WorkOrderDetailService> {

    @Autowired//代替get/set
    private WorkOrderDetailService detailService;

    @PostMapping("getDetails")//映射URL的请求
    public RetMsg getDetails(@RequestBody JSONObject json) {
        String aid = json.getString("aid");
        return RetMsg.success(detailService.getDetails(aid));
    }

    @PostMapping("updateOrderProcess")//映射URL的请求
    public RetMsg updateOrderProcess(@RequestBody JSONObject json) {

        String aid = json.getString("aid");
        String dealType = json.getString("dealType");
        String dealAnswer = json.getString("dealAnswer");
        String operator = SpringSecurityUtils.getUserByContext().getUsername();

        return RetMsg.success(detailService.updateOrderProcess(aid, dealType, dealAnswer, operator));
    }
}
