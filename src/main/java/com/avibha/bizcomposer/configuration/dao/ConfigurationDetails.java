package com.avibha.bizcomposer.configuration.dao;

import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.configuration.forms.DesignFeatureDto;
import com.avibha.common.utility.CountryState;
import com.nxsol.bzcomposer.company.repos.BcaFootnoteRepository;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * This class contains methods to save,delete,update configuration related
 * information (i.e:- footnote,all configuration records).
 */
@Service
public class ConfigurationDetails {

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private ConfigurationInfo cinfo;

	@Autowired
	private CountryState conState;

	// Invoke all the configuration related information (i.e:-
	// invenroty,sales,purchase,etc).
	public void getConfigurationInfo(HttpServletRequest request, ConfigurationDto configDto) {
//        ConfigurationInfo configInfo = new ConfigurationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		/* For the label list */
		request.setAttribute("Labels", configInfo.labelInfo());

		/* For the user group list */
		request.setAttribute("UserGroup", configInfo.userGroupInfo(compId));

		/* For country list */
		// CountryState conState = new CountryState();
		request.setAttribute("CountryList", conState.getCountry());

		/* For invoice style List */
		request.setAttribute("InvStyle", configInfo.invoiceStyleList());

		/* For Footnote List */
		request.setAttribute("Footnote", configInfo.footnoteList(compId));

		/* For Job Code List */
		request.setAttribute("JobCodeDetail", configInfo.jobCodeList(compId));

		/* For sales tax List */
		request.setAttribute("SalesTax", configInfo.salesTaxList(compId));

		/* For service type List */
		request.setAttribute("ServiceType", configInfo.serviceTypeList(request));
		configInfo.getCongurationRecord(compId, configDto, request);

	}
	
	
	

	/*
	 * Invoke the existing footnotes information (i.e:- footnot list & description).
	 */
	public void newFootnote(HttpServletRequest request, ConfigurationDto configDto) {
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		cinfo.footnoteDetails(request);
		configDto.setFootnote(0);
		configDto.setDesc("");
		request.setAttribute("Footnote", cinfo.footnoteList((String) request.getSession().getAttribute("CID")));
	}

	/*
	 * Delete the existing,user selected footnote & the related information.
	 */
	public void deleteFootnote(HttpServletRequest request, ConfigurationDto configDto) {
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean isDeleted = cinfo.deleteFootnote(configDto, (String) request.getSession().getAttribute("CID"));
		String msg = "";
		if (isDeleted == true) {
			msg = "Footnote is successfully deleted";
		} else {
			msg = "Footnote is not deleted";
		}
		newFootnote(request, configDto);
		request.setAttribute("Status", msg);
	}

	/*
	 * Save the user entered footnote& related information to the database.
	 */
	public void saveFootnote(HttpServletRequest request, ConfigurationDto configDto) {
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean isSaved = cinfo.saveFootnote(configDto,
				Long.parseLong((String) request.getSession().getAttribute("CID")), request.getParameter("FootName"));
		String msg = "";
		if (isSaved) {
			msg = "Footnote is successfully saved";
		} else {
			msg = "Footnote is not saved";
		}
		newFootnote(request, configDto);
		request.setAttribute("Status", msg);
	}

	/*
	 * Update the user selected footnote & its related information
	 */
	public void updateFootnote(HttpServletRequest request, ConfigurationDto configDto) {
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean isUpdated = cinfo.updateFootnote(configDto,
				Long.parseLong((String) request.getSession().getAttribute("CID")));

		String msg = "";
		if (isUpdated) {
			msg = "Footnote is successfully updated";
		} else {
			msg = "Footnote is not updated";
		}
		newFootnote(request, configDto);
		request.setAttribute("Status", msg);
	}

