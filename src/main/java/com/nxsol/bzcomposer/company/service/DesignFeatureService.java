package com.nxsol.bzcomposer.company.service;

import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.lead.dto.LeadBoardDto;
import com.avibha.bizcomposer.lead.dto.LeadDirectoryDto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaCities;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaIteminventory;
import com.nxsol.bzcomposer.company.domain.BcaLabel;
import com.nxsol.bzcomposer.company.domain.BcaLead;
import com.nxsol.bzcomposer.company.domain.BcaLeadCategory;
import com.nxsol.bzcomposer.company.domain.BcaLeadDirectory;
import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import com.nxsol.bzcomposer.company.domain.BcaLeadNewProducts;
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
import com.nxsol.bzcomposer.company.repos.BcaCvtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaIteminventoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadCategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadNewRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadProductsNewRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadProductsRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.nxsol.bzcomposer.company.utils.JpaHelper;

@Service
public class DesignFeatureService {

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

	@Autowired
	BcaCvtypeRepository bcaCvtypeRepository;
	
	@Autowired
	BcaLeadNewRepository bcaLeadNewRepository;
	
	@Autowired
	BcaLeadProductsNewRepository bcaLeadProductsNewRepository;
	
	@Autowired 
	private CustomerInfo customerInfo;
	
	@Autowired
	private EntityManager entityManager;
	
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
		customerDto.setCompanyID(Integer.parseInt(""+(clientVendor.getCompany().getCompanyId())));
		customerDto.setEmail(clientVendor.getEmail());
		customerDto.setDbaName(clientVendor.getDbaname());
		customerDto.setFax(clientVendor.getFax());
		customerDto.setHomePage(clientVendor.getHomePage());
		customerDto.setMemo(clientVendor.getDetail());
		customerDto.setTexID(clientVendor.getResellerTaxId());
		customerDto.setTitle(clientVendor.getCustomerTitle());
		customerDto.setTerminated(clientVendor.getIsTerminated());
		customerDto.setIsPhoneMobileNumber(clientVendor.getIsPhoneMobileNumber());
		customerDto.setActive(clientVendor.getActive() == 1 ? true : false);
		// verify data type String / Boolean
		// customerDto.setTaxAble(clientVendor.getTaxable() != 0);

		customerDto.setType(String.valueOf(clientVendor.getCvcategoryId()));
		customerDto.setCustomerGroup(String.valueOf(clientVendor.getCustomerGroupId()));
		
		if (clientVendor.getTerm() != null)
			customerDto.setTerm(String.valueOf(clientVendor.getTerm().getTermId()));
		
		if (clientVendor.getPaymentType() != null)
			customerDto.setPaymentType(String.valueOf(clientVendor.getPaymentType().getPaymentTypeId()));
		
		if (clientVendor.getSalesRep() != null)
			customerDto.setRep(String.valueOf(clientVendor.getSalesRep().getSalesRepId()));
		
		if (clientVendor.getShipCarrier() != null)
			customerDto.setShipping(String.valueOf(clientVendor.getShipCarrier().getShipCarrierId()));

		if (clientVendor.getDateAdded() != null) {
			customerDto.setDateAdded(convertDateOffsetToString(clientVendor.getDateAdded()));
		}

		if (clientVendor.getDateTerminated() != null) {
			customerDto.setTerminatedDate(convertDateOffsetToString(clientVendor.getDateTerminated()));
		}

		BcaLead lead = leadRepo.findByClientvendorId(clientVendor);
		List<BcaLeadProducts> leadProducts = new ArrayList<BcaLeadProducts>();
		if(lead != null) {
			if (lead.getLeadSource() != null && lead.getLeadSource().getLeadSourceId() != null)
				customerDto.setLeadSource(lead.getLeadSource().getLeadSourceId());
			
			if (lead.getLeadCategory() != null && lead.getLeadCategory().getLeadCategoryId() != null)
				customerDto.setLeadCategory(lead.getLeadCategory().getLeadCategoryId());
			
			customerDto.setStatus(lead.getStatus());
			customerDto.setLeadId(lead.getLeadId());
			leadProducts = leadProductRepo.findByLeadId(lead);
		}

		BcaBillingaddress billingAddress = billingAddressRepo.findByClintvendorId(clientVendor);
		if(billingAddress != null) {
			customerDto.setBillingAddressId(billingAddress.getAddressId());	
		}

		BcaShippingaddress shippingAddress = shippngAddressRepo.findByClintvendorId(clientVendor);
		if(shippingAddress != null) {
			customerDto.setShippingAddressId(shippingAddress.getAddressId());	
		}

