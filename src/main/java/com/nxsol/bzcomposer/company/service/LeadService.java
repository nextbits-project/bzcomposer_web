package com.nxsol.bzcomposer.company.service;

import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaCities;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaIteminventory;
import com.nxsol.bzcomposer.company.domain.BcaLead;
import com.nxsol.bzcomposer.company.domain.BcaLeadCategory;
import com.nxsol.bzcomposer.company.domain.BcaLeadProducts;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.repos.BcaBillingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaCitiesRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientcategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaIteminventoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadCategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadProductsRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;

@Service
public class LeadService {

	@Autowired
	private BcaClientvendorRepository clientVendorRepo;
	@Autowired
	private BcaLeadSourceRepository leadSourceRepo;
	@Autowired
	private BcaLeadCategoryRepository leadCategoryRepo;
	@Autowired
	private BcaIteminventoryRepository iteminventoryRepo;
	@Autowired
	private BcaPaymenttypeRepository PaymenttypeRepo;
	@Autowired
	private BcaSalesrepRepository salesRepRepo;
	@Autowired
	private BcaShipcarrierRepository shipcarrierRepRepo;
	@Autowired
	private BcaTermRepository termRepo;
	@Autowired
	private BcaCompanyRepository companyRepo;
	@Autowired
	private BcaClientcategoryRepository clienCategoryRepo;
	@Autowired
	private BcaShippingaddressRepository shippngAddressRepo;
	@Autowired
	private BcaBillingaddressRepository billingAddressRepo;
	@Autowired
	private BcaLeadRepository leadRepo;
	@Autowired
	private BcaLeadProductsRepository leadProductRepo;
	@Autowired
	private BcaCitiesRepository cityRepo;
	@Autowired
	private BcaStatesRepository stateRepo;
	@Autowired
	private BcaCountriesRepository countryRepo;

//	Get All Lead
	public List<BcaClientvendor> getAllLead(int cvType, BcaCompany companyId) {
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		List<BcaClientvendor> clientVendors = clientVendorRepo.findByCvtypeId(cvType, companyId);
		for (BcaClientvendor clientVendor : clientVendors) {
			clientVendor.setCity(getCityNameById(Integer.parseInt(clientVendor.getCity())));
			clientVendor.setState(getStateNameById(Integer.parseInt(clientVendor.getState())));
			clientVendor.setCountry(getCountryNameById(Integer.parseInt(clientVendor.getCountry())));

			if (clientVendor.getDateAdded() != null) {
	            String formattedDate = clientVendor.getDateAdded().format(formatter);
	            clientVendor.setFormattedDateAdded(formattedDate);
	        }
//			if (clientVendor.getDateAdded() != null) {
//				OffsetDateTime offsetDateAdded = clientVendor.getDateAdded();
//				LocalDate dateAdded = offsetDateAdded.toLocalDate();
//				OffsetDateTime offsetDateTime = dateAdded.atStartOfDay().atOffset(ZoneOffset.UTC);
//				clientVendor.setDateAdded(offsetDateTime);
//			}
		}
		return clientVendors;
	}

//  Convert offset date and time to string	
	public String convertDateOffsetToString(OffsetDateTime date) {
		OffsetDateTime offsetDateTime = date;

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		String formattedDate = offsetDateTime.format(formatter);
		return formattedDate;
	}

//	Get Lead By Id
	public CustomerDto getLeadById(int id) {
		BcaClientvendor clientVendor = clientVendorRepo.findById(id).orElse(null);

		CustomerDto customerDto = new CustomerDto();
		customerDto.setClientVendorID(String.valueOf(clientVendor.getClientVendorId()));

		customerDto.setFirstName(clientVendor.getFirstName());
		customerDto.setMiddleName(clientVendor.getMiddleName());
		customerDto.setLastName(clientVendor.getLastName());
		customerDto.setAddress1(clientVendor.getAddress1());
		customerDto.setAddress2(clientVendor.getAddress2());
		customerDto.setCity(clientVendor.getCity());
		customerDto.setCountry(clientVendor.getCountry());
		customerDto.setState(clientVendor.getState());
		customerDto.setZipCode(clientVendor.getZipCode());
		customerDto.setPhone(clientVendor.getPhone());
		customerDto.setCellPhone(clientVendor.getCellPhone());
		customerDto.setEmail(clientVendor.getEmail());
		customerDto.setCompanyName(clientVendor.getName());
		customerDto.setEmail(clientVendor.getEmail());
		customerDto.setDbaName(clientVendor.getDbaname());
		customerDto.setFax(clientVendor.getFax());
		customerDto.setHomePage(clientVendor.getHomePage());
		customerDto.setMemo(clientVendor.getDetail());
		customerDto.setTexID(clientVendor.getResellerTaxId());
		customerDto.setTitle(clientVendor.getCustomerTitle());
		customerDto.setTerminated(clientVendor.getIsTerminated());
		customerDto.setIsPhoneMobileNumber(clientVendor.getIsPhoneMobileNumber());
		
		//verify data type String / Boolean
		//customerDto.setTaxAble(clientVendor.getTaxable() != 0);
		
		customerDto.setType(String.valueOf(clientVendor.getCvcategoryId()));
		customerDto.setCustomerGroup(String.valueOf(clientVendor.getCustomerGroupId()));
		customerDto.setTerm(String.valueOf(clientVendor.getTerm().getTermId()));
		customerDto.setPaymentType(String.valueOf(clientVendor.getPaymentType().getPaymentTypeId()));
		customerDto.setRep(String.valueOf(clientVendor.getSalesRep().getSalesRepId()));
		customerDto.setShipping(String.valueOf(clientVendor.getShipCarrier().getShipCarrierId()));

		if (clientVendor.getDateAdded() != null) {
			customerDto.setDateAdded(convertDateOffsetToString(clientVendor.getDateAdded()));
		}

		if (clientVendor.getDateTerminated() != null) {
			customerDto.setTerminatedDate(convertDateOffsetToString(clientVendor.getDateTerminated()));
		}

		BcaLead lead = leadRepo.findByClientvendorId(clientVendor);

		customerDto.setLeadSource(lead.getLeadSource().getLeadSourceId());
		customerDto.setLeadCategory(lead.getLeadCategory().getLeadCategoryId());
		customerDto.setStatus(lead.getStatus());

		customerDto.setLeadId(lead.getLeadId());

		BcaBillingaddress billingAddress = billingAddressRepo.findByClintvendorId(clientVendor);
		customerDto.setBillingAddressId(billingAddress.getAddressId());

		BcaShippingaddress shippingAddress = shippngAddressRepo.findByClintvendorId(clientVendor);
		customerDto.setShippingAddressId(shippingAddress.getAddressId());

		System.out.println(customerDto);
		return customerDto;
	}

//	Set selected lead product with inventory list
	public List<BcaIteminventory> getSelectedLeadProduct(String companyId, int clientVendorId) {
		List<BcaIteminventory> products = getAllProducts(companyId);

		BcaClientvendor clientVendor = clientVendorRepo.findById(clientVendorId).orElse(null);
		BcaLead lead = leadRepo.findByClientvendorId(clientVendor);
		List<BcaLeadProducts> leadProducts = leadProductRepo.findByLeadId(lead);

		for (BcaIteminventory product : products) {
			System.out.println(product.getInventoryId());

			for (BcaLeadProducts leadProduct : leadProducts) {
				System.out.println(leadProduct.getInventory().getInventoryId());
				if (product.getInventoryId() == leadProduct.getInventory().getInventoryId()) {
					product.setInventoryCode(product.getInventoryCode() + "&nbsp&nbsp&nbsp" + "✔(Selected)");
				}
			}
		}

		return products;
	}

//	Get City Name By Id
	public String getCityNameById(int cityId) {
		Optional<BcaCities> cityOptional = cityRepo.findById(cityId);
		String cityName = "";
		if (cityOptional.isPresent()) {
			BcaCities city = cityOptional.get();
			cityName = city.getName();
		}
		return cityName;
	}

//	Get State Name By Id
	public String getStateNameById(int stateId) {
		Optional<BcaStates> stateOptional = stateRepo.findById(stateId);
		String stateName = "";
		if (stateOptional.isPresent()) {
			BcaStates state = stateOptional.get();
			stateName = state.getName();
		}
		return stateName;
	}

//	Get Country Name By Id
	public String getCountryNameById(int countryId) {
		Optional<BcaCountries> countryOptional = countryRepo.findById(countryId);
		String countryName = "";
		if (countryOptional.isPresent()) {
			BcaCountries country = countryOptional.get();
			countryName = country.getName();
		}
		return countryName;
	}

//	Get all lead Source by companyId
	public List<BcaLeadSource> getLeadSources(String companyId) {
		return leadSourceRepo.getLeadSource(companyId);
	}

//	Get all Category by companyId
	public List<BcaLeadCategory> getLeadCategories(String companyId) {
		return leadCategoryRepo.getLeadCategory(companyId);
	}

//	Get all products by companyId
	public List<BcaIteminventory> getAllProducts(String companyId) {
		return iteminventoryRepo.getAllProduct(companyId);
	}

//	Format Date String
	public static OffsetDateTime convertDateStringToOffset(String dateString) {
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		try {
			LocalDate localDate = LocalDate.parse(dateString, inputFormatter);

			OffsetDateTime offsetDateTime = localDate.atStartOfDay().atOffset(OffsetDateTime.now().getOffset());
			return offsetDateTime;
		} catch (DateTimeParseException e) {
			return null;
		}
	}

//	Insert Lead Data
	@Transactional
	public void addClientVendor(CustomerDto customerDto, String companyId) {
		BcaClientvendor clientVendor = new BcaClientvendor();
		clientVendor.setClientVendorId(Integer.parseInt(customerDto.getClientVendorID()));
		clientVendor.setFirstName(customerDto.getFirstName());
		clientVendor.setMiddleName(customerDto.getMiddleName());
		clientVendor.setLastName(customerDto.getLastName());
		clientVendor.setAddress1(customerDto.getAddress1());
		clientVendor.setAddress2(customerDto.getAddress2());
		clientVendor.setCity(customerDto.getCity());
		clientVendor.setCountry(customerDto.getCountry());
		clientVendor.setState(customerDto.getState());
		clientVendor.setZipCode(customerDto.getZipCode());
		clientVendor.setPhone(customerDto.getPhone());
		clientVendor.setCellPhone(customerDto.getCellPhone());
		clientVendor.setEmail(customerDto.getEmail());
		clientVendor.setName(customerDto.getCompanyName());
		clientVendor.setEmail(customerDto.getEmail());
		clientVendor.setCustomerGroupId(Integer.parseInt(customerDto.getCustomerGroup()));

		if (customerDto.getDateAdded() != null) {
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(customerDto.getDateAdded());
			clientVendor.setDateAdded(formattedDateAdded);
		}

		if (customerDto.getTerminatedDate() != null) {
			OffsetDateTime formattedDateTerminated = convertDateStringToOffset(customerDto.getTerminatedDate());
			clientVendor.setDateTerminated(formattedDateTerminated);
		}

		clientVendor.setDbaname(customerDto.getDbaName());
		clientVendor.setFax(customerDto.getFax());
		clientVendor.setHomePage(customerDto.getHomePage());
		clientVendor.setDetail(customerDto.getMemo());
		clientVendor.setStatus("N");
		clientVendor.setResellerTaxId(customerDto.getTexID());
		clientVendor.setCustomerTitle(customerDto.getTitle());
		clientVendor.setIsTerminated(customerDto.isTerminated());
		clientVendor.setIsPhoneMobileNumber(customerDto.isIsPhoneMobileNumber());

		clientVendor.setTaxable(Long.parseLong("0"));
		int cvCategoryId = Integer.parseInt(customerDto.getType());
		clientVendor.setCvcategoryId(cvCategoryId);
		clientVendor.setCvcategoryName(clienCategoryRepo.findNameByCvcategoryId(cvCategoryId));

		Optional<BcaPaymenttype> optionalPaymentType = PaymenttypeRepo
				.findById(Integer.parseInt(customerDto.getPaymentType()));
		BcaPaymenttype paymentType = optionalPaymentType.orElse(null);
		clientVendor.setPaymentType(paymentType);

		Optional<BcaSalesrep> optionalSalesRep = salesRepRepo.findById(Integer.parseInt(customerDto.getRep()));
		BcaSalesrep salesRep = optionalSalesRep.orElse(null);
		clientVendor.setSalesRep(salesRep);

		Optional<BcaShipcarrier> optionalShipcarrier = shipcarrierRepRepo
				.findById(Integer.parseInt(customerDto.getShipping()));
		BcaShipcarrier Shipcarrier = optionalShipcarrier.orElse(null);
		clientVendor.setShipCarrier(Shipcarrier);

		Optional<BcaTerm> optionalTerm = termRepo.findById(Integer.parseInt(customerDto.getTerm()));
		BcaTerm term = optionalTerm.orElse(null);
		clientVendor.setTerm(term);

		Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
		BcaCompany company = optionalCompany.orElse(null);
		clientVendor.setCompany(company);

//		BcaCategory myCategory = new BcaCategory(); 
//		myCategory.setCategoryId(0);
//		clientVendor.setCategory(myCategory);

		clientVendor.setIsMobilePhoneNumber(false);
		clientVendor.setCvtypeId(6);
		clientVendor.setActive(1);
		clientVendor.setDeleted(0);
		clientVendor.setCctypeId(0);
		clientVendor.setCustomerOpenDebit((double) 0);
		clientVendor.setCustomerCreditLine((double) 0);
		clientVendor.setVendorOpenDebit((double) 0);
		clientVendor.setVendorAllowedCredit((double) 0);
		clientVendor.setPriority(0);
		clientVendor.setItemPriceLevel(0);
		clientVendor.setVendorOpenDebit((double) 0);
		clientVendor.setPayFromId(0);
		clientVendor.setPriceLevelId(0);
		clientVendor.setUseSpecialMessage(false);
		clientVendor.setLineofCreditTermId(0);
		clientVendor.setForm1099(0);
		clientVendor.setReferenceCustomerId(0);
		clientVendor.setBankAccountId(0);

		clientVendorRepo.save(clientVendor);
	}

//	Adding Lead Shipping Address
	public void addShippingAddress(CustomerDto customerDto) {
		BcaShippingaddress shippingAddress = new BcaShippingaddress();

		if (customerDto.getShippingAddressId() != 0) {
			shippingAddress.setAddressId(customerDto.getShippingAddressId());
		}

		shippingAddress.setAddressName("Default");

		int clientId = Integer.parseInt(customerDto.getClientVendorID());
		Optional<BcaClientvendor> optionalClient = clientVendorRepo.findById(clientId);

		if (optionalClient.isPresent()) {
			BcaClientvendor clientVendor = optionalClient.get();
			shippingAddress.setClientVendor(clientVendor);
		}

		shippingAddress.setName(customerDto.getCompanyName());
		shippingAddress.setFirstName(customerDto.getFirstName());
		shippingAddress.setLastName(customerDto.getLastName());
		shippingAddress.setAddress1(customerDto.getAddress1());
		shippingAddress.setAddress2(customerDto.getAddress2());
		shippingAddress.setCity(customerDto.getCity());
		shippingAddress.setState(customerDto.getState());
		shippingAddress.setCountry(customerDto.getCountry());
		shippingAddress.setZipCode(customerDto.getZipCode());
		shippingAddress.setPhone(customerDto.getPhone());
		shippingAddress.setCellPhone(customerDto.getCellPhone());
		shippingAddress.setFax(customerDto.getFax());
		shippingAddress.setActive(1);
		shippingAddress.setIsDefault(1);
		shippingAddress.setAddressType("0");
		shippingAddress.setStatus("N");
		shippingAddress.setProvince("");

		if (customerDto.getDateAdded() != null) {
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(customerDto.getDateAdded());
			shippingAddress.setDateAdded(formattedDateAdded);
		}

		shippngAddressRepo.save(shippingAddress);
	}

