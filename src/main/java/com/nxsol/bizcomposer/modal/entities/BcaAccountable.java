package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaAccountable {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer payableId;

    @Column
    private Integer payeeCvId;

    @Column
    private Integer payeeCvServiceId;

    @Column
    private Integer payerCvId;

    @Column
    private Integer payerCvServiceId;

    @Column
    private OffsetDateTime dateAdded;

    @Column(precision = 23, scale = 4)
    private BigDecimal amount;

    @Column(length = 50)
    private String memo;

    @Column(length = 100)
    private String ref;

    @Column
    private Integer payFromId;

    @Column
    private Boolean paymentCompleted;

    @Column
    private Boolean deleted;

    @Column
    private Boolean isPayable;

    @Column(length = 50)
    private String checkNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_type_id")
    private BcaPaymenttype paymentType;

  

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "credit_card_id")
    private BcaCvcreditcard creditCard;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private BcaInvoice invoice;

    @OneToMany(mappedBy = "payable")
    private Set<BcaPayment> payableBcaPayments;

	public Integer getPayableId() {
		return payableId;
	}

	public void setPayableId(Integer payableId) {
		this.payableId = payableId;
	}

	public Integer getPayeeCvId() {
		return payeeCvId;
	}

	public void setPayeeCvId(Integer payeeCvId) {
		this.payeeCvId = payeeCvId;
	}

	public Integer getPayeeCvServiceId() {
		return payeeCvServiceId;
	}

	public void setPayeeCvServiceId(Integer payeeCvServiceId) {
		this.payeeCvServiceId = payeeCvServiceId;
	}

	public Integer getPayerCvId() {
		return payerCvId;
	}

	public void setPayerCvId(Integer payerCvId) {
		this.payerCvId = payerCvId;
	}

	public Integer getPayerCvServiceId() {
		return payerCvServiceId;
	}

	public void setPayerCvServiceId(Integer payerCvServiceId) {
		this.payerCvServiceId = payerCvServiceId;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public Integer getPayFromId() {
		return payFromId;
	}

	public void setPayFromId(Integer payFromId) {
		this.payFromId = payFromId;
	}

	public Boolean getPaymentCompleted() {
		return paymentCompleted;
	}

	public void setPaymentCompleted(Boolean paymentCompleted) {
		this.paymentCompleted = paymentCompleted;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public Boolean getIsPayable() {
		return isPayable;
	}

	public void setIsPayable(Boolean isPayable) {
		this.isPayable = isPayable;
	}

	public String getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(String checkNumber) {
		this.checkNumber = checkNumber;
	}

	public BcaCategory getCategory() {
		return category;
	}

	public void setCategory(BcaCategory category) {
		this.category = category;
	}

	public BcaPaymenttype getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(BcaPaymenttype paymentType) {
		this.paymentType = paymentType;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public BcaCvcreditcard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(BcaCvcreditcard creditCard) {
		this.creditCard = creditCard;
	}

	public BcaInvoice getInvoice() {
		return invoice;
	}

	public void setInvoice(BcaInvoice invoice) {
		this.invoice = invoice;
	}

	public Set<BcaPayment> getPayableBcaPayments() {
		return payableBcaPayments;
	}

	public void setPayableBcaPayments(Set<BcaPayment> payableBcaPayments) {
		this.payableBcaPayments = payableBcaPayments;
	}

    
   
}
