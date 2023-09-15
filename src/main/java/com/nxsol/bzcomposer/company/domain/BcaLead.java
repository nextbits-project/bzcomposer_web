package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaLead {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadId;

    @Column
    private Integer agentId;

    @Column
    private String status;

    @Column
    private String position;

    @Column
    private String webSite;

    @Column
    private Double leadValue;

    @Column
    private Integer isPublic;

    @Column
    private Integer isContactToday;

    @Column
    private OffsetDateTime contactDate;

    @Column
    private Integer isAllowFollowUp;

    @Column
    private String officePhone;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lead_source_id")
    private BcaLeadSource leadSource;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lead_category_id")
    private BcaLeadCategory leadCategory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_rep_id")
    private BcaSalesrep salesRep;

    @OneToMany(mappedBy = "lead")
    private Set<BcaLeadProducts> leadBcaLeadProductss;

    public Integer getLeadId() {
        return leadId;
    }

    public void setLeadId(final Integer leadId) {
        this.leadId = leadId;
    }

    public Integer getAgentId() {
        return agentId;
    }

    public void setAgentId(final Integer agentId) {
        this.agentId = agentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(final String position) {
        this.position = position;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(final String webSite) {
        this.webSite = webSite;
    }

    public Double getLeadValue() {
        return leadValue;
    }

    public void setLeadValue(final Double leadValue) {
        this.leadValue = leadValue;
    }

    public Integer getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(final Integer isPublic) {
        this.isPublic = isPublic;
    }

    public Integer getIsContactToday() {
        return isContactToday;
    }

    public void setIsContactToday(final Integer isContactToday) {
        this.isContactToday = isContactToday;
    }

    public OffsetDateTime getContactDate() {
        return contactDate;
    }

    public void setContactDate(final OffsetDateTime contactDate) {
        this.contactDate = contactDate;
    }

    public Integer getIsAllowFollowUp() {
        return isAllowFollowUp;
    }

    public void setIsAllowFollowUp(final Integer isAllowFollowUp) {
        this.isAllowFollowUp = isAllowFollowUp;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(final String officePhone) {
        this.officePhone = officePhone;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaLeadSource getLeadSource() {
        return leadSource;
    }

    public void setLeadSource(final BcaLeadSource leadSource) {
        this.leadSource = leadSource;
    }

    public BcaLeadCategory getLeadCategory() {
        return leadCategory;
    }

    public void setLeadCategory(final BcaLeadCategory leadCategory) {
        this.leadCategory = leadCategory;
    }

    public BcaSalesrep getSalesRep() {
        return salesRep;
    }

    public void setSalesRep(final BcaSalesrep salesRep) {
        this.salesRep = salesRep;
    }

    public Set<BcaLeadProducts> getLeadBcaLeadProductss() {
        return leadBcaLeadProductss;
    }

    public void setLeadBcaLeadProductss(final Set<BcaLeadProducts> leadBcaLeadProductss) {
        this.leadBcaLeadProductss = leadBcaLeadProductss;
    }

}
