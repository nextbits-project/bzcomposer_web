<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.vendorpurchaseordertitle" /></title>

<script type="text/javascript">
function toggleFunction() {
	
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
  }
} 
$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
  });
$(document).ready(function()
{
	
	 //request.setAttribute("sortId", sortId);
	var countryId = '<%= request.getAttribute("countryID")%>';
	var stateId = '<%=request.getAttribute("stateID")%>';
	var viaId = '<%= request.getAttribute("viaID")%>';
	var CategoryID = '<%= request.getAttribute("CategoryID")%>';
	
	var termId = '<%= request.getAttribute("termID")%>';
	var repId = '<%= request.getAttribute("repID")%>';
	var paymentMethodId = '<%= request.getAttribute("payMethodID")%>';
	var inchargeEmpId = '<%= request.getAttribute("inchargeEmpID")%>';
	
	
	
	$('select[id="selectedCategoryId"]').find('option[value="'+CategoryID+'"]').attr("selected",true);
	$('select[id="shipCarrierId"]').find('option[value="'+viaId+'"]').attr("selected",true);
	$('select[id="selectedTermId"]').find('option[value="'+termId+'"]').attr("selected",true);
	
	$('select[id="selectedSalesRepId"]').find('option[value="'+repId+'"]').attr("selected",true);
	$('select[id="selectedPaymentId"]').find('option[value="'+paymentMethodId+'"]').attr("selected",true);

	$('#poShowCountry').change(function()
	{
		var isChecked = "<%= request.getAttribute("showCountry")%>";
		//var isChecked = "on";
		
		if($(this).prop("checked") == true)
		{

	        $("#poShowCountry").attr('checked', true);
	        
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#poShowCountry").attr('checked', false);
	        
	        isChecked = "off";
		}	
	    else
	    {

	        $("#poShowCountry").attr('checked', isChecked);
	        
	    	document.configurationForm.poShowCountry.value = isChecked;
	    	
	    }	
		$("#poShowCountry").val(isChecked);
	});
		
	$('#poShowTelephone').change(function()
	{
		var isChecked = "<%= request.getAttribute("showTelephone")%>";
		//var isChecked = "on";
		
		if($(this).prop("checked") == true)
		{

	        $("#poShowTelephone").attr('checked', true);
	        
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#poShowTelephone").attr('checked', false);
	        
	        isChecked = "off";
		}	
	    else
	    {

	        $("#poShowTelephone").attr('checked', isChecked);
	        
	    	document.configurationForm.poShowTelephone.value = isChecked;
	    	
	    }	
		$("#poShowTelephone").val(isChecked);
	});
	
	$('#isPurchasePrefix').change(function()
	{
		var isChecked = "<%= request.getAttribute("purchasePrefix")%>";
		//var isChecked = "on";
		
		if($(this).prop("checked") == true)
		{

	        $("#isPurchasePrefix").attr('checked', true);
	        
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#isPurchasePrefix").attr('checked', false);
	        
	        isChecked = "off";
		}	
	    else
	    {

	        $("#isPurchasePrefix").attr('checked', isChecked);
	        
	    	document.configurationForm.isPurchasePrefix.value = isChecked;
	    	
	    }	
		$("#isPurchasePrefix").val(isChecked);
	});
});

function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;

	if (unicode!=8)
	{
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
 			return true;
		} 
		else 
		if (unicode<48||unicode>57) //if not a number
			return false; //disable key press
	}
}


function disable() 
{
	var value = document.configurationForm.selectedCountryId.value;
	if(value == "2")
	{
		document.configurationForm.selectedStateId.disabled=false;
	}
	else
	{
		document.configurationForm.selectedStateId.disabled=true;
	}
}

function clearDescription(){
	document.getElementById("description").value = "";
}

let custTypeID = 0;
function setCustomerType(ctID){
    custTypeID = ctID;
    let mySelectBox = document.getElementById('customerType');
    document.getElementById('custTypeName').value = mySelectBox.options[mySelectBox.selectedIndex].text;
}

