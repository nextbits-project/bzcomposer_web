package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaCvcreditcard {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer creditCardId;

    @Column
    private Integer clientVendorId;

    @Column(length = 20)
    private String nickname;

    @Column
    private Boolean defaultCard;

    @Column
    private Integer cctypeId;

    @Column(length = 50)
    private String cardNumber;

    @Column(length = 50)
    private String cardExpMonth;

    @Column(length = 50)
    private String cardExpYear;

    @Column(length = 50)
    private String cardCw2;

    @Column(length = 50)
    private String cardHolderName;

    @Column
    private String cardBillingAddress;

    @Column(length = 50)
    private String city;

    @Column(length = 50)
    private String state;

    @Column(length = 50)
    private String province;

    @Column(length = 50)
    private String country;

    @Column(length = 50)
    private String cardBillingZipCode;

    @Column
    private Integer active;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @Column
    private Integer deleted;

    @OneToMany(mappedBy = "creditCard")
    private Set<BcaAccountable> creditCardBcaAccountables;

    @OneToMany(mappedBy = "creditCard")
    private Set<BcaAccountable> creditCardBcaAccountables;

    @OneToMany(mappedBy = "creditCard")
    private Set<BcaAccountable> creditCardBcaAccountables;

    public Integer getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(final Integer creditCardId) {
        this.creditCardId = creditCardId;
    }

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
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

    public Integer getCctypeId() {
        return cctypeId;
    }

    public void setCctypeId(final Integer cctypeId) {
        this.cctypeId = cctypeId;
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

    public Set<BcaAccountable> getCreditCardBcaAccountables() {
        return creditCardBcaAccountables;
    }

    public void setCreditCardBcaAccountables(final Set<BcaAccountable> creditCardBcaAccountables) {
        this.creditCardBcaAccountables = creditCardBcaAccountables;
    }

    public Set<BcaAccountable> getCreditCardBcaAccountables() {
        return creditCardBcaAccountables;
    }

    public void setCreditCardBcaAccountables(final Set<BcaAccountable> creditCardBcaAccountables) {
        this.creditCardBcaAccountables = creditCardBcaAccountables;
    }

}
