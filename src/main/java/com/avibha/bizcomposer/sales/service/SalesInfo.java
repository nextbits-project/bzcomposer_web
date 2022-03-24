package com.avibha.bizcomposer.sales.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.sales.dao.BCA_CCType;
import com.avibha.bizcomposer.sales.dao.BCA_CVCategory;
import com.avibha.bizcomposer.sales.dao.BCA_Location;
import com.avibha.bizcomposer.sales.dao.BCA_Message;
import com.avibha.bizcomposer.sales.dao.BCA_PaymentType;
import com.avibha.bizcomposer.sales.dao.BCA_ReceivedType;
import com.avibha.bizcomposer.sales.dao.BCA_SalesRep;
import com.avibha.bizcomposer.sales.dao.BCA_SalesTax;
import com.avibha.bizcomposer.sales.dao.BCA_Term;
import com.avibha.bizcomposer.sales.dao.BCA_Title;
import com.avibha.bizcomposer.sales.dao.BCA_UnitOfMeasure;
import com.avibha.bizcomposer.sales.repository.BCA_CCTypeRepository;
import com.avibha.bizcomposer.sales.repository.BCA_CVCategoryRepository;
import com.avibha.bizcomposer.sales.repository.BCA_LocationRepository;
import com.avibha.bizcomposer.sales.repository.BCA_MessageRepository;
import com.avibha.bizcomposer.sales.repository.BCA_PaymentTypeRepository;
import com.avibha.bizcomposer.sales.repository.BCA_ReceivedTypeRepository;
import com.avibha.bizcomposer.sales.repository.BCA_SalesRepRepository;
import com.avibha.bizcomposer.sales.repository.BCA_SalesTaxRepository;
import com.avibha.bizcomposer.sales.repository.BCA_ShipCarrierRepository;
import com.avibha.bizcomposer.sales.repository.BCA_TermRepository;
import com.avibha.bizcomposer.sales.repository.BCA_TitleRepository;
import com.avibha.bizcomposer.sales.repository.BCA_UnitOfMeasureRepository;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.bzcomposer.configuration.module.form.shipping.BCA_ShipCarrier;

/*
 * 
 */
@Service
public class SalesInfo {
	
	private BCA_TitleRepository bcaTitleRepository;
	private BCA_SalesRepRepository bcaSalesRepos;
	private BCA_CVCategoryRepository bcaCVCategory;
	private BCA_TermRepository bcaTermRepos;
	private BCA_LocationRepository bcaLocationRepos;
	private BCA_PaymentTypeRepository bcaPaymentTypeRepos;
	private BCA_ReceivedTypeRepository bcaReceivedTypeRepos;
	private BCA_CCTypeRepository bcaCCTypeRepository;
	private BCA_ShipCarrierRepository bcaShipRepository;
	private BCA_SalesTaxRepository bcaSalesTaxRepos;
	private BCA_MessageRepository bcaMsgRepository;
	private BCA_UnitOfMeasureRepository bcaUnitOfMsrRepository;
	
	@Autowired
	public SalesInfo(BCA_TitleRepository bca_TitleRepository, 
					 BCA_SalesRepRepository bcaSalesRep,
					 BCA_TermRepository bcaTermRepos,
					 BCA_LocationRepository bcaLocationRepos,
					 BCA_PaymentTypeRepository bcaPaymentTypeRepos,
					 BCA_ReceivedTypeRepository bcaReceivedTypeRepos,
					 BCA_CCTypeRepository bcaCCTypeRepository,
					 BCA_ShipCarrierRepository bcaShipRepository,
					 BCA_SalesTaxRepository bcaSalesTaxRepos,
					 BCA_MessageRepository bcaMsgRepository,
					 BCA_CVCategoryRepository bcaCVCategory,
					 BCA_UnitOfMeasureRepository bcaUnitOfMsrRepository) {
		super();
		this.bcaTitleRepository= bca_TitleRepository;
		this.bcaSalesRepos = bcaSalesRep;
		this.bcaCVCategory = bcaCVCategory;
		this.bcaTermRepos = bcaTermRepos;
		this.bcaLocationRepos = bcaLocationRepos;
		this.bcaPaymentTypeRepos = bcaPaymentTypeRepos;
		this.bcaReceivedTypeRepos = bcaReceivedTypeRepos;
		this.bcaCCTypeRepository = bcaCCTypeRepository;
		this.bcaShipRepository = bcaShipRepository;
		this.bcaSalesTaxRepos = bcaSalesTaxRepos;
		this.bcaMsgRepository = bcaMsgRepository;
		this.bcaUnitOfMsrRepository = bcaUnitOfMsrRepository;
	}

