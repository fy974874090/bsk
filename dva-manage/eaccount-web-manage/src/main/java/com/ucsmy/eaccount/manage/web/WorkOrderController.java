package com.ucsmy.eaccount.manage.web;

import com.alibaba.fastjson.JSONObject;
import com.ucsmy.core.tool.interceptor.domain.PageRequest;
import com.ucsmy.core.utils.SpringSecurityUtils;
import com.ucsmy.core.vo.RetMsg;
import com.ucsmy.eaccount.manage.entity.WorkOrder;
import com.ucsmy.eaccount.manage.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;


@RestController/*@Component + @Controller + @ResponseBody*/
//暴露处理对象
@RequestMapping("sys/work")
//映射URL的请求
public class WorkOrderController {

    private static final Integer suc = 1;

    @Autowired
    //自动装配 代替get/set
    private WorkOrderService workOrderService;
    //@PostMapping = @RequestMapping(method = RequestMethod.POST)
    @PostMapping("save")//映射post请求url
    //@RequestBody接受前端传递的对象 反射序列化 可以是map或者实体对象
    //新增
    public RetMsg insertOrder(@RequestBody JSONObject json) {
        try {
            //通过 SpringSecurityUtils工具类获取当前用户信息
            String username = SpringSecurityUtils.getUserByContext().getUsername();
            String title = json.getString("title");
            String product = json.getString("product");
            String content = json.getString("content");
            WorkOrder order = new WorkOrder(username, title, content, product);
            return workOrderService.save(order);
        } catch (Exception e) {
            return RetMsg.error("增加工单失败!");
        }
    }
//获取列表
    @PostMapping(value = "list")
    public RetMsg find(@RequestBody WorkOrder entity, PageRequest pageRequest) {
        return RetMsg.success(workOrderService.getOrderList(pageRequest));
    }
//获取员工信息
    @PostMapping("workers")
    public RetMsg getWorkers() {
        return RetMsg.success(workOrderService.getWorkers());
    }
//分配
    @PostMapping("distribute")
    public RetMsg distributeWorker(@RequestBody JSONObject json) {
        String aid = json.getString("aid");
        String worker = json.getString("worker");
        return RetMsg.success(workOrderService.distributeWorker(aid, worker));
    }
//编辑工单信息
    @PostMapping("update")
    public RetMsg updateWorkOrder(@RequestBody JSONObject json) {
        String aid = json.getString("key");
        String title = json.getString("title");
        String product = json.getString("product");
        String content = json.getString("content");
        Integer result = workOrderService.updateWorkOrder(aid, title, content,product);
        return suc.equals(result) ? RetMsg.success("修改成功") : RetMsg.error("修改失败");
    }

    /**
     * restful格式请求，可以通过花括号来进行参数值的传递，根据不同的参数值做出不同的处理
     *
     * @PathVariable 可以将url花括号中的参数名称获取并映射到形参中
     * id --> workOrderId
     *
     * 这两个是同一个意思
     * @PostMapping = @RequestMapping(method = RequestMethod.POST)
     * @RequestMapping 支持这些方法 GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS, TRACE
     */
    @DeleteMapping("delete/{id}")
//    @RequestMapping(value = "delete/{id}",method = RequestMethod.DELETE)
    public RetMsg deleteWorkOrder(@PathVariable("id") String workOrderId){
        return workOrderService.delete(workOrderId);
    }
}
