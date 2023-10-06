package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bca_countries")
public class BcaCountries {

    @Id
    @Column(name= "id", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "sortname", nullable = false, length = 3)
    private String sortname;

    @Column(name= "name", nullable = false, length = 150)
    private String name;

    @Column(name= "phonecode", nullable = false)
    private Integer phonecode;

    @OneToMany(mappedBy = "customerCountry")
    private Set<BcaPreference> customerCountryBcaPreferences;

    @OneToMany(mappedBy = "vendorCountry")
    private Set<BcaPreference> vendorCountryBcaPreferences;

    @OneToMany(mappedBy = "employeeCountry")
    private Set<BcaPreference> employeeCountryBcaPreferences;

    @OneToMany(mappedBy = "country")
    private Set<BcaStates> countryBcaStatess;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getSortname() {
        return sortname;
    }

    public void setSortname(final String sortname) {
        this.sortname = sortname;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getPhonecode() {
        return phonecode;
    }

    public void setPhonecode(final Integer phonecode) {
        this.phonecode = phonecode;
    }

    public Set<BcaPreference> getCustomerCountryBcaPreferences() {
        return customerCountryBcaPreferences;
    }

    public void setCustomerCountryBcaPreferences(
            final Set<BcaPreference> customerCountryBcaPreferences) {
        this.customerCountryBcaPreferences = customerCountryBcaPreferences;
    }

    public Set<BcaPreference> getVendorCountryBcaPreferences() {
        return vendorCountryBcaPreferences;
    }

    public void setVendorCountryBcaPreferences(
            final Set<BcaPreference> vendorCountryBcaPreferences) {
        this.vendorCountryBcaPreferences = vendorCountryBcaPreferences;
    }

    public Set<BcaPreference> getEmployeeCountryBcaPreferences() {
        return employeeCountryBcaPreferences;
    }

    public void setEmployeeCountryBcaPreferences(
            final Set<BcaPreference> employeeCountryBcaPreferences) {
        this.employeeCountryBcaPreferences = employeeCountryBcaPreferences;
    }

    public Set<BcaStates> getCountryBcaStatess() {
        return countryBcaStatess;
    }

    public void setCountryBcaStatess(final Set<BcaStates> countryBcaStatess) {
        this.countryBcaStatess = countryBcaStatess;
    }

}
