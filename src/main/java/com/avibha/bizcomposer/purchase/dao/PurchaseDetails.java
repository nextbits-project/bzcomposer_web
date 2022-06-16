/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.purchase.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.avibha.bizcomposer.employee.dao.Title;
import com.avibha.bizcomposer.purchase.forms.PrintLabelDto;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;

public class PurchaseDetails {

	/* The method gets the list of all vendor
	 * with their ids and names & with their services.
	 */
	public void getVendors(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		PurchaseInfo vendor = new PurchaseInfo();
		ArrayList VendorDetails = new ArrayList();
		VendorDetails = vendor.getVendorsBySort(compId, null);
		request.setAttribute("VendorDetails", VendorDetails);
		//Loger.log("Size of VendorDetails=" + VendorDetails.size());
	}

	public void getCountry(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		PurchaseInfo vendor = new PurchaseInfo();
		ArrayList VendorDetails = new ArrayList();
		VendorDetails = vendor.getVendorsBySort(compId, null);
		request.setAttribute("VendorDetails", VendorDetails);
		Loger.log("Size of VendorDetails=" + VendorDetails.size());
	}

	public void getState(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		PurchaseInfo vendor = new PurchaseInfo();
		ArrayList VendorDetails = new ArrayList();
		VendorDetails = vendor.getVendorsBySort(compId, null);
		request.setAttribute("VendorDetails", VendorDetails);
		Loger.log("Size of VendorDetails=" + VendorDetails.size());
	}

	public void getTitle(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		PurchaseInfo vendor = new PurchaseInfo();
		ArrayList VendorDetails = new ArrayList();
		VendorDetails = vendor.getVendorsBySort(compId, null);
		request.setAttribute("VendorDetails", VendorDetails);
		Loger.log("Size of VendorDetails=" + VendorDetails.size());
	}

	/* Add new vendor with its related information to
	 * the database. 
	 */
	/*public void AddVendor(HttpServletRequest request, VendorDto form,String compId, String stateName) {
			//String compId = (String) request.getSession().getAttribute("CID");
			String istaxable = request.getParameter("isTaxable");
			String isAlsoClient = request.getParameter("isAlsoClient");
			String UseIndividualFinanceCharges = request.getParameter("UseIndividualFinanceCharges");
			String AssessFinanceChk = request.getParameter("AssessFinanceChk");
					
			int istax = 0;
			int isclient = 3; // 2 for vendor in cvtype table
			int indCharge = 0;
			int aFCharge = 0;
			int fICharge = 0;

			if(istaxable==null)
				istax = 0;
			else if (("on").equalsIgnoreCase(istaxable))
				istax = 1;
			else
				istax = 0;
			
			if(isAlsoClient==null)
				isclient = 3;
			else if (("on").equalsIgnoreCase(isAlsoClient))
				isclient = 1;
			else
				isclient = 3;
			
			if(UseIndividualFinanceCharges==null)
				indCharge = 0;
			else if (("on").equalsIgnoreCase(UseIndividualFinanceCharges))
				indCharge = 1;
			else
				indCharge = 0;
			
			if(AssessFinanceChk==null)
				aFCharge = 0;
			else if (("on").equalsIgnoreCase(AssessFinanceChk))
				aFCharge = 1;
			
			// generating new cvId
			PurchaseInfo pinfo = new PurchaseInfo();
			int cvID = pinfo.getLastClientVendorID() + 1;
			//Id generation finished
		
			PurchaseInfo purchase = new PurchaseInfo();
			VendorDto vfrm = (VendorDto) form;
			try{
			boolean isAdded = purchase.insertVendor(cvID + "", vfrm, compId, istax, isclient,
					indCharge, aFCharge, fICharge, "N",stateName);
			request.setAttribute("SaveStatus",
					"Vendor Information is Successfully Added !");
			if(isAdded){
				request.setAttribute("SaveStatus",new ActionMessage("Vendor Information is Successfully Added !"));
				request.setAttribute("Added","true");
			}
			}catch (Exception e) {
				// TODO: handle exception
				request.setAttribute("Status",new ActionMessage("Vendor Information is Not Insert !"));
			}
	}*/

	/*		Get all general information related to
	 * the vendor. 
	 */
	public void getAllList(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String cid = (String) sess.getAttribute("CID");
		// Title List
		Title t = new Title();
		request.setAttribute("titleList", t.getTitleList(cid));

		// country List
		CountryState cs = new CountryState();
		request.setAttribute("cList", cs.getCountry());

		// Term List
		Term tr = new Term();
		request.setAttribute("TermList", tr.getTermList(cid));

		// Rep List
		Rep rap = new Rep();
		request.setAttribute("RepList", rap.getRepList(cid));

		// PayMethod List
		PayMethod pmethod = new PayMethod();
		
		request.setAttribute("PaymentList",pmethod.getPaymentTypeList(cid));

		// ShipCarrier List
		Shipping ship = new Shipping();
		request.setAttribute("ShipCarrierList",ship.getShipCarrierList(cid));

		// CreditCard List
		CreditCard cc = new CreditCard();
		request.setAttribute("CreditCardList",cc.getCCTypeList(cid));

		// CreditCard List
		VendorCategory cv = new VendorCategory();
		request.setAttribute("VendorCategoryList", cv.getCVCategoryList(cid));

	}
	
	
	
	/*		Update the existing vendor & his related 
	 * information.
	 */
	
	
	/*		Provides the information required for the 
	 * print label such as vendor list with his/her
	 * services,total no. of pages, etc. 
	 * 
	 */
	public void getPrintLabelInfo(HttpServletRequest request,PrintLabelDto pForm){
		
		PurchaseInfo purchase = new PurchaseInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		Pagination page = new Pagination();
		int total = page.getPages(Long.parseLong(compId));
		int start = pForm.getStartPage();
		
		int limit = 5;         // Limit to no. of records display
		int pageCount = 3;     // No. of pages to display on page
		
		request.setAttribute("PrintList",purchase.getPrintLabelInfo(request,compId,start,limit));
		pForm.setTotalPages(total);
		request.setAttribute("PageValue",String.valueOf(start));
		int[] pages = new int[pageCount];
		int count = 0;
		if(start == total){
			start--; 
			for(int cnt = 0 ;cnt<pageCount; cnt++){
				pages[cnt]=start;
				start++;
				count++;
				if(start>total){
					break;
				}
			}
		}
		else if(start < total){
			for(int cnt = 0 ;cnt<pageCount; cnt++){
				pages[cnt]=start;
				start++;
				count++;
				if(start>total){
					break;
				}
			}
		}
		
		int[] record = new int[count]; 
		for(int cnt = 0; cnt<count;cnt++){
			record[cnt]=pages[cnt];
		}
		
		request.setAttribute("TotalPages",String.valueOf(pForm.getTotalPages()));
		request.setAttribute("Total",record);
		
		if(request.getParameter("VendorName") != null){
			request.setAttribute("VendorList",request.getParameter("VendorName"));
		}
				
	}
	
	
}
