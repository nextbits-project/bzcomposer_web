<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs2" ).tabs();
  });
<%-- $(document).ready(function()
{
	$("#refundReasonSel option").each(function() 
	{
		if ($(this).val() == 1) 
		{
            $(this).css("color", 'Blue');
		}
		else
		{
			//alert('normal Reason');
		}
    });
	
	var groupId = '<%= request.getAttribute("groupId")%>';
	var countryId = '<%= request.getAttribute("countryId")%>';
	var stateId = '<%= request.getAttribute("stateId")%>';
	var shippingFeeMethodId = '<%= request.getAttribute("shippingMethodId")%>'; 
	var termId = '<%= request.getAttribute("termId")%>';
	var salesRepId = '<%= request.getAttribute("salesRepId")%>';
	var payMethodId = '<%= request.getAttribute("payMethodId")%>';
	
	//Added on 01-05-2020
	debugger
	var sortId = '<%= request.getAttribute("sortById")%>';
	debugger
	$('select[id="sortBy"]').find('option[value="'+sortId+'"]').attr("selected",true);
	debugger
	//$("#description").val("");
	
	var packingSlipStyleId = '<%= request.getAttribute("packingSlipStyleId")%>';
	
	var isChecked = '<%= request.getAttribute("isRefundAllowed")%>';
  	/*alert("RefundAllowed Checkecbox is"+isChecked);*/
    if(isChecked == "on")
    {
		
      	//alert("isRefundAllowed checked");
      	$("#isRefundAllowed").attr('checked', true);
      	 
		$("#refundReason").prop('readonly', false);
        $("#refundReasonSel").prop('readonly',false);
        $("#addRefundReason").prop('disabled',false);
        $("#updateRefundReason").prop('disabled',false);
        $("#deleteRefundReason").prop('disabled',false);
        $("#defaultReason").prop('disabled',false);
	} 
	else if(isChecked == "off")
    {
		//alert("isRefundAllowed unchecked");
        $("#refundReason").prop('readonly', true);
		$("#refundReasonSel").prop('readonly',true);
	    $("#addRefundReason").prop('disabled',true);
	    $("#updateRefundReason").prop('disabled',true);
	    $("#deleteRefundReason").prop('disabled',true);
	    $("#defaultReason").prop('disabled',true);
    }
	else
	{
		$("#refundReason").prop('readonly', isChecked);
        $("#refundReasonSel").prop('readonly',isChecked);
        $("#addRefundReason").prop('disabled',isChecked);
        $("#updateRefundReason").prop('disabled',isChecked);
        $("#deleteRefundReason").prop('disabled',isChecked);
        $("#defaultReason").prop('disabled',isChecked);
	}
	
	if(countryId==2)
	{
		$('#customerState').prop('disabled', false);	
	}
	else
	{
		$('#customerState').prop('disabled', true);
	}
	$('select[id="customerGroup"]').find('option[value="'+groupId+'"]').attr("selected",true);
	$('select[id="customerCountry"]').find('option[value="'+countryId+'"]').attr("selected",true);
	$('select[id="customerState"]').find('option[value="'+stateId+'"]').attr("selected",true);
	
	$('select[id="customerShippingId"]').find('option[value="'+shippingFeeMethodId+'"]').attr("selected",true);
	$('select[id="customerTerm"]').find('option[value="'+termId+'"]').attr("selected",true);
	$('select[id="customerSalesRep"]').find('option[value="'+salesRepId+'"]').attr("selected",true);
	$('select[id="customerPaymentMethod"]').find('option[value="'+payMethodId+'"]').attr("selected",true);
	$('select[id="packingSlipTemplateId"]').find('option[value="'+packingSlipStyleId+'"]').attr("selected",true);
	
	$("#isDefaultCreditTerm").change(function()
	{
    	var isChecked = '<%= request.getAttribute("isDefault")%>';
    	//var isChecked = "on";
        if($(this).prop("checked") == true){
            //alert("CustomerTaxale is checked.");
            $("#isDefaultCreditTerm").attr('checked', true);
            
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            //alert("CustomerTaxable is unchecked.");
            $("#isDefaultCreditTerm").attr('checked', false);
            
             isChecked = "off";
        }	
        else{
        	$("#isDefaultCreditTerm").attr('checked', isChecked);
        }	
    	document.configurationForm.isDefaultCreditTerm.value = isChecked;
    	$("#isDefaultCreditTerm").val(isChecked);
    });
	
	$("#custTaxable").change(function()
	{
    	var isChecked = '<%= request.getAttribute("custTaxableStatus")%>';
        if($(this).prop("checked") == true){
            //alert("CustomerTaxale is checked.");
            $("#custTaxable").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            //alert("CustomerTaxable is unchecked.");
            $("#custTaxable").attr('checked', false);
             isChecked = "off";
        }	
        else{
        	$("#custTaxable").attr('checked', isChecked);
        	document.configurationForm.custTaxable.value = isChecked;
        }	
    	$("#custTaxable").val(isChecked);
    });
	
	$("#addressSettings").change(function()
	{
    	var isChecked = '<%= request.getAttribute("addressStatus")%>';
        if($(this).prop("checked") == true)
        {
            $("#addressSettings").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false)
        {
            $("#addressSettings").attr('checked', false);
            isChecked = "off";
        }	
        else{
        	$("#custTaxable").attr('checked', isChecked);
        	document.configurationForm.addressSettings.value = isChecked;
        }	
    	$("#addressSettings").val(isChecked);
    });
	$("#isSalesOrder").change(function()
	{
    	var isChecked = '<%= request.getAttribute("salesOrderStatus")%>';
        if($(this).prop("checked") == true){
            $("#isSalesOrder").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#isSalesOrder").attr('checked', false);
            isChecked = "off";
        }	
        else
        {
            $("#isSalesOrder").attr('checked', isChecked);
        	document.configurationForm.isSalesOrder.value = isChecked;
        }	
    	$("#isSalesOrder").val(isChecked);
    });
	
	
	/*for Sales&Invocie panel*/
	$("#saleShowCountry").change(function()
	{
    	var isChecked = '<%=request.getAttribute("showCountry")%>';
        if($(this).prop("checked") == true){
            $("#saleShowCountry").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#saleShowCountry").attr('checked', false);
			isChecked = "off";
        }	
        else
        {
            $("#isSalesOrder").attr('checked', isChecked);
        	document.configurationForm.saleShowCountry.value = isChecked;
        }	
    	$("#saleShowCountry").val(isChecked);
    });
	
	$("#ratePriceChangable").change(function()
	{
    	var isChecked = '<%=request.getAttribute("ratePrice")%>';
        if($(this).prop("checked") == true){
            $("#ratePriceChangable").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#ratePriceChangable").attr('checked', false);
             isChecked = "off";
        }	
        else
        {
            $("#ratePriceChangable").attr('checked', isChecked);
        	document.configurationForm.ratePriceChangable.value = isChecked;
        }	
    	$("#ratePriceChangable").val(isChecked);
    });
	
	$("#saleShowTelephone").change(function()
	{
    	var isChecked = '<%= request.getAttribute("salesShowTelephone")%>';
        if($(this).prop("checked") == true){
            $("#saleShowTelephone").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#saleShowTelephone").attr('checked', false);
            isChecked = "off";
        }	
        else
        {
            $("#saleShowTelephone").attr('checked', isChecked);
        	document.configurationForm.saleShowTelephone.value = isChecked;
        }	
    	$("#saleShowTelephone").val(isChecked);
    });
	
	$("#isSalePrefix").change(function()
	{
    	var isChecked = '<%= request.getAttribute("isSalePrefix")%>';
        if($(this).prop("checked") == true){
            $("#isSalePrefix").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#isSalePrefix").attr('checked', false);
            isChecked = "off";
        }	
        else
        {
            $("#isSalePrefix").attr('checked', isChecked);
        	document.configurationForm.isSalePrefix.value = isChecked;
        }	
    	$("#isSalePrefix").val(isChecked);
    });
	
	$("#extraChargeApplicable").change(function()
	{
    	var isChecked = '<%= request.getAttribute("extraCharge")%>';
        if($(this).prop("checked") == true){
            $("#extraChargeApplicable").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#extraChargeApplicable").attr('checked', false);
             isChecked = "off";
        }	
        else
        {
            $("#extraChargeApplicable").attr('checked', isChecked);
        	document.configurationForm.extraChargeApplicable.value = isChecked;
        }	
    	$("#extraChargeApplicable").val(isChecked);
    }); 
	
	$("#recurringServiceBill").change(function()
	{
		var isChecked = "on";
		if($(this).prop("checked") == true){
            $("#recurringServiceBill").attr('checked', true);
            isChecked = "on"; 
        }
        else if($(this).prop("checked") == false){
            $("#recurringServiceBill").attr('checked', false);
             isChecked = "off";
        }	
        else
        {
            $("#recurringServiceBill").attr('checked', isChecked);
        	document.configurationForm.recurringServiceBill.value = isChecked;
        }	
    	$("#recurringServiceBill").val(isChecked);
	});
	
	$("#invoiceLocation").change(function(){
		var filePath = $("#invoiceLocation").val();
		//alert("Selected File:"+filePath);
		$("invoiceLocation").val(filePath);
		//document.configurationForm.invoiceLocation.value = filePath;
		//debugger
	});
	
	$("#saveImage").change(function(){
		var filePath = $("#saveImage").val();
		//alert("Selected File:"+filePath);
		$("saveImage").val(filePath);
		//document.configurationForm.invoiceLocation.value = filePath;
		//debugger
	});
	
	/* $("#form").submit(function(){
		debugger
		var form = $('form')[0]; // You need to use standard javascript object here
		debugger
		var formData = new FormData(form);
		formData.append('image', $('input[type=file]')[0].files[0]);
		$.ajax({
		    url: 'Configuration?tabid=SaveCustomerInvocieSettings',
		    data: formData,
		    type: 'POST',
		    contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
		    processData: false, // NEEDED, DON'T OMIT THIS
		    // ... Other options like success and etc
		});
	}); */
	Commented on 05-05-2019 due to this error:
	The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
	
	 $("#isRefundAllowed").change(function () 
	{
      	
      	var isChecked = '<%= request.getAttribute("isRefundAllowed")%>';
      	var checked = "on";
        if($(this).prop("checked") == true)
        {
          	//alert("isRefundAllowed checked");
          	$("#isRefundAllowed").attr('checked', true);
          	 
			$("#refundReason").prop('readonly', false);
            $("#refundReasonSel").prop('readonly',false);
            $("#addRefundReason").prop('disabled',false);
            $("#updateRefundReason").prop('disabled',false);
            $("#deleteRefundReason").prop('disabled',false);
            $("#defaultReason").prop('disabled',false);
              
            document.configurationForm.isRefundAllowed.value = "on"; 
		} 
		else if($(this).prop("checked") == false)
        {
          	//alert("isRefundAllowed unchecked");
            $("#refundReason").prop('readonly', true);
			$("#refundReasonSel").prop('readonly',true);
		    $("#addRefundReason").prop('disabled',true);
		    $("#updateRefundReason").prop('disabled',true);
		    $("#deleteRefundReason").prop('disabled',true);
		    $("#defaultReason").prop('disabled',true);
              
            document.configurationForm.isRefundAllowed.value = "off";
		}
      }); 
	/* $("#form").submit(function( event ) 
	{
		var text = $('#description').val();
		var setup = $("#setupID option:selected").val();
		if(text == "" || text == " ")
		{
			alert("Necessary data is empty");
		}
		else
		{
			if(setup == "Location")
			{
				debugger
				alert(text);
				$.ajax({
					type: "POST",
	   				url:"Configuration?tabid=addDescription&Description="+text,
	               	data:  { location : text }
	           		}).done(function(data){
	           		debugger
	               	//$("#state").html(data);
	           		$(document).find('div#locationDiv table').replaceWith($(data).find('div#locationDiv').html());
	           		//$('select[id="phonecode"]').find('option[id="'+selectedCountry+'"]').attr("selected",true);
	           	});
				
				/* document.getElementById('Description').value = text;
				document.getElementById('tabid').value="addDescription";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
				debugger */
			/*}	
		}
	}); */
	
	/* Added on 04-05-2020 */
 	var accountID = '<%= request.getAttribute("accountId")%>';
	$('select[id="selectedBankAccountId"]').find('option[value="'+accountID+'"]').attr("selected",true);
	$("#reason").val("");
	$("#parentReasonId option").prop("selected",false);
	$("#availableReasons option").prop("selected",false);
	
});  
 --%>
