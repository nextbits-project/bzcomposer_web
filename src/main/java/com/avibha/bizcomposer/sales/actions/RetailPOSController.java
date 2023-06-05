/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.sales.dao.*;
import com.avibha.bizcomposer.sales.dto.InvoiceDetailsResponse;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/retail-pos")
public class RetailPOSController {

    @GetMapping
    public ModelAndView index(HttpServletRequest request,
                              HttpServletResponse response) {

		String companyId = request.getSession().getAttribute("CID").toString();
//        String companyId = String.valueOf(1);

        // customer list
        CustomerInfoDao customerInfoDao = new CustomerInfoDao();
        List<CustomerDto> customerList = customerInfoDao.customerDetails(companyId);

        // Get All items and Category Together
        InvoiceInfoDao invoice = new InvoiceInfoDao();
        Map<String, ArrayList<Item>> itemListAndCategories = invoice.getItemListAndCategories(companyId);
        // item category
        List<Item> categories = itemListAndCategories.get("categories");
        // item list
        List<Item> itemList = itemListAndCategories.get("itemList");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("sales/pos/retailPos");
        request.setAttribute("customerList", customerList);
        request.setAttribute("categories", categories);
        request.setAttribute("itemList", itemList);

        return mv;
    }

    @GetMapping("/{invoiceId}")
    public ModelAndView invoiceDetails(@PathVariable String invoiceId, HttpServletRequest request) {
        String companyId = request.getSession().getAttribute("CID").toString();
        InvoiceInfoDao invoice = new InvoiceInfoDao();
        InvoiceDetailsResponse response = invoice.invoiceDetails(Integer.parseInt(invoiceId), companyId);
        request.setAttribute("box", response);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("sales/pos/print");

        return mv;
    }
}
