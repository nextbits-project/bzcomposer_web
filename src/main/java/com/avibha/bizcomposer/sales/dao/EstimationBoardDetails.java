package com.avibha.bizcomposer.sales.dao;

import com.avibha.bizcomposer.sales.forms.EstimationBoardDto;
import com.avibha.common.log.Loger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class EstimationBoardDetails {

	@Autowired
	private EstimationBoardInfo estimationBoardInfo;
	
    public ArrayList getEstimationBoardDetails(HttpServletRequest request, EstimationBoardDto eform) {
        HttpSession sess = request.getSession();
        String compId = (String) sess.getAttribute("CID");
//        EstimationBoardInfo EstimationInfo = new EstimationBoardInfo();
        ArrayList estBoardList = estimationBoardInfo.EstimationRecordSearch(compId, eform);
        request.setAttribute("EstimationBoardDetails", estBoardList);
        request.setAttribute("Market", eform.getFilterMarket());
        
        return estBoardList;
    }

    public void updateRecord(HttpServletRequest request) {
        //	SalesBoardInfo salesInfo = new SalesBoardInfo();
//        EstimationBoardInfo EstimationInfo = new EstimationBoardInfo();
        boolean result = estimationBoardInfo.update(request);
        String msg = "";
        if (result) {
            msg = "**Update is sucessfully completed";
            Loger.log("Updated " + msg);
        } else {
            msg = "**Record is not updated";
        }
        request.setAttribute("IsUpdated", msg);
    }
    
    public void deleteEstimationFromList(HttpServletRequest request)
    {
    	
    	boolean result=estimationBoardInfo.updateEstimation(request);
    	
        String msg = "";
        if (result) {
            msg = "**delete is sucessfully completed";
            Loger.log("Updated " + msg);
        } else {
            msg = "**delete  is  not completed";
        }
        request.setAttribute("msg", msg);
    	
    	
    }
}
