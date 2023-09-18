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


@Entity
public class BizcalAppoint {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer mAlarm;

    @Column
    private Integer mColorRgb;

    @Column
    private Integer mLength;

    @Column(length = 100)
    private String mText;

    @Column
    private OffsetDateTime mDate;

    @Column
    private Integer mW;

    @Column
    private Integer mH;

    @Column
    private Integer mX;

    @Column
    private Integer mY;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getMAlarm() {
        return mAlarm;
    }

    public void setMAlarm(final Integer mAlarm) {
        this.mAlarm = mAlarm;
    }

    public Integer getMColorRgb() {
        return mColorRgb;
    }

    public void setMColorRgb(final Integer mColorRgb) {
        this.mColorRgb = mColorRgb;
    }

    public Integer getMLength() {
        return mLength;
    }

    public void setMLength(final Integer mLength) {
        this.mLength = mLength;
    }

    public String getMText() {
        return mText;
    }

    public void setMText(final String mText) {
        this.mText = mText;
    }

    public OffsetDateTime getMDate() {
        return mDate;
    }

    public void setMDate(final OffsetDateTime mDate) {
        this.mDate = mDate;
    }

    public Integer getMW() {
        return mW;
    }

    public void setMW(final Integer mW) {
        this.mW = mW;
    }

    public Integer getMH() {
        return mH;
    }

    public void setMH(final Integer mH) {
        this.mH = mH;
    }

    public Integer getMX() {
        return mX;
    }

    public void setMX(final Integer mX) {
        this.mX = mX;
    }

    public Integer getMY() {
        return mY;
    }

    public void setMY(final Integer mY) {
        this.mY = mY;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
