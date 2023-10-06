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
@Table(name= "bizcal_appoint")
public class BizcalAppoint {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "m_alarm")
    private Integer mAlarm;

    @Column(name= "m_color_rgb")
    private Integer mColorRgb;

    @Column(name= "m_length")
    private Integer mLength;

    @Column(name= "m_text", length = 100)
    private String mText;

    @Column(name= "m_date")
    private OffsetDateTime mDate;

    @Column(name= "m_w")
    private Integer mW;

    @Column(name= "m_h")
    private Integer mH;

    @Column(name= "m_x")
    private Integer mX;

    @Column(name= "m_y")
    private Integer mY;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
