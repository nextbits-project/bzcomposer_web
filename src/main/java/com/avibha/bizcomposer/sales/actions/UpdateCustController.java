package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.sales.dao.SalesDetails;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.log.Loger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author sarfrazmalik
 */
@Controller
public class UpdateCustController {

    @RequestMapping(value = {"/updateEditedCustomer"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String execute(CustomerDto customerDto, HttpServletRequest request) throws IOException, ServletException {
        SalesDetails sdetails = new SalesDetails();
        String action = request.getParameter("tabid");
        String cvId = null;
        if(action==null){
            cvId = (String) request.getSession().getAttribute("editedCVID");
            sdetails.updateInvoice(cvId,request);
        }
        else if (action.equalsIgnoreCase("edit")) {
            cvId = (String) request.getSession().getAttribute("editedCVID");
            sdetails.UpdateCustomer(request, customerDto);
            sdetails.updateInvoice(cvId,request);
        }
        else if (action.equalsIgnoreCase("DHLUP")) {
            cvId = request.getParameter("CustId");
            sdetails.updateInvoice(cvId,request);
            sdetails.getLookup(cvId, request, customerDto);
        }
        //return "/sales/updateCustomer";
        return "redirect:/Customer?tabid=editCustomer&cvId="+cvId;
    }
}
