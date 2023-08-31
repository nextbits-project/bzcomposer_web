package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaAtt1 {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer att1Id;

    @Column(length = 50)
    private String att1Name;

    @Column(length = 50)
    private String att1Nickname;

    public Integer getAtt1Id() {
        return att1Id;
    }

    public void setAtt1Id(final Integer att1Id) {
        this.att1Id = att1Id;
    }

    public String getAtt1Name() {
        return att1Name;
    }

    public void setAtt1Name(final String att1Name) {
        this.att1Name = att1Name;
    }

    public String getAtt1Nickname() {
        return att1Nickname;
    }

    public void setAtt1Nickname(final String att1Nickname) {
        this.att1Nickname = att1Nickname;
    }

}
