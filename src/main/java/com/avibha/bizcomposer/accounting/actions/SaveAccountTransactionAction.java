/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights 
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.accounting.actions;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.avibha.bizcomposer.accounting.dao.AccountingDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.avibha.bizcomposer.accounting.forms.SaveAccountForm;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.Path;

public class SaveAccountTransactionAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String forward = "failure";
		HttpSession session = request.getSession();
		String companyID = (String) session.getAttribute("CID");
		if (request.getSession().isNew()
				|| ((String) request.getSession().getAttribute("CID")) == null
				|| ((Path) request.getSession().getAttribute("path")) == null) {
			forward = "Expired";
		} else {
			Loger.log("INSIDE SAVE ACCOUNT ACTION");

			SaveAccountForm saf = (SaveAccountForm) form;

			int no = AccountingDAO.saveAccountTransaction(saf, request, companyID);
			if (no != 0) {
				forward = "success";
			}
		}
		return mapping.findForward(forward);
	}
}