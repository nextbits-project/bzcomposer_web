package io.bootify.my_app.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;
import lombok.Getter;
import lombok.Setter;


//@Entity
//@Getter
//@Setter
public class BcaBalancesheetitem {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer balancesheetitemId;

    @Column
    private Integer categoryId;

    @Column
    private Integer categoryTypeId;

    @Column
    private String name;

    @Column
    private Integer amount;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer companyId;

}
