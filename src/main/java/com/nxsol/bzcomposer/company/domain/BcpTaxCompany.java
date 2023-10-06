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
@Table(name= "bcp_tax_company")
public class BcpTaxCompany {

    @Id
    @Column(name= "DeductionID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer deductionId;

    @Column(name= "Daily")
    private Boolean daily;

    @Column(name= "Weekly")
    private Boolean weekly;

    @Column(name= "BiWeekly")
    private Boolean biWeekly;

    @Column(name= "SemiMonthly")
    private Boolean semiMonthly;

    @Column(name= "Monthly")
    private Boolean monthly;

    @Column(name= "Quarterly")
    private Boolean quarterly;

    @Column(name= "SemiAnnually")
    private Boolean semiAnnually;

    @Column(name= "Annually")
    private Boolean annually;

    @Column(name= "UsePayrollDayWeek")
    private Boolean usePayrollDayWeek;

    @Column(name= "PayrollDayWeek")
    private Integer payrollDayWeek;

    @Column(name= "UsePayrollDayMonth")
    private Boolean usePayrollDayMonth;

    @Column(name= "PayrollDayMonth")
    private Integer payrollDayMonth;

    @Column(name= "UseOvertimeDailyHour")
    private Boolean useOvertimeDailyHour;

    @Column(name= "OvertimeDailyHour")
    private Integer overtimeDailyHour;

    @Column(name= "UseOvertimeWeeklyHour")
    private Boolean useOvertimeWeeklyHour;

    @Column(name= "OvertimeWeeklyHour")
    private Integer overtimeWeeklyHour;

    @Column(name= "OvertimeRate")
    private Integer overtimeRate;

    @Column(name= "UseSaturdayRate")
    private Boolean useSaturdayRate;

    @Column(name= "SaturdayRate")
    private Integer saturdayRate;

    @Column(name= "UseSundayRate")
    private Boolean useSundayRate;

    @Column(name= "SundayRate")
    private Integer sundayRate;

    @Column(name= "UseHolidayRate")
    private Boolean useHolidayRate;

    @Column(name= "HolidayRate")
    private Integer holidayRate;

    @Column(name= "StartingDate")
    private OffsetDateTime startingDate;

    @Column(name= "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "Active")
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID", nullable = false)
    private BcaCompany company;

    public Integer getDeductionId() {
        return deductionId;
    }

    public void setDeductionId(final Integer deductionId) {
        this.deductionId = deductionId;
    }

    public Boolean getDaily() {
        return daily;
    }

    public void setDaily(final Boolean daily) {
        this.daily = daily;
    }

    public Boolean getWeekly() {
        return weekly;
    }

    public void setWeekly(final Boolean weekly) {
        this.weekly = weekly;
    }

    public Boolean getBiWeekly() {
        return biWeekly;
    }

    public void setBiWeekly(final Boolean biWeekly) {
        this.biWeekly = biWeekly;
    }

    public Boolean getSemiMonthly() {
        return semiMonthly;
    }

    public void setSemiMonthly(final Boolean semiMonthly) {
        this.semiMonthly = semiMonthly;
    }

    public Boolean getMonthly() {
        return monthly;
    }

    public void setMonthly(final Boolean monthly) {
        this.monthly = monthly;
    }

    public Boolean getQuarterly() {
        return quarterly;
    }

    public void setQuarterly(final Boolean quarterly) {
        this.quarterly = quarterly;
    }

    public Boolean getSemiAnnually() {
        return semiAnnually;
    }

    public void setSemiAnnually(final Boolean semiAnnually) {
        this.semiAnnually = semiAnnually;
    }

    public Boolean getAnnually() {
        return annually;
    }

    public void setAnnually(final Boolean annually) {
        this.annually = annually;
    }

    public Boolean getUsePayrollDayWeek() {
        return usePayrollDayWeek;
    }

    public void setUsePayrollDayWeek(final Boolean usePayrollDayWeek) {
        this.usePayrollDayWeek = usePayrollDayWeek;
    }

    public Integer getPayrollDayWeek() {
        return payrollDayWeek;
    }

    public void setPayrollDayWeek(final Integer payrollDayWeek) {
        this.payrollDayWeek = payrollDayWeek;
    }

    public Boolean getUsePayrollDayMonth() {
        return usePayrollDayMonth;
    }

    public void setUsePayrollDayMonth(final Boolean usePayrollDayMonth) {
        this.usePayrollDayMonth = usePayrollDayMonth;
    }

    public Integer getPayrollDayMonth() {
        return payrollDayMonth;
    }

    public void setPayrollDayMonth(final Integer payrollDayMonth) {
        this.payrollDayMonth = payrollDayMonth;
    }

    public Boolean getUseOvertimeDailyHour() {
        return useOvertimeDailyHour;
    }

    public void setUseOvertimeDailyHour(final Boolean useOvertimeDailyHour) {
        this.useOvertimeDailyHour = useOvertimeDailyHour;
    }

    public Integer getOvertimeDailyHour() {
        return overtimeDailyHour;
    }

    public void setOvertimeDailyHour(final Integer overtimeDailyHour) {
        this.overtimeDailyHour = overtimeDailyHour;
    }

    public Boolean getUseOvertimeWeeklyHour() {
        return useOvertimeWeeklyHour;
    }

    public void setUseOvertimeWeeklyHour(final Boolean useOvertimeWeeklyHour) {
        this.useOvertimeWeeklyHour = useOvertimeWeeklyHour;
    }

    public Integer getOvertimeWeeklyHour() {
        return overtimeWeeklyHour;
    }

    public void setOvertimeWeeklyHour(final Integer overtimeWeeklyHour) {
        this.overtimeWeeklyHour = overtimeWeeklyHour;
    }

    public Integer getOvertimeRate() {
        return overtimeRate;
    }

    public void setOvertimeRate(final Integer overtimeRate) {
        this.overtimeRate = overtimeRate;
    }

    public Boolean getUseSaturdayRate() {
        return useSaturdayRate;
    }

    public void setUseSaturdayRate(final Boolean useSaturdayRate) {
        this.useSaturdayRate = useSaturdayRate;
    }

    public Integer getSaturdayRate() {
        return saturdayRate;
    }

    public void setSaturdayRate(final Integer saturdayRate) {
        this.saturdayRate = saturdayRate;
    }

    public Boolean getUseSundayRate() {
        return useSundayRate;
    }

    public void setUseSundayRate(final Boolean useSundayRate) {
        this.useSundayRate = useSundayRate;
    }

    public Integer getSundayRate() {
        return sundayRate;
    }

    public void setSundayRate(final Integer sundayRate) {
        this.sundayRate = sundayRate;
    }

    public Boolean getUseHolidayRate() {
        return useHolidayRate;
    }

    public void setUseHolidayRate(final Boolean useHolidayRate) {
        this.useHolidayRate = useHolidayRate;
    }

    public Integer getHolidayRate() {
        return holidayRate;
    }

    public void setHolidayRate(final Integer holidayRate) {
        this.holidayRate = holidayRate;
    }

    public OffsetDateTime getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(final OffsetDateTime startingDate) {
        this.startingDate = startingDate;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