		List<String> leadSelectedProducts = new ArrayList<>();
		for (BcaLeadProducts product : leadProducts) {
			if (product.getInventory() != null) {
				leadSelectedProducts.add(product.getInventory().getInventoryCode());
			}

		}
		
		customerDto.setLeadSelectedproducts(leadSelectedProducts);
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

	public List<String> getOnlySelectedLeadProduct(BcaLead lead) {
		List<String> leadSelectedProducts = new ArrayList<>();
		List<BcaLeadProducts> leadProducts = leadProductRepo.findByLeadId(lead);

		for (BcaLeadProducts product : leadProducts) {
			if (product.getInventory() != null) {
				leadSelectedProducts.add(product.getInventory().getInventoryCode());
			}

		}

		return leadSelectedProducts;
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
	public void addClientVendor(CustomerDto customerDto, String companyId, Integer clientVendorID) {
		BcaClientvendor clientVendor = new BcaClientvendor();
		if (clientVendorID != null && clientVendorID > 0) {
			clientVendor.setClientVendorId(clientVendorID);
		}
		//clientVendor.setClientVendorId(Integer.parseInt(customerDto.getClientVendorID()));
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

		if (customerDto.getPaymentType() != null && !customerDto.getPaymentType().isEmpty()) {
			Optional<BcaPaymenttype> optionalPaymentType = PaymenttypeRepo.findById(Integer.parseInt(customerDto.getPaymentType()));
			BcaPaymenttype paymentType = optionalPaymentType.orElse(null);
			clientVendor.setPaymentType(paymentType);
		}
		
		if (customerDto.getRep() != null && !customerDto.getRep().isEmpty()) {
			Optional<BcaSalesrep> optionalSalesRep = salesRepRepo.findById(Integer.parseInt(customerDto.getRep()));
			BcaSalesrep salesRep = optionalSalesRep.orElse(null);
			clientVendor.setSalesRep(salesRep);	
		}
		
		if (customerDto.getShipping() != null && !customerDto.getShipping().isEmpty()) {
			Optional<BcaShipcarrier> optionalShipcarrier = shipcarrierRepRepo.findById(Integer.parseInt(customerDto.getShipping()));
			BcaShipcarrier Shipcarrier = optionalShipcarrier.orElse(null);
			clientVendor.setShipCarrier(Shipcarrier);	
		}
		
		if (customerDto.getTerm() != null && !customerDto.getTerm().isEmpty()) {
			Optional<BcaTerm> optionalTerm = termRepo.findById(Integer.parseInt(customerDto.getTerm()));
			BcaTerm term = optionalTerm.orElse(null);
			clientVendor.setTerm(term);	
		}
		
		if (companyId != null && !companyId.isEmpty()) {
			Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
			BcaCompany company = optionalCompany.orElse(null);
			clientVendor.setCompany(company);	
		}

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

		BcaClientvendor savedClientVendor = clientVendorRepo.save(clientVendor);

		customerDto.setClientVendorID(savedClientVendor.getClientVendorId().toString());
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
		Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.valueOf(customerDto.getCompanyID()));
		BcaCompany company = optionalCompany.orElse(null);
		shippingAddress.setCompany(company);
		
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
		Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.valueOf(customerDto.getCompanyID()));
		BcaCompany company = optionalCompany.orElse(null);
		billingAddress.setCompany(company);
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
	
	//------------------------------------------below New APIs--------------------------------------------------------------
	public List<BcaLeadNew> getAllLeadsList(BcaCompany companyId) {
		int cvType = 0;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		Integer typeIDList = bcaCvtypeRepository.findByName("Lead");
		if (typeIDList > 0)
			cvType = typeIDList;
		List<BcaLeadNew> bcaLeadList = bcaLeadNewRepository.findByCvtypeId(cvType, companyId);
		for (BcaLeadNew bcaLead : bcaLeadList) {
			bcaLead.setCity(getCityNameById(Integer.parseInt(bcaLead.getCity())));
			bcaLead.setState(getStateNameById(Integer.parseInt(bcaLead.getState())));
			bcaLead.setCountry(getCountryNameById(Integer.parseInt(bcaLead.getCountry())));

			if (bcaLead.getDateAdded() != null) {
				String formattedDate = bcaLead.getDateAdded().format(formatter);
				bcaLead.setFormattedDateAdded(formattedDate);
			}
		}
		return bcaLeadList;
	}
	
