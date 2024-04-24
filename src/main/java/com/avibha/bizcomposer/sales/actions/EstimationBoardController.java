package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.sales.dao.EstimationBoardDetails;
import com.avibha.bizcomposer.sales.forms.EstimationBoardDto;
import com.avibha.common.log.Loger;
import com.nxsol.bizcomposer.common.EmailSenderDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Locale;

/**
 * @author Sarfraz Malik
 */
@Controller
public class EstimationBoardController {
	@Autowired
	private EstimationBoardDetails estimationBoardDetails;
	@Autowired
	private MessageSource messageSource;

    @RequestMapping(value = {"/EstimationBoard"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String execute(EstimationBoardDto estBoardDto, HttpServletRequest request, Model model) throws IOException, ServletException {
        String forward = "/sales/Estimationboard";
    	Locale locale = LocaleContextHolder.getLocale();
        String action = request.getParameter("tabid");
        model.addAttribute("estimationBoardDto", estBoardDto);
        model.addAttribute("emailSenderDto", new EmailSenderDto());
       // estimationBoardDetails.getEstimationBoardDetails(request, estBoardDto);
        if (action.equalsIgnoreCase("ShowList")) {
//            EstimationBoardDetails ed = new EstimationBoardDetails();
            estimationBoardDetails.getEstimationBoardDetails(request, estBoardDto);
            if(request.getParameter("status")!=null)
			{
			request.setAttribute("successMsg",messageSource.getMessage("BzComposer.global.recordDelete", new Object[] {}, locale));
			
			}
            
        }
        else if (action.equalsIgnoreCase("UpdateRecord")) {
//            EstimationBoardDetails ed = new EstimationBoardDetails();
        	estimationBoardDetails.updateRecord(request);
        	estimationBoardDetails.getEstimationBoardDetails(request, estBoardDto);
        }
        else if (action.equalsIgnoreCase("AllEstimationList")) 
        {
            Loger.log("value from form ");
//            EstimationBoardDetails ed = new EstimationBoardDetails();
            estimationBoardDetails.getEstimationBoardDetails(request, estBoardDto);
            forward = "/reports/allEstimationReport";
        }
        else if (action.equalsIgnoreCase("DeleteListOrders")) 
        {
        	estimationBoardDetails.deleteEstimationFromList(request);
        	request.removeAttribute("EstimationBoardDetails");
        	estimationBoardDetails.getEstimationBoardDetails(request, estBoardDto);
        	
        	
        	forward = "redirect:/EstimationBoard?tabid=ShowList";
        	
        }
       
        
        return forward;
    }
}
