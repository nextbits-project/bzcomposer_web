/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.rma.actions;

import com.avibha.bizcomposer.rma.dao.RMADetailsDao;
import com.avibha.bizcomposer.rma.dao.RMAInfoDao;
import com.avibha.bizcomposer.rma.forms.RMADto;
import com.avibha.bizcomposer.sales.dao.SalesBoard;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.Path;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;
@Controller
public class RMAController {
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping,
	 *      org.apache.struts.action.ActionForm,
	 *      javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse)
	 */
	
	@Autowired
	private RMADetailsDao rmaDetailsDao;
	
	@Autowired
	private RMAInfoDao rmaInfoDao;
	
	@Autowired
	BcaInvoiceRepository bcaInvoiceRepository;
	
	@RequestMapping(value = {"/RMA"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView RMA(RMADto rmaDto, HttpServletRequest request) throws IOException, ServletException {
	    String forward = "/rma/rma";
	    String action = request.getParameter("tabid");
	    HttpSession sess = request.getSession();
	    String compId = (String) sess.getAttribute("CID");
	    Loger.log("Acc " + action);
	    request.setAttribute("rmaDto", rmaDto);

	    if (action == null) {
	        rmaDetailsDao.getRAMDetails(request, rmaDto);
	        forward = "/rma/rma";
	    } else {
	        switch (action) {
	            case "CreateRMA":
	                int orderNo = Integer.parseInt(request.getParameter("orderNumber"));

	                // Get invoice Id using order number
	                int invoiceId = rmaInfoDao.getInvoiceId(orderNo, 1, compId); // 1 = InvoiceTypeID for Sales Order
	                // Get invoice Details using invoiceId
//	                SalesBoard invoiceObj = rmaInfoDao.getInvoice(invoiceId, compId);
	                Optional<BcaInvoice> bcaInvoiceOp = bcaInvoiceRepository.findByInvoiceIdAndCompany_CompanyId(invoiceId, Long.valueOf(compId));
	                BcaInvoice bcaInvoice = null;
	                if (bcaInvoiceOp.isPresent()) {
	                	bcaInvoice = bcaInvoiceOp.get();
					}
	                // Get Cart id using invoice ID
	                // int cartId = rmaInfo.getCartId(invoiceId, compId);
	                if (bcaInvoice.getIsPaymentCompleted() && bcaInvoice.getShipped() == 1) {
	                    String reason = "Not Used";
//	                    rmaInfoDao.insertRMA2(invoiceObj.getInventoryQty(), reason, invoiceObj.getInventoryId());
	                    rmaInfoDao.insertRMAJpa(bcaInvoice, reason);
	                } else {
	                    System.out.println("RMA is created only for paid and shipped invoice.");
	                }
	                rmaDetailsDao.getRAMDetails(request, rmaDto);
	                forward = "redirect:/RMA?tabid=R0L0S0";
	                break;

	            case "CreateRMApo":
	                int poNumber = Integer.parseInt(request.getParameter("poNumber"));

	                // Get invoice Id using order number
	                int poInvoiceId = rmaInfoDao.getInvoiceId(poNumber, 2, compId); // 2 = InvoiceTypeID for PO
	                // Get invoice Details using invoiceId
//	                SalesBoard invoiceObj = rmaInfoDao.getInvoice(invoiceId, compId);
	                Optional<BcaInvoice> bcaInvoicePoOp = bcaInvoiceRepository.findByInvoiceIdAndCompany_CompanyId(poInvoiceId, Long.valueOf(compId));
	                BcaInvoice bcaInvoicePo = null;
	                if (bcaInvoicePoOp.isPresent()) {
	                	bcaInvoicePo = bcaInvoicePoOp.get();
	                	String reason = "Not Used";
	                    rmaInfoDao.insertRMAJpa(bcaInvoicePo, reason);
					}
//	                if (bcaInvoicePo.getIsPaymentCompleted() && bcaInvoicePo.getShipped() == 1) {
//	                    String reason = "Not Used";
//	                    rmaInfoDao.insertRMAJpa(bcaInvoicePo, reason);
//	                } else {
//	                    System.out.println("RMA is created only for paid and shipped PO.");
//	                }
//	                rmaDetailsDao.getRAMDetails(request, rmaDto);
//	                forward = "redirect:/rma/rmaListVendor";
	                rmaDetailsDao.getRAMList(request, rmaDto, 2); // 2 = InvoiceTypeID for PO
	                forward = "redirect:/RMA?tabid=RMAVendor";
	                break;
	                
	            case "R0M0A0": // For Fname and lname listing
	                rmaDetailsDao.getRAMDetails(request, rmaDto);
	                forward = "/rma/rma";
	                break;

	            case "RmaInfo": // for RMA Details
	                rmaDetailsDao.getRAMInfo(request, rmaDto);
	                forward = "/rma/rmaDetails";
	                break;

	            case "R0A0D0": // to insert or approve RMA
	                rmaDetailsDao.insertRAM(request, rmaDto);
	                rmaDetailsDao.getRAMInfo(request, rmaDto);
	                forward = "/rma/rmaDetails";
	                break;

	            case "R0R0M0": // to Delete or cancel RMA
	                rmaDetailsDao.deleteRAM(request);
	                rmaDetailsDao.getRAMInfo(request, rmaDto);
	                forward = "/rma/rmaDetails";
	                break;

	            case "R0S0C0": // to find RMA
	                rmaDetailsDao.getRAMSearch(request, rmaDto);
	                forward = "/rma/rma";
	                break;

	            case "R0L0S0": // for RMA List
	                rmaDto.setStartPage(1);
	                request.getSession().setAttribute("StartPage", String.valueOf(rmaDto.getStartPage()));
	                rmaDetailsDao.getRAMList(request, rmaDto, 1); // 1 = InvoiceTypeID for Invoice
	                forward = "/rma/rmaList";
	                break;

	            case "R0L0S0List": // for RMA List
	                rmaDetailsDao.getRAMList(request, rmaDto, 1); // 1 = InvoiceTypeID for Invoice
	                forward = "/rma/rmaList";
	                break;

	            case "CreditMemo":
	                forward = "/rma/creditMemo";
	                break;
	                
	            case "RMAVendor": // for RMA List
	                rmaDto.setStartPage(1);
	                request.getSession().setAttribute("StartPage", String.valueOf(rmaDto.getStartPage()));
	                rmaDetailsDao.getRAMList(request, rmaDto, 2); // 2 = InvoiceTypeID for PO
	                forward = "/rma/rmaListVendor";
	                break;
	                
	            default:
	                rmaDetailsDao.getRAMDetails(request, rmaDto);
	                forward = "/rma/rma";
	                break;
	        }
	    }

	    return new ModelAndView(forward);
	}

//	@RequestMapping(value = {"/RMA"}, method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView RMA(RMADto rmaDto, HttpServletRequest request) throws IOException, ServletException {
//		String forward = "/rma/rma";
//		String action = request.getParameter("tabid");
//		HttpSession sess = request.getSession();
//		String compId = (String) sess.getAttribute("CID");
//		Loger.log("Acc "+action);
//		request.setAttribute("rmaDto",rmaDto);
//		if(action == null){
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDetailsDao.getRAMDetails(request, rmaDto);
//			forward = "/rma/rma";
//		}
//		else if (action.equalsIgnoreCase("CreateRMA")) {
////			RMADetailsDao rd=new RMADetailsDao();
//			int orderNo = Integer.parseInt(request.getParameter("orderNumber"));
//
//			// Get invoice Id using order number
////			RMAInfoDao rmaInfo = new RMAInfoDao();
//			int invoiceId = rmaInfoDao.getInvoiceId(orderNo, 1, compId); // 1 = InvoiceTypeID for Sales Order
//			// Get invoice Details using invoiceId
//			SalesBoard invoiceObj = rmaInfoDao.getInvoice(invoiceId, compId);
//
//			// Get Cart id using invoice ID
//			//int cartId = rmaInfo.getCartId(invoiceId, compId);
//			if (invoiceObj.isPaymentCompleted() && invoiceObj.getShipped() == 1) {
//				String reason = "Not Used";
//				rmaInfoDao.insertRMA2(invoiceObj.getInventoryQty(),reason,invoiceObj.getInventoryId());
//			}else{
//				System.out.println("RMA is created only for paid and shipped invoice.");
//			}
//			rmaDetailsDao.getRAMDetails(request, rmaDto);
//			forward = "redirect:/RMA?tabid=R0L0S0";
//
//		}
//		else if (action.equalsIgnoreCase("R0M0A0")) { // For Fname and lname listing
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDetailsDao.getRAMDetails(request, rmaDto);
//			forward = "/rma/rma";
//		}
//		
//		else if (action.equalsIgnoreCase("RmaInfo")) { // for RMA Details
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDetailsDao.getRAMInfo(request,rmaDto);
//			forward = "/rma/rmaDetails";
//		}
//		
//		else if (action.equalsIgnoreCase("R0A0D0")) {  // to insert or approve RMA 
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDetailsDao.insertRAM(request,rmaDto);
//			rmaDetailsDao.getRAMInfo(request,rmaDto);
//			forward = "/rma/rmaDetails";
//		}
//		
//		else if (action.equalsIgnoreCase("R0R0M0")) { // to Delete or cancel RMA 
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDetailsDao.deleteRAM(request);
//			rmaDetailsDao.getRAMInfo(request,rmaDto);
//			forward = "/rma/rmaDetails";
//		}
//		
//		else if (action.equalsIgnoreCase("R0S0C0")) { //to find RMA 
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDetailsDao.getRAMSearch(request,rmaDto);
//			forward = "/rma/rma";
//		}
//		
//		else if (action.equalsIgnoreCase("R0L0S0")) { // for RMA List
////			RMADetailsDao rd=new RMADetailsDao();
//			rmaDto.setStartPage(1);
//			request.getSession().setAttribute("StartPage",String.valueOf(rmaDto.getStartPage()));
//			rmaDetailsDao.getRAMList(request,rmaDto);
//			forward = "/rma/rmaList";
//		}
//		else if (action.equalsIgnoreCase("R0L0S0List")) { // for RMA List
////			RMADetailsDao rd=new RMADetailsDao();
//
//			rmaDetailsDao.getRAMList(request,rmaDto);
//			forward = "/rma/rmaList";
//		}
//		else if (action.equalsIgnoreCase("CreditMemo")) {
//			forward = "/rma/creditMemo";
//		}
//		ModelAndView modelAndView =new ModelAndView(forward);
//		return modelAndView;
//	}

}
