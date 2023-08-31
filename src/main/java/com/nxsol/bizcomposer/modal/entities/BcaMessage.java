package com.nxsol.bizcomposer.modal.entities;

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
    private Set<BcaInvoicememorized> messageBcaInvoicememorizeds;

    @OneToMany(mappedBy = "message")
    private Set<BcaInvoiceshipped> messageBcaInvoiceshippeds;

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

    public Set<BcaInvoicememorized> getMessageBcaInvoicememorizeds() {
        return messageBcaInvoicememorizeds;
    }

    public void setMessageBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> messageBcaInvoicememorizeds) {
        this.messageBcaInvoicememorizeds = messageBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getMessageBcaInvoiceshippeds() {
        return messageBcaInvoiceshippeds;
    }

    public void setMessageBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> messageBcaInvoiceshippeds) {
        this.messageBcaInvoiceshippeds = messageBcaInvoiceshippeds;
    }

}
