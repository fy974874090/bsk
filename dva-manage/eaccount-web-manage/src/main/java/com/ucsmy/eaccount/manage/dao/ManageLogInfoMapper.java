package com.ucsmy.eaccount.manage.dao;

import com.ucsmy.core.bean.ManageLogInfo;
import org.springframework.stereotype.Repository;

/**
 *
 *
 */
@Repository
public interface ManageLogInfoMapper {

    /**
     * 添加logInfo
     * @param manageLogInfo
     * @return
     */
    int addManageLogInfo(ManageLogInfo manageLogInfo);
}
