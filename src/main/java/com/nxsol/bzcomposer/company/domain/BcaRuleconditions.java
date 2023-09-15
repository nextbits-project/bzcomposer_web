package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaRuleconditions {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String ruleName;

    @Column(length = 25)
    private String conditionField;

    @Column(length = 25)
    private String operatorName;

    @Column(length = 25)
    private String operatorValue;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(final String ruleName) {
        this.ruleName = ruleName;
    }

    public String getConditionField() {
        return conditionField;
    }

    public void setConditionField(final String conditionField) {
        this.conditionField = conditionField;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(final String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperatorValue() {
        return operatorValue;
    }

    public void setOperatorValue(final String operatorValue) {
        this.operatorValue = operatorValue;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