function disable() 
{
	var value = document.configurationForm.custDefaultCountryID.value;
	//alert("Selected Country:"+value);
	if(value == "2")
	{
		document.configurationForm.selectedStateId.disabled=false;
		$('#customerState').prop('disabled', false);
	}
	else
	{
		document.configurationForm.selectedStateId.disabled=true;
		$('#customerState').prop('disabled', true);
	}
}

function showSetupID()
{
	var val = document.getElementById("setupID").value;
		//alert("Selected SetUpId is:"+val);
		
		if(val == "Location")
		{
			document.getElementById("location").style.display = 'block';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "Message")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'block';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "REP")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'block';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "Terms")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'block';
			document.getElementById("days").style.display = 'block';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "SalesTax")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'block';
			document.getElementById("tax").style.display = 'block';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "creditTerm")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'block';
			document.getElementById("days1").style.display = 'block';
		}
	}
	
	function setDefaultReason()
	{
	    $("#parentReasonId").val(0);
		var reason = $('#refundReasonSel :selected').text();
		var reasonId = $("#refundReasonSel option:selected").attr('id');
		if(reasonId == null || reasonId === 0){
			alert("<spring:message code='BzComposer.configuration.customerinvoice.selectreasonfromlist'/>")
		}else{
			document.getElementById('locationID').value = reasonId;
        	document.getElementById('tabid').value="makeDefaultReason";
			document.forms['form'].action = "Configuration?tabid=makeDefaultReason";
			document.forms['form'].submit();
		}
	}
	
	function setReason()
	{
		var oldReason = $.trim($('#refundReasonSel option:selected').text());
		//$('#refundReasonSel option:selected').remove();
    	document.getElementById("refundReason").value = oldReason;	
	}
	
	function setCategory()
	{
		var oldCategory = $('#jobCategory option:selected').text();
		var isChecked = $("#jobCategory option:selected").attr("id");
		//$('#jobCategory option:selected').remove();
    	document.getElementById("txtJobCategory").value = oldCategory;
    	if(isChecked == "on")
    	{
    		$("#recurringServiceBill").prop('checked',true);
    	}
    	else
    	{
    		$("#recurringServiceBill").prop('checked',false);
    	}
	}
	function setDescription()
	{
		var text = $('#location :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription1()
	{
		var text = $('#message :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription2()
	{
		var text = $('#rep :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription3()
	{
		var text = $('#terms :selected').text();
		document.getElementById("description").value = text;
		var strUser = $('#terms :selected').val();
		document.getElementById("txtTerms").value = strUser;
	}
	
	function setDescription4()
	{
		var text = $('#salesTax :selected').text();
		//var e = document.getElementById("salesTax");
		var strUser = $('#salesTax :selected').val();
		document.getElementById("description").value = text;
		document.getElementById("txtTax").value = strUser;
	}
	
	function setDescription5()
	{
		var text = $('#creditTerm :selected').text();
		var isChecked = $("#creditTerm option:selected").attr("name");
		document.getElementById("description").value = text;
		
		var e = document.getElementById("creditTerm");
		var strUser = e.options[e.selectedIndex].value;
		document.getElementById("txtDays").value = strUser;
		if(isChecked == "on")
		{
			$("#isDefaultCreditTerm").prop("checked",true);
		}
		else
		{
			$("#isDefaultCreditTerm").prop("checked",false);
		}
	}
	

	
	/* function AddDescription()
	{
		debugger
		var text = $('#description').val();
		var setup = $("#setupID option:selected").val();
		if(text == "" || text == " ")
		{
			alert("Necessary data is empty");
		}
		else
		{
			if(setup == "Location")
			{
				debugger */
				/*alert(text);
				 $.ajax({
					type: "POST",
	   				url:"Configuration?tabid=addDescription&Description="+text,
	               	data: { location : location } 
	           		}).done(function(data){
	           		debugger
	               	//$("#state").html(data);
	           		$(document).find('div#locationDiv table').replaceWith($(data).find('div#locationDiv').html());
	           		//$('select[id="phonecode"]').find('option[id="'+selectedCountry+'"]').attr("selected",true);
	           	}); */
				
				/* document.getElementById('Description').value = text;
				document.getElementById('tabid').value="addDescription";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
				debugger
			}	
			else if(setup == "Message")
			{
				debugger
				document.getElementById('Description').value = text;
				document.getElementById('tabid').value="addNewMessage";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
				debugger
			} */
			/* else if(setup == "REP")
			{
				document.getElementById('Description').value = text;
				document.getElementById('tabid').value="addNewSalesRep";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
			} */
			/* else if(setup == "Terms")
			{
				//vat days = $("#txtTerms").val();
				document.getElementById('Description').value = text;
				document.getElementById('locationID').value = days;
				document.getElementById('tabid').value="addNewTerms";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
			} */
			/* else if(setup == "Sales Tax")
			{
				var tax = $("#txtTax").val();
				document.getElementById('Description').value = text;
				document.getElementById('locationId').value = tax;
				document.getElementById('tabid').value="addNewSalesTax";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
			} */
			/* else
			{
				//document.configurationForm.isDefaultCreditTerm.value = documetn.configurationForm.isDefaultCreditTerm.value;
				document.getElementById('Description').value = text;
				document.getElementById('locationId').value = tax;
				document.getElementById('isDefault').value = $("#isDefaultCreditTerm").val();
				document.getElementById('tabid').value="addNewCreditTerm";
				document.forms[0].action = "Configuration";
				document.forms[0].submit();
			}  */
		/*}
	}*/
	 
	function addNewJobCategory()
    {
		var itemExists = false;
		let jobCategory = $("#txtJobCategory").val().trim();
    	if (jobCategory == ''){
            alert("<spring:message code='BzComposer.configuration.customerinvoice.enterjobcategory'/>");
        }
        else {
            $("#jobCategory option").each(function() {
                if ($(this).text() == jobCategory) {
                    itemExists= true;
                    alert('<spring:message code="BzComposer.configuration.customerinvoice.jobcategoryexists"/>');
                    event.preventDefault();
                    $("#txtJobCategory").val('');
                }
            });

			if (!itemExists) {
			    $("#parentReasonId").val(0);
				document.getElementById('Description').value= jobCategory;
				document.getElementById('locationID').value = document.configurationForm.recurringServiceBill.value;
	          	document.getElementById('tabid').value="addJobCategory";
				document.forms['form'].action = "Configuration?tabid=addJobCategory";
				document.forms['form'].submit();
          	}
        }
    }

	function updateExistingJobCategory()
	{
	    var oldCategory = $('#jobCategory option:selected').text();
		var jCategoryId = $('#jobCategory option:selected').val();
		var newCategory = $('#txtJobCategory').val().trim();
	    var itemExists = false;
		if (oldCategory == "" || jCategoryId == ""){
	    	alert("<spring:message code='BzComposer.configuration.customerinvoice.selectjobfromlist'/>");
		}
	    else if(newCategory == ''){
			alert("<spring:message code='BzComposer.configuration.customerinvoice.enterjobcategory'/>");
		}
	    else {
			$("#jobCategory option").each(function() 
			{
                if ($(this).text() == newCategory) {
                    itemExists= true;
                    alert('<spring:message code="BzComposer.configuration.customerinvoice.samejobcantupdatetolist"/>');
                    event.preventDefault();
                    $("#txtJobCategory").val(oldCategory);
                }
            });

			if (!itemExists) {
			    $("#parentReasonId").val(0);
				$('#jobCategory option:selected').remove();
				document.getElementById('Description').value= newCategory;
				document.getElementById('locationID').value = jCategoryId
				document.getElementById('isDefault').value = document.configurationForm.recurringServiceBill.value;
				document.getElementById('tabid').value="updateJobCategory";
	          	document.forms['form'].action = "Configuration?tabid=updateJobCategory";
				document.forms['form'].submit();
          	}
		}
	}
	
	function deleteSelectedJobCategory()
	{
		var jCategoryId = $('#jobCategory option:selected').val();
        if ($("#jobCategory option").text() == "" || jCategoryId == "" || jCategoryId == null){
			alert("<spring:message code='BzComposer.configuration.customerinvoice.selectjobfromlist'/>");
        }
        else {
        	var con = confirm("<spring:message code='BzComposer.configuration.customerinvoice.removeselectedjob'/>");
        	if(con){
        	    $("#parentReasonId").val(0);
            	$("#txtJobCategory").val('');
            	document.getElementById('locationID').value = jCategoryId;
				document.getElementById('tabid').value="deleteJobCategory";
	          	document.forms['form'].action = "Configuration?tabid=deleteJobCategory";
				document.forms['form'].submit();
            }
        }
	}
	
	function EditServiceBillInfo()
	{
		var billName = $('#serviceBillName').val();
		if(billName == "" || billName == " "){
			alert("<spring:message code='BzComposer.configuration.customerinvoice.enterrecurringservicecategory'/>");
		}else{
			$("#parentReasonId").val(0);
			document.getElementById('Description').value = billName;
			document.getElementById('isDefault').value =  document.configurationForm.recurringServiceBill.value;

			document.getElementById('tabid').value="EditServiceBillInfo";
          	document.forms['form'].action = "Configuration";
			document.forms['form'].submit();
		}
	}

	/*$(function () {
        $("#updateRefundReason").click(function () 
        {
        	debugger
        	var oldReason = $('#refundReasonSel option:selected').text();
        	var newReason = $('#refundReason').text();
            if (oldReason == '' || oldReason == ' ') {
                alert("Please select a refund reason from the list");
            }
            else if(oldReason == newReason)
            {
            	alert("Same Reason can't update to the list")	
            }
            else
            {
            	debugger
            	$('#refundReasonSel option:selected').remove();
            	$('#refundReasonSel').append($("<option value="+$('#refundReason').val()+" onclick=setReason()>" + $('#refundReason').val() + "</option>"));
            	/*$('#refundReasonSel').append($("<option>" + newReason + "</option>"));
            }
        });
    });*/
	
	/* $(function () {
        $("#deleteRefundReason").click(function () {
        	debugger
        	var reason = $('#refundReasonSel selected').val();
            if (reason == '') {
                alert("Please select a refund reason from the list");
            }
            else if(reason == ' ')
            {
            	alert("Whitespace is not allowed")
            }
            else
            {
            	debugger
            	var con = confirm("Are you sure to remove this reason?");
            	//alert("Inside else condition")
            	if(con)
            	//$('#refundReasonSel option:selected').remove();
            	$("#refundReason").val('');
            		
            }
        });
    }); */
	
	/*$(function () {
        $("#addJobCategory").click(function (e) {
        	debugger
        	var cat = $("#txtJobCategory").val();
        	//var items = $("#jobCategory option").val();
            if (cat == '') {
                alert("Please enter a job category.");
            }
            else if(cat == ' ')
            {
            	alert("Whitespace is not allowed.")
            }
            else
            {
            	//$('#jobCategory').append($("<option value="+cat+">" + cat + "</option>"));
            	var itemExists = false;
                //var txt = $("#refundReason").val();
                e.preventDefault();
                $("#jobCategory option").each(function() {
                    if ($(this).text() == $.trim(cat)) {
                        itemExists = true;
                        alert('Job Category already exists');
                        $("#txtJobCategory").val('');
                    }
                });

              if (!itemExists) {
              $("#jobCategory").append("<option value="+cat+" onclick=setCategory()>" + cat + "</option>");
              $("#txtJobCategory").val('');
              }
            }
        });
    });*/
    
   /*$(function () {
        $("#updateJobCategory").click(function () {
        	var oldCategory = $('#jobCategory option:selected').text();
        	var newCategory = $('#txtJobCategory').val();
        	debugger
            if (oldCategory == "") {
                alert("Please Select a Job from the list.");
            }
            else if(oldCategory == ' ')
            {
            	alert("Whitespace is not allowed.")
            }
            else
            {
            	debugger
            	$('#jobCategory option:selected').remove();
            	$('#jobCategory').append($("<option value="+newCategory+" onclick=setCategory()>" + newCategory + "</option>"));
            }
        });
    });*/
	
	/*$(function () {
        $("#deleteJobCategory").click(function () {
        	debugger
            if ($("#jobCategory option").text() == "") {
                alert("Please Select a Job from the List");
            }
            else
            {
            	debugger
            	var con = confirm("Are You Sure to remove this job?");
            	if(con)
            	//$('#jobCategory option:selected').remove();
            	$("#txtJobCategory").val('');
            }
        });
    });
	*/

	function addNewRefundReason()
	{
		$("#parentReasonId").val(0);
		var reason = $("#refundReason").val().trim();
        if (reason == '') {
            alert("<spring:message code='BzComposer.configuration.customerinvoice.enterrefundreason'/>");
        }
        else{
        	var itemExists = false;
            $("#refundReasonSel option").each(function() {
                if ($(this).attr("name") == $.trim(reason)) {
                    itemExists = true;
                    alert('<spring:message code="BzComposer.configuration.customerinvoice.reasonalreadyexists"/>');
                    $("#refundReason").val('');
                    event.preventDefault();
                }
            });

          	if (!itemExists) {
          		document.getElementById('Description').value = reason;
          		document.getElementById('tabid').value="addRefundReason";
				document.forms['form'].action = "Configuration?tabid=addRefundReason";
				document.forms['form'].submit();
				
          	}
		}
	}
	
	function updateExistingRefundReason()
	{
		$("#parentReasonId").val(0);
    	var oldReason = $('#refundReasonSel option:selected').text();
		var reasonId = $('#refundReasonSel option:selected').attr('id');
    	var newReason = $('#refundReason').val().trim();
        if (oldReason == '') {
            alert("<spring:message code='BzComposer.configuration.customerinvoice.selectreasonfromlist'/>");
        }
        else if(oldReason == newReason){
        	alert("<spring:message code='BzComposer.configuration.customerinvoice.samereasoncantupdate'/>");	
        }
        else{
        	$('#refundReasonSel option:selected').remove();
        	document.getElementById('Description').value = newReason;
        	document.getElementById('locationID').value = reasonId;

        	document.getElementById('tabid').value="updateRefundReason";
			document.forms['form'].action = "Configuration?tabid=updateRefundReason";
			document.forms['form'].submit();
        }
	}
	
	function deleteSelectedRefundReason()
	{
		$("#parentReasonId").val(0);
    	var reason = $('#refundReasonSel option:selected').text();
		var reasonId = $("#refundReasonSel option:selected").attr('id');
        if (reason == '') {
            alert("<spring:message code='BzComposer.configuration.customerinvoice.selectreasonfromlist'/>");
        }
        else {
        	var con = confirm("<spring:message code='BzComposer.configuration.customerinvoice.removereason'/>");
        	if(con){
            	document.getElementById('locationID').value = reasonId;
            	document.getElementById('tabid').value="deleteRefundReason";
    			document.forms['form'].action = "Configuration?tabid=deleteRefundReason";
    			document.forms['form'].submit();
        	}
        }
	}
	
	/* Added on 04-05-2020 */
	function selectReason() {
		$('select[id="availableReasons"]').find('option').attr("selected",false);
		var selectedReason = $.trim($("#parentReasonId option:selected").text());
		if(selectedReason ==""){
			alert("<spring:message code='BzComposer.configuration.rma.enterreason'/>");
			return false;
		}
		else{
			var reasonSelected = $('select[id="parentReasonId"]').find('option[id="'+selectedReason+'"]').val();
			$('select[id="availableReasons"]').find('option[value="'+reasonSelected+'"]').attr("selected",true);
			$("#reason").val(selectedReason);
		}
	}

	function addNewReason()
	{
		var newReason = $("#reason").val().trim();
		var camelized = newReason.toLowerCase().replace(/\b[a-z]/g, function(letter) {
	    	return letter.toUpperCase();
		});
		var selectedReason = $('select[id="parentReasonId"]').find('option[id="'+camelized+'"]').attr("selected",true);
		var isAvailable = $.trim($("#parentReasonId option:selected").text());
		if(newReason == ""){
			alert("<spring:message code='BzComposer.configuration.rma.enterreason'/>");
			return false;
		}
		else if((newReason.match("^no") || newReason.match("^No"))&&(newReason.match("reason$") || newReason.match("Reason$"))) {
            alert("<spring:message code='BzComposer.configuration.rma.entervalidreason'/>");
            return false;
        }
        else if(camelized == isAvailable || newReason == isAvailable) {
            alert("<spring:message code='BzComposer.configuration.customerinvoice.reasonalreadyexists'/>");
            return false;
        }
        else {
            var parentReasonId = $("#availableReasons option:selected").val();
            var parentReason = $("#availableReasons option:selected").text();
            document.getElementById('reason').value = newReason;
            document.getElementById('parentReasonId').value = parentReasonId;
            document.getElementById('tabid').value = "addNewRMAReason";
            document.forms['form'].action = "Configuration?tabid=addNewRMAReason";
            document.forms['form'].submit();
        }
	}

	function updateRMAReason()
	{
		var reason = $("#reason").val().trim();
		var isAvailable = $.trim($("#parentReasonId option:selected").text());
		var parentReasonId = $("#availableReasons option:selected").val();
		var reasonId = $("#parentReasonId option:selected").val();
		if(reason == ""){
			alert("<spring:message code='BzComposer.configuration.rma.enterreason'/>");
			return falsel
		}
		else if(isAvailable ==""){
			alert("<spring:message code='BzComposer.configuration.rma.selectreasontoupdate'/>");
			return false;
		}
		else{
			document.getElementById('reason').value= reason;
			document.getElementById('resonId').value = reasonId;
			document.getElementById('parentReasonId').value = parentReasonId;
			document.getElementById('tabid').value = "updateRMAReason";
			document.forms['form'].action = "Configuration?tabid=updateRMAReason";
			document.forms['form'].submit();
		}
	}

	function deleteReason()
	{
		var reason = $("#reason").val().trim();
		var parentReasonId = $("#availableReasons option:selected").val();
		var parentReason = $("#availableReasons option:selected").text();
		if(reason == "" || parentReasonId == ""){
            alert("<spring:message code='BzComposer.configuration.rma.enterreason'/>");
            return falsel
        }
		if(confirm("<spring:message code='BzComposer.configuration.rma.deleteselectedrecord'/>"))
		{
			document.getElementById('reason').value = reason;
			document.getElementById('parentReasonId').value = parentReasonId;
			document.getElementById('tabid').value = "deleteRMAReason";
			document.forms['form'].action = "Configuration?tabid=deleteRMAReason";
			document.forms['form'].submit();
		}
	}

	function clearValues(){
		debugger
		$("#reason").val("");
		$("#parentReasonId option").prop("selected",false);
		$("#availableReasons option").prop("selected",false);
		//$('select[id="parentReasonId"]').find('option').prop("selected",false);
		debugger
	}
</script>