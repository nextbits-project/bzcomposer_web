package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaAtt2 {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer att2Id;

    @Column(length = 50)
    private String att2Name;

    @Column(length = 50)
    private String att2Nickname;

    public Integer getAtt2Id() {
        return att2Id;
    }

    public void setAtt2Id(final Integer att2Id) {
        this.att2Id = att2Id;
    }

    public String getAtt2Name() {
        return att2Name;
    }

    public void setAtt2Name(final String att2Name) {
        this.att2Name = att2Name;
    }

    public String getAtt2Nickname() {
        return att2Nickname;
    }

    public void setAtt2Nickname(final String att2Nickname) {
        this.att2Nickname = att2Nickname;
    }

}
