package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaMastershippingmailtype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer mailTypeId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "mailType")
    private Set<BcaShippingservice> mailTypeBcaShippingservices;

    public Integer getMailTypeId() {
        return mailTypeId;
    }

    public void setMailTypeId(final Integer mailTypeId) {
        this.mailTypeId = mailTypeId;
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

    public Set<BcaShippingservice> getMailTypeBcaShippingservices() {
        return mailTypeBcaShippingservices;
    }

    public void setMailTypeBcaShippingservices(
            final Set<BcaShippingservice> mailTypeBcaShippingservices) {
        this.mailTypeBcaShippingservices = mailTypeBcaShippingservices;
    }

}