	public List<BcaLeadNew> getFilterLeadsList(BcaCompany companyId, LeadBoardDto leadBoardDto) {
		int cvType = 0;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		Integer typeIDList = bcaCvtypeRepository.findByName("Lead");
		if (typeIDList > 0)
			cvType = typeIDList;
		
		String oDate1 = leadBoardDto.getOrderDate1();
		String oDate2 = leadBoardDto.getOrderDate2();
		String searchType = leadBoardDto.getSearchType();
		String searchTxt = leadBoardDto.getSearchTxt();
		
		StringBuffer query = new StringBuffer("select bca from BcaLeadNew as bca where bca.cvtypeId = :cvtypeId and bca.company = :companyId and bca.active = 1");
		if (oDate1 != null && !oDate1.trim().isEmpty() && oDate1.trim().length() > 1 && oDate2 != null && !oDate2.trim().isEmpty() && oDate2.trim().length() > 1) {
			query.append(" and bca.dateAdded between '" + customerInfo.string2date(oDate1) + "' and '" + customerInfo.string2date(oDate2) + "' ");
		} else if (oDate1 != null && !oDate1.trim().isEmpty() && oDate1.trim().length() > 1) {
			query.append(" and bca.dateAdded between '" + customerInfo.string2date(oDate1) + "' and '" + customerInfo.string2date("now()") + "' ");
		} else if (searchType != null && !searchType.trim().isEmpty() && searchTxt != null && !searchTxt.trim().isEmpty()) {
			//will add some condition
			if (searchType.equals("1")) {
				query.append(" and bca.leadSource.name LIKE '%" + searchTxt + "%' ");
			} else if (searchType.equals("2")) {
				query.append(" and bca.firstName LIKE '%" + searchTxt + "%' ");
			} else if (searchType.equals("3")) {
				query.append(" and bca.name LIKE '%" + searchTxt + "%' ");
			} else if (searchType.equals("4")) {
				query.append(" and bca.address1 LIKE '%" + searchTxt + "%' ");
			} else if (searchType.equals("5")) {
				query.append(" and bca.email LIKE '%" + searchTxt + "%' ");
			}
		}
		
		query.append(" ORDER BY bca.leadID DESC");
		
		TypedQuery<BcaLeadNew> typedQuery = this.entityManager.createQuery(query.toString(), BcaLeadNew.class);
		JpaHelper.addParameter(typedQuery, query.toString(), "companyId", companyId);
		JpaHelper.addParameter(typedQuery, query.toString(), "cvtypeId", cvType);
		List<BcaLeadNew> bcaLeadList = typedQuery.getResultList();
		for (BcaLeadNew bcaLead : bcaLeadList) {
			bcaLead.setCity(getCityNameById(Integer.parseInt(bcaLead.getCity())));
			bcaLead.setState(getStateNameById(Integer.parseInt(bcaLead.getState())));
			bcaLead.setCountry(getCountryNameById(Integer.parseInt(bcaLead.getCountry())));
			if (bcaLead.getDateAdded() != null) {
				String formattedDate = bcaLead.getDateAdded().format(formatter);
				bcaLead.setFormattedDateAdded(formattedDate);
			}
		}
		return bcaLeadList;
	}
	
