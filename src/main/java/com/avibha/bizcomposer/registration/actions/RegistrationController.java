package com.avibha.bizcomposer.registration.actions;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.avibha.bizcomposer.login.forms.MultiUserForm;
import com.avibha.bizcomposer.login.forms.MultiUserFormValidator;
import com.avibha.common.utility.CountryState;
import com.avibha.bizcomposer.registration.dao.RegistrationDAO;
import com.avibha.bizcomposer.registration.dao.RegistrationDAOImpl;
import com.avibha.common.Country;
import com.avibha.common.utility.MyUtility;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.AddNewCompanyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegistrationController {

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private CountryState cs;

	@GetMapping("/Register")
	public String register(MultiUserForm mform, Model model) {
		CountryState cs = new CountryState();
		model.addAttribute("countryList", cs.getCountryList());
		AddNewCompanyDAO newComDao = new AddNewCompanyDAO();
		model.addAttribute("businessType", newComDao.getBusinessType());
		
		model.addAttribute("multiUserForm", mform);
		return "register";
	}

	@RequestMapping(value = { "/addUserMember", "/administer/addUserMember" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addUser(MultiUserForm mform, HttpServletRequest request, Model model) {
		String forward = "register";
		Locale locale = LocaleContextHolder.getLocale();
		String URI = request.getRequestURI();
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (URI.contains("administer")) {
				return "redirect:/administer?tabid=AddVisitor";
			} else {
				return "redirect:/Register?tabid=Register";
			}
		}
		RegistrationDAO regisDAO = new RegistrationDAOImpl();
		MultiUserFormValidator validator = new MultiUserFormValidator();
		CountryState cs = new CountryState();
		ArrayList<Country> countryList = cs.getCountryList();
		model.addAttribute("countryList", countryList);
		mform.setUserName(mform.getEmailAddress().substring(0, mform.getEmailAddress().indexOf("@")));
		if (validator.isMultiUserValidValue(mform, messageSource, request) || checkEmailExists(mform, request)
				|| checkLoginIdExists(mform, request)) {
			model.addAttribute("mform", mform);
		} else {
			// adding Company information
			AddNewCompanyDAO newCompany = new AddNewCompanyDAO();
			CompanyInfoDto newCompanyDto = new CompanyInfoDto();
			LocalDate currentDate = LocalDate.now(); // Get the current date
	        LocalDate expiryDate = currentDate.plusMonths(6); // Add 6 months to the current date
	        mform.setDateExpiry(expiryDate.toString());
			newCompanyDto = setCompanyInformation(mform, newCompanyDto);
			newCompany.addCompany(newCompanyDto);
			mform.setCompanyID(ConstValue.companyId);

			// adding user information
			int updateCount = mform.getUserID() > 0 ? regisDAO.updateUserInformation(mform)
					: regisDAO.addUserInformation(mform);
			if (updateCount <= 0) {
				request.setAttribute("errorMsg",
						messageSource.getMessage("err.registration.error", new Object[] {}, locale));
				model.addAttribute("mform", mform);
			} else {
				//Save Company Profile
				newCompany.saveCompanyProfile(newCompanyDto);
				//set success message
				request.setAttribute("successMsg",
						messageSource.getMessage("err.registration.success", new Object[] {}, locale));
				forward = "loginPage1";
			}
		}
		if (URI.contains("administer")) {
			forward = "/admin/visitorDetails";
		}
		return forward;
	}

	public CompanyInfoDto setCompanyInformation(MultiUserForm mform, CompanyInfoDto newCompanyDto) {
		newCompanyDto.setMembershipLevel(mform.getMembershipLevel());
		newCompanyDto.setSfirstName(mform.getFirstName());
		newCompanyDto.setSlastName(mform.getLastName());
		newCompanyDto.setJobPosition(mform.getJobPosition());
		newCompanyDto.setsEmail(mform.getEmailAddress());
		newCompanyDto.setAdminUserName(mform.getUserName());
		newCompanyDto.setPassword(mform.getPassword());
		newCompanyDto.setConfirmPassword(mform.getConfirmPassword());
		newCompanyDto.setCompanyName(mform.getCompanyName());
		newCompanyDto.setsNickName(mform.getNickName());
		newCompanyDto.setsAddress1(mform.getAddress1());
		newCompanyDto.setsAddress2(mform.getAddress2());
		newCompanyDto.setsZip(mform.getZip());
		newCompanyDto.setsCity(mform.getCity());
		newCompanyDto.setsState(mform.getState());
		newCompanyDto.setsProvince(mform.getProvince());
		newCompanyDto.setsCountry(mform.getCountry());
		newCompanyDto.setsPhone1(mform.getPhone());
		newCompanyDto.setsPhone2(mform.getCellPhone());
		newCompanyDto.setsFax1(mform.getFax());
		newCompanyDto.setsEndDate(mform.getDateExpiry());
		newCompanyDto.setBusinessTypeId(Integer.valueOf(mform.getBusinessTypeID()));

		return newCompanyDto;

	}

	public boolean checkLoginIdExists(MultiUserForm mform, HttpServletRequest request) {
		boolean isUserExists = false;
		RegistrationDAO regisDAO = new RegistrationDAOImpl();
		isUserExists = regisDAO.isUserExists(mform.getUserName());
		if (isUserExists && mform.getUserID() == 0) {
			Locale locale = LocaleContextHolder.getLocale();
			request.setAttribute("errorMsg",
					messageSource.getMessage("err.registration.username.duplicate", new Object[] {}, locale));
			return true;
		}
		return false;
	}

	public boolean checkEmailExists(MultiUserForm mform, HttpServletRequest request) {
		boolean isEmailExists = false;
		RegistrationDAO regisDAO = new RegistrationDAOImpl();
		isEmailExists = regisDAO.isEmailExists(mform.getEmailAddress());
		Locale locale = LocaleContextHolder.getLocale();
		if (isEmailExists && mform.getUserID() == 0) {
			request.setAttribute("errorMsg",
					messageSource.getMessage("err.registration.emailaddress.duplicate", new Object[] {}, locale));
			return true;
		}
		return false;
	}

//	============================ Register Rest APIs ============================
	@ResponseBody
	@RequestMapping(value = "/RegisterAPI", method = { RequestMethod.GET, RequestMethod.POST })
	public Object loadStatesByCountry(HttpServletRequest request) throws Exception {
		String status = "Success";
		String action = request.getParameter("tabid");
//		CountryState cs = new CountryState();
		if (action.equalsIgnoreCase("loadStatesByCountryID")) {
			return cs.getStateList(request.getParameter("id"));
		} else if (action.equalsIgnoreCase("loadCitiesByStateID")) {
			return cs.getCityList(request.getParameter("id"));
		} else if (action.equalsIgnoreCase("loadAddressDetailsByZipcode")) {
			String zipcode = request.getParameter("zipcode");
			return cs.getAddressDetailsByZipcode(zipcode);
		} else {
			return status;
		}

	}

}
