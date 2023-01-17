package com.avibha.bizcomposer.lead.actions;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avibha.bizcomposer.employee.dao.Title;
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

	private Title title;

	@PostConstruct
	private void postConstruct() {
		countryState = new CountryState();
		title = new Title();
	}

	@GetMapping("/Leads")
	public String loadLeads(@RequestParam(required = false, name = "tabid") String action, Model model,
			HttpSession session) throws Exception {
		String forward = "";
		// String action = request.getParameter("tabid");
		String strCompanyId = (String) session.getAttribute("CID");
		if (StringUtils.isEmpty(strCompanyId)) {
			return "redirect:Login?tabid=loginPage";
		}

		int companyId = Integer.parseInt(strCompanyId);

		// ConstValue.companyId = companyId;

		// ConstValue c = new ConstValue();
		// c.setCompanyId(Integer.parseInt(companyID));
		model.addAttribute("leadList", leadDAO.loadLeads(strCompanyId));

		forward = "/leads/leads";

		return forward;
	}

	@GetMapping("/Lead/delete")
	public String loadLead(@RequestParam(required = true, name = "LeadId") Long leadId, HttpSession session,
			Model model) {

		String strCompanyId = (String) session.getAttribute("CID");
		if (StringUtils.isEmpty(strCompanyId)) {
			return "redirect:Login?tabid=loginPage";
		}

		leadDAO.delete(leadId, strCompanyId);

		return "redirect:/Leads?tabid=leads";
	}

	@GetMapping("/Lead")
	public String loadLead(@RequestParam(required = false, name = "LeadId") Long leadId, Model model,
			HttpSession session) throws Exception {
		String forward = "";
		// String action = request.getParameter("tabid");
		String strCompanyId = (String) session.getAttribute("CID");
		if (StringUtils.isEmpty(strCompanyId)) {
			return "redirect:Login?tabid=loginPage";
		}

		int companyId = Integer.parseInt(strCompanyId);

		// ConstValue.companyId = companyId;

		// ConstValue c = new ConstValue();
		// c.setCompanyId(Integer.parseInt(companyID));

		if (leadId == null || leadId <= 0) {

			String countryID = ConstValue.countryID;
			String stateID = ConstValue.stateID;

			// country List
			model.addAttribute("cList", countryState.getCountry());
			model.addAttribute("countryList", countryState.getCountryList());
			model.addAttribute("stateList", countryState.getStateList(countryID));
			model.addAttribute("cityList", countryState.getCityList(stateID));

			model.addAttribute("titleList", title.getTitleList(strCompanyId));

			model.addAttribute("leadDto", new LeadDto());
			forward = "/leads/addLead";
		} else {
			LeadDto dto = leadDAO.loadLead(leadId, strCompanyId);

			String countryID = ObjectUtils.isEmpty(dto.getCountry()) ? ConstValue.countryID : dto.getCountry();
			String stateID = ObjectUtils.isEmpty(dto.getState()) ? ConstValue.stateID : dto.getState();

			// country List
			model.addAttribute("cList", countryState.getCountry());
			model.addAttribute("countryList", countryState.getCountryList());
			model.addAttribute("stateList", countryState.getStateList(countryID));
			model.addAttribute("cityList", countryState.getCityList(stateID));

			model.addAttribute("titleList", title.getTitleList(strCompanyId));
			model.addAttribute("leadDto", dto);
			forward = "/leads/addLead";
		}
		return forward;
	}

	@PostMapping("/Lead")
	public String saveLead(LeadDto leadDto, @RequestParam(required = true, name = "tabid") String action, Model model,
			HttpSession session) throws Exception {
		String forward = "";
		// String action = request.getParameter("tabid");
		String strCompanyId = (String) session.getAttribute("CID");
		if (StringUtils.isEmpty(strCompanyId)) {
			return "redirect:Login?tabid=loginPage";
		}

		if (leadDto.getLeadId() == null || leadDto.getLeadId() <= 0) {

			leadDAO.insert(leadDto, strCompanyId);
			/// forward = "/leads/addLead";
			model.addAttribute("success", true);
			forward = "/leads/addLead";
		} else {

			leadDAO.update(leadDto, strCompanyId);
			/// forward = "/leads/addLead";
			model.addAttribute("success", true);
			forward = "/leads/addLead";

		}

		return forward;
	}

}
