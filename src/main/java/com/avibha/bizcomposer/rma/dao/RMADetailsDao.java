/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.rma.dao;

import com.avibha.bizcomposer.rma.forms.RMADto;
import com.avibha.bizcomposer.rma.forms.RMAForm;
import com.avibha.common.log.Loger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class RMADetailsDao {
	@Autowired
	private RMAInfoDao rmaInfoDao;

	
	public void getRAMDetails(HttpServletRequest request, RMADto rFrm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		RMAInfoDao rmaInfo = new RMAInfoDao();
		ArrayList UNameList = new ArrayList();
		UNameList=rmaInfoDao.getUserName(compId);

		ArrayList orderDetails =rmaInfoDao.getOrderForRMACreate(compId, rFrm.getFname(), rFrm.getOrder(),rFrm.getLname(),  rFrm.getOrderDate() );
		request.setAttribute("UNameList",UNameList);
		request.setAttribute("RMADetails",orderDetails);
		Loger.log("Size of FNameList="+UNameList.size());
		}
	
	
	public void getRAMInfo(HttpServletRequest request, RMADto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		RMAInfoDao rmaInfo = new RMAInfoDao();
		String fname= request.getParameter("Fname");
		String lname= request.getParameter("Lname");
		
		String LastRMA=rmaInfoDao.getLastRMA();
		String OrderID=request.getParameter("OrderID");
		
		if(OrderID!=null){
			request.setAttribute("OrderID",OrderID);
			sess.removeAttribute("OrderID");
			sess.setAttribute("OrderID",OrderID);
		}else{
			OrderID=(String)sess.getAttribute("OrderID");
			
		}
		
		if(fname!=null){
			request.setAttribute("Fname",fname);
			sess.removeAttribute("Fname");
			sess.setAttribute("Fname",fname);
		}
		
		if(lname!=null){
			request.setAttribute("Lname",lname);
			sess.removeAttribute("Lname");
			sess.setAttribute("Lname",lname);
		}
		
		ArrayList RMADetails = new ArrayList();
		ArrayList ItemDetails = new ArrayList();
		ItemDetails=rmaInfoDao.getItemDetails(compId,OrderID);
		RMADetails=rmaInfoDao.getRMADetails(compId,OrderID);
		request.setAttribute("ItemDetails",ItemDetails);
		request.setAttribute("RMADetails",RMADetails);
		
		request.setAttribute("LastRMA",LastRMA);
	}
		

	public void getRAMSearch(HttpServletRequest request, RMADto rFrm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		RMAInfoDao rmaInfo = new RMAInfoDao();
		ArrayList RMADetails = new ArrayList();
		ArrayList UNameList = new ArrayList();
		String fname=request.getParameter("fnameTxt");
		String lname=request.getParameter("lnameTxt");
		UNameList=rmaInfoDao.getUserName(compId);
		request.setAttribute("FName",fname);
		request.setAttribute("LName",lname);
		RMADetails=rmaInfoDao.getRMASearch(compId,fname,lname,rFrm.getOrder(),rFrm.getOrderDate());
		request.setAttribute("NameList",UNameList);
		request.setAttribute("RMADetails",RMADetails);
		Loger.log("Size of FNameList="+UNameList.size());
		Loger.log("Size of RMADetails="+RMADetails.size());
		}
	
	
	public void getRAMList(HttpServletRequest request, RMADto rForm, int invoiceTypeID) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
	//	RMAInfoDao rmaInfo = new RMAInfoDao();
		ArrayList RMAList = new ArrayList();
		int limit = 10;         // Limit to no. of records display
		int total = rmaInfoDao.calculatePages(Long.parseLong(compId),limit, invoiceTypeID);
		
		int pageCount = 3; 
		int start = rForm.getStartPage();
		RMAList=rmaInfoDao.getRMAListNew(compId, invoiceTypeID, start,limit);
		rForm.setTotalPages(total);
		request.setAttribute("PageValue",String.valueOf(start));
		request.setAttribute("RMAList",RMAList);
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
		
		request.setAttribute("TotalPages",String.valueOf(rForm.getTotalPages()));
		request.setAttribute("Total",record);
		
	}

	public void insertRAM(HttpServletRequest request, RMADto rFrm) {
//		RMAInfoDao rmaInfo = new RMAInfoDao();
		boolean isRmaExist=false;
		
		isRmaExist=rmaInfoDao.isExistingRMA(rFrm.getRma());
			if(isRmaExist==false){
				String cartId= request.getParameter("cartID");
				rmaInfoDao.insertRMA(rFrm.getRma(),rFrm.getQty(),rFrm.getReason(),cartId);
			}
			else{
				String msg="RMA# has been already used.Please use other number";
				request.setAttribute("msg",msg);
				
			}
		}
	
	public void deleteRAM(HttpServletRequest request) {
//		RMAInfoDao rmaInfo = new RMAInfoDao();
		String rmaNo=request.getParameter("RMAno");
		rmaInfoDao.deleteRMA(rmaNo);
		}
	
	
}
