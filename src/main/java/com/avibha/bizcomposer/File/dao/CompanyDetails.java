package com.avibha.bizcomposer.File.dao;

import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.avibha.common.utility.CountryState;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyDetails {

	@Autowired
	CompanyInfo comapanyDao;
	
    public void updateConpanydetails(HttpServletRequest request, CompanyInfoDto companyInfoDto) {
        HttpSession sess = request.getSession();
        String compId = (String) sess.getAttribute("CID");
        int userID=(Integer) sess.getAttribute("userID");
//        CompanyInfo comapanyDao = new CompanyInfo();
        comapanyDao.updateComapanyinfo(companyInfoDto,userID,compId);
        //	comapany.updateInsertComapany(compfrm, compId);
    }

    public void getAllList(HttpServletRequest request) {
        HttpSession sess = request.getSession();
        // country List
        CountryState cs = new CountryState();
        request.setAttribute("cList", cs.getCountry());
    }
}
