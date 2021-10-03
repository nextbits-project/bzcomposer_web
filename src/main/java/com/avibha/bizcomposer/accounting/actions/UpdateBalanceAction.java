/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights 
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.accounting.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.avibha.bizcomposer.accounting.dao.Account;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.avibha.common.log.Loger;
import com.avibha.common.utility.Path;

public class UpdateBalanceAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String forward = "failure";

		if (request.getSession().isNew()
				|| ((String) request.getSession().getAttribute("CID")) == null
				|| ((Path) request.getSession().getAttribute("path")) == null) {
			forward = "Expired";
		} else {
			Loger.log("INSIDE UPDATE BALANCE ACTION");
			String orderno = request.getParameter("ordNumber");
			String bal = request.getParameter("changedBal");
			Loger.log("Order is" + orderno);
			Loger.log("balance is" + bal);

			if (Account.updateBalance(bal, orderno))
				forward = "success";
			else
				forward = "failure";
		}
		return mapping.findForward(forward);
	}

}
