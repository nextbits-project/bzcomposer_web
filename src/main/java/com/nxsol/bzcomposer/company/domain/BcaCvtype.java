package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.Set;


@Entity
@Table(name="bca_cvtype")
public class BcaCvtype {

    @Id
    @Column(name="CVTypeID",nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cvtypeId;

    @Column(name="Name",length = 50)
    private String name;

    @OneToMany(mappedBy = "cvtype")
    private Set<StorageClientvendor> cvtypeStorageClientvendors;

    public Integer getCvtypeId() {
        return cvtypeId;
    }

    public void setCvtypeId(final Integer cvtypeId) {
        this.cvtypeId = cvtypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Set<StorageClientvendor> getCvtypeStorageClientvendors() {
        return cvtypeStorageClientvendors;
    }

    public void setCvtypeStorageClientvendors(
            final Set<StorageClientvendor> cvtypeStorageClientvendors) {
        this.cvtypeStorageClientvendors = cvtypeStorageClientvendors;
    }

}
