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
import java.util.Set;


@Entity
public class BcaStates {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 30)
    private String name;

    @Column(nullable = false)
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
