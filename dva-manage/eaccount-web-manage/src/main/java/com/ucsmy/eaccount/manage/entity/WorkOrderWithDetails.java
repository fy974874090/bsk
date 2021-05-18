package com.ucsmy.eaccount.manage.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author : Hu xinyao
 * @date : 2021/4/26
 */
@Data
public class WorkOrderWithDetails {

    private String aid;

    private String title;

    private String content;

    private String consumer;

    private String worker;

    private Date createTime;

    private List<WorkOrderDetail> details;
}
