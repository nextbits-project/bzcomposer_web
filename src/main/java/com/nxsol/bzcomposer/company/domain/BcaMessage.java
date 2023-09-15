package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaMessage {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer messageId;

    @Column
    private Integer companyId;

    @Column
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "message")
    private Set<BcaInvoice> messageBcaInvoices;

    @OneToMany(mappedBy = "message")
    private Set<BcaInvoicememorized> messageBcaInvoicememorizeds;

    @OneToMany(mappedBy = "message")
    private Set<StorageInvoice> messageStorageInvoices;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(final Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaInvoice> getMessageBcaInvoices() {
        return messageBcaInvoices;
    }

    public void setMessageBcaInvoices(final Set<BcaInvoice> messageBcaInvoices) {
        this.messageBcaInvoices = messageBcaInvoices;
    }

    public Set<BcaInvoicememorized> getMessageBcaInvoicememorizeds() {
        return messageBcaInvoicememorizeds;
    }

    public void setMessageBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> messageBcaInvoicememorizeds) {
        this.messageBcaInvoicememorizeds = messageBcaInvoicememorizeds;
    }

    public Set<StorageInvoice> getMessageStorageInvoices() {
        return messageStorageInvoices;
    }

    public void setMessageStorageInvoices(final Set<StorageInvoice> messageStorageInvoices) {
        this.messageStorageInvoices = messageStorageInvoices;
    }

}
