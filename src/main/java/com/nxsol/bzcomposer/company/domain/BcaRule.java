package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name="bca_rule")
public class BcaRule {

    @Id
    @Column(name="RuleName", nullable = false, updatable = false, length = 50)
    private String ruleName;

    @Column(name="DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name="Priority")
    private Integer priority;

    @Column(name="ChangeField", length = 50)
    private String changeField;

    @Column(name="ChangeTo", length = 50)
    private String changeTo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