	/*
	 * Saves the all configuration records (i.e:- networking,sales,purchase,etc.) to
	 * the database.
	 */
	public void saveRecords(ConfigurationDto configDto, HttpServletRequest request, int multiUserConnection) {
		configDto.setMultiUserConnection(multiUserConnection);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));
		cinfo.saveConfigurationRecord(configDto, compId, request);
	}

	public void saveInvoiceStyle(ConfigurationDto configDto, String[] ActiveInvoiceStylelists,
			String[] DeActiveInvoiceStylelists) {
		configDto.setListOfActiveInvoiceStyle(ActiveInvoiceStylelists);
		configDto.setListOfDeActiveInvoiceStyle(DeActiveInvoiceStylelists);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		cinfo.saveformCustomization(configDto);
	}

	public void saveRecordsGeneral(ConfigurationDto configDto, HttpServletRequest request) {
		configDto.setSalesOrderBoard(request.getParameter("salesOrderBoard"));
		configDto.setItemReceivedBoard(request.getParameter("itemReceivedBoard"));
		configDto.setItemShippedBoard(request.getParameter("itemShippedBoard"));
		configDto.setPoboard(request.getParameter("poboard"));
		configDto.setCurrencyID(Integer.parseInt(request.getParameter("currencyID")));
		configDto.setWeightID(Integer.parseInt(request.getParameter("weightID")));

		configDto.setFilterOption(request.getParameter("filterOption"));
		configDto.setDefaultLabelID(Integer.parseInt(request.getParameter("defaultLabelID")));
		// configDto.setListOfExistingModules1(request.getParameter("moduleslist").split(","));
		configDto.setModuleID(Integer.parseInt(request.getParameter("moduleID")));
		configDto.setMailServer(request.getParameter("mailServer"));
		configDto.setSenderEmail(request.getParameter("senderEmail"));
		configDto.setMailUserName(request.getParameter("mailUserName"));
		configDto.setMailPassword(request.getParameter("mailPassword"));
		configDto.setShowUSAInBillShipAddress(Boolean.parseBoolean(request.getParameter("showUSAInBillShipAddress")));
		configDto.setMultiUserConnection(Integer.parseInt(request.getParameter("multiUserConnection")));
		
		configDto.setLeadsIsActive("on".equals(request.getParameter("leads")) ? 1 : 0);
		
		configDto.setInvoiceIsActive("on".equals(request.getParameter("invoice")) ? 1 : 0);
		configDto.setEstimationIsActive("on".equals(request.getParameter("estimation")) ? 1 : 0);
		configDto.setSalesOrderIsActive("on".equals(request.getParameter("salesOrder")) ? 1 : 0);
		configDto.setRmaIsActive("on".equals(request.getParameter("rma")) ? 1 : 0);
		configDto.setDataManagarIsActive("on".equals(request.getParameter("dataManagar")) ? 1 : 0);
		
		configDto.setContactIsActive("on".equals(request.getParameter("contact")) ? 1 : 0);
		configDto.setOpportunitiesIsActive("on".equals(request.getParameter("opportunities")) ? 1 : 0);
		configDto.setCalendarIsActive("on".equals(request.getParameter("calendar")) ? 1 : 0);
		configDto.setEventsIsActive("on".equals(request.getParameter("events")) ? 1 : 0);
	
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		
		cinfo.saveConfigurationRecordGeneral(configDto, request);
	}

	public void saveRecordsEstimation(ConfigurationDto configDto, HttpServletRequest request) {
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));
		cinfo.saveConfigurationRecordEstimation(configDto, compId);
	}

	public void saveRecordsBilling(ConfigurationDto configDto, HttpServletRequest request, String printValue,
			String mailCust, String showCombinedBilling) {
		configDto.setShowCombinedBilling(showCombinedBilling);
		configDto.setPrintBills(printValue);
		configDto.setMailToCustomer(mailCust);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));
		cinfo.saveConfigurationRecordBilling(configDto, compId);
	}

	public void addRMAReason(ConfigurationDto configDto, String companyID, String reason, int parentReasonID) {
		configDto.setReason(reason);
		configDto.setParentReasonId(parentReasonID);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveRMAReason(configDto, compId);
		if (saved) {
			System.out.println("Reason Added Successfully...");
		} else {
			System.out.println("Error in addRMAReason!!!!!");
		}
	}

	public void deleteRMAReason(ConfigurationDto configDto, String reason, int parentReasonID) {
		configDto.setReason(reason);
		configDto.setParentReasonId(parentReasonID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteRMAReason(configDto);
		if (saved) {
			System.out.println("Reason Deleted Successfully...");
		} else {
			System.out.println("Error in deleteRMAReason!!!!!");
		}
	}

	public void updateMAReason(ConfigurationDto configDto, String reason, int reasonId, int parentReasonID) {
		configDto.setReasonId(reasonId);
		configDto.setReason(reason);
		configDto.setParentReasonId(parentReasonID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateRMAReason(configDto);
		if (saved) {
			System.out.println("Reason Updated Successfully...");
		} else {
			System.out.println("Error in updateRMAReason!!!!!");
		}
	}

	public void saveDefaultBank(ConfigurationDto configDto, HttpServletRequest request) {
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean updated = cinfo.saveDefaultBankDetails(configDto, compId);
		if (updated) {
			System.out.println("Bank Updated Successfully...");
		} else {
			System.out.println("Error in SavingDefaultBankDetails!!!!!");
		}
	}

	public void saveRecordsInventorySettings(ConfigurationDto configDto, HttpServletRequest request) {
		configDto.setShowReorderPointWarning(request.getParameter("showReorderPointWarning"));
		configDto.setReservedQuantity(request.getParameter("reservedQuantity"));
		configDto.setSalesOrderQty(request.getParameter("salesOrderQty"));
		configDto.setProductTaxable(request.getParameter("productTaxable"));
		configDto.setProductCategoryID(Integer.parseInt(request.getParameter("productCategoryID")));
		configDto.setReorderPoint(Integer.parseInt(request.getParameter("reorderPoint")));

//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean saved = cinfo.saveConfigurationRecordInventorySetting(configDto, compId);
		if (saved) {
			System.out.println("Record Saved Successfully...");
		} else {
			System.out.println("Error in saveRecordsInventorySettings!!!!!");
		}
	}

	public void saveFinanceCharges(ConfigurationDto configDto, HttpServletRequest request, String companyID,
			String assetFinanceChargeStatus) {
		configDto.setAssessFinanceCharge(assetFinanceChargeStatus);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean saved = cinfo.saveFinanceCharges(configDto, compId);
		if (saved) {
			System.out.println("Finance Charges Saved Successfully...");
		} else {
			System.out.println("Error in saveFinanceCharges!!!!!");
		}

	}

	public void saveAccountPaymentDetails(ConfigurationDto configDto, HttpServletRequest request, String companyID) {
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean saved = cinfo.saveAccountPaymentDetails(configDto, compId);
		if (saved) {
			System.out.println("Payment Details Updated Successfully...");
		} else {
			System.out.println("Error in saveAccountPaymnetDetails!!!!!");
		}

	}

	public void savePerformance(ConfigurationDto configDto, HttpServletRequest request, String companyID) {
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean saved = cinfo.savePerformance(configDto, compId);
		if (saved) {
			System.out.println("Performance Updated Successfully...");
		} else {
			System.out.println("Error in saveAccountPaymnetDetails!!!!!");
		}
	}

	public void saveDashboardSetting(ConfigurationDto configDto, HttpServletRequest request, String companyID,
			String salesOrder, String itemReceived, String itemShipped, String poBoard) {
		configDto.setSalesOrderBoard(salesOrder);
		configDto.setItemReceivedBoard(itemReceived);
		configDto.setItemShippedBoard(itemShipped);
		configDto.setPoboard(poBoard);

//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean saved = cinfo.saveDashboard(configDto, compId);
		if (saved) {
			System.out.println("Dashboard Updated Successfully...");
		} else {
			System.out.println("Error in saveDashboardSetting!!!!!");
		}
	}

	public void saveReminderSetting(ConfigurationDto configDto, HttpServletRequest request, String companyID,
			String showReminderStatus) {
		configDto.setShowReminder(showReminderStatus);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		Long compId = Long.valueOf((String) request.getSession().getAttribute("CID"));
		boolean saved = cinfo.saveReminder(configDto, compId);
		if (saved) {
			System.out.println("Reminder Details Updated Successfully...");
		} else {
			System.out.println("Error in saveDashboardSetting!!!!!");
		}
	}

	public String saveCustomerInvoiceSetting(ConfigurationDto configDto, HttpServletRequest request, String companyID) {
		/*
		 * File fileUpload; String fileUploadContentType; String fileUploadFileName;
		 * HttpServletRequest servletRequest; File path = (File)
		 * configDto.getInvoiceLocation(); String locationPath = path.getAbsolutePath();
		 * File logoPath = configDto.getSaveImage(); String logo =
		 * logoPath.getAbsolutePath(); String filePath =
		 * request.getSession().getServletContext().getRealPath("logoPath");
		 */
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveCustomerInvoice(configDto, Long.valueOf(companyID));
		if (saved) {
			System.out.println("CustomerInvoice Details Updated Successfully...");
			return "200";
		} else {
			System.out.println("Error in saveCustomerInvoiceSetting!!!!!");
			return "404";
		}
	}

	public void addNewDescription(ConfigurationDto configDto, String companyID, String description) {
		configDto.setDescription(description);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveDescription(configDto, compId);
		if (saved) {
			System.out.println("Description Added Successfully...");
		} else {
			System.out.println("Error in addNewDescription!!!!!");
		}
	}

	public void deleteLocation(String companyID, int descriptionID) {
		// configDto.setDescription(descriptionID);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteLocation(descriptionID, compId);
		if (saved) {
			System.out.println("Description Deleted Successfully...");
		} else {
			System.out.println("Error in deleteDescription!!!!!");
		}
	}

	public void updateDescription(ConfigurationDto configDto, String companyID, String description, String locationID) {
		configDto.setDescription(description);
		Long compId = Long.valueOf(companyID);
		int locationId = Integer.parseInt(locationID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateDescription(configDto, compId, locationId);
		if (saved) {
			System.out.println("Description updated Successfully...");
		} else {
			System.out.println("Error in updateDescription!!!!!");
		}
	}

	public void addNewMessage(ConfigurationDto configDto, String companyID, String description) {
		configDto.setDescription(description);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveMessage(configDto, compId);
		if (saved) {
			System.out.println("Message Added Successfully...");
		} else {
			System.out.println("Error in addNewMessage!!!!!");
		}
	}

	public void addNewSalesRep(ConfigurationDto configDto, String companyID, String description) {
		configDto.setDescription(description);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveSalesRep(configDto, compId);
		if (saved) {
			System.out.println("SalesRepresentative Added Successfully...");
		} else {
			System.out.println("Error in addNewSalesRep!!!!!");
		}
	}

	public void addNewTerm(ConfigurationDto configDto, String companyID, String term, int days) {
		configDto.setDescription(term);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveNewTerm(configDto, compId, days);
		if (saved) {
			System.out.println("Term Added Successfully...");
		} else {
			System.out.println("Error in addNewTerm!!!!!");
		}
	}

	public void addNewSalesTax(ConfigurationDto configDto, String companyID, String term, float tax) {
		configDto.setDescription(term);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveNewSalesTax(configDto, compId, tax);
		if (saved) {
			System.out.println("SalesTax Added Successfully...");
		} else {
			System.out.println("Error in addNewSalesTax!!!!!");
		}
	}

	public void addNewCreditTerms(ConfigurationDto configDto, String companyID, String term, int days,
			String isDefault) {
		configDto.setDescription(term);
		configDto.setIsDefaultCreditTerm(isDefault);
		Long compId = Long.valueOf(companyID);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveNewCreditTerms(configDto, compId, days);
		if (saved) {
			System.out.println("CreditTerm Added Successfully...");
		} else {
			System.out.println("Error in addNewCreditTerms!!!!!");
		}
	}

	public void updateMessage(ConfigurationDto configDto, String companyID, String message, String messageId) {
		configDto.setDescription(message);
		Long compId = Long.valueOf(companyID);
		int messageID = Integer.parseInt(messageId);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateMessage(configDto, compId, messageID);
		if (saved) {
			System.out.println("Message updated Successfully...");
		} else {
			System.out.println("Error in updateMessage!!!!!");
		}
	}

	public void updateSalesRep(ConfigurationDto configDto, String companyID, String salesRep, String salesRepId) {
		configDto.setDescription(salesRep);
		Long compId = Long.valueOf(companyID);
		int salesRepID = Integer.parseInt(salesRepId);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateSalesRep(configDto, compId, salesRepID);
		if (saved) {
			System.out.println("Sales Representative updated Successfully...");
		} else {
			System.out.println("Error in updateSalesRep!!!!!");
		}
	}

	public void updateTerm(ConfigurationDto configDto, String companyID, String term, String termId, int days) {
		configDto.setDescription(term);
		Long compId = Long.valueOf(companyID);
		int termID = Integer.parseInt(termId);
//		ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateTerm(configDto, compId, termID, days);
		if (saved) {
			System.out.println("Description updated Successfully...");
		} else {
			System.out.println("Error in updateTerm!!!!!");
		}
	}

	public void updateSalesTax(ConfigurationDto configDto, String companyID, String salesTax, String salesTaxId,
			float tax) {
		configDto.setDescription(salesTax);
		Long compId = Long.valueOf(companyID);
		int salesTaxID = Integer.parseInt(salesTaxId);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateSalesTax(configDto, compId, salesTaxID, tax);
		if (saved) {
			System.out.println("SalesTax updated Successfully...");
		} else {
			System.out.println("Error in updateSalesTax!!!!!");
		}
	}

	public void updateCreditTerm(ConfigurationDto configDto, String companyID, String creditTerm, String creditTermId,
			String isDefault, String Days) {
		configDto.setDescription(creditTerm);
		configDto.setIsDefaultCreditTerm(isDefault);
		Long compId = Long.valueOf(companyID);
		int creditTermID = Integer.parseInt(creditTermId);
		int days = Integer.parseInt(Days);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateCreditTerm(configDto, compId, creditTermID, days);
		if (saved) {
			System.out.println("CreditTerm updated Successfully...");
		} else {
			System.out.println("Error in updateCreditTerm!!!!!");
		}
	}

	public void deleteMessage(String companyID, int messageID) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteMessage(compId, messageID);
		if (saved) {
			System.out.println("Message Deleted Successfully...");
		} else {
			System.out.println("Error in deleteMessage!!!!!");
		}
	}

	public void deleteSalesRep(ConfigurationDto configDto, String companyID, int salesRepId) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteSalesRep(compId, salesRepId);
		if (saved) {
			System.out.println("Sales Representative Deleted Successfully...");
		} else {
			System.out.println("Error in deleteSalesRep!!!!!");
		}
	}

	public void deleteTerm(String companyID, int termId) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteTerm(compId, termId);
		if (saved) {
			System.out.println("Term Deleted Successfully...");
		} else {
			System.out.println("Error in deleteTerm!!!!!");
		}
	}

	public void deleteSalesTax(String companyID, int salesTaxId) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteSalesTax(compId, salesTaxId);
		if (saved) {
			System.out.println("SalesTax Deleted Successfully...");
		} else {
			System.out.println("Error in deleteSalesTax!!!!!");
		}
	}

	public void deleteCreditTerm(String companyID, int creditTermId) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteCreditTerm(compId, creditTermId);
		if (saved) {
			System.out.println("Term Deleted Successfully...");
		} else {
			System.out.println("Error in deleteCreditTerm!!!!!");
		}
	}

	public void insertRefundReason(String companyID, String refundReason) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.insertRefundReason(compId, refundReason);
		if (saved) {
			System.out.println("Refund Reason Added Successfully...");
		} else {
			System.out.println("Error in insertRefundReason!!!!!");
		}
	}

	public void updateRefundReason(String companyID, int refundReasonId, String newRefundReason) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateRefundReason(compId, refundReasonId, newRefundReason);
		if (saved) {
			System.out.println("Refund Reason Updated Successfully...");
		} else {
			System.out.println("Error in updateRefundReason!!!!!");
		}
	}

	public void deleteRefundReason(String companyID, int refundReasonId) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteRefundReason(compId, refundReasonId);
		if (saved) {
			System.out.println("Refund Reason Deleted Successfully...");
		} else {
			System.out.println("Error in deleteRefundReason!!!!!");
		}
	}

	public boolean setDefaultRefundReason(int reasonID, String companyID) {
		Long compId = Long.valueOf(companyID);

		// ConfigurationInfo cinfo = new ConfigurationInfo();
		return cinfo.setDefaultRefundReason(reasonID, compId);
	}

	public void addJobCategory(ConfigurationDto configDto, String companyID, String jobCategory) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.addJobCategory(configDto, compId, jobCategory);
		if (saved) {
			System.out.println("JobCategory Added Successfully...");
		} else {
			System.out.println("Error in addJobCategory!!!!!");
		}
	}

	public void updateJobCategory(ConfigurationDto configDto, String companyID, int jobCategoryId,
			String newJobCategoryName) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.updateJobCategory(configDto, compId, jobCategoryId, newJobCategoryName);
		if (saved) {
			System.out.println("JobCategory Updated Successfully...");
		} else {
			System.out.println("Error in updateJobCategory!!!!!");
		}
	}

	public void deleteJobCategory(String companyID, int jCategoryId) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.deleteJobCategory(jCategoryId, compId);
		if (saved) {
			System.out.println("JobCategory Deleted Successfully...");
		} else {
			System.out.println("Error in deleteJobCategory!!!!!");
		}
	}

	public void editServiceBillInfo(int jCategoryId, ConfigurationDto configDto, String companyID, String billName,
			String recurringServiceBill) {
		configDto.setRecurringServiceBill(recurringServiceBill);
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.editServiceBillInfo(jCategoryId, configDto, billName, compId);
		if (saved) {
			System.out.println("JobCategory Deleted Successfully...");
		} else {
			System.out.println("Error in editServiceBillInfo!!!!!");
		}
	}

	public void saveVendorPurchaseValues(ConfigurationDto configDto, String companyID) {
		Long compId = Long.valueOf(companyID);
		// ConfigurationInfo cinfo = new ConfigurationInfo();
		boolean saved = cinfo.saveVendorPurchaseValuesInConfigInfo(configDto, compId);
		if (saved) {
			System.out.println("VendorPurchaseValues Saved Successfully...");
		} else {
			System.out.println("Error in saveVendorPurchaseValues!!!!!");
		}
	}
	
	public void saveDesignFeature(DesignFeatureDto configDto, String companyID) {
		Long compId = Long.valueOf(companyID);
		boolean saved = true;
		//boolean saved = cinfo.saveVendorPurchaseValuesInConfigInfo(configDto, compId);
		if (saved) {
			System.out.println("Design And Feature Saved Successfully...");
		} else {
			System.out.println("Error in Design And Feature!!!!!");
		}
	}
}