	public void addBillingAddress(CustomerDto customerDto) {
		BcaBillingaddress billingAddress = new BcaBillingaddress();

		if (customerDto.getBillingAddressId() != 0) {
			billingAddress.setAddressId(customerDto.getBillingAddressId());
		}

		billingAddress.setAddressName("Default");

		int clientId = Integer.parseInt(customerDto.getClientVendorID());
		Optional<BcaClientvendor> optionalClient = clientVendorRepo.findById(clientId);

		if (optionalClient.isPresent()) {
			BcaClientvendor clientVendor = optionalClient.get();
			billingAddress.setClientVendor(clientVendor);
		}

		billingAddress.setName(customerDto.getCompanyName());
		billingAddress.setFirstName(customerDto.getFirstName());
		billingAddress.setLastName(customerDto.getLastName());
		billingAddress.setAddress1(customerDto.getAddress1());
		billingAddress.setAddress2(customerDto.getAddress2());
		billingAddress.setCity(customerDto.getCity());
		billingAddress.setState(customerDto.getState());
		billingAddress.setCountry(customerDto.getCountry());
		billingAddress.setZipCode(customerDto.getZipCode());
		billingAddress.setPhone(customerDto.getPhone());
		billingAddress.setCellPhone(customerDto.getCellPhone());
		billingAddress.setFax(customerDto.getFax());
		billingAddress.setActive(1);
		billingAddress.setIsDefault(1);
		billingAddress.setAddressType("1");
		billingAddress.setStatus("N");
		billingAddress.setProvince("");

		if (customerDto.getDateAdded() != null) {
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(customerDto.getDateAdded());
			billingAddress.setDateAdded(formattedDateAdded);
		}

		billingAddressRepo.save(billingAddress);
	}