	@Transactional
	public BcaLeadNew addLead(CustomerDto customerDto, String companyId, Integer leadID) {
		//insert lead
		BcaLeadNew bcaLead = new BcaLeadNew();
		if (leadID != null && leadID > 0) {
			bcaLead.setLeadID(leadID);
		}
		bcaLead.setFirstName(customerDto.getFirstName());
		bcaLead.setMiddleName(customerDto.getMiddleName());
		bcaLead.setLastName(customerDto.getLastName());
		bcaLead.setAddress1(customerDto.getAddress1());
		bcaLead.setAddress2(customerDto.getAddress2());
		bcaLead.setCity(customerDto.getCity());
		bcaLead.setCountry(customerDto.getCountry());
		bcaLead.setState(customerDto.getState());
		bcaLead.setZipCode(customerDto.getZipCode());
		bcaLead.setPhone(customerDto.getPhone());
		bcaLead.setCellPhone(customerDto.getCellPhone());
		bcaLead.setEmail(customerDto.getEmail());
		bcaLead.setName(customerDto.getCompanyName());
		bcaLead.setEmail(customerDto.getEmail());

		if (customerDto.getDateAdded() != null) {
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(customerDto.getDateAdded());
			bcaLead.setDateAdded(formattedDateAdded);
		}

		bcaLead.setDbaname(customerDto.getDbaName());
		bcaLead.setFax(customerDto.getFax());
		bcaLead.setHomePage(customerDto.getHomePage());
		bcaLead.setDetail(customerDto.getMemo());
		bcaLead.setStatus("N");
		bcaLead.setResellerTaxId(customerDto.getTexID());
		bcaLead.setCustomerTitle(customerDto.getTitle());
		bcaLead.setTaxable(Long.parseLong("0"));
		int cvCategoryId = Integer.parseInt(customerDto.getType());
		bcaLead.setCvcategoryId(cvCategoryId);
		bcaLead.setCvcategoryName(clienCategoryRepo.findNameByCvcategoryId(cvCategoryId));

		if (customerDto.getPaymentType() != null && !customerDto.getPaymentType().isEmpty()) {
			Optional<BcaPaymenttype> optionalPaymentType = PaymenttypeRepo.findById(Integer.parseInt(customerDto.getPaymentType()));
			BcaPaymenttype paymentType = optionalPaymentType.orElse(null);
			bcaLead.setPaymentType(paymentType);
		}
		
		if (customerDto.getRep() != null && !customerDto.getRep().isEmpty()) {
			Optional<BcaSalesrep> optionalSalesRep = salesRepRepo.findById(Integer.parseInt(customerDto.getRep()));
			BcaSalesrep salesRep = optionalSalesRep.orElse(null);
			bcaLead.setSalesRep(salesRep);	
		}
		
		if (customerDto.getShipping() != null && !customerDto.getShipping().isEmpty()) {
			Optional<BcaShipcarrier> optionalShipcarrier = shipcarrierRepRepo.findById(Integer.parseInt(customerDto.getShipping()));
			BcaShipcarrier Shipcarrier = optionalShipcarrier.orElse(null);
			bcaLead.setShipCarrier(Shipcarrier);	
		}
		
		if (customerDto.getTerm() != null && !customerDto.getTerm().isEmpty()) {
			Optional<BcaTerm> optionalTerm = termRepo.findById(Integer.parseInt(customerDto.getTerm()));
			BcaTerm term = optionalTerm.orElse(null);
			bcaLead.setTerm(term);	
		}
		
		if (companyId != null && !companyId.isEmpty()) {
			Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
			BcaCompany company = optionalCompany.orElse(null);
			bcaLead.setCompany(company);	
		}
		
		Integer typeIDList = bcaCvtypeRepository.findByName("Lead");
		if (typeIDList > 0)
			bcaLead.setCvtypeId(typeIDList);
		
		Optional<BcaLeadSource> optionalLeadSource = leadSourceRepo.getLeadById(customerDto.getLeadSource());
		BcaLeadSource leadSource = optionalLeadSource.orElse(null);
		bcaLead.setLeadSource(leadSource);
		Optional<BcaLeadCategory> optionalLeadCategory = leadCategoryRepo.getLeadCategoryById(customerDto.getLeadCategory());
		BcaLeadCategory leadCategory = optionalLeadCategory.orElse(null);
		bcaLead.setLeadCategory(leadCategory);
		
		bcaLead.setActive(1);
		bcaLead.setDeleted(0);
		bcaLead.setCctypeId(0);
		bcaLead.setCustomerOpenDebit((double) 0);
		bcaLead.setCustomerCreditLine((double) 0);
		bcaLead.setVendorOpenDebit((double) 0);
		bcaLead.setVendorAllowedCredit((double) 0);
		BcaLeadNew bcaLeadNew = bcaLeadNewRepository.save(bcaLead);
		Loger.log("bcaLeadNew -------------- Created ID-------------"+bcaLeadNew.getLeadID());
		//customerDto.setClientVendorID(savedClientVendor.getClientVendorId().toString());
		return bcaLeadNew;
	}
	
