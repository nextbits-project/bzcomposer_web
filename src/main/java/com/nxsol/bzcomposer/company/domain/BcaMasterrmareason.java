package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bca_masterrmareason")
public class BcaMasterrmareason {

    @Id
    @Column(name= "rmaReasonID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rmaReasonId;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Active")
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
