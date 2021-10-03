package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.sales.dao.SalesOrderBoardDetails;
import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.avibha.common.log.Loger;
import com.nxsol.bizcomposer.common.EmailSenderDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class SalesOrderBoardController {

    @RequestMapping(value = {"/SalesOrderBoard"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String execute(SalesBoardDto salesBoardDto, HttpServletRequest request, Model model) throws IOException, ServletException {
        String forward = "/sales/SalesOrderBoard";
        model.addAttribute("emailSenderDto", new EmailSenderDto());
        model.addAttribute("salesBoardDto", salesBoardDto);
        String action = request.getParameter("tabid");
        if (action.equalsIgnoreCase("ShowList")) { // For Fname and lname listing
            SalesOrderBoardDetails sd = new SalesOrderBoardDetails();
            sd.getSalesOrderBoardDetails(request, salesBoardDto);
        }
        else if (action.equalsIgnoreCase("UpdateRecord")) { // For Fname and lname listing
            SalesOrderBoardDetails sd = new SalesOrderBoardDetails();
            sd.updateRecord(request);
            sd.getSalesOrderBoardDetails(request, salesBoardDto);
        }
        else if (action.equalsIgnoreCase("ReservedInventoryList")) { // ReservedInventoryList Report
            SalesOrderBoardDetails sd = new SalesOrderBoardDetails();
            sd.getSalesOrderBoardDetails(request, salesBoardDto);
            forward = "/reports/reservedInventoryList";
        }
        else if(action.equalsIgnoreCase("DamagedInvList")) {
            SalesOrderBoardDetails sd = new SalesOrderBoardDetails();
            sd.getSalesOrderBoardDetails(request, salesBoardDto);
        }
        return forward;
    }
}