	public CustomerDto getNewLeadById(int id) {
		BcaLeadNew clientVendor = bcaLeadNewRepository.findById(id).orElse(null);
		CustomerDto customerDto = new CustomerDto();
		customerDto.setClientVendorID(String.valueOf(clientVendor.getLeadID()));
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
		customerDto.setActive(clientVendor.getActive() == 1 ? true : false);
		customerDto.setType(String.valueOf(clientVendor.getCvcategoryId()));
		if (clientVendor.getTerm() != null)
			customerDto.setTerm(String.valueOf(clientVendor.getTerm().getTermId()));
		
		if (clientVendor.getPaymentType() != null)
			customerDto.setPaymentType(String.valueOf(clientVendor.getPaymentType().getPaymentTypeId()));
		
		if (clientVendor.getSalesRep() != null)
			customerDto.setRep(String.valueOf(clientVendor.getSalesRep().getSalesRepId()));
		
		if (clientVendor.getShipCarrier() != null)
			customerDto.setShipping(String.valueOf(clientVendor.getShipCarrier().getShipCarrierId()));

		if (clientVendor.getDateAdded() != null) {
			customerDto.setDateAdded(convertDateOffsetToString(clientVendor.getDateAdded()));
		}
		
		customerDto.setStatus(clientVendor.getStatus());
		customerDto.setLeadId(clientVendor.getLeadID());
		if (clientVendor.getLeadSource() != null && clientVendor.getLeadSource().getLeadSourceId() != null)
			customerDto.setLeadSource(clientVendor.getLeadSource().getLeadSourceId());
		
		if (clientVendor.getLeadCategory() != null && clientVendor.getLeadCategory().getLeadCategoryId() != null)
			customerDto.setLeadCategory(clientVendor.getLeadCategory().getLeadCategoryId());
		
		List<BcaLeadNewProducts> leadProducts = new ArrayList<BcaLeadNewProducts>();
		leadProducts = bcaLeadProductsNewRepository.findByLeadId(clientVendor);
		List<String> leadSelectedProducts = new ArrayList<>();
		for (BcaLeadNewProducts product : leadProducts) {
			if (product.getInventory() != null) {
				leadSelectedProducts.add(product.getInventory().getInventoryCode());
			}
		}
		
		customerDto.setLeadSelectedproducts(leadSelectedProducts);
		System.out.println(customerDto);
		return customerDto;
	}
	
	public void addLeadNewProduct(List<String> products, String companyId, int lastInsertedLeadId, String purpose) {
		Optional<BcaLeadNew> optionalLead = bcaLeadNewRepository.findById(lastInsertedLeadId);
		BcaLeadNew lead = optionalLead.orElse(null);
		if ("editPage".equals(purpose)) {
			bcaLeadProductsNewRepository.removeByLead(lead);
		}
		
		Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
		BcaCompany company = optionalCompany.orElse(null);
		for (String inventoryId : products) {
			BcaLeadNewProducts leadProduct = new BcaLeadNewProducts();
			leadProduct.setLead(lead);
			leadProduct.setCompany(company);
			Optional<BcaIteminventory> optionalInventroy = iteminventoryRepo.getByInventoryId(Integer.parseInt(inventoryId));
			BcaIteminventory inventory = optionalInventroy.orElse(null);
			leadProduct.setInventory(inventory);
			bcaLeadProductsNewRepository.save(leadProduct);
		}
	}
	
	public List<BcaIteminventory> getSelectedLeadNewProduct(String companyId, int clientVendorId) {
		List<BcaIteminventory> products = getAllProducts(companyId);
		BcaLeadNew bcaLeadNew = bcaLeadNewRepository.findById(clientVendorId).orElse(null);
		List<BcaLeadNewProducts> leadProducts = bcaLeadProductsNewRepository.findByLeadId(bcaLeadNew);
		for (BcaIteminventory product : products) {
			System.out.println(product.getInventoryId());
			for (BcaLeadNewProducts leadProduct : leadProducts) {
				System.out.println(leadProduct.getInventory().getInventoryId());
				if (product.getInventoryId() == leadProduct.getInventory().getInventoryId()) {
					product.setInventoryCode(product.getInventoryCode() + "&nbsp&nbsp&nbsp" + "✔(Selected)");
				}
			}
		}
		return products;
	}
	
	public boolean convertLeadTo(String leadId, String compId, String cvTypeName) {
		boolean ret = false;
		try {
			//convert lead to customer
			Integer typeID = bcaCvtypeRepository.findByName(cvTypeName);
			BcaLeadNew bcaLead = bcaLeadNewRepository.findByCompanyIdAndleadID(Long.valueOf(compId), Integer.valueOf(leadId));
			bcaLead.setCvtypeId(typeID);
			BcaClientvendor bcaClientvendor = addBcaClientVendor(bcaLead, compId, 0);
			if (cvTypeName != null && cvTypeName.equalsIgnoreCase("Customer")) {
				addBcaShippingAddress(bcaClientvendor);
				addBcaBillingAddress(bcaClientvendor);	
			}
			//then need to remove lead in lead table
			bcaLeadNewRepository.deleteById(Integer.valueOf(leadId));
			ret = true;
		} catch (Exception e) {
			Loger.log(2, "Exception... LEADInfo.convertToCustomer(). --->" + e.getMessage());
			ret = false;
		}
		return ret;
	}
	
