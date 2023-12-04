package com.pritesh.bizcomposer.accounting.bean;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientvendorDto {
    private Double remainingCredit;
    private Double customerCreditLine;
    private String name;
    private String firstName;
    private String lastName;
    private OffsetDateTime dateAdded;
    private OffsetDateTime date_Added;
    private Integer clientVendorId;
    private Integer categoryId;
    private Integer invoiceId;
    private BigDecimal credit;
    private BigDecimal totalCredit;
    private Integer termId;
    private String memo;
}
