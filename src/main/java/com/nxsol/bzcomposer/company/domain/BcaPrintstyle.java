package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaPrintstyle {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer styleTypeId;

    @Column(length = 50)
    private String name;

    public Integer getStyleTypeId() {
        return styleTypeId;
    }

    public void setStyleTypeId(final Integer styleTypeId) {
        this.styleTypeId = styleTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

}