	@Transactional
	public int addLead(CustomerDto customerDto, String companyId) {
		BcaLead lead = new BcaLead();

		if (customerDto.getLeadId() != 0) {
			lead.setLeadId(customerDto.getLeadId());
		}

		int clientId = Integer.parseInt(customerDto.getClientVendorID());
		Optional<BcaClientvendor> optionalClient = clientVendorRepo.findById(clientId);

		if (optionalClient.isPresent()) {
			BcaClientvendor clientVendor = optionalClient.get();
			lead.setClientVendor(clientVendor);
		}

		Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
		BcaCompany company = optionalCompany.orElse(null);
		lead.setCompany(company);

		Optional<BcaLeadSource> optionalLeadSource = leadSourceRepo.getLeadById(customerDto.getLeadSource());
		BcaLeadSource leadSource = optionalLeadSource.orElse(null);
		lead.setLeadSource(leadSource);

		Optional<BcaLeadCategory> optionalLeadCategory = leadCategoryRepo
				.getLeadCategoryById(customerDto.getLeadCategory());
		BcaLeadCategory leadCategory = optionalLeadCategory.orElse(null);
		lead.setLeadCategory(leadCategory);

		Optional<BcaSalesrep> optionalSalesRep = salesRepRepo.getBySalesRepId(Integer.parseInt(customerDto.getRep()));
		BcaSalesrep salesRep = optionalSalesRep.orElse(null);
		lead.setSalesRep(salesRep);

		if (customerDto.getDateAdded() != null) {
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(customerDto.getDateAdded());
			lead.setContactDate(formattedDateAdded);
		}

		lead.setWebSite(customerDto.getHomePage());
		lead.setOfficePhone(customerDto.getPhone());
		lead.setStatus(customerDto.getStatus());
		lead.setAgentId(0);
		lead.setPosition("");
		lead.setLeadValue(0.0);
		lead.setIsPublic(0);
		lead.setIsContactToday(0);
		lead.setIsAllowFollowUp(1);
		lead.setActive(true);

		lead = leadRepo.save(lead);
		int lastInsertedLeadId = lead.getLeadId();
		return lastInsertedLeadId;
	}

