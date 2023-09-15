package com.avibha.bizcomposer.sales.dao;

import com.avibha.bizcomposer.sales.forms.EstimationBoardDto;
import com.avibha.common.log.Loger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class EstimationBoardDetails {

    public ArrayList getEstimationBoardDetails(HttpServletRequest request, EstimationBoardDto eform) {
        HttpSession sess = request.getSession();
        String compId = (String) sess.getAttribute("CID");
        EstimationBoardInfo EstimationInfo = new EstimationBoardInfo();
        ArrayList estBoardList = EstimationInfo.EstimationRecordSearch(compId, eform);
        request.setAttribute("EstimationBoardDetails", estBoardList);
        request.setAttribute("Market", eform.getFilterMarket());
        return estBoardList;
    }

    public void updateRecord(HttpServletRequest request) {
        //	SalesBoardInfo salesInfo = new SalesBoardInfo();
        EstimationBoardInfo EstimationInfo = new EstimationBoardInfo();
        boolean result = EstimationInfo.update(request);
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
