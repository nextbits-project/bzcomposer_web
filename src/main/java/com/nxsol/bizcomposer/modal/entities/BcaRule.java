package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BcaRule {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String ruleName;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer companyId;

    @Column
    private Integer priority;

    @Column(length = 50)
    private String changeField;

    @Column(length = 50)
    private String changeTo;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

}
