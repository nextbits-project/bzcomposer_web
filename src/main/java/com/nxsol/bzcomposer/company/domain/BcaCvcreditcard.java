package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.time.OffsetDateTime;
import java.util.Set;

// Jpa cctypeId changed from int to string

@Entity
@Table(name = "bca_cvcreditcard")
public class BcaCvcreditcard {

	@Id
	@Column(name = "CreditCardID", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer creditCardId;

	@Column(name = "Nickname", length = 20)
	private String nickname;

	@Column(name = "DefaultCard")
	private Boolean defaultCard;

	@Column(name = "CardNumber", length = 50)
	private String cardNumber;

	@Column(name = "CardExpMonth", length = 50)
	private String cardExpMonth;

	@Column(name = "CardExpYear", length = 50)
	private String cardExpYear;

	@Column(name = "CardCW2", length = 50)
	private String cardCw2;

	@Column(name = "CardHolderName", length = 50)
	private String cardHolderName;

	@Column(name = "CardBillingAddress")
	private String cardBillingAddress;

	@Column(name = "City", length = 50)
	private String city;

	@Column(name = "State", length = 50)
	private String state;

	@Column(name = "Province", length = 50)
	private String province;

	@Column(name = "Country", length = 50)
	private String country;

	@Column(name = "CardBillingZipCode", length = 50)
	private String cardBillingZipCode;

	@Column(name = "Active")
	private Integer active;

	@Column(name = "DateAdded", nullable = false)
	private OffsetDateTime dateAdded;

	@Column(name = "Deleted")
	private Integer deleted;

	@OneToMany(mappedBy = "creditCard")
	private Set<BcaAccountable> creditCardBcaAccountables;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ClientVendorID")
	private BcaClientvendor clientVendor;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CCTypeID")
	private BcaCctype cctype;

	@OneToMany(mappedBy = "creditCard")
	private Set<BcaPaymentdetail> creditCardBcaPaymentdetails;

	public Integer getCreditCardId() {
		return creditCardId;
	}

	public void setCreditCardId(final Integer creditCardId) {
		this.creditCardId = creditCardId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(final String nickname) {
		this.nickname = nickname;
	}

	public Boolean getDefaultCard() {
		return defaultCard;
	}

	public void setDefaultCard(final Boolean defaultCard) {
		this.defaultCard = defaultCard;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(final String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardExpMonth() {
		return cardExpMonth;
	}

	public void setCardExpMonth(final String cardExpMonth) {
		this.cardExpMonth = cardExpMonth;
	}

	public String getCardExpYear() {
		return cardExpYear;
	}

	public void setCardExpYear(final String cardExpYear) {
		this.cardExpYear = cardExpYear;
	}

	public String getCardCw2() {
		return cardCw2;
	}

	public void setCardCw2(final String cardCw2) {
		this.cardCw2 = cardCw2;
	}

	public String getCardHolderName() {
		return cardHolderName;
	}

	public void setCardHolderName(final String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}

	public String getCardBillingAddress() {
		return cardBillingAddress;
	}

	public void setCardBillingAddress(final String cardBillingAddress) {
		this.cardBillingAddress = cardBillingAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(final String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(final String state) {
		this.state = state;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(final String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(final String country) {
		this.country = country;
	}

	public String getCardBillingZipCode() {
		return cardBillingZipCode;
	}

	public void setCardBillingZipCode(final String cardBillingZipCode) {
		this.cardBillingZipCode = cardBillingZipCode;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(final Integer active) {
		this.active = active;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(final OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(final Integer deleted) {
		this.deleted = deleted;
	}

	public Set<BcaAccountable> getCreditCardBcaAccountables() {
		return creditCardBcaAccountables;
	}

	public void setCreditCardBcaAccountables(final Set<BcaAccountable> creditCardBcaAccountables) {
		this.creditCardBcaAccountables = creditCardBcaAccountables;
	}

	public BcaClientvendor getClientVendor() {
		return clientVendor;
	}

	public void setClientVendor(final BcaClientvendor clientVendor) {
		this.clientVendor = clientVendor;
	}

	public Set<BcaPaymentdetail> getCreditCardBcaPaymentdetails() {
		return creditCardBcaPaymentdetails;
	}

	public void setCreditCardBcaPaymentdetails(final Set<BcaPaymentdetail> creditCardBcaPaymentdetails) {
		this.creditCardBcaPaymentdetails = creditCardBcaPaymentdetails;
	}

	public BcaCctype getCctype() {
		return cctype;
	}

	public void setCctype(BcaCctype cctype) {
		this.cctype = cctype;
	}

}