	@Transactional
	public BcaClientvendor addBcaClientVendor(BcaLeadNew bcaLead, String companyId, Integer clientVendorID) {
		BcaClientvendor clientVendor = new BcaClientvendor();
		if (clientVendorID != null && clientVendorID > 0) {
			clientVendor.setClientVendorId(clientVendorID);
		}
		clientVendor.setFirstName(bcaLead.getFirstName());
		clientVendor.setMiddleName(bcaLead.getMiddleName());
		clientVendor.setLastName(bcaLead.getLastName());
		clientVendor.setAddress1(bcaLead.getAddress1());
		clientVendor.setAddress2(bcaLead.getAddress2());
		clientVendor.setCity(bcaLead.getCity());
		clientVendor.setCountry(bcaLead.getCountry());
		clientVendor.setState(bcaLead.getState());
		clientVendor.setZipCode(bcaLead.getZipCode());
		clientVendor.setPhone(bcaLead.getPhone());
		clientVendor.setCellPhone(bcaLead.getCellPhone());
		clientVendor.setEmail(bcaLead.getEmail());
		clientVendor.setName(bcaLead.getName());
		clientVendor.setEmail(bcaLead.getEmail());
		if (bcaLead.getDateAdded() != null) {
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(DateHelper.dateFormatter(bcaLead.getDateAdded()));
			clientVendor.setDateAdded(formattedDateAdded);
		}

		clientVendor.setDbaname(bcaLead.getDbaname());
		clientVendor.setFax(bcaLead.getFax());
		clientVendor.setHomePage(bcaLead.getHomePage());
		//clientVendor.setDetail(bcaLead.getMemo());
		clientVendor.setStatus("N");
		clientVendor.setResellerTaxId(bcaLead.getResellerTaxId());
		clientVendor.setCustomerTitle(bcaLead.getCustomerTitle());
		clientVendor.setTaxable(Long.parseLong("0"));
		clientVendor.setCvcategoryId(bcaLead.getCvcategoryId());
		clientVendor.setCvcategoryName(bcaLead.getCvcategoryName());
		if (companyId != null && !companyId.isEmpty()) {
			Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
			BcaCompany company = optionalCompany.orElse(null);
			clientVendor.setCompany(company);	
		}
		clientVendor.setIsMobilePhoneNumber(false);
		clientVendor.setCvtypeId(bcaLead.getCvtypeId());
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
		clientVendor = clientVendorRepo.save(clientVendor);
		return clientVendor;
	}
	
	public void addBcaShippingAddress(BcaClientvendor customerDto) {
		BcaShippingaddress shippingAddress = new BcaShippingaddress();
		shippingAddress.setAddressName("Default");
		Optional<BcaClientvendor> optionalClient = clientVendorRepo.findById(customerDto.getClientVendorId());
		if (optionalClient.isPresent()) {
			BcaClientvendor clientVendor = optionalClient.get();
			shippingAddress.setClientVendor(clientVendor);
		}
		shippingAddress.setName(customerDto.getName());
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
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(DateHelper.dateFormatter(customerDto.getDateAdded()));
			shippingAddress.setDateAdded(formattedDateAdded);
		}
		
