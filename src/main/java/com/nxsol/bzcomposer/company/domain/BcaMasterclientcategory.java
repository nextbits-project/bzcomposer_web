package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_masterclientcategory")
public class BcaMasterclientcategory {

    @Id
    @Column(name= "CVCategoryID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cvcategoryId;

    @Column(name= "Name", length = 50)
    private String name;

    public Integer getCvcategoryId() {
        return cvcategoryId;
    }

    public void setCvcategoryId(final Integer cvcategoryId) {
        this.cvcategoryId = cvcategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

}
