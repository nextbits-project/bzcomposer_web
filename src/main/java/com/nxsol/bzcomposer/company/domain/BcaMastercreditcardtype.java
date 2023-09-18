package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaMastercreditcardtype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cctypeId;

    @Column(length = 50)
    private String name;

    public Integer getCctypeId() {
        return cctypeId;
    }

    public void setCctypeId(final Integer cctypeId) {
        this.cctypeId = cctypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

}
