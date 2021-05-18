package com.ucsmy.eaccount.manage.entity;

import com.ucsmy.core.bean.BaseNode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkOrder extends BaseNode {

    public WorkOrder(String consumer, String title, String content,String product) {
        this.consumer = consumer;
        this.title = title;
        this.content = content;
        this.product = product;
    }

    private String consumer;// 消费者账户ID
    private Integer state;// 申请状态，0待分配，1正在处理，2已结束
    private String worker;// 员工账户ID
    private String status;// 数据状态，A正常D删除S停用T其他
    private String title;
    private String content;
    private String product;
    private java.util.Date updateTime;// 更新时间
    private java.util.Date createTime;// 创建时间
    private Long aid;// 自增主键
}