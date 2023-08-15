package com.nxsol.bzcomposer.company.entities2;

import java.time.OffsetDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "bca_invoice")
@Getter
@Setter
public class BcaInvoice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceId;

    @Column
    private Integer orderNum;

    @Column
    private Integer ponum;

    @Column
    private Integer sonum;

    @Column
    private Integer rcvNum;

    @Column
    private Integer estNum;

    @Column
    private Integer employeeId;

    @Column(length = 35)
    private String refNum;

    @Column
    private Integer clientVendorId;

    @Column
    private String memo;

    @Column
    private Integer billingAddrId;

    @Column
    private Integer shippingAddrId;

    @Column
    private Integer bsaddressId;

    @Column
    private Integer companyId;

    @Column
    private Integer invoiceTypeId;

    @Column
    private Integer invoiceStyleId;

    @Column
    private Double weight;

    @Column
    private Double subTotal;

    @Column
    private Double tax;

    @Column
    private Double sh;

    @Column
    private Double total;

    @Column
    private Double adjustedTotal;

    @Column
    private Double paidAmount;

    @Column
    private Double balance;

    @Column
    private Integer salesRepId;

    @Column
    private Integer termId;

    @Column
    private Integer paymentTypeId;

    @Column
    private Integer shipCarrierId;

    @Column
    private Integer messageId;

    @Column
    private Integer salesTaxId;

    @Column
    private Integer taxable;

    @Column
    private Integer shipped;

    @Column
    private Boolean isReceived;

    @Column
    private Boolean isPaymentCompleted;

    @Column
    private Boolean fromPo;

    @Column
    private OffsetDateTime dateConfirmed;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer categoryId;

    @Column
    private Integer invoiceStatus;

    @Column(length = 50)
    private String orderid;

    @Column(length = 50)
    private String shipservicelevel;

    @Column(length = 200)
    private String shippingNote1;

    @Column(length = 50)
    private String shippingNote2;

    @Column
    private Integer storeTypeId;

    @Column
    private Integer storeId;

    @Column(length = 50)
    private String shipCarrier;

    @Column
    private Boolean isPrinted;

    @Column
    private Boolean isEmailed;

    @Column
    private Integer serviceId;

    @Column
    private String amazonGiftWrapType;

    @Column
    private String amazonGiftMessageText;

    @Column(length = 50)
    private String transactionId;

    @Column
    private Integer transactionType;

    @Column(length = 50)
    private String trackingCode;

    @Column
    private Integer gatewayId;

    @Column(length = 50)
    private String shippingMethod;

    @Column(length = 200)
    private String shippingLabel;

    @Column(length = 50)
    private String labelPrinted;

    @Column
    private Integer dropShipCustomerId;

    @Column
    private Integer jobCategoryId;

    @Column
    private Integer billId;

    @Column
    private Boolean isBillReceived;

    @Column
    private Double upfrontAmount;

    @Column(columnDefinition = "longtext")
    private String note;

    @Column
    private String billDate;

    @Column
    private Double giftAmount;

    @Column(length = 20)
    private String giftCertificateCode;

    @Column
    private Double totalCommission;

    @Column
    private Integer bankAccountId;

    @Column
    private Integer noOfBoxes;

    @Column
    private String shipNumber;

    @Column
    private Integer isInvoice;

    @Column
    private Integer isSalestype;

    @Column
    private Integer isPending;

    @Column
    private OffsetDateTime dateReceived;

    @Column
    private Integer vendorAddrId;

    @Column
    private Integer orderType;

}
