package com.avibha.bizcomposer.configuration.actions;

import com.avibha.bizcomposer.File.dao.CompanyInfo;
import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.avibha.bizcomposer.configuration.dao.ConfigurationDetails;
import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.configuration.forms.DeductionListDto;
import com.avibha.bizcomposer.employee.forms.CompanyTaxOptionDto;
import com.avibha.bizcomposer.employee.forms.StateIncomeTaxDto;
import com.avibha.bizcomposer.employee.forms.StateTaxOtherDto;
import com.avibha.bizcomposer.purchase.dao.VendorCategory;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.common.utility.CountryState;
import com.nxsol.bizcomposer.accounting.action.CategoryManagerController;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.TblBudgetCategory;
import com.nxsol.bizcomposer.common.TblCategoryType;
import com.nxsol.bizcompser.global.table.TblCategory;
import com.nxsol.bzcomposer.company.AddNewCompanyDAO;
import com.nxsol.bzcomposer.company.ConfigurationDAO;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;
import org.apache.struts.action.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * @author sarfrazmalik
 */
@Controller
public class ConfigurationController {

    private String pageActiveTab = "pageActiveTab";

    @RequestMapping(value = {"/Configuration"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String execute(ConfigurationDto configDto, CompanyInfoDto companyInfoDto, HttpServletRequest request, Model model) throws IOException, ServletException {
        String forward = "/configuration/configuration";
        String action = request.getParameter("tabid");
        System.out.println("-------ConfigurationController---------tabid: " + action);

        HttpSession session = request.getSession();
        //line added from this
        String companyID = (String) session.getAttribute("CID");
        String emailAddress = (String) session.getAttribute("Email_Address");
        ConstValue c = new ConstValue();
        c.setCompanyId(Integer.parseInt(companyID));
        ActionErrors e = new ActionErrors();
        //till this
        if (session.getAttribute("currentLocale") == null) {
            session.setAttribute("currentLocale", "en");
        }

        /* Provide the all the configuration information about application */
        if (action.equalsIgnoreCase("config")) {
			 /*ConfigurationDetailsDao cDetails = new ConfigurationDetailsDao();
			 cDetails.getConfigurationInfo(request, configDto);*/
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);

            ReceivableLIst rl = new ReceivableListImpl();
            request.setAttribute("PaymentTypeForCombo", rl.getPaymentType());

            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getDetails(companyID, request, configDto);
            dao.getModulesName(configDto);
            dao.getWeight(companyID, configDto);
            dao.getModules(companyID, request, configDto);
            dao.getSelectedModules(companyID, request, configDto);
            dao.getPaymentType(companyID, request, configDto);
            dao.getActiveTemplates(1, request, configDto);

            request.setAttribute("isSOBChecked", configDto.getSalesOrderBoard());
            request.setAttribute("isIRBChecked", configDto.getItemReceivedBoard());
            request.setAttribute("isPOBChecked", configDto.getPoboard());
            request.setAttribute("isISBChecked", configDto.getItemShippedBoard());
            request.setAttribute("isSelectedWeightID", configDto.getWeightID());

            int userID = (Integer) request.getSession().getAttribute("userID");
            CompanyInfo customer = new CompanyInfo();
            AddNewCompanyDAO companyDAO = new AddNewCompanyDAO();
            companyDAO.getBusinessType(companyID, request, companyInfoDto);
            customer.SearchCompany(companyID, userID, companyInfoDto, request);

            CountryState cs = new CountryState();
            request.setAttribute("countryList", cs.getCountryList());
            request.setAttribute("stateList", cs.getStateList(companyInfoDto.getCountryId()+""));
            request.setAttribute("cityList", cs.getCityList(companyInfoDto.getStateId()+""));
            model.addAttribute("companyInfoDto", companyInfoDto);

            //Admin-Security-Data
            configInfo.getAdministratorDetails(companyID, configDto, emailAddress);
            request.setAttribute("UserName", configDto.getEmailAddress());
            request.setAttribute("Password", configDto.getPassword());
            request.setAttribute("Role", session.getAttribute("Role"));
            request.setAttribute("membershipLevel", dao.getmembershipLevel(companyID, request));
            request.setAttribute("userSize", dao.getNumberOfUser(companyID, request, configDto));
            request.setAttribute("AdminPassword", dao.checkPassword(companyID, request));
            dao.getUserListDetails(companyID, request, configDto);
            dao.getUserGroup(companyID, request, configDto);

            setConfigActiveTab(session, "generalTab");
            System.out.println("goes to generalUpdated page......................");
            forward = "/configuration/generalUpdated";
        }
        else if (action.equalsIgnoreCase("configModule")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getInvoiceStyle(companyID, request, configDto);
            dao.getInvoiceStyle1(companyID, request, configDto);
            dao.getModules(companyID, request, configDto);

            setConfigActiveTab(session, "moduleTab");
            System.out.println("goes to configModule page......................");
            forward = "/configuration/modules";
        }
        else if (action.equalsIgnoreCase("config1")) {
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            request.getSession().setAttribute("CID", companyID);

            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getCountry(companyID, request, configDto);
            dao.getShipping(companyID, request, configDto);
            dao.getTerm(companyID, request, configDto);
            dao.getPaymentType(companyID, request, configDto);
            dao.getInvoiceStyle(companyID, request, configDto);
            dao.getCustomerGroup(configDto);
            dao.getStates("2", configDto);

            dao.getSalesRepresentative(companyID, request, configDto);
            dao.getMessages(companyID, request, configDto);
            dao.getJobTitle(request, configDto, companyID);
            dao.getExistingLocation(companyID, request, configDto);
            dao.getSalesTax(companyID, request, configDto);
            dao.getCreditTerm(companyID, request, configDto);
            dao.getRefundReason(companyID, request, configDto);
            System.out.println("goes to general page......................");
            forward = "success2";
        }
        else if (action.equalsIgnoreCase("addNewGroup")) {
            ConfigurationDAO dao = new ConfigurationDAO();
//            dao.getAccessPermissions(companyID,request,configDto);
//            dao.getUserGroup(companyID, request, configDto);
            if (request.getParameter("selectedGroupId") != null) {
                dao.getUserGroupDetails(request.getParameter("selectedGroupId"), configDto);
            }
            request.setAttribute("isViewGroupPermissions", request.getParameter("isViewGroupPermissions"));
            forward = "/configuration/newGroup";
        }
        else if (action.equalsIgnoreCase("deleteGroup")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.deleteUserGroupDetails(request.getParameter("selectedGroupId"));
            forward = "redirect:Configuration?tabid=config&tab=tr2";
        }
        else if (action.equalsIgnoreCase("deleteUser")) {
            String selectedUserId = request.getParameter("selectedUserId");
            String userGroupId = request.getParameter("userGroupId");
            ConfigurationDAO dao = new ConfigurationDAO();
            boolean check = dao.deleteSelectedUser(selectedUserId, userGroupId, companyID);
            forward = "redirect:Configuration?tabid=config&tab=tr2";
        }
        else if (action.equalsIgnoreCase("saveJobTitle")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            String jobTitle = request.getParameter("jobTitle");
            //System.out.println("Entered JobTitle:"+jobTitle);
            String op = request.getParameter("operation");
            //System.out.println("Performing operation:"+op);

            if (op.equals("add")) {
                dao.saveJobTitle(companyID, request, configDto, jobTitle);
            } else if (op.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("titleId"));
                dao.editJobTitle(companyID, request, configDto, jobTitle, id);
            } else if (op.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("titleId"));
                dao.deleteJobTitle(companyID, request, configDto, id);
            }
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            ConfigurationDAO dao1 = new ConfigurationDAO();
            dao.getCountry(companyID, request, configDto);
            dao.getStates("2", configDto);
            dao.getJobTitle(request, configDto, companyID);
            forward = "redirect:Configuration?tabid=config11&&tab=tr11";
        }
        else if (action.equalsIgnoreCase("NewUser")) {
            forward = "addNewUser";
        }
        else if (action.equalsIgnoreCase("addDays")) {
			 /*ConfigurationDetailsDao configDetails = new ConfigurationDetailsDao();
			 configDetails.getConfigurationInfo(request,configDto);*/
            //System.out.println("inside addDays method........");
            forward = "success2";
            //System.out.println("goes to div2 page......................");
        }
        else if (action.equalsIgnoreCase("config2")) {
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            request.getSession().setAttribute("CID", companyID);

            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getActiveTemplates(1, request, configDto);
            //dao.getActiveTemplates(request, configDto);

            dao.getActiveMailType(request, configDto);
            dao.getActivePackageSize(request, configDto);
            dao.getActiveContainer(request, configDto);

            dao.getUPSUserDetails(companyID, request, configDto);
            dao.getUSPSUserDetails(companyID, request, configDto);
            dao.getFedExUserDetails(companyID, request, configDto);

            //dao.getUserDefinedShippingRateAndPrice(request, configDto);
            //System.out.println("goes to div2 page......................");
            forward = "success3";
        }
        else if (action.equalsIgnoreCase("config30")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            int sId = Integer.parseInt(request.getParameter("shippingCarrierId"));
            dao.getActiveMailType(request, configDto);
            dao.getActivePackageSize(request, configDto);
            dao.getActiveContainer(request, configDto);
            dao.getActiveRealTimeShippingServices(0, request, configDto);
            dao.getActiveRealTimeShippingServices(1, request, configDto);
            dao.getActiveRealTimeShippingServices(2, request, configDto);
            dao.getActiveUserdefinedShippingType(companyID, request, configDto);

            dao.getUserDefinedShippingWeightAndPrice(sId, request, configDto);
            forward = "success3";
        }
        else if (action.equalsIgnoreCase("con")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getMasterReason(configDto);
            int templateId = Integer.parseInt(request.getParameter("templateId"));
            System.out.println("Selected Template ID:" + templateId);
            dao.getActiveTemplates(templateId, request, configDto);
            /*forward="success33";*/
            forward = "success11";
            System.out.println("goes to emailTemplate page with data");
        }
        else if (action.equalsIgnoreCase("config3")) {
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            request.getSession().setAttribute("CID", companyID);
            //System.out.println("selected companyId is:"+companyID);
            ConfigurationDAO dao = new ConfigurationDAO();
            //Set<configurationForm> s = dao.getPaymentGateways(companyID,request,configDto);
            dao.getPaymentGateways(companyID, request, configDto);
            ArrayList<ConfigurationDto> s = dao.getAllCreditCards(0, request, configDto, companyID);
            dao.getAllCreditCardsType(0, request, configDto, companyID);
            dao.getAllPayemntTypeId(request, configDto, companyID);
            dao.geteSalesStore(request, configDto, companyID);
            dao.getStoreTypes(request, configDto);

            dao.geteBayCategories(request, configDto);
			/* ArrayList <configurationForm> s1 = new ArrayList<>();
			 System.out.println("List Size:"+s.size());
			 s1.add(s.get(2));*/
            //request.setAttribute("List", s);
            //System.out.println("goes to div3 page......................");
            forward = "success4";
        }
        else if (action.equalsIgnoreCase("config4")) {
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            forward = "success5";
            //System.out.println("goes to div4 page......................");

        }
        else if (action.equalsIgnoreCase("config5")) {
            //System.out.println("Inside config5 condition");
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            request.getSession().setAttribute("CID", companyID);
            //System.out.println("selected companyId is:"+companyID);
            ConfigurationDAO dao = new ConfigurationDAO();
            //Set<configurationForm> s = dao.getPaymentGateways(companyID,request,configDto);
            ArrayList<ConfigurationDto> s = dao.getPaymentGateways(companyID, request, configDto);
            //ArrayList <configurationForm> s1 = new ArrayList<>();
            //System.out.println("List Size:"+s.size());
			 /*s1.add(s.get(2));
			 request.setAttribute("List", s);*/
            //System.out.println("goes to div5 page......................");
            forward = "success6";
        }
        else if (action.equalsIgnoreCase("config03")) {
            //System.out.println("Inside config03 condition");
             /*ConfigurationInfoNEW configInfo = new ConfigurationInfoNEW();
			 configInfo.getCongurationRecord(companyID,configDto,request);*/

            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getCategory(companyID, request, configDto);
            dao.getAccount(companyID, request, configDto);
            dao.getPaymentType(companyID, request, configDto);
            dao.getPaymentTypeGeneralAccount(companyID, request, configDto);
            dao.getBillingTemplate(companyID, request, configDto);

            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            // Added on 04-05-2020
            request.getSession().setAttribute("CID", companyID);
            dao.getPaymentGateways(companyID, request, configDto);
            ArrayList<ConfigurationDto> s = dao.getAllCreditCards(0, request, configDto, companyID);
            dao.getAllCreditCardsType(0, request, configDto, companyID);
            dao.getAllPayemntTypeId(request, configDto, companyID);
            dao.getAllReceicedTypeId(request, configDto, companyID);

            request.setAttribute("selectedId", configDto.getDefaultDepositToId());
            request.setAttribute("paymentId", configDto.getDefaultPaymentMethodId());
            request.setAttribute("cateId", configDto.getDefaultCategoryId());
            request.setAttribute("arCatId", configDto.getArCategory());
            request.setAttribute("poCatId", configDto.getPoCategory());
            request.setAttribute("bpCatId", configDto.getBpCategory());
            request.setAttribute("arReceiveType", configDto.getArReceivedType());
            request.setAttribute("poReceiveType", configDto.getPoReceivedType());
            request.setAttribute("bpReceiveType", configDto.getBpReceivedType());
            request.setAttribute("arDepositTo", configDto.getArDepositTo());
            request.setAttribute("poDepositTo", configDto.getPoDepositTo());
            request.setAttribute("bpDepositTo", configDto.getBpDepositTo());
            request.setAttribute("billingTemplateID", configDto.getShowBillingStatStyle());
            request.setAttribute("showCmbValue", configDto.getShowCombinedBilling());

            //-------------------- CategoryManager ------------------
            CategoryManagerController catManagerController = new CategoryManagerController();
            try {
                catManagerController.categoryManager(null, request);
            }catch (Exception ex){
                ex.printStackTrace();
            }

            System.out.println("goes to accountPayment page......................");
            setConfigActiveTab(session, "accountPaymentTab");
            forward = "/configuration/accountPayment";
        }
        else if (action.equalsIgnoreCase("ChangeAdministratorPassword")) {
            String modalNewPassword = request.getParameter("modalNewPassword");
            System.out.println("modalNewPassword" + modalNewPassword);
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getAdministratorDetails(companyID, emailAddress, modalNewPassword);
            forward = "redirect:Configuration?tabid=config&tab=tr2";
        }
        else if (action.equalsIgnoreCase("config04")) {
            //System.out.println("Inside config04 condition");
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getAdministratorDetails(companyID, configDto, emailAddress);
            String UserName = configDto.getEmailAddress();
            String Password = configDto.getPassword();
            request.setAttribute("UserName", UserName);
            request.setAttribute("Password", Password);

            String role = (String) session.getAttribute("Role");
            request.setAttribute("Role", role);
            ConfigurationDAO dao = new ConfigurationDAO();
            String membershipLevel = dao.getmembershipLevel(companyID, request);
            request.setAttribute("membershipLevel", membershipLevel);
            int usercount = dao.getNumberOfUser(companyID, request, configDto);
            request.setAttribute("userSize", usercount);

            String AdminPassword = dao.checkPassword(companyID, request);
            request.setAttribute("AdminPassword", AdminPassword);
            dao.getUserListDetails(companyID, request, configDto);
            dao.getUserGroup(companyID, request, configDto);

            System.out.println("goes to networkSecurity page......................");
            setConfigActiveTab(session, "securityTab");
            forward = "/configuration/networkSecurity";
        }
        else if (action.equalsIgnoreCase("config05")) {
            //System.out.println("Inside config05 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            //ConfigurationInfoNEW configInfo = new ConfigurationInfoNEW();
            dao.getBillingTemplate(companyID, request, configDto);
            int billtemplateId = configDto.getShowBillingStatStyle();
            String pbValue = configDto.getPrintBills();
            String mailValue = configDto.getMailToCustomer();
            String showCmbValue = configDto.getShowCombinedBilling();
            request.setAttribute("billingTemplateID", billtemplateId);
            request.setAttribute("pbValue", pbValue);
            request.setAttribute("mcValue", mailValue);
            request.setAttribute("showCmbValue", showCmbValue);
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);
            forward = "success14";
            System.out.println("goes to billing page......................");
        }
        else if (action.equalsIgnoreCase("config6")) {
            //System.out.println("Inside config6 condition");
            //ConfigurationInfoNEW configInfo = new ConfigurationInfoNEW();
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getPackingSlipTemplate(companyID, request, configDto);
            dao.getCountry(companyID, request, configDto);
            dao.getShipping(companyID, request, configDto);
            dao.getTerm(companyID, request, configDto);
            dao.getPaymentType(companyID, request, configDto);
            dao.getInvoiceStyle(companyID, request, configDto);
            dao.getCustomerGroup(configDto);
            dao.getStates("2", configDto);

            dao.getSalesRepresentative(companyID, request, configDto);
            dao.getMessages(companyID, request, configDto);
            dao.getJobTitle(request, configDto, companyID);
            dao.getExistingLocation(companyID, request, configDto);
            dao.getSalesTax(companyID, request, configDto);
            dao.getCreditTerm(companyID, request, configDto);
            dao.getRefundReason(companyID, request, configDto);
            dao.getJobCategory(companyID, request, configDto);

            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            dao.getMasterReason(configDto);
            dao.getMasterReason1(companyID, configDto);
            dao.getDefaultBank(1, request, configDto, companyID);

            String isDefault = (configDto.getIsRefundAllowed() != null && configDto.getIsRefundAllowed().equals("1")) ? "on" : "off";
            String isDefaultCreditTerm = (configDto.getIsDefaultCreditTerm() != null && configDto.getIsDefaultCreditTerm().equals("1")) ? "on" : "off";
            String recurringServiceBill = (configDto.getRecurringServiceBill() != null && configDto.getRecurringServiceBill().equals("1")) ? "on" : "off";
            configDto.setIsDefaultCreditTerm(isDefaultCreditTerm);
            configDto.setRecurringServiceBill(recurringServiceBill);

            request.setAttribute("sortById", configDto.getSortBy());
            request.setAttribute("groupId", configDto.getCustomerGroup());
            request.setAttribute("countryId", configDto.getCustDefaultCountryID());
            request.setAttribute("stateId", configDto.getSelectedStateId());
            request.setAttribute("isRefundAllowed", isDefault);
            request.setAttribute("shippingMethodId", configDto.getCustomerShippingId());
            request.setAttribute("termId", configDto.getSelectedTermId());
            request.setAttribute("salesRepId", configDto.getSelectedSalesRepId());
            request.setAttribute("payMethodId", configDto.getSelectedPaymentId());
            request.setAttribute("packingSlipStyleId", configDto.getPackingSlipTemplateId());

            String cTaxableStatus = configDto.getCustTaxable().equals("1") ? "on" : "off";
            String salesOrderStatus = configDto.getIsSalesOrder().equals("1") ? "on" : "off";
            String addressStatus = configDto.getAddressSettings().equals("1") ? "on" : "off";

            String showCountry = configDto.getSaleShowCountry().equals("1") ? "on" : "off";
            String ratePrice = configDto.getRatePriceChangable().equals("1") ? "on" : "off";
            String saleShowTelephone = configDto.getSaleShowTelephone().equals("1") ? "on" : "off";
            String isSalePrefix = configDto.getIsSalePrefix().equals("1") ? "on" : "off";
            String extraChargeApplicable = configDto.getExtraChargeApplicable().equals("1") ? "on" : "off";

            request.setAttribute("DefaultPaymentMethodId", configDto.getDefaultPaymentMethodId());
            request.setAttribute("custTaxableStatus", cTaxableStatus);
            request.setAttribute("salesOrderStatus", salesOrderStatus);
            request.setAttribute("addressStatus", addressStatus);
            // request.setAttribute("showCountry", showCountry);
            request.setAttribute("ratePrice", ratePrice);
            request.setAttribute("salesShowTelephone", saleShowTelephone);
            request.setAttribute("isSalePrefix", isSalePrefix);
            request.setAttribute("extraCharge", extraChargeApplicable);

            //configInfo.getCongurationRecord(companyID,configDto,request);
            //Sales and invoice
            request.setAttribute("InvoiceFootnoteID", configDto.getSelectedMessageId());
            request.setAttribute("selectedInvoiceStyleId", configDto.getInvStyleID());
            request.setAttribute("billingTemplateID", configDto.getShowBillingStatStyle());
            request.setAttribute("accountId", configDto.getSelectedAccountId());

            setConfigActiveTab(session, "customerInvoiceTab");
            for(ConfigurationDto conDto: configDto.getListOfExistingCountry()){
                if(conDto.getCountryId() == configDto.getCustDefaultCountryID()){
                    conDto.setCountryName("USA");
                }
            }
            System.out.println("goes to customerInvoice page......................");
            forward = "/configuration/customerInvoice";
        }
        else if (action.equalsIgnoreCase("config7")) {
            //System.out.println("Inside config7 condition");
            forward = "success22";
            System.out.println("goes to estimation page......................");
        }
        else if (action.equalsIgnoreCase("config8")) {
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            String reorder = configDto.getShowReorderPointList();
            String reorderWarning = configDto.getShowReorderPointWarning();
            String reservedQuantity = configDto.getReservedQuantity();
            String so = configDto.getSalesOrderQty();
            String pt = configDto.getProductTaxable();

            request.setAttribute("reorder", reorder);
            request.setAttribute("reorderWarning", reorderWarning);
            request.setAttribute("reservedQuantity", reservedQuantity);
            request.setAttribute("salesOrder", so);
            request.setAttribute("productTaxable", pt);
            forward = "/configuration/inventorySetting";
            System.out.println("goes to inventory Setting page......................");
        }
        else if (action.equalsIgnoreCase("config9")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            dao.getInvoiceStyle(companyID, request, configDto);
            dao.getInvoiceStyle1(companyID, request, configDto);
            dao.getModules(companyID, request, configDto);

            System.out.println("goes to formCustomization page......................");
            setConfigActiveTab(session, "customizationTab");
            forward = "/configuration/formCustomization";
        }
        else if (action.equalsIgnoreCase("config10")) {
            //System.out.println("Inside config10 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            ConfigurationDetails cDetails = new ConfigurationDetails();
            VendorCategory vendorCategory = new VendorCategory();
            cDetails.getConfigurationInfo(request, configDto);

            //request.setAttribute("sortId", configDto.getSortBy());
            request.setAttribute("CategoryID", configDto.getDefaultCategoryId());
            request.setAttribute("countryID", configDto.getSelectedCountryId1());
            request.setAttribute("stateID", configDto.getSelectedStateId1());
            request.setAttribute("viaID", configDto.getShipCarrierId());
            request.setAttribute("termID", configDto.getSelectedTermId());
            request.setAttribute("repID", configDto.getSelectedSalesRepId());
            request.setAttribute("payMethodID", configDto.getSelectedPaymentId());
            request.setAttribute("inchargeEmpID", configDto.getSelectedActiveEmployeeId());

            request.setAttribute("showCountry", configDto.getPoShowCountry());
            request.setAttribute("showTelephone", configDto.getPoShowTelephone());
            request.setAttribute("purchasePrefix", configDto.getIsPurchasePrefix());
            request.setAttribute("businessTypes", vendorCategory.getCVCategoryList(companyID));
            request.setAttribute("customerTypeList", dao.getCustomerTypeList(companyID));

            dao.getCountry(companyID, request, configDto);
            dao.getStates("2", configDto);
            dao.getCategory(companyID, request, configDto);
            dao.getExistingLocation(companyID, request, configDto);
            dao.getActiveEmployee(companyID, request, configDto);
            dao.getShipCarrier(companyID, request, configDto);
            dao.getTerm(companyID, request, configDto);
            dao.getSalesRepresentative(companyID, request, configDto);
            dao.getPaymentType(companyID, request, configDto);
            dao.getMessages(companyID, request, configDto);
            dao.getInvoiceStyle(companyID, request, configDto);
            setConfigActiveTab(session, "vendorPurchaseOrderTab");
            System.out.println("goes to vendorPurchaseOrder page......................");
            forward = "/configuration/vendorPurchaseOrder";
        }
        else if (action.equalsIgnoreCase("config11")) {
            //System.out.println("Inside config11 condition");
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);

            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getCountry(companyID, request, configDto);
            dao.getStates("2", configDto);
            dao.getJobTitle(request, configDto, companyID);
            setConfigActiveTab(session, "employeeTab");
            System.out.println("goes to employee page......................");
            forward = "/configuration/employee";
        }
        else if (action.equalsIgnoreCase("config28")) {
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);

            SalesDetailsDao sd = new SalesDetailsDao();
            sd.getdataManager(request);
            setConfigActiveTab(session, "dataManagerTab");
            System.out.println("goes to datamanager page......................");
            forward = "configuration/datamanager";
        }
        else if (action.equalsIgnoreCase("DM_Save")) { // save of DataManager tab
            SalesDetailsDao sd = new SalesDetailsDao();
            sd.getdataManagerSave(request);
            forward = "redirect:/Configuration?tabid=config28&tab=tr28";
        }
        else if (action.equalsIgnoreCase("DM_SaveDefaultValues")) { // save of DataManager tab
            SalesDetailsDao sd = new SalesDetailsDao();
            sd.DataManager_SaveDefaultValues(configDto);
            forward = "redirect:/Configuration?tabid=config28&tab=tr28";
        }
        else if (action.equalsIgnoreCase("DM_Update")) { // save of DataManager tab
            SalesDetailsDao sd = new SalesDetailsDao();
            sd.getdataManagerUpdate(request);
            forward = "redirect:/Configuration?tabid=config28&tab=tr28";
        }
        else if (action.equalsIgnoreCase("DM_Delete")) { // save of DataManager tab
            SalesDetailsDao sd = new SalesDetailsDao();
            sd.getdataManagerDelete(request);
            forward = "redirect:/Configuration?tabid=config28&tab=tr28";
        }
        else if (action.equalsIgnoreCase("config12")) {
            //System.out.println("Inside config12 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getAvailableTaxYear(request, configDto);
            dao.loadCompanyTaxProperties(companyID, configDto);
            int year = Calendar.getInstance().get(Calendar.YEAR);
            dao.loadTaxProperties(companyID, year, configDto);
            configDto.setCompanyTaxOptionDtos(dao.loadCompanyTaxOption(companyID));
            System.out.println("goes to tax page......................");
            forward = "/configuration/tax";
            setConfigActiveTab(session, "taxTab");
        }
        else if (action.equalsIgnoreCase("config13")) {
            //System.out.println("Inside config13 condition");
            //ConfigurationDetailsDao configDetails = new ConfigurationDetailsDao();
            ConfigurationInfo configInfo = new ConfigurationInfo();
            String showReminderStatus = configDto.getShowReminder().equals("1") ? "on" : "off";
            request.setAttribute("showReminderStatus", showReminderStatus);

            configInfo.getCongurationRecord(companyID, configDto, request);
            //configDetails.getConfigurationInfo(request,configDto);
            forward = "success32";
            System.out.println("goes to reminder page......................");
        }
        else if (action.equalsIgnoreCase("config14")) {
            //System.out.println("Inside config14 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getActiveTemplates(1, request, configDto);

            forward = "success33";
            System.out.println("goes to emailSetup page......................");
        }
        else if (action.equalsIgnoreCase("config15")) {
            //System.out.println("Inside config15 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            ArrayList<ConfigurationDto> udShipTypes = dao.getActiveUserdefinedShippingType(companyID, request, configDto);
            dao.getActiveRealTimeShippingServices(0, request, configDto);
            dao.getActiveRealTimeShippingServices(1, request, configDto);
            dao.getActiveRealTimeShippingServices(2, request, configDto);

            dao.getActiveMailType(request, configDto);
            dao.getActivePackageSize(request, configDto);
            dao.getActiveContainer(request, configDto);
            dao.getUPSUserDetails(companyID, request, configDto);
            dao.getUSPSUserDetails(companyID, request, configDto);
            dao.getFedExUserDetails(companyID, request, configDto);
            if(!udShipTypes.isEmpty()) {
                int sId = udShipTypes.get(0).getUserDefinedShippingTypeId();
                dao.getUserDefinedShippingWeightAndPrice(sId, request, configDto);
            }
            System.out.println("goes to shipping page......................");
            forward = "/configuration/shipping";
            setConfigActiveTab(session, "shippingTab");
        }
        else if (action.equalsIgnoreCase("addshippingtype")) {
            String Newval = request.getParameter("shippingtype");
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.addShippingTypeValue(request, Newval, companyID);
            //forward="success34";
            System.out.println("goes to shipping page......................");
            forward = "redirect:Configuration?tabid=config15&&tab=tr15";
        }
        else if (action.equalsIgnoreCase("editshippingtype")) {
            String oldVal = request.getParameter("oldshippingtype");
            String oldId = request.getParameter("oldId");
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.editShippingTypeValue(request, oldVal, companyID, oldId);
            forward = "redirect:Configuration?tabid=config15&&tab=tr15";
        }
        else if (action.equalsIgnoreCase("deleteshippingtype")) {
            String oldId = request.getParameter("oldId");
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.deleteShippingTypeValue(request, companyID, oldId);
            forward = "redirect:Configuration?tabid=config15&&tab=tr15";
        }
        else if (action.equalsIgnoreCase("config16")) {
            //System.out.println("Inside config16 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            int accountID = configDto.getSelectedAccountId();
            request.setAttribute("accountId", accountID);

            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            dao.getMasterReason(configDto);
            dao.getMasterReason1(companyID, configDto);
            dao.getDefaultBank(1, request, configDto, companyID);
            System.out.println("goes to RMA page......................");
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("config17")) {
            //System.out.println("Inside config17 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getStoreTypes(request, configDto);
            //int storeTypeID = Integer.parseInt(request.getParameter("selectedStoreTypeId"));
            dao.getStores(5, request, configDto);
            //configDto.setSelectedStoreTypeId(storeTypeID);
            dao.geteActiveStore(request, configDto, companyID);

            forward = "success41";
            System.out.println("goes to eSales page......................");
        }
        else if (action.equalsIgnoreCase("config18")) {
            //System.out.println("Inside config18 condition");

            request.getSession().setAttribute("CID", companyID);
            //System.out.println("selected companyId is:"+companyID);
            ConfigurationDAO dao = new ConfigurationDAO();
            //Set<configurationForm> s = dao.getPaymentGateways(companyID,request,configDto);
            dao.getPaymentGateways(companyID, request, configDto);
            ArrayList<ConfigurationDto> s = dao.getAllCreditCards(0, request, configDto, companyID);
            dao.getAllCreditCardsType(0, request, configDto, companyID);
            dao.getAllPayemntTypeId(request, configDto, companyID);

            forward = "success42";
            System.out.println("goes to paymentReceivedOption page......................");
        }
        else if (action.equalsIgnoreCase("config19")) {
            //System.out.println("Inside config19 condition");

            forward = "success43";
            System.out.println("goes to mySqlConfiguration page......................");
        }
        else if (action.equalsIgnoreCase("config20")) {
            //System.out.println("Inside config20 condition");
            forward = "/configuration/deviceManager";
            System.out.println("goes to deviceManager page......................");
        }
        else if (action.equalsIgnoreCase("config21")) {
            //System.out.println("Inside config21 condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            ArrayList<ConfigurationDto> s = dao.getPaymentGateways(companyID, request, configDto);
            //System.out.println("List Size:"+s.size());

            System.out.println("goes to paymentGateway page......................");
            forward = "/configuration/paymentGateway";
            setConfigActiveTab(session, "paymentGatewayTab");
        }
        else if (action.equalsIgnoreCase("config22")) {
            //System.out.println("Inside config22 condition");
            request.getSession().setAttribute("CID", companyID);
            //System.out.println("selected companyId is:"+companyID);
            ConfigurationDAO dao = new ConfigurationDAO();
            dao.getExistingPrinter(companyID, request, configDto);

            System.out.println("goes to printer Setup page......................");
            setConfigActiveTab(session, "deviceManagerTab");
            forward = "/configuration/printerSetup";
        }
        else if (action.equalsIgnoreCase("config23")) {
            //System.out.println("Inside config23 condition");
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            String isChecked = configDto.getAssessFinanceCharge().equals("1") ? "on" : "off";
            request.setAttribute("isChecked", isChecked);
            System.out.println("goes to financeCharges page......................");
            forward = "success52";
        }
        else if (action.equalsIgnoreCase("config24")) {
            System.out.println("goes to smtp Setup page......................");
            forward = "success53";
        }
        else if (action.equalsIgnoreCase("config25")) {
            //System.out.println("Inside config25 condition");
            System.out.println("goes to performance page......................");
            forward = "success54";
        }
        else if (action.equalsIgnoreCase("config26")) {
            //System.out.println("Inside config26 condition");

            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            System.out.println("goes to manage service type page......................");
            forward = "success55";
        }
        else if (action.equalsIgnoreCase("config27")) {
            //System.out.println("Inside config27 condition");
			 /*ConfigurationDetailsDao cDetails = new ConfigurationDetailsDao();
			 cDetails.getConfigurationInfo(request, configDto);*/
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.getCongurationRecord(companyID, configDto, request);

            String isSalesOrderBoard = configDto.getSalesOrderBoard();
            request.setAttribute("isSOBChecked", isSalesOrderBoard);


            String isItemReceivedBoard = configDto.getItemReceivedBoard();
            request.setAttribute("isIRBChecked", isItemReceivedBoard);

            String isPoBoard = configDto.getPoboard();
            request.setAttribute("isPOBChecked", isPoBoard);

            String isItemShippedBoard = configDto.getItemShippedBoard();
            request.setAttribute("isISBChecked", isItemShippedBoard);

            int isSelectedWeightID = configDto.getWeightID();
            request.setAttribute("isSelectedWeightID", isSelectedWeightID);
            forward = "success56";
            System.out.println("goes to dashboard page......................");
        }
        else if (action.equalsIgnoreCase("showStore")) {
            System.out.println("Inside showStore condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            //dao.initStoreTypesModel(true);
            //ConfigurationDao dao = new ConfigurationDao();
            dao.getStores(5, request, configDto);
            dao.getCountry(companyID, request, configDto);
            dao.getStoreTypes(request, configDto);
            ArrayList<String> s = dao.getState();
            request.setAttribute("states", s);
            forward = "success7";
        }
        else if (action.equalsIgnoreCase("showStore1")) {
            //System.out.println("Inside showStore condition");
            ConfigurationDAO dao = new ConfigurationDAO();
            //dao.initStoreTypesModel(true);
            //ConfigurationDao dao = new ConfigurationDao();

            dao.getCountry(companyID, request, configDto);
            dao.getStoreTypes(request, configDto);
            int storeTypeID = Integer.parseInt(request.getParameter("selectedStoreTypeId"));
            dao.getStores(storeTypeID, request, configDto);
            configDto.setSelectedStoreTypeId(storeTypeID);
            ArrayList<String> s = dao.getState();
            request.setAttribute("states", s);
            forward = "success7";
        }
        /* Show the footnote list & related information in the special window */
        else if (action.equalsIgnoreCase("ShowEditFootnote")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.newFootnote(request, configDto);
            forward = "/configuration/editFootnote";
        }

        /* Delete the selected footnote & its related information */
        else if (action.equalsIgnoreCase("DeleteFootnote")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteFootnote(request, configDto);
            forward = "/configuration/editFootnote";
        }

        /*  Save the new footnote as user enter */
        else if (action.equalsIgnoreCase("SaveFootnote")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveFootnote(request, configDto);
            forward = "/configuration/editFootnote";
        }

        /* Update the existing footnote & its information */
        else if (action.equalsIgnoreCase("UpdateFootnote")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateFootnote(request, configDto);
            forward = "/configuration/editFootnote";
        } else if (action.equalsIgnoreCase("SaveConfigurationGeneral")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveRecordsGeneral(configDto, request);
            cDetails.getConfigurationInfo(request, configDto);
            e.add("common.recoversucess", new ActionMessage("err.general.success"));
            forward = "redirect:Configuration?tabid=config";
        }
        else if (action.equalsIgnoreCase("SaveConfigurationEstimation")) {

            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveRecordsEstimation(configDto, request);
            cDetails.getConfigurationInfo(request, configDto);
            e.add("common.recoversucess", new ActionMessage("err.general.success"));
            forward = "success22";
        }
        else if (action.equalsIgnoreCase("SaveConfigurationBilling")) {
            String printBillValue = request.getParameter("printBillsValue");
            String mailCustomerValue = request.getParameter("mailToCust");
            String showCombinedValue = request.getParameter("showCmbBilling");

            System.out.println("is showCombinedBilling Checked?:" + showCombinedValue + ""
                    + "\nis PrintBills Checked?:" + printBillValue + "\nis MailToCustomer Checked?:" + mailCustomerValue);

            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveRecordsBilling(configDto, request, printBillValue, mailCustomerValue, showCombinedValue);
            cDetails.getConfigurationInfo(request, configDto);
            e.add("common.recoversucess", new ActionMessage("err.general.success"));
            forward = "success11";
        }
        else if (action.equalsIgnoreCase("SaveConfigurationInventorySettng")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveRecordsInventorySettings(configDto, request);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "success23";
        }
        else if (action.equalsIgnoreCase("SaveConfigurationAccountPayment")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveAccountPaymentDetails(configDto, request, companyID);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "redirect:Configuration?tabid=config03&tab=tr3";
        }
        else if (action.equalsIgnoreCase("SavePerformance")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();

            cDetails.savePerformance(configDto, request, companyID);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "success54";
        }
        else if (action.equalsIgnoreCase("SaveFinanceCharges")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();

            String assetFinanceChargeStatus = request.getParameter("assetFinanceChargeStatus");
            cDetails.saveFinanceCharges(configDto, request, companyID, assetFinanceChargeStatus);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "success52";
        }
        else if (action.equalsIgnoreCase("addNewRMAReason")) {
            String Reason = request.getParameter("reason");
            String parentReasonId = request.getParameter("parentReasonId");
            int parentReasonID = Integer.parseInt(parentReasonId);

            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addRMAReason(configDto, companyID, Reason, parentReasonID);
            session.setAttribute(pageActiveTab, "RefundSettings0");
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateRMAReason")) {
            String Reason = request.getParameter("reason");
            String rId = request.getParameter("resonId");
            int reasonId = Integer.parseInt(rId);
            String parentReasonId = request.getParameter("parentReasonId");
            int parentReasonID = Integer.parseInt(parentReasonId);

            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateMAReason(configDto, Reason, reasonId, parentReasonID);
            session.setAttribute(pageActiveTab, "RefundSettings0");
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteRMAReason")) {
            String Reason = request.getParameter("reason");
            String parentReasonId = request.getParameter("parentReasonId");
            int parentReasonID = Integer.parseInt(parentReasonId);

            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteRMAReason(configDto, Reason, parentReasonID);
            session.setAttribute(pageActiveTab, "RefundSettings0");
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("SaveDefaultBank")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveDefaultBank(configDto, request);
            cDetails.getConfigurationInfo(request, configDto);
            /*e.add("common.recoversucess", new ActionMessage("err.general.success"));*/
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("SaveDashboardSetting")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();

            String salesOrder = request.getParameter("salesOrderBoard");
            String itemReceived = request.getParameter("itemReceivedBoard");
            String itemShipped = request.getParameter("itemShippedBoard");
            String poBoard = request.getParameter("poboard");

            cDetails.saveDashboardSetting(configDto, request, companyID, salesOrder, itemReceived, itemShipped, poBoard);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "success56";
        }
        else if (action.equalsIgnoreCase("SaveReminderSetting")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            String showReminderStatus = request.getParameter("showReminderStatus");

            cDetails.saveReminderSetting(configDto, request, companyID, showReminderStatus);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "success32";
        }
        else if (action.equalsIgnoreCase("addDescription")) {
            String description = request.getParameter("Description");
            System.out.println("New Description To be added:" + description);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addNewDescription(configDto, companyID, description);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateDescription")) {
            String description = request.getParameter("Description");
            String locationID = request.getParameter("locationID");
            System.out.println("LocationId:" + locationID + "\nDescription To be updated:" + description);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateDescription(configDto, companyID, description, locationID);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteLocation")) {
            int descriptionID = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("locationId To be Delete:" + descriptionID);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteLocation(companyID, descriptionID);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("addNewMessage")) {
            String description = request.getParameter("Description");
            System.out.println("New Message To be added:" + description);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addNewMessage(configDto, companyID, description);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateMessage")) {
            String message = request.getParameter("Description");
            String messageId = request.getParameter("locationID");
            System.out.println("MessageId:" + messageId + "\nNew Message To be updated:" + message);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateMessage(configDto, companyID, message, messageId);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteMessage")) {
            int messageID = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("MessageId To be Delete:" + messageID);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteMessage(companyID, messageID);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("addNewSalesRep")) {
            String description = request.getParameter("Description");
            System.out.println("New Sales Representative To be added:" + description);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addNewSalesRep(configDto, companyID, description);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateSalesRep")) {
            String salesRep = request.getParameter("Description");
            String salesRepId = request.getParameter("locationID");
            System.out.println("SalesRepId:" + salesRepId + "\nNSales Representative:" + salesRep);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateSalesRep(configDto, companyID, salesRep, salesRepId);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteSalesRep")) {
            int salesRepId = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("Sales Representative Id To be Deleted:" + salesRepId);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteSalesRep(configDto, companyID, salesRepId);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("addNewTerms")) {
            String term = request.getParameter("Description");
            int days = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("New Term To be added:" + term + "\n Days:" + days);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addNewTerm(configDto, companyID, term, days);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateTerms")) {
            String term = request.getParameter("Description");
            String termId = request.getParameter("locationID");
            int days = Integer.parseInt(request.getParameter("isDefault"));
            System.out.println("TermId:" + termId + "\nTerm:" + term + "\nDays:" + days);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateTerm(configDto, companyID, term, termId, days);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteTerms")) {
            int termId = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("Term Id To be Deleted:" + termId);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteTerm(companyID, termId);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("addNewSalesTax")) {
            String term = request.getParameter("Description");
            float tax = Float.parseFloat((request.getParameter("locationID")));
            System.out.println("New Term To be added:" + term + "\n Tax:" + tax);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addNewSalesTax(configDto, companyID, term, tax);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateSalesTax")) {
            String salesTax = request.getParameter("Description");
            String salesTaxId = request.getParameter("locationID");
            float tax = Float.parseFloat(request.getParameter("isDefault"));
            System.out.println("SalesTaxId:" + salesTaxId + "\nSalesTaxName:" + salesTax + "\nTax:" + tax);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateSalesTax(configDto, companyID, salesTax, salesTaxId, tax);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteSalesTax")) {
            int salesTaxId = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("SalesTax Id To be Deleted:" + salesTaxId);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteSalesTax(companyID, salesTaxId);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("addNewCreditTerm")) {
            String term = request.getParameter("Description");
            String isDefault = request.getParameter("isDefault");
            int days = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("New CreditTerm To be added:" + term + "\nDays:" + days + "\nIs Default:" + isDefault);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addNewCreditTerms(configDto, companyID, term, days, isDefault);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateCreditTerm")) {
            String creditTerm = request.getParameter("Description");
            String creditTermId = request.getParameter("locationID");
            String isDefault = request.getParameter("isDefault");
            String days = request.getParameter("creditTermDays");
            System.out.println("CreditTermId:" + creditTermId + "\nCreditTerm:" + creditTerm + "\nDefault is checked?:" + isDefault + "\nDays:" + days);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateCreditTerm(configDto, companyID, creditTerm, creditTermId, isDefault, days);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteCreditTerm")) {
            int creditTermId = Integer.parseInt(request.getParameter("locationID"));
            System.out.println("creditTerm Id To be Deleted:" + creditTermId);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteCreditTerm(companyID, creditTermId);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }
        else if (action.equalsIgnoreCase("addRefundReason")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.insertRefundReason(companyID, request.getParameter("Description"));
            session.setAttribute(pageActiveTab, "RefundSettings0");
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateRefundReason")) {
            int refundReasonId = Integer.parseInt(request.getParameter("locationID"));
            String newRefundReason = request.getParameter("Description");
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateRefundReason(companyID, refundReasonId, newRefundReason);
            session.setAttribute(pageActiveTab, "RefundSettings0");
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteRefundReason")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteRefundReason(companyID, Integer.parseInt(request.getParameter("locationID")));
            session.setAttribute(pageActiveTab, "RefundSettings0");
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }
        else if (action.equalsIgnoreCase("makeDefaultReason")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.setDefaultRefundReason( Integer.parseInt(request.getParameter("locationID")) );
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }

        else if (action.equalsIgnoreCase("addJobCategory")) {
            String jobCategory = request.getParameter("Description");
            String recurringServiceBill = request.getParameter("locationID");
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.addJobCategory(configDto, companyID, jobCategory, recurringServiceBill);
            session.setAttribute(pageActiveTab, "Customer&Job0");
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }
        else if (action.equalsIgnoreCase("updateJobCategory")) {
            int jobCategoryId = Integer.parseInt(request.getParameter("locationID"));
            String newJobCategoryName = request.getParameter("Description");
            String recurringServiceBill = request.getParameter("isDefault");
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.updateJobCategory(configDto, companyID, jobCategoryId, newJobCategoryName, recurringServiceBill);
            session.setAttribute(pageActiveTab, "Customer&Job0");
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }
        else if (action.equalsIgnoreCase("deleteJobCategory")) {
            int jCategoryId = Integer.parseInt(request.getParameter("locationID"));
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.deleteJobCategory(companyID, jCategoryId);
            session.setAttribute(pageActiveTab, "Customer&Job0");
            forward = "redirect:Configuration?tabid=config6&tab=tr6";
        }
        else if (action.equalsIgnoreCase("EditServiceBillInfo")) {
            String billName = request.getParameter("Description");
            String recurringServiceBill = request.getParameter("isDefault");
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.editServiceBillInfo(configDto, companyID, billName, recurringServiceBill);
            forward = "redirect:Configuration?tabid=config6&&tab=tr6";
        }

        /* Shows the back up option window */
        else if (action.equalsIgnoreCase("BackupOption")) {
            forward = "backupwindow";
        }

        /* Show the set prefernces window which is useful to set the preference information. */
        else if (action.equalsIgnoreCase("ShowSetPreference")) {
            ConfigurationDetails configDetails = new ConfigurationDetails();
            configDetails.getConfigurationInfo(request, configDto);
            forward = "success_setPreference";
        }

        /* Saves the preference information (i.e:- inventory,sales,purchase,etc). */
        else if (action.equalsIgnoreCase("SavePreferences")) {
            String multiUserConnection1 = request.getParameter("multiUserConnection");
            int multiUserConnection = Integer.valueOf(multiUserConnection1);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveRecords(configDto, request, multiUserConnection);
            cDetails.getConfigurationInfo(request, configDto);
            forward = "success_setPreference";
        }
        else if (action.equalsIgnoreCase("addEmployeeJobCode")) {
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.addJobCodeTimesheet(request);
            forward = "redirect:Configuration?tabid=config11&&tab=tr11";
        }
        else if (action.equalsIgnoreCase("editEmployeeJobCode")) {
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.editJobCodeTimesheet(request);
            forward = "redirect:Configuration?tabid=config11&&tab=tr11";
        }
        else if (action.equalsIgnoreCase("deleteEmployeeJobCode")) {
            ConfigurationInfo configInfo = new ConfigurationInfo();
            configInfo.removeJobCodeTimesheet(request);
            forward = "redirect:Configuration?tabid=config11&&tab=tr11";
        }
        else if (action.equalsIgnoreCase("SaveCustomerType")) {
            ConfigurationDAO configDao = new ConfigurationDAO();
            String ID = request.getParameter("ID");
            String custTypeName = request.getParameter("custTypeName");
            configDao.saveCustomerType(ID, custTypeName, companyID);
            forward = "redirect:Configuration?tabid=config10&tab=tr10";
        }
        else if (action.equalsIgnoreCase("DeleteCustomerType")) {
            ConfigurationDAO configDao = new ConfigurationDAO();
            String ID = request.getParameter("ID");
            configDao.deleteCustomerType(ID);
            forward = "redirect:Configuration?tabid=config10&tab=tr10";
        }
        model.addAttribute("configDto", configDto);
        return forward;
    }

    @ResponseBody
    @PostMapping(value = {"/ConfigurationAjax/SaveConfiguration"})
    public String ConfigurationAjax(ConfigurationDto configDto, HttpServletRequest request) {
        String status = "Success";
        String action = request.getParameter("tabid");
        System.out.println("-------ConfigurationAjax--POST-------tabid: "+ action);

        String companyID = (String) request.getSession().getAttribute("CID");
        String emailAddress = (String) request.getSession().getAttribute("Email_Address");
        ConstValue c = new ConstValue();
        c.setCompanyId(Integer.parseInt(companyID));
        ActionErrors e = new ActionErrors();

        if (action.equalsIgnoreCase("SaveCustomerInvoiceSettings")) {
            ConfigurationDetails cDetails = new ConfigurationDetails();

            configDto.setSelectedTermId(Integer.parseInt(request.getParameter("selectedTermId")));
            configDto.setSelectedSalesRepId(Integer.parseInt(request.getParameter("selectedSalesRepId")));
            configDto.setSelectedPaymentId(Integer.parseInt(request.getParameter("selectedPaymentId")));
            configDto.setCustTaxable(request.getParameter("custTaxable"));
            configDto.setIsSalesOrder(request.getParameter("isSalesOrder"));
            configDto.setAddressSettings(request.getParameter("addressSettings"));
            configDto.setSaleShowCountry(request.getParameter("saleShowCountry"));
            configDto.setRatePriceChangable(request.getParameter("ratePriceChangable"));
            configDto.setSaleShowTelephone(request.getParameter("saleShowTelephone"));
            configDto.setIsSalePrefix(request.getParameter("isSalePrefix"));
            configDto.setExtraChargeApplicable(request.getParameter("extraChargeApplicable"));
            configDto.setIsRefundAllowed(request.getParameter("creditTermDays"));
            configDto.setSortBy(Integer.parseInt(request.getParameter("sortBy")));
            configDto.setInvStyleID(Integer.parseInt(request.getParameter("selectedInvoiceStyleId")));
            configDto.setDisplayPeriod(Integer.parseInt(request.getParameter("displayPeriod")));

            String errorCode = cDetails.saveCustomerInvoiceSetting(configDto, request, companyID);
            cDetails.getConfigurationInfo(request, configDto);

            //added on 01-05-2020
            request.setAttribute("sortById", configDto.getSortBy());
            request.setAttribute("groupId", configDto.getCustomerGroup());
            request.setAttribute("countryId", configDto.getCustDefaultCountryID());
            request.setAttribute("stateId", configDto.getSelectedStateId());
            request.setAttribute("isRefundAllowed", configDto.getIsRefundAllowed());

            request.setAttribute("shippingMethodId", configDto.getCustomerShippingId());
            request.setAttribute("termId", configDto.getSelectedTermId());
            request.setAttribute("salesRepId", configDto.getSelectedSalesRepId());
            request.setAttribute("payMethodId", configDto.getSelectedPaymentId());
            request.setAttribute("packingSlipStyleId", configDto.getPackingSlipTemplateId());

            String cTaxableStatus = configDto.getCustTaxable().equals("1") ? "on" : "off";
            String salesOrderStatus = configDto.getIsSalesOrder().equals("1") ? "on" : "off";
            String addressStatus = configDto.getAddressSettings().equals("1") ? "on" : "off";

            String showCountry = configDto.getSaleShowCountry().equals("1") ? "on" : "off";
            String ratePrice = configDto.getRatePriceChangable().equals("1") ? "on" : "off";
            String saleShowTelephone1 = configDto.getSaleShowTelephone().equals("1") ? "on" : "off";
            String isSalePrefix1 = configDto.getIsSalePrefix().equals("1") ? "on" : "off";
            String extraChargeApplicable1 = configDto.getExtraChargeApplicable().equals("1") ? "on" : "off";

            request.setAttribute("custTaxableStatus", cTaxableStatus);
            request.setAttribute("salesOrderStatus", salesOrderStatus);
            request.setAttribute("addressStatus", addressStatus);

            request.setAttribute("showCountry", showCountry);
            request.setAttribute("ratePrice", ratePrice);
            request.setAttribute("salesShowTelephone", saleShowTelephone1);
            request.setAttribute("isSalePrefix", isSalePrefix1);
            request.setAttribute("extraCharge", extraChargeApplicable1);

            System.out.println("ErrorCode value:" + errorCode);
            //forward = "success21";
            status = errorCode;
        }
        else if (action.equalsIgnoreCase("saveVendorPurchaseValues")) {
            configDto.setSortBy(Integer.parseInt(request.getParameter("sortBy")));
            configDto.setSelectedStateId1(Integer.parseInt(request.getParameter("selectedStateId1")));
            configDto.setSelectedCountryId1(Integer.parseInt(request.getParameter("selectedCountryId1")));
            configDto.setVendorProvience(request.getParameter("vendorProvience"));
            configDto.setStartPONum(request.getParameter("startPONum"));
            configDto.setVendorDefaultFootnoteID(Integer.parseInt(request.getParameter("vendorDefaultFootnoteID")));
            configDto.setPoShowTelephone(request.getParameter("showTelephone"));
            configDto.setIsPurchasePrefix(request.getParameter("isPrefix"));
            configDto.setPoShowCountry(request.getParameter("showCountry"));
            configDto.setShipCarrierId(Integer.parseInt(request.getParameter("shipCarrierId")));
            configDto.setSelectedTermId(Integer.parseInt(request.getParameter("selectedTermId")));
            configDto.setSelectedSalesRepId(Integer.parseInt(request.getParameter("selectedSalesRepId")));
            configDto.setSelectedPaymentId(Integer.parseInt(request.getParameter("selectedPaymentId")));
            configDto.setSelectedActiveEmployeeId(Integer.parseInt(request.getParameter("selectedActiveEmployeeId")));
            configDto.setSelectedCategoryId(Integer.parseInt(request.getParameter("selectedCategoryId")));
            configDto.setVendorBusinessTypeID(Integer.parseInt(request.getParameter("vendorBusinessTypeID")));
            configDto.setVendorInvoiceStyleId(Integer.parseInt(request.getParameter("vendorInvoiceStyleId")));
            configDto.setCustomerType(Integer.parseInt(request.getParameter("customerType")));
            configDto.setPriceLevelPriority(Integer.parseInt(request.getParameter("priceLevelPriority")));
            configDto.setPriceLevelDealer(Integer.parseInt(request.getParameter("priceLevelDealer")));
            configDto.setPriceLevelCustomer(Integer.parseInt(request.getParameter("priceLevelCustomer")));
            configDto.setPriceLevelGeneral(Integer.parseInt(request.getParameter("priceLevelGeneral")));

            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveVendorPurchaseValues(configDto, companyID);
            cDetails.saveRecordsInventorySettings(configDto, request);
            cDetails.getConfigurationInfo(request, configDto);
        }
        else if (action.equalsIgnoreCase("formCustomization")) {
            String ActiveInvoiceStylelist = request.getParameter("ActiveInvoiceStylelist");
            String[] ActiveInvoiceStylelists = ActiveInvoiceStylelist.split(",");

            String DeActiveInvoiceStylelist = request.getParameter("DeActiveInvoiceStylelist");
            String[] DeActiveInvoiceStylelists = DeActiveInvoiceStylelist.split(",");
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveInvoiceStyle(configDto, ActiveInvoiceStylelists, DeActiveInvoiceStylelists);
        }
        /* Save all the configuration records (i.e:- inventory,sales,purchase,etc).*/
        else if (action.equalsIgnoreCase("SaveConfiguration")) {
            System.out.println("----------SaveConfiguration-----------");
            String multiUserConnection1 = request.getParameter("multiUserConnection");
            int multiUserConnection = Integer.valueOf(multiUserConnection1);
            ConfigurationDetails cDetails = new ConfigurationDetails();
            cDetails.saveRecords(configDto, request, multiUserConnection);
            cDetails.getConfigurationInfo(request, configDto);
            e.add("common.recoversucess", new ActionMessage("err.general.success"));
        }
        else if (action.equalsIgnoreCase("addNewUser")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            boolean check = dao.addNewUser(companyID, request);
            if (check == true) {
                System.out.println("success");
            } else {
                System.out.println("Error");
            }
        }
        else if (action.equalsIgnoreCase("saveGroup")) {
            ConfigurationDAO dao = new ConfigurationDAO();
            boolean result = dao.saveUserGroupDetails(companyID, configDto);
            if (!result) {
                status = "ERROR";
            }
        } else {
            System.out.println("-----------ERROR-ACTION-not-found-------------");
        }
        return status;
    }

    @ResponseBody
    @RequestMapping(value = {"/ConfigurationAjaxTest"}, method = {RequestMethod.GET, RequestMethod.POST})
    public Object ConfigurationAjaxTest(ConfigurationDto configDto, HttpServletRequest request) {
        String status = "Success";
        String action = request.getParameter("tabid");
        System.out.println("-------ConfigurationAjaxTest-------tabid: "+ action);
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        if (action.equalsIgnoreCase("getUserDefinedShippingWeightAndPrice")) {
            int sId = Integer.parseInt(request.getParameter("shippingCarrierId"));
            return dao.getUserDefinedShippingWeightAndPrice(sId, request, configDto);
        }
        else if (action.equalsIgnoreCase("addUserDefinedShippingWeightAndPrice")) {
            return dao.addUserDefinedShippingWeightAndPrice(configDto);
        }
        else if (action.equalsIgnoreCase("updateUserDefinedShippingWeightAndPrice")) {
            return dao.updateUserDefinedShippingWeightAndPrice(configDto);
        }
        else if (action.equalsIgnoreCase("deleteUserDefinedShippingWeightAndPrice")) {
            int udShippingRateID = Integer.parseInt(request.getParameter("udShippingRateID"));
            return dao.deleteUserDefinedShippingWeightAndPrice(udShippingRateID);
        }
        else if (action.equalsIgnoreCase("setPrintingTemplates")) {
            System.out.println(configDto);
            return dao.setPrintingTemplates(companyID, configDto);
        }
        else {
            System.out.println("-----------ERROR-ACTION-not-found-------------");
        }
        return status;
    }

    private void setConfigActiveTab(HttpSession session, String tabName) {
        if (session.getAttribute("configActiveTab") == null) {
            session.setAttribute("configActiveTab", "generalTab");
        }
        session.setAttribute("configActiveTab", tabName);
    }


    @ResponseBody
    @GetMapping(value = {"/Configuration/FederalTax/companyTaxInfo/loadTaxYear/{year}"})
    public ConfigurationDto loadFederalTaxByYear(@PathVariable("year") String year, HttpServletRequest request) {
        ConfigurationDto configDto = new ConfigurationDto();
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        dao.loadTaxProperties(companyID, Integer.parseInt(year), configDto);
        return configDto;
    }

    @ResponseBody
    @PostMapping( path = "/Configuration/FederalTax/companyTaxInfo")
    public String saveFIDCompanyTaxInfo(ConfigurationDto configDto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        dao.saveFIDCompanyTaxInfo(companyID, configDto);
        return "";
    }


    @ResponseBody
    @PostMapping( path = "/Configuration/FederalTax/companyTaxOption/deduction")
    public List<DeductionListDto> saveFIDCompanyTaxOption(DeductionListDto configDto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.saveFIDCompanyTaxOptionDeduction(companyID, configDto);
    }

    @ResponseBody
    @PostMapping( path = "/Configuration/FederalTax/companyTaxOption/deduction/delete")
    public List<DeductionListDto> deleteFIDCompanyTaxOptionDeduction(DeductionListDto configDto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.deleteFIDCompanyTaxOptionDeduction(companyID, configDto);
    }

    @ResponseBody
    @PostMapping( path = "/Configuration/FederalTax/companyTaxOption/option")
    public List<CompanyTaxOptionDto> saveFIDCompanyTaxOption(CompanyTaxOptionDto companyTaxOptionDto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.saveFIDCompanyTaxOption(companyID, companyTaxOptionDto);
    }

    @ResponseBody
    @PostMapping( path = "/Configuration/FederalTax/companyTaxOption/option/delete")
    public List<CompanyTaxOptionDto> deleteFIDCompanyTaxOption(CompanyTaxOptionDto configDto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.deleteFIDCompanyTaxOption(companyID, configDto);
    }

    // StateTax/OtherTax

    @ResponseBody
    @PostMapping( path = "/Configuration/StateTax")
    public StateIncomeTaxDto saveSIDOther(StateIncomeTaxDto dto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.saveSID(companyID, dto);
    }

    @ResponseBody
    @GetMapping(value = {"/Configuration/StateTax/{stateId}"})
    public StateIncomeTaxDto  loadStateTaxOtherByYear(@PathVariable("stateId") Long stateId, HttpServletRequest request) {
        ConfigurationDAO dao = new ConfigurationDAO();
        String companyID = (String) request.getSession().getAttribute("CID");
        return dao.loadSID(companyID, stateId);
    }

    @ResponseBody
    @PostMapping( path = "/Configuration/StateTax/setAsDefault")
    public StateIncomeTaxDto saveSIDStateSetAsDefault(StateIncomeTaxDto dto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.saveSIDStateSetAsDefault(companyID, dto);
    }

    @ResponseBody
    @PostMapping( path = "/Configuration/StateTax/setActive")
    public StateIncomeTaxDto saveSIDSetActive(StateIncomeTaxDto dto, HttpServletRequest request) {
        String companyID = (String) request.getSession().getAttribute("CID");
        ConfigurationDAO dao = new ConfigurationDAO();
        return dao.saveSIDStateSetActive(companyID, dto);
    }


}
