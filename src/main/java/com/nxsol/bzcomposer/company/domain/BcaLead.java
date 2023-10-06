package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bca_label")
public class BcaLead {

    @Id
    @Column(name= "LeadID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadId;

    @Column(name= "AgentID")
    private Integer agentId;

    @Column(name= "Status")
    private String status;

    @Column(name= "Position")
    private String position;

    @Column(name= "WebSite")
    private String webSite;

    @Column(name= "LeadValue")
    private Double leadValue;

    @Column(name= "isPublic")
    private Integer isPublic;

    @Column(name= "isContactToday")
    private Integer isContactToday;

    @Column(name= "contactDate")
    private OffsetDateTime contactDate;

    @Column(name= "isAllowFollowUp")
    private Integer isAllowFollowUp;

    @Column(name= "OfficePhone")
    private String officePhone;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LeadSourceID")
    private BcaLeadSource leadSource;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LeadCategoryID")
    private BcaLeadCategory leadCategory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesRepID")
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
