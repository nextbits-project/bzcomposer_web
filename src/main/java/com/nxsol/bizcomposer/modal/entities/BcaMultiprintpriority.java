package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;


@Entity
public class BcaMultiprintpriority {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String sortBy;

    @Column
    private Integer active;

    @Column
    private Integer iseSales;

    @Column
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
