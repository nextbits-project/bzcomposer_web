package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_multiprintpriority")
public class BcaMultiprintpriority {

    @Id
    @Column(name= "SortBy", nullable = false, updatable = false, length = 50)
    private String sortBy;

    @Column(name= "Active")
    private Integer active;

    @Column(name= "IseSales")
    private Integer iseSales;

    @Column(name= "Priority")
    private Integer priority;

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(final String sortBy) {
        this.sortBy = sortBy;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getIseSales() {
        return iseSales;
    }

    public void setIseSales(final Integer iseSales) {
        this.iseSales = iseSales;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(final Integer priority) {
        this.priority = priority;
    }

}
