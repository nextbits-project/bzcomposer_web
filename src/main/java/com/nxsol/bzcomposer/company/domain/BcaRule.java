package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaRule {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String ruleName;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer priority;

    @Column(length = 50)
    private String changeField;

    @Column(length = 50)
    private String changeTo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(final String ruleName) {
        this.ruleName = ruleName;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(final Integer priority) {
        this.priority = priority;
    }

    public String getChangeField() {
        return changeField;
    }

    public void setChangeField(final String changeField) {
        this.changeField = changeField;
    }

    public String getChangeTo() {
        return changeTo;
    }

    public void setChangeTo(final String changeTo) {
        this.changeTo = changeTo;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
