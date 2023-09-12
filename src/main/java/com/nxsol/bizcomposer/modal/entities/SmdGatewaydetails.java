package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class SmdGatewaydetails {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer gatewayId;

    @Column
    private Integer companyId;

    @Column(length = 50)
    private String gatewayType;

    @Column(length = 50)
    private String field1;

    @Column(length = 150)
    private String field2;

    @Column(length = 50)
    private String field3;

    @Column(length = 75)
    private String field4;

    @Column(length = 50)
    private String field5;

    @Column(length = 50)
    private String field6;

    @Column(length = 50)
    private String field7;

    @Column(length = 50)
    private String field8;

    @Column(length = 50)
    private String field9;

    @Column(length = 50)
    private String field10;

    @Column
    private Boolean isDefault;

    @Column
    private Boolean testEnv;

    public Integer getGatewayId() {
        return gatewayId;
    }

    public void setGatewayId(final Integer gatewayId) {
        this.gatewayId = gatewayId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getGatewayType() {
        return gatewayType;
    }

    public void setGatewayType(final String gatewayType) {
        this.gatewayType = gatewayType;
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

    public String getField6() {
        return field6;
    }

    public void setField6(final String field6) {
        this.field6 = field6;
    }

    public String getField7() {
        return field7;
    }

    public void setField7(final String field7) {
        this.field7 = field7;
    }

    public String getField8() {
        return field8;
    }

    public void setField8(final String field8) {
        this.field8 = field8;
    }

    public String getField9() {
        return field9;
    }

    public void setField9(final String field9) {
        this.field9 = field9;
    }

    public String getField10() {
        return field10;
    }

    public void setField10(final String field10) {
        this.field10 = field10;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Boolean isDefault) {
        this.isDefault = isDefault;
    }

    public Boolean getTestEnv() {
        return testEnv;
    }

    public void setTestEnv(final Boolean testEnv) {
        this.testEnv = testEnv;
    }

}
