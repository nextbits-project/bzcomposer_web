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
import javax.persistence.Table;

@Entity
@Table(name= "bca_clientvendorcontacthistory")
public class BcaClientvendorcontacthistory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "CallDate")
    private OffsetDateTime callDate;

    @Column(name = "Comment")
    private String comment;

    @Column(name = "MailDate")
    private OffsetDateTime mailDate;

    @Column(name = "MailContent", length = 50)
    private String mailContent;

    @Column(name = "ContactBy", length = 50)
    private String contactBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
