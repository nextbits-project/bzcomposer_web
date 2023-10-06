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
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_employee")
public class BcpEmployee {

    @Id
    @Column(name= "EmployeeIndexID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer employeeIndexId;

    @Column(name= "EmployeeID")
    private Integer employeeId;

    @Column(name= "FirstName", length = 50)
    private String firstName;

    @Column(name= "LastName", length = 50)
    private String lastName;

    @Column(name= "NickName", length = 50)
    private String nickName;

    @Column(name= "SSN", length = 50)
    private String ssn;

    @Column(name= "Address1")
    private String address1;

    @Column(name= "Address2")
    private String address2;

    @Column(name= "City")
    private String city;

    @Column(name= "State", length = 50)
    private String state;

    @Column(name= "Province", length = 50)
    private String province;

    @Column(name= "Country", length = 50)
    private String country;

    @Column(name= "ZipCode", length = 50)
    private String zipCode;

    @Column(name= "Phone", length = 50)
    private String phone;

    @Column(name= "CellPhone", length = 50)
    private String cellPhone;

    @Column(name= "Email", length = 50)
    private String email;

    @Column(name= "EmployeeTitleID")
    private Integer employeeTitleId;

    @Column(name = "Amount", precision = 23, scale = 4)
    private BigDecimal amount;

    @Column(name= "Allowance")
    private Integer allowance;

    @Column(name= "TaxState", length = 50)
    private String taxState;

    @Column(name= "DateofBirth")
    private OffsetDateTime dateofBirth;

    @Column(name= "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "DateStarted")
    private OffsetDateTime dateStarted;

    @Column(name= "DateTerminated")
    private OffsetDateTime dateTerminated;

    @Column(name= "Detail", columnDefinition = "longtext")
    private String detail;

    @Column(name= "Status", length = 5)
    private String status;

    @Column(name= "Active")
    private Integer active;

    @Column(name= "Hourly")
    private Boolean hourly;

    @Column(name= "Daily")
    private Boolean daily;

    @Column(name= "Salary")
    private Boolean salary;

    @Column(name= "UseJobCode")
    private Boolean useJobCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeTypeID")
    private BcpEmployeetype employeeType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "FilingStatusID")
    private BcpFilingstatus filingStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "JobTitleID")
    private BcpJobtitle jobTitle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PayrollPeriodID")
    private BcpPayrollperiod payrollPeriod;

    @OneToMany(mappedBy = "employee")
    private Set<BcpIncome> employeeBcpIncomes;

    @OneToMany(mappedBy = "employee")
    private Set<StorageInvoice> employeeStorageInvoices;

    public Integer getEmployeeIndexId() {
        return employeeIndexId;
    }

    public void setEmployeeIndexId(final Integer employeeIndexId) {
        this.employeeIndexId = employeeIndexId;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(final Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(final String nickName) {
        this.nickName = nickName;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(final String ssn) {
        this.ssn = ssn;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(final String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(final String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(final String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(final String state) {
        this.state = state;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(final String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(final String country) {
        this.country = country;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(final String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public Integer getEmployeeTitleId() {
        return employeeTitleId;
    }

    public void setEmployeeTitleId(final Integer employeeTitleId) {
        this.employeeTitleId = employeeTitleId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(final BigDecimal amount) {
        this.amount = amount;
    }

    public Integer getAllowance() {
        return allowance;
    }

    public void setAllowance(final Integer allowance) {
        this.allowance = allowance;
    }

    public String getTaxState() {
        return taxState;
    }

    public void setTaxState(final String taxState) {
        this.taxState = taxState;
    }

    public OffsetDateTime getDateofBirth() {
        return dateofBirth;
    }

    public void setDateofBirth(final OffsetDateTime dateofBirth) {
        this.dateofBirth = dateofBirth;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public OffsetDateTime getDateStarted() {
        return dateStarted;
    }

    public void setDateStarted(final OffsetDateTime dateStarted) {
        this.dateStarted = dateStarted;
    }

    public OffsetDateTime getDateTerminated() {
        return dateTerminated;
    }

    public void setDateTerminated(final OffsetDateTime dateTerminated) {
        this.dateTerminated = dateTerminated;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(final String detail) {
        this.detail = detail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Boolean getHourly() {
        return hourly;
    }

    public void setHourly(final Boolean hourly) {
        this.hourly = hourly;
    }

    public Boolean getDaily() {
        return daily;
    }

    public void setDaily(final Boolean daily) {
        this.daily = daily;
    }

    public Boolean getSalary() {
        return salary;
    }

    public void setSalary(final Boolean salary) {
        this.salary = salary;
    }

    public Boolean getUseJobCode() {
        return useJobCode;
    }

    public void setUseJobCode(final Boolean useJobCode) {
        this.useJobCode = useJobCode;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcpEmployeetype getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(final BcpEmployeetype employeeType) {
        this.employeeType = employeeType;
    }

    public BcpFilingstatus getFilingStatus() {
        return filingStatus;
    }

    public void setFilingStatus(final BcpFilingstatus filingStatus) {
        this.filingStatus = filingStatus;
    }

    public BcpJobtitle getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(final BcpJobtitle jobTitle) {
        this.jobTitle = jobTitle;
    }

    public BcpPayrollperiod getPayrollPeriod() {
        return payrollPeriod;
    }

    public void setPayrollPeriod(final BcpPayrollperiod payrollPeriod) {
        this.payrollPeriod = payrollPeriod;
    }

    public Set<BcpIncome> getEmployeeBcpIncomes() {
        return employeeBcpIncomes;
    }

    public void setEmployeeBcpIncomes(final Set<BcpIncome> employeeBcpIncomes) {
        this.employeeBcpIncomes = employeeBcpIncomes;
    }

    public Set<StorageInvoice> getEmployeeStorageInvoices() {
        return employeeStorageInvoices;
    }

    public void setEmployeeStorageInvoices(final Set<StorageInvoice> employeeStorageInvoices) {
        this.employeeStorageInvoices = employeeStorageInvoices;
    }

}
