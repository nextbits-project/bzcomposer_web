package com.avibha.bizcomposer.File.actions;

import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.ItemInfoDao;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.bizcomposer.sales.forms.ItemDto;
import com.avibha.common.utility.MyUtility;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.apache.poi.util.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author sarfrazmalik
 */
@Controller
public class DataImportExportController {

    @GetMapping("/exportDataIntoJsonFile")
    public void exportItemsIntoJsonFile(HttpServletRequest request, HttpServletResponse response) {
        String compId = (String) request.getSession().getAttribute("CID");
        String action = request.getParameter("tabid");
        try {
            ObjectMapper mapper = new ObjectMapper();
            ObjectWriter writer = mapper.writerWithDefaultPrettyPrinter();
            if(action.equalsIgnoreCase("ItemList")) {
                ItemInfoDao item = new ItemInfoDao();
                ArrayList<ItemDto> itemList = new ArrayList<>();    //item.SearchItem(compId, null,null, request);

                String outFileName = "ItemList-" + MyUtility.getCurrentDate();
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=" + outFileName + ".json");
                ByteArrayInputStream stream = new ByteArrayInputStream(writer.writeValueAsBytes(itemList));
                IOUtils.copy(stream, response.getOutputStream());
                System.out.println("ItemList Exported...");
            }
            else if(action.equalsIgnoreCase("CustomerList")) {
                InvoiceInfoDao invoiceInfoDao = new InvoiceInfoDao();
                ArrayList<CustomerDto> customerList = new ArrayList<>();    //invoiceInfoDao.SearchCustomerList(compId, null, request, new CustomerDto());

                String outFileName = "CustomerList-" + MyUtility.getCurrentDate();
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=" + outFileName + ".json");
                ByteArrayInputStream stream = new ByteArrayInputStream(writer.writeValueAsBytes(customerList));
                IOUtils.copy(stream, response.getOutputStream());
                System.out.println("CustomerList Exported...");
            }
            else if(action.equalsIgnoreCase("ConfigurationInfo")) {
                ConfigurationInfo configInfo = new ConfigurationInfo();
                ConfigurationDto configDto = new ConfigurationDto();
                configInfo.getCongurationRecord(compId, configDto, request);

                String outFileName = "ConfigurationInfo-" + MyUtility.getCurrentDate();
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=" + outFileName + ".json");
                ByteArrayInputStream stream = new ByteArrayInputStream(writer.writeValueAsBytes(configDto));
                IOUtils.copy(stream, response.getOutputStream());
                System.out.println("CustomerList Exported...");
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    @GetMapping("/importDataFromJsonFile")
    public String importDataFromJsonFile(HttpServletRequest request, Model model) {
        String forward = null;
        String action = request.getParameter("tabid");
        if(action.equalsIgnoreCase("ConfigurationInfo")) {
            forward = "/file/configurationImport";
        }
        return forward;
    }

    @PostMapping("/importDataFromJsonFile")
    public String importItemsFromJsonFile(@RequestParam("attachFile") MultipartFile attachFile, HttpServletRequest request) {
        String compId = (String) request.getSession().getAttribute("CID");
        String action = request.getParameter("tabid");
        String forward = null;
        try {
            if(!attachFile.isEmpty()) {
                ObjectMapper mapper = new ObjectMapper();
                InputStream inputStream = attachFile.getInputStream();
                if(action.equalsIgnoreCase("ItemList")) {
                    SalesDetailsDao sdetails = new SalesDetailsDao();
                    TypeReference<List<ItemDto>> typeReference = new TypeReference<List<ItemDto>>() {};
                    List<ItemDto> itemList = mapper.readValue(inputStream, typeReference);
                    for (ItemDto itemDto : itemList) {
                        System.out.println(itemDto.getInventoryId() + " : " + itemDto.getItemCode() + " : " + itemDto.getItemName());
                        sdetails.AddItem(request, itemDto);
                    }
                    request.getSession().setAttribute("ItemUploaded", "success");
                    forward = "redirect:/Item?tabid=UploadItem";
                }
                else if(action.equalsIgnoreCase("ConfigurationInfo")) {
                    ConfigurationDto configDto = mapper.readValue(inputStream, ConfigurationDto.class);
                    ConfigurationInfo cinfo = new ConfigurationInfo();

                    System.out.println("------------importDataFromJsonFile---ConfigurationInfo----------------");
                    cinfo.saveConfigurationRecordGeneral(configDto, request);
                    cinfo.saveConfigurationRecordBilling(configDto, Integer.parseInt(compId));
                    cinfo.saveConfigurationRecordInventorySettting(configDto, Integer.parseInt(compId));
                    cinfo.saveAccountPaymentDetails(configDto, Integer.parseInt(compId));
                    cinfo.saveConfigurationRecord(configDto, Integer.parseInt(compId) ,request);
                    cinfo.saveCustomerInvoice(configDto, Integer.parseInt(compId));
                    cinfo.saveVendorPurchaseValuesInConfigInfo(configDto, Integer.parseInt(compId));
                    request.getSession().setAttribute("successMessage", "Success");
                    forward = "redirect:/importDataFromJsonFile?tabid=ConfigurationInfo";
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return forward;
    }

}