	public void addLeadProduct(List<String> products, String companyId, int lastInsertedLeadId, String purpose) {

		Optional<BcaLead> optionalLead = leadRepo.findByLeadId(lastInsertedLeadId);
		BcaLead lead = optionalLead.orElse(null);

		if ("editPage".equals(purpose)) {
			leadProductRepo.removeByLead(lead);
		}

		Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
		BcaCompany company = optionalCompany.orElse(null);

		for (String inventoryId : products) {
			BcaLeadProducts leadProduct = new BcaLeadProducts();

			leadProduct.setLead(lead);
			leadProduct.setCompany(company);

			Optional<BcaIteminventory> optionalInventroy = iteminventoryRepo
					.getByInventoryId(Integer.parseInt(inventoryId));
			BcaIteminventory inventory = optionalInventroy.orElse(null);
			leadProduct.setInventory(inventory);

			leadProductRepo.save(leadProduct);
		}

	}

//	@Transactional
//	public void removeClientVendor(int id) {
//		BcaClientvendor clientVendor = clientVendorRepo.findById(id).orElse(null);
//		clientVendor.setActive(0);
//		clientVendor.setDeleted(1);
//		clientVendorRepo.save(clientVendor);
//		
//		BcaLead lead = leadRepo.findByClientvendorId(clientVendor);
//		lead.setActive(false);
//		lead.setStatus("Deleted");
//		leadRepo.save(lead);
//		
//	}
	@Transactional
	public void removeClientVendor(int id) {
	    BcaClientvendor clientVendor = clientVendorRepo.findById(id).orElse(null);
	    if (clientVendor != null) {
	        clientVendor.setActive(0);
	        clientVendor.setDeleted(1);
	        clientVendorRepo.save(clientVendor);

	        BcaLead lead = leadRepo.findByClientvendorId(clientVendor);
	        if (lead != null) {
	            lead.setActive(false);
	            lead.setStatus("Deleted");
	            leadRepo.save(lead);
	        } else {
	        	Loger.log("Lead not Found________________removeClientVendor");
	        }
	    } else {
	    	Loger.log("ClientVendor not Found________________removeClientVendor");
	    }
	}
}