function SaveCustomerType(type){
    if(type == 'Add')   custTypeID = 0;
    let custTypeName = document.getElementById('custTypeName').value;
    if(type == 'Edit' && custTypeID == 0){
        alert("<spring:message code='BzComposer.common.selectCustomerType'/>");
        return false;
    }
    else if(custTypeName.trim() == ''){
        alert("<spring:message code='BzComposer.common.enterCustomerType'/>");
        return false;
    }else{
        event.preventDefault();
        $("#saveCustomerTypeDialog").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    window.location = "/Configuration?tabid=SaveCustomerType&ID="+custTypeID+"&custTypeName="+custTypeName;
                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });
    }
}

function DeleteCustomerType(){
    if(custTypeID == 0){
        alert("<spring:message code='BzComposer.common.selectCustomerType'/>");
        return false;
    }else{
        event.preventDefault();
        $("#deleteCustomerTypeDialog").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    window.location = "/Configuration?tabid=DeleteCustomerType&ID="+custTypeID;
                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });
    }
}

function setdeactivate() {
	
	var sel = document.getElementById("ActiveInvoiceStyleId");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;

	var sel1 = document.getElementById('InvoiceStyleId1');
	sel.remove(sel.selectedIndex);

	var opt = document.createElement('option');
	opt.appendChild( document.createTextNode(selectValue) );
	opt.value = selectValue1;
	sel1.appendChild(opt);
}