	private Logger logMsg = LoggerFactory.getLogger(SalesInfo.class);
	public ArrayList<BCA_Title> getCustomerTitle(String compId) {
		
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return (ArrayList<BCA_Title>) bcaTitleRepository.findAllByCompanyIdAndActive(companyId, 1);
		
	}

	public ArrayList<BCA_SalesRep> getSalesRep(String compId) {
		
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return (ArrayList<BCA_SalesRep>) bcaSalesRepos.findAllByCompanyIdAndActive(companyId,1);
	}

	public ArrayList<BCA_CVCategory> getCatType(String compId) {
		
		if(null == compId) compId="0";
		int companyId = Integer.valueOf(compId);
		return bcaCVCategory.findAllByCompanyIdAndActiveOrderByCvCategoryNameAsc(companyId, 1);
		
	}

	public ArrayList<BCA_Term> getTerms(String compId) {
		
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		
		return bcaTermRepos.findAllByCompanyIdAndActive(companyId,1);
	}

	public ArrayList<BCA_Location> getLocation(String compId) {
		
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return bcaLocationRepos.findAllByCompanyIdAndActive(companyId, 1);
	}

	public ArrayList<BCA_PaymentType> getPaymentType(String compId) {
	
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return (ArrayList<BCA_PaymentType>) bcaPaymentTypeRepos.findAllByCompanyIdAndActiveAndTypeCategoryOrderByPaymentTypeNameAsc(companyId, 1, 1);
	}

	public ArrayList<BCA_ReceivedType> getReceivedType(String compId) {

		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return  bcaReceivedTypeRepos.findAllByCompanyIdAndActiveAndTypeCategoryOrderByPaymentTypeNameAsc(companyId, 1, 1);
	}

	public ArrayList<BCA_CCType> getCreditCard(String compId) {

		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return  bcaCCTypeRepository.findAllByCompanyIdAndActive(companyId, 1);
	}

	public ArrayList<BCA_Message> getMessage(String compId) {
		
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return bcaMsgRepository.findAllByCompanyIdAndActive(companyId, 1);
		
	}

	public ArrayList<BCA_SalesTax> getTax(String compId) {
		
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return bcaSalesTaxRepos.findAllByCompanyIdAndActive(companyId, 1);
		
	}

	public ArrayList<BCA_ShipCarrier> getVia(String compId) {
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return bcaShipRepository.findAllByCompanyIdAndActive(companyId, 1);
	}
	
	public ArrayList<BCA_UnitOfMeasure> getUnitOfMeasure(String compId) {
		if(null == compId) compId="0";
		int companyId =Integer.parseInt(compId) ;
		return bcaUnitOfMsrRepository.findAllByCompanyIdAndActive(companyId, 1);
	}

