package com.ucsmy.eaccount.manage.service;

import com.ucsmy.core.service.BasicService;
import com.ucsmy.eaccount.manage.entity.ManageIpScheduleTask;
import com.ucsmy.core.vo.RetMsg;

/**
 * 废弃
 */

public interface ManageScheduleTaskService extends BasicService<ManageIpScheduleTask> {

    /**
     * 启动/停用定时任务
     *
     * @param id 任务id
     * @return
     */
    RetMsg updateStatus(String id);
}
