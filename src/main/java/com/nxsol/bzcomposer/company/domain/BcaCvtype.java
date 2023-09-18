package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaCvtype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cvtypeId;

    @Column(length = 50)
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