	public boolean insertSalesData(String sNewID, String title, String oldVal, String newVal, String taxRateVal, String compId) {
		boolean valid = true;
		try {
			int companyId=0;
			if(null ==compId || compId == "") {
				compId ="0";
			}
			companyId =  Integer.valueOf(compId);
			if ("TAX".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Tax Details :"+SalesInfo.class.getName());
				BCA_SalesTax bcaSalesTax = new BCA_SalesTax();
				bcaSalesTax.setActive(1);
				bcaSalesTax.setCompanyId(companyId);
				bcaSalesTax.setSalesRate(Float.valueOf(taxRateVal));
				bcaSalesTax.setState(newVal);
				
				bcaSalesTaxRepos.save(bcaSalesTax);

			} else if ("CUSTOMER TITLE".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting customer title :"+SalesInfo.class.getName());
				
				BCA_Title titleObject = new BCA_Title();
				titleObject.setActive(1);
				titleObject.setTitle(newVal);
				titleObject.setCompanyId(companyId);
				bcaTitleRepository.save(titleObject);
				
			} else if ("REP".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Sales Rep :"+SalesInfo.class.getName());
				BCA_SalesRep salesRep = new BCA_SalesRep();
				salesRep.setActive(1);
				salesRep.setCompanyId(companyId);
				salesRep.setSalesRepname(newVal);
				bcaSalesRepos.save(salesRep);
				
			} else if ("TERMS".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Business Terms :"+SalesInfo.class.getName());
				BCA_Term bcaTerm = new BCA_Term();
				bcaTerm.setActive(1);
				bcaTerm.setBcaTermName(newVal);
				bcaTerm.setCompanyId(companyId);
				bcaTermRepos.save(bcaTerm);
				
			} else if ("MESSAGE".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Message :"+SalesInfo.class.getName());
				BCA_Message message = new  BCA_Message();
				message.setActive(1);;
				message.setCompanyId(companyId);
				message.setMessageName(newVal);
				bcaMsgRepository.save(message);
				
			} else if ("BUSINESS TYPE".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Business Type :"+SalesInfo.class.getName());
				BCA_CVCategory businessCategory = new BCA_CVCategory();
				businessCategory.setActive(1);
				businessCategory.setCompanyId(companyId);
				businessCategory.setCvCategoryName(newVal);
				bcaCVCategory.save(businessCategory);
				
			} else if ("LOCATION".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Location :"+SalesInfo.class.getName());
				BCA_Location location = new BCA_Location();
				location.setActive(1);
				location.setCompanyId(companyId);
				location.setLocationName(newVal);
				bcaLocationRepos.save(location);

			} else if ("PAYMENT TYPE".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Payment Type :"+SalesInfo.class.getName());
				BCA_PaymentType paymentType = new BCA_PaymentType();
				paymentType.setActive(1);
				paymentType.setPaymentTypeName(newVal);
				paymentType.setTypeCategory(1);
				paymentType.setCompanyId(companyId);
				bcaPaymentTypeRepos.save(paymentType);
				
			}
			else if ("RECEIVED TYPE".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Received Type :"+SalesInfo.class.getName());
				BCA_ReceivedType receivedType = new BCA_ReceivedType();
				receivedType.setCompanyId(companyId);
				receivedType.setPaymentTypeName(newVal);
				receivedType.setActive(1);
				receivedType.setTypeCategory(1);
				bcaReceivedTypeRepos.save(receivedType);

			} else if ("CREDIT CARD".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Credit Card Details :"+SalesInfo.class.getName());
				BCA_CCType ccType = new BCA_CCType();
				ccType.setActive(1);;
				ccType.setCompanyId(companyId);
				ccType.setCcTypeName(newVal);
				bcaCCTypeRepository.save(ccType);
				
			} else if ("SHIPPING VIA".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Shipping Details :"+SalesInfo.class.getName());
				BCA_ShipCarrier shipping = new BCA_ShipCarrier();
				shipping.setActive(1);
				shipping.setCompanyId(companyId);
				shipping.setShipCarrierName(newVal);
				bcaShipRepository.save(shipping);
			}else if ("UNIT OF MEASURE".equalsIgnoreCase(title)) {
				logMsg.debug("Inserting Unit Of Measure Details :"+SalesInfo.class.getName());
				BCA_UnitOfMeasure unitOfMeasure = new BCA_UnitOfMeasure();
				unitOfMeasure.setActive(1);
				unitOfMeasure.setCompanyId(companyId);
				unitOfMeasure.setUnitName(newVal);
				unitOfMeasure.setUseName(newVal);
				bcaUnitOfMsrRepository.save(unitOfMeasure);
			}
		} catch (Exception ee) {
			logMsg.debug("Error in"+SalesInfo.class.getName()+ ":updateSalesData() " + ee);
			valid=false;
		}
		logMsg.debug("Successfully Added Data "+SalesInfo.class.getName());
		return valid;
	}
	public boolean updateSalesData(String sNewID, String title, String oldVal, String newVal, String taxRateVal, String compId){
	
		boolean valid = false;
		try {
			int sNewvalID = Integer.parseInt(sNewID);
			if ("CUSTOMER TITLE".equalsIgnoreCase(title)) {
			Optional<BCA_Title> optional = bcaTitleRepository.findById(sNewvalID);
			
			BCA_Title bcaTitleFromDB = optional.get();
			bcaTitleFromDB.setTitle(newVal);
			logMsg.debug("Updating Customer Title : "+SalesInfo.class.getName()+ " title = "+newVal+" Where TitleId = "+sNewvalID);
			bcaTitleRepository.save(bcaTitleFromDB);
				
			}
			else if ("SHIPPING VIA".equalsIgnoreCase(title)) {
				Optional<BCA_ShipCarrier> optional = bcaShipRepository.findById(sNewvalID);
				BCA_ShipCarrier shipCarrierFromDb = optional.get();
				shipCarrierFromDb.setShipCarrierName(newVal);
				logMsg.debug("Updating Shipping Via : "+SalesInfo.class.getName()+ " name = "+newVal+" Where shipCarrierId = "+sNewvalID);
				bcaShipRepository.save(shipCarrierFromDb);
			}
			else if ("REP".equalsIgnoreCase(title)) {
				Optional<BCA_SalesRep> optional = bcaSalesRepos.findById(sNewvalID);
				BCA_SalesRep bcaSalesRepFromDb = optional.get();
				bcaSalesRepFromDb.setSalesRepname(newVal);
				logMsg.debug("Updating Sales Representative : "+SalesInfo.class.getName()+ " name = "+newVal+" Where SalesRepID = "+sNewvalID);
				bcaSalesRepos.save(bcaSalesRepFromDb);
				
			}
			else if ("TERMS".equalsIgnoreCase(title)) {
				Optional<BCA_Term> optional = bcaTermRepos.findById(sNewvalID);
				BCA_Term bcaTermFromDb = optional.get();
				bcaTermFromDb.setBcaTermName(newVal);
				logMsg.debug("Updating Term Data : "+SalesInfo.class.getName()+ " name = "+newVal+" Where TermID = "+sNewvalID);
				bcaTermRepos.save(bcaTermFromDb);
			}
			else if ("BUSINESS TYPE".equalsIgnoreCase(title)) {
				Optional<BCA_CVCategory> optional = bcaCVCategory.findById(sNewvalID);
				BCA_CVCategory cvcFromDb = optional.get();
				cvcFromDb.setCvCategoryName(newVal);
				logMsg.debug("Updating Business Data : "+SalesInfo.class.getName()+ " name = "+newVal+" Where CVCategoryID = "+sNewvalID);
				bcaCVCategory.save(cvcFromDb);
				
			}
			else if ("LOCATION".equalsIgnoreCase(title)) {
				Optional<BCA_Location> optional = bcaLocationRepos.findById(sNewvalID);
				BCA_Location locationFromDb = optional.get();
				locationFromDb.setLocationName(newVal);
				logMsg.debug("Updating Location Data : "+SalesInfo.class.getName()+ " name = "+newVal+" Where LocationID = "+sNewvalID);
				bcaLocationRepos.save(locationFromDb);
			}
			else if ("PAYMENT TYPE".equalsIgnoreCase(title)) {
				Optional<BCA_PaymentType> optional = bcaPaymentTypeRepos.findById(sNewvalID);
				BCA_PaymentType paymentFromDb = optional.get();
				paymentFromDb.setPaymentTypeName(newVal);
				logMsg.debug("Updating Payment Type Data : "+SalesInfo.class.getName()+ " name = "+newVal+" Where PaymentTypeID = "+sNewvalID);
				bcaPaymentTypeRepos.save(paymentFromDb);
			}
			else if ("RECEIVED TYPE".equalsIgnoreCase(title)) {
				Optional<BCA_ReceivedType> optional = bcaReceivedTypeRepos.findById(sNewvalID);
				BCA_ReceivedType receivedFromDb = optional.get();
				receivedFromDb.setPaymentTypeName(newVal);
				logMsg.debug("Updating Received Type Data : "+SalesInfo.class.getName()+ " name = "+newVal+" Where PaymentTypeID = "+sNewvalID);
				bcaReceivedTypeRepos.save(receivedFromDb);
			}
			else if ("CREDIT CARD".equalsIgnoreCase(title)) {
				Optional<BCA_CCType> optional = bcaCCTypeRepository.findById(sNewvalID);
				BCA_CCType ccTypeFromDb = optional.get();
				ccTypeFromDb.setCcTypeName(newVal);
				logMsg.debug("Updating CREDIT CARD Data : "+SalesInfo.class.getName()+ " name = "+newVal+" Where CCTypeID = "+sNewvalID);
				bcaCCTypeRepository.save(ccTypeFromDb);
				
			}
			else if ("MESSAGE".equalsIgnoreCase(title)) {
				Optional<BCA_Message> optional = bcaMsgRepository.findById(sNewvalID);
				BCA_Message msgFromDb = optional.get();
				msgFromDb.setMessageName(newVal);
				logMsg.debug("Updating MESSAGE Data : "+SalesInfo.class.getName()+ " Name = "+newVal+" Where MessageID = "+sNewvalID);
				bcaMsgRepository.save(msgFromDb);
			}
			else if ("TAX".equalsIgnoreCase(title)) {
				Optional<BCA_SalesTax> optional = bcaSalesTaxRepos.findById(sNewvalID);
				BCA_SalesTax salesTaxFromDb = optional.get();
				salesTaxFromDb.setState(newVal);
				salesTaxFromDb.setSalesRate(Float.valueOf(taxRateVal));
				logMsg.debug("Updating Tax Data : "+SalesInfo.class.getName()+ " State = "+newVal+ "and rate = "+taxRateVal +" where SalesTaxID= "+sNewvalID);
				bcaSalesTaxRepos.save(salesTaxFromDb);
			}else if ("UNIT OF MEASURE".equalsIgnoreCase(title)) {
				Optional<BCA_UnitOfMeasure> optional = bcaUnitOfMsrRepository.findById(sNewvalID);
				BCA_UnitOfMeasure unitOfMeasure = optional.get();
				unitOfMeasure.setActive(1);
				unitOfMeasure.setUnitName(newVal);
				unitOfMeasure.setUseName(newVal);
				logMsg.debug("Updating Unit Of Measure Data : "+SalesInfo.class.getName()+ " Name = "+newVal+" Where unitOfMeasureId = "+sNewvalID);
				bcaUnitOfMsrRepository.save(unitOfMeasure);
			}
		}catch (Exception ee) {
				logMsg.debug("Error"+SalesInfo.class.getName() +"in updateSalesData() " + ee);
				valid = false;
			}
		return valid;
	}
	public boolean DeleteSalesData(String sNewvalID, String title, String compId) {

		boolean valid = false;
		try {
			int idForDeletion = Integer.parseInt(sNewvalID);
			if ("CUSTOMER TITLE".equalsIgnoreCase(title)) {
				
				bcaTitleRepository.deleteById(idForDeletion);
				
			}else if ("SHIPPING VIA".equalsIgnoreCase(title)) {
				
				bcaShipRepository.deleteById(idForDeletion);
				
			}
			else if ("REP".equalsIgnoreCase(title)) {
				
				bcaSalesRepos.deleteById(idForDeletion);
				
			}else if ("TERMS".equalsIgnoreCase(title)) {
				
				bcaTermRepos.deleteById(idForDeletion);
				
			}else if ("BUSINESS TYPE".equalsIgnoreCase(title)) {
				
				bcaCVCategory.deleteById(idForDeletion);
				
			}else if ("LOCATION".equalsIgnoreCase(title)) {
				
				bcaLocationRepos.deleteById(idForDeletion);
				
			}else if ("PAYMENT TYPE".equalsIgnoreCase(title)) {
				
				bcaPaymentTypeRepos.deleteById(idForDeletion);
				
			}else if ("RECEIVED TYPE".equalsIgnoreCase(title)) {
				
				bcaReceivedTypeRepos.deleteById(idForDeletion);
				
			}else if ("CREDIT CARD".equalsIgnoreCase(title)) {
				
				bcaCCTypeRepository.deleteById(idForDeletion);
				
			}else if ("MESSAGE".equalsIgnoreCase(title)) {
				
				bcaMsgRepository.deleteById(idForDeletion);
				
			}else if ("TAX".equalsIgnoreCase(title)) {
				
				bcaSalesTaxRepos.deleteById(idForDeletion);
				
			}else if ("UNIT OF MEASURE".equalsIgnoreCase(title)) {
				
				bcaUnitOfMsrRepository.deleteById(idForDeletion);
				
			}
		}catch (Exception ee) {
			logMsg.debug("Error in"+SalesInfo.class.getName() +":updateSalesData() " + ee);
		}
		return valid;
	}
}
