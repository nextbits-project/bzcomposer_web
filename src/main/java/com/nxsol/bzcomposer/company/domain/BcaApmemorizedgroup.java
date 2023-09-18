package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaApmemorizedgroup {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer groupId;

    @Column(nullable = false, length = 50)
    private String groupName;

    @Column
    private Integer dueDay;

    @Column
    private OffsetDateTime addedDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(final Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(final String groupName) {
        this.groupName = groupName;
    }

    public Integer getDueDay() {
        return dueDay;
    }

    public void setDueDay(final Integer dueDay) {
        this.dueDay = dueDay;
    }

    public OffsetDateTime getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(final OffsetDateTime addedDate) {
        this.addedDate = addedDate;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
