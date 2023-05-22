/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.sales.dao.CustomerInfoDao;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.Item;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/retail-pos-ajax")
public class RetailPOSAjaxController {

    @GetMapping("/{categoryId}/items")
    @ResponseBody
    public ModelAndView itemsByCategory(@PathVariable Integer categoryId, HttpServletRequest request,
                              HttpServletResponse response) {

        System.out.println(categoryId);
		String companyId = request.getSession().getAttribute("CID").toString();
//        String companyId = String.valueOf(1);

        // Get All items and Category Together
        InvoiceInfoDao invoice = new InvoiceInfoDao();
        List<Item> itemList = invoice.getItemListByCategory(String.valueOf(categoryId), companyId);
          ModelAndView mv = new ModelAndView();
        mv.setViewName("sales/pos/items");
        request.setAttribute("itemList", itemList);
        System.out.println(itemList.size());
        return mv;
    }
}
