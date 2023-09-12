package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaFootnote {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer footNoteId;

    @Column
    private Integer companyId;

    @Column(length = 50)
    private String name;

    @Column(name = "\"description\"", columnDefinition = "longtext")
    private String description;

    @Column
    private Integer active;

    public Integer getFootNoteId() {
        return footNoteId;
    }

    public void setFootNoteId(final Integer footNoteId) {
        this.footNoteId = footNoteId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

}
