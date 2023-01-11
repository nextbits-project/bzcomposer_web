package com.avibha.bizcomposer.lead.actions;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avibha.bizcomposer.lead.dao.LeadDAO;
import com.avibha.bizcomposer.lead.dto.LeadDto;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.utility.CountryState;
import com.nxsol.bizcomposer.common.ConstValue;

/**
 * @author kamiomar
 */
@Controller
public class LeadController {
	
	@Autowired
	private LeadDAO leadDAO;
	
	private CountryState countryState;
	
    @PostConstruct
	private void postConstruct() {
    	countryState = new CountryState();
    }


	@GetMapping("/Leads")
	public String execute(@RequestParam(required = true, name = "tabid") String action, Model model, HttpSession session)
			throws Exception {
		String forward = "";
		// String action = request.getParameter("tabid");
		String companyID = (String) session.getAttribute("CID");
		if(StringUtils.isEmpty(companyID)) {
 			return "redirect:Login?tabid=loginPage";
		}
		ConstValue.companyId  = Integer.parseInt(companyID);

		// ConstValue c = new ConstValue();
		// c.setCompanyId(Integer.parseInt(companyID));

		if (action.equalsIgnoreCase("Leads")) {
			forward = "/leads/leads";
		} else if (action.equalsIgnoreCase("NewLead")) {
			
 			String countryID = ConstValue.countryID;
			String stateID = ConstValue.stateID;
 				 
			 
			// country List
			model.addAttribute("cList", countryState.getCountry());
			model.addAttribute("countryList", countryState.getCountryList());
			model.addAttribute("stateList", countryState.getStateList(countryID));
			model.addAttribute("cityList", countryState.getCityList(stateID));
			
			model.addAttribute("leadDto", new LeadDto());
			forward = "/leads/addLead";
		}else if (action.equalsIgnoreCase("editLead")) {
			model.addAttribute("leadDto", new CustomerDto());
			forward = "/leads/addLead";
			// forward = "/leads/updateLead";
		}else if (action.equalsIgnoreCase("deleteLead")) {
			forward = "/leads/addLead";
		}
		return forward;
	}

}
