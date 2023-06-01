/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.sales.dao.BoxInvoice;
import com.avibha.bizcomposer.sales.dao.BoxInvoiceItem;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dto.PosInvoiceItem;
import com.avibha.bizcomposer.sales.dto.PosInvoiceRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/retail-pos-ajax-actions")
public class RetailPOSAjaxActionsController {

    @PostMapping("/save")
    @ResponseBody
    public boolean save(@RequestBody PosInvoiceRequest invoiceRequest, HttpServletRequest request) {

        String companyId = request.getSession().getAttribute("CID").toString();

        List<PosInvoiceItem> invoiceItems = invoiceRequest.getInvoiceItems();
        double subTotal = parseDouble(invoiceRequest.getSubTotal());
        double taxTotal = parseDouble(invoiceRequest.getTaxTotal());
        double discount = parseDouble(invoiceRequest.getDiscount());
        double grandTotal = parseDouble(invoiceRequest.getGrandTotal());
//        int paymentMethod = invoiceRequest.getPaymentMethod();
        int customerId = parseInt(invoiceRequest.getCustomerId());

        BoxInvoice boxInvoice = new BoxInvoice();
        boxInvoice.setSubTotal(subTotal);
        boxInvoice.setTaxTotal(taxTotal);
        boxInvoice.setDiscount(discount);
        boxInvoice.setGrandTotal(grandTotal);
        boxInvoice.setPaymentMethod(1);
        boxInvoice.setCustomerId(customerId);
        // Generate Order no
        int min = 100, max = 999;
        int random = min + (int)(Math.random() * ((max - min) + 1));
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        String orderNo = now.format(formatter) + random;
        boxInvoice.setOrderNo(parseInt(orderNo));
        boxInvoice.setTermId(3);
        boxInvoice.setIsInvoice(1);
        boxInvoice.setIsPaymentCompleted(1);
        boxInvoice.setIsSalesType(1);
        boxInvoice.setCompanyId(Integer.parseInt(companyId));
        boxInvoice.setInvoiceTypeId(7);
        System.out.println("=== hits ===");
        // cart items
        List<BoxInvoiceItem> boxInvoiceItems = new ArrayList<>();
        invoiceItems.forEach(item -> {
            BoxInvoiceItem boxItem = new BoxInvoiceItem();
            boxItem.setItemId(parseInt(item.getItemId()));
            boxItem.setItemName(item.getItemName());
            boxItem.setItemCode(item.getItemCode());
            boxItem.setQty(parseInt(item.getQty()));
            boxItem.setPrice(parseDouble(item.getPrice()));
            boxItem.setAmount(item.getAmount());
        });

        boxInvoice.setInvoiceItems(boxInvoiceItems);
        boxInvoice.setDateAdded(now);
        boxInvoice.setDateConfirmed(now);

        InvoiceInfoDao invoiceInfoDao = new InvoiceInfoDao();
        try {
            invoiceInfoDao.posInvoiceSave(boxInvoice);
            return true;
        } catch (Exception ignored) {
            return false;
        }
    }

    @GetMapping("/print")
    public String print() {
        return "sales/pos/print";
    }

    private boolean isEmpty(String value) {
        return Objects.equals(value, "") || value == null || value.trim().length() == 0;
    }

    private int parseInt(String value) {
        return Integer.parseInt(value);
    }

    private double parseDouble(String value) {
        return Double.parseDouble(value);
    }

}
