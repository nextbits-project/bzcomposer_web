package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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

    public Set<BcaRmareason> getParentReasonBcaRmareasons() {
        return parentReasonBcaRmareasons;
    }

    public void setParentReasonBcaRmareasons(final Set<BcaRmareason> parentReasonBcaRmareasons) {
        this.parentReasonBcaRmareasons = parentReasonBcaRmareasons;
    }

}
