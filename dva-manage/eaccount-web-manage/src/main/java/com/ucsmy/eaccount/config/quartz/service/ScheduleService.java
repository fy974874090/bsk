package com.ucsmy.eaccount.config.quartz.service;

import org.quartz.Scheduler;

/**
 * quartz service
 */
public interface ScheduleService {
    /**
     * 执行定时调用
     */
    void proceedSchedule();

    void setScheduler(Scheduler scheduler);

}
