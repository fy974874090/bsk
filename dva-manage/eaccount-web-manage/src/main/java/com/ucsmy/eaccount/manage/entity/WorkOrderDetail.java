package com.ucsmy.eaccount.manage.entity;

import com.ucsmy.core.bean.BaseNode;
import lombok.Data;

@Data
public class WorkOrderDetail extends BaseNode {
    private String operator;// 消费者账户ID
    private Long orderId;// 自增主键
    private String status;// 数据状态，A正常D删除S停用T其他
    private Long aid;// 自增主键
    private String dealAnswer;// 处理进度明细
    private java.util.Date createTime;// 创建时间
    private String dealType;// 处理进度类型，U更新 A回复 C完成 
}