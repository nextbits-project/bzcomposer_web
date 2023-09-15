package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaClientvendorcontacthistory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private OffsetDateTime callDate;

    @Column
    private String comment;

    @Column
    private OffsetDateTime mailDate;

    @Column(length = 50)
    private String mailContent;

    @Column(length = 50)
    private String contactBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public OffsetDateTime getCallDate() {
        return callDate;
    }

    public void setCallDate(final OffsetDateTime callDate) {
        this.callDate = callDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(final String comment) {
        this.comment = comment;
    }

    public OffsetDateTime getMailDate() {
        return mailDate;
    }

    public void setMailDate(final OffsetDateTime mailDate) {
        this.mailDate = mailDate;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(final String mailContent) {
        this.mailContent = mailContent;
    }

    public String getContactBy() {
        return contactBy;
    }

    public void setContactBy(final String contactBy) {
        this.contactBy = contactBy;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
