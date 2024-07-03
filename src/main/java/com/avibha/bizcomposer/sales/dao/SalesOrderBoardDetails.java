package com.avibha.bizcomposer.sales.dao;

import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.avibha.common.log.Loger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SalesOrderBoardDetails {
	@Autowired
	private SalesOrderBoardInfo salesOrderBoardInfo;
	
	public ArrayList getSalesOrderBoardDetails(HttpServletRequest request, SalesBoardDto sform) {
        HttpSession sess = request.getSession();
        String compId = (String) sess.getAttribute("CID");
//        SalesOrderBoardInfo SaleInfo = new SalesOrderBoardInfo();
        ArrayList saleOrderDetails = salesOrderBoardInfo.SalesRecordSearch(compId, sform);
        request.setAttribute("SalesOrderBoardDetails", saleOrderDetails);
        request.setAttribute("Market", sform.getFilterMarket());
        return saleOrderDetails;
    }
	
	public ArrayList getLayawaysBoardDetails(HttpServletRequest request, SalesBoardDto sform) {
        HttpSession sess = request.getSession();
        String compId = (String) sess.getAttribute("CID");
//        SalesOrderBoardInfo SaleInfo = new SalesOrderBoardInfo();
        ArrayList saleOrderDetails = salesOrderBoardInfo.layawaysRecordSearch(compId, sform);
        request.setAttribute("SalesOrderBoardDetails", saleOrderDetails);
        request.setAttribute("Market", sform.getFilterMarket());
        return saleOrderDetails;
    }
    
    

    public void updateRecord(HttpServletRequest request) {
//        SalesOrderBoardInfo salesInfo = new SalesOrderBoardInfo();
        boolean result = salesOrderBoardInfo.update(request);
        String msg = "";
        if (result) {
            msg = "**Update is sucessfully completed";
            Loger.log("Updated " + msg);
        } else {
            msg = "**Record is not updated";
        }
        request.setAttribute("IsUpdated", msg);
    }
    
    
    public void deleteSalesOrderFromList(HttpServletRequest request)
    {
    	boolean result=salesOrderBoardInfo.updateSalesOrder(request);	
        String msg = "";
        if (result) {
            msg = "**delete is sucessfully completed";
            Loger.log("Updated " + msg);
        } else {
            msg = "**delete  is  not completed";
        }
        request.setAttribute("IsUpdated", msg);
    	
    	
    }
}
