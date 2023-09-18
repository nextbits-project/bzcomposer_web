package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class SmdShipdetails {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String shippType;

    @Column(length = 200)
    private String field1;

    @Column(length = 200)
    private String field2;

    @Column(length = 200)
    private String field3;

    @Column(length = 200)
    private String field4;

    @Column(length = 200)
    private String field5;

    @Column
    private Boolean active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public String getShippType() {
        return shippType;
    }

    public void setShippType(final String shippType) {
        this.shippType = shippType;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(final String field1) {
        this.field1 = field1;
    }

    public String getField2() {
        return field2;
    }

    public void setField2(final String field2) {
        this.field2 = field2;
    }

    public String getField3() {
        return field3;
    }

    public void setField3(final String field3) {
        this.field3 = field3;
    }

    public String getField4() {
        return field4;
    }

    public void setField4(final String field4) {
        this.field4 = field4;
    }

    public String getField5() {
        return field5;
    }

    public void setField5(final String field5) {
        this.field5 = field5;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(final Boolean active) {
        this.active = active;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
