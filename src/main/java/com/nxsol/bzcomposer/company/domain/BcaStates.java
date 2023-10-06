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
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name="bca_states")
public class BcaStates {

    @Id
    @Column(name="id", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name", nullable = false, length = 30)
    private String name;

    @Column(name="StateCode", nullable = false)
    private String stateCode;

    @OneToMany(mappedBy = "state")
    private Set<BcaCities> stateBcaCitiess;

    @OneToMany(mappedBy = "customerState")
    private Set<BcaPreference> customerStateBcaPreferences;

    @OneToMany(mappedBy = "vendorState")
    private Set<BcaPreference> vendorStateBcaPreferences;

    @OneToMany(mappedBy = "employeeState")
    private Set<BcaPreference> employeeStateBcaPreferences;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country_id", nullable = false)
    private BcaCountries country;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(final String stateCode) {
        this.stateCode = stateCode;
    }

    public Set<BcaCities> getStateBcaCitiess() {
        return stateBcaCitiess;
    }

    public void setStateBcaCitiess(final Set<BcaCities> stateBcaCitiess) {
        this.stateBcaCitiess = stateBcaCitiess;
    }

    public Set<BcaPreference> getCustomerStateBcaPreferences() {
        return customerStateBcaPreferences;
    }

    public void setCustomerStateBcaPreferences(
            final Set<BcaPreference> customerStateBcaPreferences) {
        this.customerStateBcaPreferences = customerStateBcaPreferences;
    }

    public Set<BcaPreference> getVendorStateBcaPreferences() {
        return vendorStateBcaPreferences;
    }

    public void setVendorStateBcaPreferences(final Set<BcaPreference> vendorStateBcaPreferences) {
        this.vendorStateBcaPreferences = vendorStateBcaPreferences;
    }

    public Set<BcaPreference> getEmployeeStateBcaPreferences() {
        return employeeStateBcaPreferences;
    }

    public void setEmployeeStateBcaPreferences(
            final Set<BcaPreference> employeeStateBcaPreferences) {
        this.employeeStateBcaPreferences = employeeStateBcaPreferences;
    }

    public BcaCountries getCountry() {
        return country;
    }

    public void setCountry(final BcaCountries country) {
        this.country = country;
    }

}
