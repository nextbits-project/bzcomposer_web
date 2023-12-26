package com.pritesh.bizcomposer.accounting.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BcaShippingaddressDto {
	Integer addressId;
	Integer clientVendorId;
	String name;
	String firstName;
	String lastName;
	String address1;
	String address2;
	String zipCode;
	String city;
	String cityName;
	String state;
	String stateName;
	String country;
	String countryName;


}