function setactivate() {
	
	var sel = document.getElementById("InvoiceStyleId1");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;

	var sel1 = document.getElementById('ActiveInvoiceStyleId');
	sel.remove(sel.selectedIndex);

	var opt = document.createElement('option');
	opt.appendChild( document.createTextNode(selectValue) );
	opt.value = selectValue1;
	sel1.appendChild(opt);
}
</script>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();">
<!-- begin shared/header -->
<form:form name="configurationForm" id="frmPOS"  enctype="MULTIPART/FORM-DATA" method="post" modelAttribute="configDto">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">

	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<spring:message code="BzComposer.configuration.configurationtitle"/>
		</span>
	</div>
	<div>
		<div>
			<c:if test="${not empty Labels}">
                <input type="hidden" name="lsize" id="lblsize" value='${Labels.size()}' />
                <c:forEach items="${Labels}" var="lbl" varStatus="loop">
                    <input type="hidden" id='${loop.index}lid' name='${loop.index}lidname' value='${lbl.value}' />
                    <input type="hidden" id='${loop.index}lname' name='${loop.index}lnm' value='${lbl.label}' />
                </c:forEach>
			</c:if>
		</div>
		<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
		<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
			<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
				<tr>
					<td id="leftMenu" style="position: relative; width: 180px;">
						<table>
							<tr>
								<td>
									<jsp:include page="menuPage.jsp" />
								</td>
							</tr>
						</table>
					</td>
					<td valign="top" >
					    <div id="tabs" style="height:auto;">
                            <ul>
                                <li style="font-size: 12px;"><a href="#designTab"><spring:message code="BizComposer.Configuration.POS.Design" /></a></li>
                                <li style="font-size: 12px;"><a href="#featuresTab"><spring:message code="BizComposer.Configuration.POS.Features" /></a></li>
                            </ul>
                            <!-- designTab Starts -->
                            <div id="designTab" style="display:none;">
                                <table class="table-notifications" width="100%">
                                    <tr>
                                        <th colspan="4" style="font-size:12px; padding: 5px;"><spring:message code="BizComposer.Configuration.POS.Design.Header" /></th>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-size:12px;">
                                            <input type="checkbox" id="showReorderPointWarning" name="showReorderPointWarning" ${configDto.showReorderPointWarning=='on'?'checked':''} />
                                            <spring:message code="BzComposer.configuration.POS.producticons"/>
                                        </td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-size: 12px;">
                                            <input type="checkbox" id="productTaxable" name="productTaxable" ${configDto.productTaxable=='on'?'checked':''} />
                                            <spring:message code="BzComposer.configuration.POS.gridsslip"/>
                                        </td>
                                        <td colspan="2">&nbsp;</td>
                                    <tr>
                                        <td colspan="2" style="font-size:12px;">
                                            <input type="checkbox" id="reservedQuantity" name="reservedQuantity" ${configDto.reservedQuantity=='on'?'checked':''} />
                                            <spring:message code="BzComposer.configuration.POS.calpage"/>
                                        </td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                    					<td style="font-size:12px;">
                        				<spring:message code="BzComposer.customer.CustomerType"/> :
                    					</td>
                    					<td style="font-size:12px;">
                        					<form:select path="customerType" onchange="setCustomerType(this.value);">
                            				<form:options items="${customerTypeList}" itemValue="value" itemLabel="label"/>
                        				</form:select>
                    					</td>
                    					<td colspan="2">
                        					<div style="float:left;"><input id="custTypeName" /></div>
                        					
                    						</td>
                					</tr>
                                    <tr>
                                        <th colspan="4" style="font-size:12px; padding: 5px;"><spring:message code="BzComposer.configuration.POS.prodlist" /></th>
                                    </tr>
                                    <tr>
                                    <td style="width:60px;font-size:12px;">
                                        <select id="ActiveInvoiceStyleId" name="InvoiceStyleId" style="display:block; width: 200px; height: 200px;" multiple="multiple">
                                            <option><spring:message code="BzComposer.configuration.POS.prodlist1"/></option>
  											<option><spring:message code="BzComposer.configuration.POS.prodlist2"/></option>
  											<option><spring:message code="BzComposer.configuration.POS.prodlist3"/></option>
                                        </select>
                                        
                                        <c:if test="${not empty configDto.listOfExistingInvoiceStyle}">
                                            <input type="hidden" name="invoiceStyleId" id="invoiceStyleId" value="">
                                        </c:if>
                                        <c:if test="${empty configDto.listOfExistingInvoiceStyle}">
                                            <input type="hidden" name="invoiceStyleId" id="invoiceStyleId" value="">
                                        </c:if>
                                    </td>

                                    <td align="center" style="font-size:12px;width: 100px;">
                                        <br><br><br><br>
                                        <input type="button" id="addL2R" class="formButton" name="addL2R" onclick="setdeactivate()"  value="<spring:message code="BzComposer.configuration.lefttorightbtn"/>" style="width: 40px;">
                                        <br><br>
                                        <input type="button" id="addR2L" style="width:40px;" class="formButton" name="addR2L" onclick="setactivate()"  value="<spring:message code="BzComposer.configuration.righttoleftbtn"/>">
                                    </td>
                                    <td style="font-size:12px;">
                                    <select id="InvoiceStyleId1" name="InvoiceStyleId1" style="display:block; width: 200px; height: 200px;" multiple="multiple">
                                        <c:if test="${not empty configDto.listOfExistingInvoiceStyle1}">
                                            <c:forEach items="${configDto.listOfExistingInvoiceStyle1}" var="objList1">
                                                <option value="${objList1.invoiceStyleId1}" onclick="setDescription()">${objList1.invoiceStyle1}</option>
                                            </c:forEach>
                                        </c:if>
                                        </select>
                                    </td>
                                </tr>
                                    </table>
                            </div>

			<!-- ==================== vendor-Tab =================== -->
			<div id="featuresTab" style="display:none;">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><spring:message code="BizComposer.Configuration.POS.Features.Header" />
					</th>
				</tr>
				<tr>
					<td colspan="2" style="font-size:12px;">
                    	<spring:message code="BizComposer.Configuration.POS.Features.SalesRate"/> : &nbsp;&nbsp;
                    	<form:input path="salesOrderQty" align="left" value="9.5" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
                 	</td>
        			<td colspan="2">&nbsp;</td>
        		</tr>
				<tr>
                    <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                        <spring:message code="BizComposer.Configuration.POS.Features.SpecialPrice" />
                    </th>
                </tr>
                <tr>
                	<td style="font-size:12px;">
                        <spring:message code="BizComposer.Configuration.POS.Features.Police"/> : &nbsp;&nbsp;
                        <form:input path="priceLevelPriority" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
                    </td>
                </tr>
                <tr>
                	<td style="font-size:12px;">
                        <spring:message code="BizComposer.Configuration.POS.Features.Retailer"/> : &nbsp;&nbsp;
                        <form:input path="priceLevelPriority" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
                    </td>
                </tr>
                <tr>
                	<td style="font-size:12px;">
                        <spring:message code="BizComposer.Configuration.POS.Features.Wholesaler"/> : &nbsp;&nbsp;
                        <form:input path="priceLevelPriority" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
                    </td>
                </tr>
			</table>
			</div>
			
			<!-- ==================== Purchase-Order =================== -->
            <div id="purchaseOrderTab" style="display:none;">
            <table class="table-notifications" width="100%">
                <tr>
                    <th colspan="4" align="left" style="font-size:12px; padding: 5px;"><spring:message code="BzComposer.configuration.purchaseorderpreference" /></th>
                </tr>
                <tr>
                    <td style="font-size:12px;">
                        <spring:message code="BzComposer.configuration.startponumber" /> :
                    </td>
                    <td style="font-size:12px;">
                        <form:input path="startPONum" id="startPONum" maxlength="15" style="width:150px;" class="startPONum" />
                    </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size:12px;"><spring:message code="BzComposer.configuration.postyle" /> :</td>
                    <td style="font-size:12px;">
                        <form:select path="vendorInvoiceStyleId">
                            <c:forEach items="${configDto.listOfExistingInvoiceStyle}" var="objList1">
                                <form:option value="${objList1.selectedInvoiceStyleId}">${objList1.invoiceStyle}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size:12px;"><spring:message code="BzComposer.configuration.defaultfootnote" /> :</td>
                    <td id="vdfoot" style="font-size:12px;">
                        <form:select path="vendorDefaultFootnoteID" style="width:70%;">
                            <form:option value="0"><spring:message code="BzComposer.ComboBox.Select" /></form:option>
                            <c:forEach items="${configDto.messages}" var="curObject" varStatus="loop">
                                <form:option value='${curObject.selectedMessageId}'>${curObject.messageName}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size:12px;">
                        <input type="checkbox" name="poShowCountry" id="poShowCountry" value="${configDto.poShowCountry}" ${configDto.poShowCountry=='on'?'checked':''} />
                        <spring:message code="BzComposer.configuration.showcountorynameonpurchaseorder"/>
                    </td>
                    <td style="font-size:12px;">
                        <input type="checkbox" name="poShowTelephone" id="poShowTelephone" value="${configDto.poShowTelephone}" ${configDto.poShowTelephone=='on'?'checked':''} />
                        <spring:message code="BzComposer.configuration.showphonefaxnumberonpurchaseorder"/>
                    </td>
                    <td style="font-size:12px;">
                        <input type="checkbox" name="isPurchasePrefix" id="isPurchasePrefix" value="${configDto.isPurchasePrefix}" ${configDto.isPurchasePrefix=='on'?'checked':''} />
                        <spring:message code="BzComposer.configuration.useprefixpo"/>
                    </td>
                </tr>
            </table>
            </div>

			</div>
			
			<div align="center">
			<input type="submit" name="Submit" class="bottomButton formButton" value="<spring:message code='BzComposer.global.save'/>"/>
			<input type="reset" name="Cancel" class="bottomButton formButton" onclick="RevokeValues()" value="<spring:message code='BzComposer.global.cancel'/>"/>
			</div>
			
			</td>
		</tr>
	</table>
	<div>
		<form:hidden path="empStateID" />
		<form:hidden path="labelName" />
		<form:hidden path="fileName" />
	</div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="showCountry" id="showCountry" value="" />
		<input type="hidden" name="showTelephone" id="showTelephone" value="" />
		<input type="hidden" name="isPrefix" id="isPrefix" value="" />
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</form:form>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
<script type="text/javascript">