		if(customerDto.getCompany() != null && customerDto.getCompany().getCompanyId() > 0) {
			Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.valueOf(customerDto.getCompany().getCompanyId()));
			BcaCompany company = optionalCompany.orElse(null);
			shippingAddress.setCompany(company);	
		}
		
		shippngAddressRepo.save(shippingAddress);
	}
	
	public void addBcaBillingAddress(BcaClientvendor customerDto) {
		BcaBillingaddress billingAddress = new BcaBillingaddress();
		billingAddress.setAddressName("Default");
		Optional<BcaClientvendor> optionalClient = clientVendorRepo.findById(customerDto.getClientVendorId());
		if (optionalClient.isPresent()) {
			BcaClientvendor clientVendor = optionalClient.get();
			billingAddress.setClientVendor(clientVendor);
		}

		billingAddress.setName(customerDto.getName());
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
			OffsetDateTime formattedDateAdded = convertDateStringToOffset(DateHelper.dateFormatter(customerDto.getDateAdded()));
			billingAddress.setDateAdded(formattedDateAdded);
		}
		if (customerDto.getCompany() != null && customerDto.getCompany().getCompanyId() > 0) {
			Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.valueOf(customerDto.getCompany().getCompanyId()));
			BcaCompany company = optionalCompany.orElse(null);
			billingAddress.setCompany(company);	
		}
		
		billingAddressRepo.save(billingAddress);
	}
	
	public boolean convertToLead(String clientVendorID, String compId, String cvTypeName) {
		boolean ret = false;
		try {
			//convert customer or contact to lead
			Integer typeID = bcaCvtypeRepository.findByName(cvTypeName);
			BcaClientvendor clientVendor = clientVendorRepo.findByCompanyIdAndClientvendorId(Long.valueOf(compId), Integer.valueOf(clientVendorID));
			clientVendor.setCvtypeId(typeID);
			BcaLeadNew bcaLeadNew = clientVendorToaddLead(clientVendor, compId, typeID);
			if (cvTypeName != null && cvTypeName.equalsIgnoreCase("Customer")) {
				BcaShippingaddress bcaShippingaddress = shippngAddressRepo.findByClintvendorId(clientVendor);
				if(bcaShippingaddress != null && bcaShippingaddress.getAddressId() > 0){
					shippngAddressRepo.deleteById(bcaShippingaddress.getAddressId());
				}
				
				BcaBillingaddress bcaBillingaddress = billingAddressRepo.findByClintvendorId(clientVendor);
				if(bcaBillingaddress != null && bcaBillingaddress.getAddressId() > 0){
					billingAddressRepo.deleteById(bcaBillingaddress.getAddressId());
				}
			}
			//then need to remove vendor in client vendor table
			clientVendorRepo.deleteById(Integer.valueOf(clientVendorID));
			ret = true;
		} catch (Exception e) {
			Loger.log(2, "Exception... LEADInfo.convertToCustomer(). --->" + e.getMessage());
			ret = false;
		}
		return ret;
	}
	
	@Transactional
	public BcaLeadNew clientVendorToaddLead(BcaClientvendor bcaClientvendor, String companyId, Integer leadID) {
		//insert lead
		BcaLeadNew bcaLead = new BcaLeadNew();
		if (leadID != null && leadID > 0) {
			bcaLead.setLeadID(leadID);
		}
		bcaLead.setFirstName(bcaClientvendor.getFirstName());
		bcaLead.setMiddleName(bcaClientvendor.getMiddleName());
		bcaLead.setLastName(bcaClientvendor.getLastName());
		bcaLead.setAddress1(bcaClientvendor.getAddress1());
		bcaLead.setAddress2(bcaClientvendor.getAddress2());
		bcaLead.setCity(bcaClientvendor.getCity());
		bcaLead.setCountry(bcaClientvendor.getCountry());
		bcaLead.setState(bcaClientvendor.getState());
		bcaLead.setZipCode(bcaClientvendor.getZipCode());
		bcaLead.setPhone(bcaClientvendor.getPhone());
		bcaLead.setCellPhone(bcaClientvendor.getCellPhone());
		bcaLead.setEmail(bcaClientvendor.getEmail());
		bcaLead.setName(bcaClientvendor.getName());
		bcaLead.setEmail(bcaClientvendor.getEmail());
		bcaLead.setDateAdded(bcaClientvendor.getDateAdded());
		bcaLead.setDbaname(bcaClientvendor.getDbaname());
		bcaLead.setFax(bcaClientvendor.getFax());
		bcaLead.setHomePage(bcaClientvendor.getHomePage());
		bcaLead.setDetail(bcaClientvendor.getMessage());
		bcaLead.setStatus("N");
		bcaLead.setResellerTaxId(bcaClientvendor.getResellerTaxId());
		bcaLead.setCustomerTitle(bcaClientvendor.getCustomerTitle());
		bcaLead.setTaxable(Long.parseLong("0"));
		bcaLead.setCvcategoryId(bcaClientvendor.getCvcategoryId());
		bcaLead.setCvcategoryName(bcaClientvendor.getCvcategoryName());

		if (bcaClientvendor.getPaymentType() != null) {
			bcaLead.setPaymentType(bcaClientvendor.getPaymentType());
		}
		
		if (companyId != null && !companyId.isEmpty()) {
			Optional<BcaCompany> optionalCompany = companyRepo.findById(Long.parseLong(companyId));
			BcaCompany company = optionalCompany.orElse(null);
			bcaLead.setCompany(company);	
		}
		
		bcaLead.setCvtypeId(bcaClientvendor.getCvtypeId());
		bcaLead.setActive(1);
		bcaLead.setDeleted(0);
		bcaLead.setCctypeId(0);
		bcaLead.setCustomerOpenDebit((double) 0);
		bcaLead.setCustomerCreditLine((double) 0);
		bcaLead.setVendorOpenDebit((double) 0);
		bcaLead.setVendorAllowedCredit((double) 0);
		BcaLeadNew bcaLeadNew = bcaLeadNewRepository.save(bcaLead);
		Loger.log("bcaLeadNew ----Convert---------- Created ID-------------"+bcaLeadNew.getLeadID());
		return bcaLeadNew;
	}
	
	@Transactional
	public void removeLead(int id) {
		BcaLeadNew bcaLeadNew = bcaLeadNewRepository.findById(id).orElse(null);
		if (bcaLeadNew != null) {
			bcaLeadNew.setActive(0);
			bcaLeadNew.setDeleted(1);
			bcaLeadNew.setStatus("Deleted");
			bcaLeadNewRepository.save(bcaLeadNew);
		} else {
			Loger.log("ClientVendor not Found________________removeClientVendor");
		}
	}
	
	public List<LeadDirectoryDto> getAllLeadByDirectoryId(int directoryId) {
		List<Object[]> bcaLeadList = bcaLeadNewRepository.findAllLeadByDirectoryId(directoryId);
		List<LeadDirectoryDto> leadListDirectoryDto = transformToDto(bcaLeadList);
		return leadListDirectoryDto;
	}
	
	private List<LeadDirectoryDto> transformToDto(List<Object[]> bcaLeadList) {
		List<LeadDirectoryDto> leadListDirectoryDto = new ArrayList<LeadDirectoryDto>();
		for (Object[] leadObject: bcaLeadList) {
			LeadDirectoryDto leadDirectoryDto = new LeadDirectoryDto();
			String firstName = ""; 
			String middleName = "";
			String lastName = "";
			if (leadObject[0] != null)
				leadDirectoryDto.setLeadID(Integer.valueOf(leadObject[0].toString()));
			
			if (leadObject[1] != null)
				leadDirectoryDto.setSourceName(leadObject[1].toString());
			else 
				leadDirectoryDto.setSourceName("Not Specified");
			
			if (leadObject[2] != null)
				firstName = leadObject[2].toString();
			
			if (leadObject[3] != null)
				middleName = leadObject[3].toString();
			
			if (leadObject[4] != null)
				lastName = leadObject[4].toString();
			
			if (lastName != null && !lastName.isEmpty())
				leadDirectoryDto.setFullName(firstName+" "+middleName+" "+lastName);
			else 
				leadDirectoryDto.setFullName(firstName+" "+lastName);	
			
			if (leadObject[5] != null)
				leadDirectoryDto.setCompanyName(leadObject[5].toString());
			
			if (leadObject[6] != null)
				leadDirectoryDto.setAddress1(leadObject[6].toString());
			
			if (leadObject[7] != null)
				leadDirectoryDto.setAddress2(leadObject[7].toString());
			
			if (leadObject[8] != null)
				leadDirectoryDto.setCity(leadObject[8].toString());
			
			if (leadObject[9] != null)
				leadDirectoryDto.setState(leadObject[9].toString());
			
			if (leadObject[10] != null)
				leadDirectoryDto.setCountry(leadObject[10].toString());
			
			if (leadObject[11] != null)
				leadDirectoryDto.setZipCode(leadObject[11].toString());
			
			if (leadObject[12] != null)
				leadDirectoryDto.setDateAdded(leadObject[12].toString());
			
			if (leadObject[13] != null)
				leadDirectoryDto.setPhone(leadObject[13].toString());
			
			if (leadObject[14] != null)
				leadDirectoryDto.setCellPhone(leadObject[14].toString());
			
			if (leadObject[15] != null)
				leadDirectoryDto.setFax(leadObject[15].toString());
			
			if (leadObject[16] != null)
				leadDirectoryDto.setEmail(leadObject[16].toString());
			
			
			leadListDirectoryDto.add(leadDirectoryDto);
		}
		return leadListDirectoryDto;
	}
	
	public List<LeadDirectoryDto> getAllLeadDirectoryByCompanyId(Long companyID) {
		List<Object[]> bcaLeadList = bcaLeadNewRepository.getAllLeadDirectoryByCompanyId(companyID);
		List<LeadDirectoryDto> leadListDirectoryDto = transformToDto(bcaLeadList);
		return leadListDirectoryDto;
	}
}
