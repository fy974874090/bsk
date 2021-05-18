package com.ucsmy.eaccount.manage.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ucsmy.core.bean.BaseNode;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import java.util.List;

/**
 * @author
 */
public class ManageRole extends BaseNode {
    /**
     * 名称
     */
    @NotEmpty(message = "名称不能为空") //不能为null或者长度为0的(String Collection Map的isEmpty()方法)
    @Length(max = 36, message = "名称最大长度为36")
    private String name;
    /**
     * 描述
     */
    @Length(max = 255, message = "描述最大长度为255")
    private String description;

    @Range(min = 0, max = 2)
    private Integer level;

    @JsonInclude(JsonInclude.Include.NON_NULL)//在实体类序列化成json的时候在某些策略下，加了该注解的字段不去序列化该字段
    private List<ManageMenu> menus;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public List<ManageMenu> getMenus() {
        return menus;
    }

    public void setMenus(List<ManageMenu> menus) {
        this.menus = menus;
    }
}