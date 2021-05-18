package com.ucsmy.eaccount.manage.dao;

import com.ucsmy.core.dao.BasicDao;
import com.ucsmy.eaccount.manage.entity.ManageUserAccount;
import com.ucsmy.eaccount.manage.entity.SelectOption;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.xml.soap.Node;
import java.util.List;

@Repository
public interface ManageUserAccountDao extends BasicDao<ManageUserAccount> {

    int updatePassword(ManageUserAccount account);

    int updateStatus(@Param("id") String id);

    ManageUserAccount findByUserName(@Param("userName") String userName);

    /**
     * 获取所有的员工
     *
     * @return 所有员工的集合
     */
    List<SelectOption> getWorkers();

    /**
     * 通过用户名获取用户权限
     * @param username 用户名
     * @return
     */
    Integer getRoleLevelByUsername(@Param("username") String username);
}
