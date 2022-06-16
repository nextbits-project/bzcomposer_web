package com.avibha.bizcomposer.sales.dao;

import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.avibha.common.log.Loger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class SalesOrderBoardDetails {

    public ArrayList getSalesOrderBoardDetails(HttpServletRequest request, SalesBoardDto sform) {
        HttpSession sess = request.getSession();
        String compId = (String) sess.getAttribute("CID");
        SalesOrderBoardInfo SaleInfo = new SalesOrderBoardInfo();
        ArrayList saleOrderDetails = SaleInfo.SalesRecordSearch(compId, sform);
        request.setAttribute("SalesOrderBoardDetails", saleOrderDetails);
        request.setAttribute("Market", sform.getFilterMarket());
        return saleOrderDetails;
    }

    public void updateRecord(HttpServletRequest request) {
        SalesOrderBoardInfo salesInfo = new SalesOrderBoardInfo();
        boolean result = salesInfo.update(request);
        String msg = "";
        if (result) {
            msg = "**Update is sucessfully completed";
            Loger.log("Updated " + msg);
        } else {
            msg = "**Record is not updated";
        }
        request.setAttribute("IsUpdated", msg);
    }
}