$("#frmPOS").submit(function(event) {
    
    var selectedCountryId1 =document.getElementById('selectedCountryId1').value;
    var vendorProvience = document.getElementById('vendorProvience').value;
    //Purchase Order Preference Section
    var startPONum =document.getElementById('startPONum').value;
    var vendorDefaultFootnoteID = document.getElementById('vendorDefaultFootnoteID').value;
   	//Check Box values
    var showTelephone =document.getElementById('poShowTelephone').value;
    var isPrefix =document.getElementById('isPurchasePrefix').value;
	var showCountry = document.getElementById('poShowCountry').value ;
    //Vendor Preference Section
    var shipCarrierId =document.getElementById('shipCarrierId').value;
    var selectedTermId =document.getElementById('selectedTermId').value;
    var selectedSalesRepId =document.getElementById('selectedSalesRepId').value;
    var selectedPaymentId =document.getElementById('selectedPaymentId').value;
    var selectedCategoryId =document.getElementById('selectedCategoryId').value;
    //Employee In Charge Of Item Received Itemse Section
     var selectedActiveEmployeeId =document.getElementById('selectedActiveEmployeeId').value;
     var showReorderPointWarning = $('#showReorderPointWarning').prop("checked")?'on':'off';
     var reservedQuantity = $("#reservedQuantity").prop("checked")?'on':'off';
     var salesOrderQty = $("#salesOrderQty").prop("checked")?'on':'off';
     var productTaxable = $("#productTaxable").prop("checked")?'on':'off';
     var productCategoryID = document.getElementById('productCategoryID').value;
     var reorderPoint = document.getElementById('reorderPoint').value;
     var vendorBusinessTypeID = document.getElementById('vendorBusinessTypeID').value;
     var vendorInvoiceStyleId = document.getElementById('vendorInvoiceStyleId').value;
     var customerType = document.getElementById('customerType').value;
     var priceLevelPriority = document.getElementById('priceLevelPriority').value;
     var priceLevelDealer = document.getElementById('priceLevelDealer').value;
     var priceLevelCustomer = document.getElementById('priceLevelCustomer').value;
     var priceLevelGeneral = document.getElementById('priceLevelGeneral').value;
    
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<spring:message code='BzComposer.global.ok'/>": function () {
	            	
					//$('form').submit();
					var formData = $('frmPOS').serialize();
	        		$.ajax({
	        			type:"POST",
	        			url:"ConfigurationPOSAjax/SaveConfiguration?tabid=DesignFeature+
	        					"&selectedCountryId1="+selectedCountryId1+"&vendorProvience="+vendorProvience+"&startPONum="+startPONum+
	        					"&vendorDefaultFootnoteID="+vendorDefaultFootnoteID+"&showTelephone="+showTelephone+"&isPrefix="+isPrefix+
	        					"&showCountry="+showCountry+"&shipCarrierId="+shipCarrierId+"&selectedTermId="+selectedTermId+
	        					"&selectedSalesRepId="+selectedSalesRepId+"&selectedPaymentId="+selectedPaymentId+"&selectedActiveEmployeeId="+selectedActiveEmployeeId+
	        					"&selectedCategoryId="+selectedCategoryId+"&showReorderPointWarning="+showReorderPointWarning+"&reservedQuantity="+reservedQuantity+
	        					"&salesOrderQty="+salesOrderQty+"&productTaxable="+productTaxable+"&productCategoryID="+productCategoryID+"&reorderPoint="+reorderPoint+
	        					"&vendorBusinessTypeID="+vendorBusinessTypeID+"&vendorInvoiceStyleId="+vendorInvoiceStyleId+"&customerType="+customerType+
	        					"&priceLevelPriority="+priceLevelPriority+"&priceLevelDealer="+priceLevelDealer+"&priceLevelCustomer="+priceLevelCustomer+"&priceLevelGeneral="+priceLevelGeneral,
	        			data:formData,
	        			success:function(data) {
	        				
	        				$("#showsaverecorddialog").dialog("close");
	        				$("#showsuccessdialog").dialog({
                                resizable: false,
                                height: 200,
                                width: 500,
                                modal: true,
                                buttons: {
                                    "<spring:message code='BzComposer.global.ok'/>": function () {
                                        $(this).dialog("close");
                                        return false;
                                    },
                                    "<spring:message code='BzComposer.global.cancel'/>": function () {
                                        $(this).dialog("close");
                                        return false;
                                    }
                                }
	        				});
	        			},
	        			error:function(data) {
	        			    $("#showsaverecorddialog").dialog("close");
	        				alert("<spring:message code='BzComposer.common.erroroccurred'/>");
	        			}
	        		});
	            },
	            "<spring:message code='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                /* stop form from submitting normally */
	                event.preventDefault();
	                return false;
	            }
	        }
	    });
	    return false;
    
  });
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><spring:message code="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="saveCustomerTypeDialog" style="display:none;">
	<p><spring:message code="BzComposer.common.saveCustomerTypeConfirm"/></p>
</div>
<div id="deleteCustomerTypeDialog" style="display:none;">
	<p><spring:message code="BizComposer.PurchaseOrder.Delete.Validation"/></p>
</div>
<!-- Dialog box used in this page -->
<div id="showsuccessdialog" style="display:none;">
    <p><spring:message code="BzComposer.common.recordUpdated"/></p>
</div>