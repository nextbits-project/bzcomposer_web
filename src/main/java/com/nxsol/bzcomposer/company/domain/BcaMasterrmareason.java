package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaMasterrmareason {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rmaReasonId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "parentReason")
    private Set<BcaRmaitem> parentReasonBcaRmaitems;

    @OneToMany(mappedBy = "parentReason")
    private Set<BcaRmareason> parentReasonBcaRmareasons;

    public Integer getRmaReasonId() {
        return rmaReasonId;
    }

    public void setRmaReasonId(final Integer rmaReasonId) {
        this.rmaReasonId = rmaReasonId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaRmaitem> getParentReasonBcaRmaitems() {
        return parentReasonBcaRmaitems;
    }

    public void setParentReasonBcaRmaitems(final Set<BcaRmaitem> parentReasonBcaRmaitems) {
        this.parentReasonBcaRmaitems = parentReasonBcaRmaitems;
    }

    public Set<BcaRmareason> getParentReasonBcaRmareasons() {
        return parentReasonBcaRmareasons;
    }

    public void setParentReasonBcaRmareasons(final Set<BcaRmareason> parentReasonBcaRmareasons) {
        this.parentReasonBcaRmareasons = parentReasonBcaRmareasons;
    }

}
