package com.nxsol.bizcomposer.pos.action;

import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategory;
import com.nxsol.bizcompser.global.table.TblCategoryLoader;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListBean;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblPayment;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

@Controller
public class POSController {

	@GetMapping("/POS")
	public ModelAndView pos(HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		String forward = "/pos/pos";
		HttpSession sess=request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		if(action.equals("POS"))
		{
			forward = "/pos/pos";
		}

//		request.setAttribute("partiallyReceivedLayaways", partiallyReceivedLayaways);
//		request.setAttribute("receivedList", receivedPaymentList);
		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}
}
