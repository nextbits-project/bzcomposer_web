/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.purchase.actions;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.avibha.bizcomposer.employee.dao.Label;
import com.avibha.bizcomposer.purchase.dao.PurchaseDetailsDao;
import com.avibha.bizcomposer.purchase.forms.PrintLabelDto;
import com.avibha.bizcomposer.sales.dao.SalesDetails;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;

@Controller
public class PrintLabelController{
	
	@Autowired
    private SalesDetailsDao saleDetailsDao;
	
	@Autowired
	private SalesDetails sd;

	@GetMapping("/PrintLBL")
	public String printLabel(PrintLabelDto printLabelDto, HttpServletRequest request) throws IOException, ServletException {
		String forward = "success";
		String action = request.getParameter("tabid");

		/*		The code executes when user click on PrintLabel
		 * tab. It provides the information ie:- vendor name &
		 * their related service types, address label type list.*/
		 
		if (action.equalsIgnoreCase("PrintLabel")) {
			PurchaseDetailsDao pdetails = new PurchaseDetailsDao();
			printLabelDto.setStartPage(1);
			request.getSession().setAttribute("StartPage",String.valueOf(printLabelDto.getStartPage()));
			pdetails.getPrintLabelInfo(request, printLabelDto);
			pdetails.getVendors(request);
			
			// to print lables
			Label lbl = new Label();
			ArrayList labelList = lbl.getLabelList();
			request.setAttribute("Labels", labelList);
			forward = "/purchase/printLables";
		}
		
			/*	The code executes when user click on pages 
		 * (ie:- 1,2 or previous or next). It provides the 
		 * information ie:- vendor name & their related 
		 * service types, address label type list.*/
		 		
		else if (action.equalsIgnoreCase("PrintLabelList")) { // for Print Label
			PurchaseDetailsDao pdetails = new PurchaseDetailsDao();
			pdetails.getPrintLabelInfo(request,printLabelDto);
			
			// to print lables
			Label lbl = new Label();
			ArrayList labelList = lbl.getLabelList();
			request.setAttribute("Labels", labelList);
			forward = "/purchase/printLables";
		}
		
		/*	Update the address type label selected by
		 * user in the existing address type label list.
		 * Also update the related information such as 
		 * width,height,etc.*/
		 
		else if (action.equalsIgnoreCase("UpdateLabel")) { 
			PurchaseDetailsDao pdetails = new PurchaseDetailsDao();
			request.setAttribute("Vendor","Vendor");
			Label lbl = new Label();
			ArrayList labelList = lbl.getLabelList();
			request.setAttribute("Labels", labelList);
			//SalesDetails sd = new SalesDetails();
			pdetails.getLabel(request, printLabelDto);
			sd.getLabelType(request);
			forward = "/sales/setUpLabel";
		}
		/*
				Saves the new address type label & its related 
		 * information sach as width, height,etc. to the
		 * database.*/
		 
		else if (action.equalsIgnoreCase("SaveLabel")) { 
			PurchaseDetailsDao pdetails = new PurchaseDetailsDao();
			//SalesDetailsDao sd = new SalesDetailsDao();
			boolean result=pdetails.saveLabel(request, printLabelDto);
			String msg="";
			request.setAttribute("Vendor","v");
			if(result){
				pdetails.addNewLabel(printLabelDto);
				msg="Label is saved successfully";
				
			}
			else{
				msg="Label is updated successfully";
				
			}
			saleDetailsDao.getLabelType(request);
			Label lbl = new Label();
			ArrayList labelList = lbl.getLabelList();
			request.setAttribute("Labels", labelList);
			request.setAttribute("Status",msg);
			forward = "/sales/setUpLabel";
		}
		else if (action.equalsIgnoreCase("AddNewLabel")) { 
			PurchaseDetailsDao sd = new PurchaseDetailsDao();
			request.setAttribute("Vendor","V");
			sd.addNewLabel(printLabelDto);
			forward = "/sales/addLabel";
		}
		else if (action.equalsIgnoreCase("DeleteLabel")) { 
			request.setAttribute("Vendor","v");
			PurchaseDetailsDao pdetails = new PurchaseDetailsDao();
		//	SalesDetails sd = new SalesDetails();
			pdetails.deleteLabel(request, printLabelDto);
			sd.getLabelType(request);
			Label lbl = new Label();
			ArrayList labelList = lbl.getLabelList();
			request.setAttribute("Labels", labelList);
			forward = "/sales/setUpLabel";
		}
		request.setAttribute("customerDto", printLabelDto);
		return forward;
	}  
}