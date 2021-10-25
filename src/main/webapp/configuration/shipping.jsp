<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.shippingtitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
  <script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<script type="text/javascript">
function toggleFunction() {
	debugger;
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
$(function() 
{
    $("#tabs1").tabs();
    $("#tabsTax").tabs();
    $("#tabs2").tabs();
    $("#tabs").tabs();
    $("#tabsFederalTax").tabs();
    $("#tabsCompanyTaxOption").tabs();
    
    var isUPS = $("#isUPSActive").val();
	var isUSPS = $("#isUSPSActive").val();
	var isFedex = $("#isFeDexActive").val();
	
	/* alert("is UPS Active:"+isUPS+"\n is USPS Active:"+isUSPS+"\n is Fedex Active:"+isFedex); */
	
	if(isUPS == 1)
	{
		$("#upsUserId").attr('readonly',true);
		$("#upsPassword").attr('readonly',true);
		$("#accessKey").attr('readonly',true);
		$("#upsAccountNo").attr('readonly',true);
		$("#isUPSActive").attr('checked',true);
	}
	else
	{
		$("#upsUserId").attr('readonly',false);
		$("#upsPassword").attr('readonly',false);
		$("#accessKey").attr('readonly',false);
		$("#upsAccountNo").attr('readonly',false);
		$("#isUPSActive").attr('checked',false);
	}

	if(isUSPS == 1)
	{
		$("#isUSPSActive").attr('checked',true);
		$("#uspsUserId").attr('readonly',true);
	}
	else
	{
		$("#isUSPSActive").attr('checked',false);
		$("#uspsUserId").attr('readonly',false);
	}

	if(isFedex == 1)
	{
		$("#fedexAccountNumber").attr('readonly',true);
		$("#fedexMeterNumber").attr('readonly',true);
		$("#fedexPassword").attr('readonly',true);
		$("#fedexTestKey").attr('readonly',true);
	}
	else
	{
		$("#fedexAccountNumber").attr('readonly',false);
		$("#fedexMeterNumber").attr('readonly',false);
		$("#fedexPassword").attr('readonly',false);
		$("#fedexTestKey").attr('readonly',false);
	} 
});

$(document).ready(function(){
	$('#shippingTypeWeight').scroll(function(){
	    var length = $(this).scrollTop();
	    $('#shippingTypePrice').scrollTop(length);
	});
	$('#shippingTypePrice').scroll(function(){
		var length = $(this).scrollTop();
		$('#shippingTypeWeight').scrollTop(length);
	});
	
	$("#modifySeletedWeight").attr('disabled',true);
 	$("#deleteSeletedWeight").attr('disabled',true);
 	
 	//$("#selectedMailTypeId")append(new Option("", "0"));
 	var o = new Option("", "0");
	$(o).html("");
	var o1 = new Option("", "0");
	$(o1).html("");
	var o2 = new Option("", "0");
	$(o2).html("");
	$("#selectedMailTypeId").append(o);
	$("#selectedPackageSizeId").append(o1);
	$("#selectedContainerId").append(o2);
 	$('select[id="selectedMailTypeId"]').find('option[value="'+0+'"]').attr("selected",true);
 	$('select[id="selectedPackageSizeId"]').find('option[value="'+0+'"]').attr("selected",true);
 	$('select[id="selectedContainerId"]').find('option[value="'+0+'"]').attr("selected",true);
});
 
function setPrice()
{
	$('select[id="shippingTypePrice"]').find('option').attr("selected",false);
 	var weight = $.trim($("#shippingTypeWeight option:selected").val());
 	$('select[id="shippingTypePrice"]').find('option[value="'+weight+'"]').attr("selected",true);
 	var price = $.trim($("#shippingTypePrice option:selected").text());

 	$("#upsWeight").val(weight);
 	$("#upsShippingFee").val("$"+price);
 	$("#modifySeletedWeight").attr('disabled',false);
 	$("#deleteSeletedWeight").attr('disabled',false);
}
function showPanel() 
{
    var selectedTab = $("#tabs1").tabs('option','active');
    if(selectedTab == 2)
    {
    	document.getElementById("shippingFreeMethodDiv").style.display = "none";
    	document.getElementById("valueAddedCalculator").style.display = "none";
    }
    else
    {
    	document.getElementById("shippingFreeMethodDiv").style.display = "block";
    	document.getElementById("valueAddedCalculator").style.display = "block";
    }
}

function updateSelectedWeight()
{

}

function deleteSelectedWeight()
{

}
function setServices()
{
	debugger
	var serviceName = $.trim($("#upsSelect option:selected").text());
	$("#upsServiceName").val(serviceName);
}

function setUSPSService()
{
	var uspsService = $("#uspsSelect option:selected").text();
	$("#uspsServiceName").val(uspsService);
}

function setWeightPrice()
{
	var shippingType = $("#userShippingType option:selected").val();
	if(shippingType == 0)
	{

		return selectshippingtypedialog();
	}
	else
	{

		$("#modifySeletedWeight").attr('disabled',true);
	 	$("#deleteSeletedWeight").attr('disabled',true);
		window.open("Configuration.do?tabid=config30&shippingCarrierId="+shippingType);
		//window.open("Configuration.do?tabid=showStore");
	}
}

function addModalShippingType()
{
	var sType = $.trim($("#modalShippingType option:selected").text());
	$("#selectedShippingType").val(sType);
}

function setModalDescription()
{
	debugger
	var sType = $.trim($("#modalShippingType option:selected").text());
	$("#selectedShippingType").val(sType);
}

function saveTemplate()
{

}

function deleteTemplate()
{

}
function saveModalShippingType()
{
	debugger
	var selectedSType = $.trim($("#modalShippingType option:selected").text());
	debugger
	var textboxValue = $("#selectedShippingType").val();
	debugger
	if(textboxValue =="")
	{

		return emptyvaluedialog();
	}
	else if(selectedSType == textboxValue)
	{

		return duplicatevaluedialog();
	}
	else 
	{
		//var id = document.getElementById("id1234").value;
		alert(textboxValue)		//commented on 24-11-2019 to prevent alert
		//window.location.href= "Configuration.do?tabid=addshippingtype&shippingtype="+textboxValue;
		
		
		var formData = $('frmshipping').serialize();
		
		$.ajax({
			type : "POST",
			url : "Configuration.do?tabid=addshippingtype&shippingtype="+textboxValue,
			data : formData,
			success : function(data) {
				debugger
				
				$("#showsuccessdialog").dialog({
						resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				        	"<bean:message key='BzComposer.global.ok'/>": function () {
				        		$(this).dialog("close");
				        		window.location.href= "Configuration.do?tabid=config15&&tab=tr15";
				                return false;
				        	},
				            "<bean:message key='BzComposer.global.cancel'/>": function () {
				                $(this).dialog("close");
				                return false;
				            }
			        	}
				});
			},
			error : function(data) {
				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			}
		});
	}
}

function editModalShippingType() {
	debugger;
	newID = document.getElementById("modalShippingType").value;
	var textboxValue = $("#selectedShippingType").val();
	var formData = $('frmshipping').serialize();
	$.ajax({
		type : "POST",
		url : "Configuration.do?tabid=editshippingtype&oldshippingtype="+textboxValue+"&oldId="+newID,
		data : formData,
		success : function(data) {
			debugger
			
			$("#showsuccessdialog").dialog({
					resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			        	"<bean:message key='BzComposer.global.ok'/>": function () {
			        		$(this).dialog("close");
			        		window.location.href= "Configuration.do?tabid=config15&&tab=tr15";
			                return false;
			        	},
			            "<bean:message key='BzComposer.global.cancel'/>": function () {
			                $(this).dialog("close");
			                return false;
			            }
		        	}
			});
		},
		error : function(data) {
			alert("<bean:message key='BzComposer.common.erroroccurred'/>");
		}
	});
	
	
}
function deleteModalShippingType() {
	debugger;
	newID = document.getElementById("modalShippingType").value;
	var formData = $('frmshipping').serialize();
	$.ajax({
		type : "POST",
		url : "Configuration.do?tabid=deleteshippingtype&oldId="+newID,
		data : formData,
		success : function(data) {
			debugger
			
			$("#showsuccessdialog").dialog({
					resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			        	"<bean:message key='BzComposer.global.ok'/>": function () {
			        		$(this).dialog("close");
			        		window.location.href= "Configuration.do?tabid=config15&&tab=tr15";
			                return false;
			        	},
			            "<bean:message key='BzComposer.global.cancel'/>": function () {
			                $(this).dialog("close");
			                return false;
			            }
		        	}
			});
		},
		error : function(data) {
			alert("<bean:message key='BzComposer.common.erroroccurred'/>");
		}
	});
	
	
}


function addNewTemplate()
{
	debugger	
	document.getElementById("templateName").style.display = "block";
	document.getElementById("templateSubject").style.display = "block";
	document.getElementById("emailText").style.display = "block";
	document.getElementById("txtTemplateText").style.display = "none";
	document.getElementById("txtTemplateName").style.display = "none";
	document.getElementById("txtTemplateSubject").style.display = "none";
	document.getElementById("emailText").value = "<<name>>"+'\n'+"<<company name>>"+'\n'+"<<address>>"+'\n'+"<<phonenumber>>";	
}
function setContent()
{
	debugger
	var id = $("#selectedTemplateId option:selected").val();

	document.getElementById("templateName").style.display = "none";
	document.getElementById("txtTemplateName").style.display = "block";
	document.getElementById("templateSubject").style.display = "none";
	document.getElementById("txtTemplateSubject").style.display = "block";
	document.getElementById("emailText").style.display = "none";
	document.getElementById("txtTemplateText").style.display = "block";
	
	//window.open("Configuration.do?tabid=config21&templateId="+id,null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showTime()
{
	var h = document.getElementById("hours").value;
	var m = document.getElementById("minutes").value;
	var t = document.getElementById("selectedTime").value;
	if(h>=0 && h<10)	
	{
		h = "0"+h;
	}
	if(m>=0 && m<10)	
	{
		m = "0"+m;
	}
	var time = h+" : "+ m +" "+ t;
	$("#scheduleTime").append("<option value=" + time + ">"+ time + "</option>");
}
function removeTime()
{
	$('#scheduleTime option:selected').remove();
}
</script>
</head>
<!-- <body onload="init2();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post" styleId="frmshipping">

 <div id="ddcolortabsline">&nbsp;</div>
<!--<div id="cos"></div> -->
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.configuration.configurationtitle"/>
	</span>
</div>
<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" /> 
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
				<logic:iterate name="Labels" id="lbl" indexId="index">
					<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
					<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
				</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
	<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
		<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
			<tr>
				<td id="leftMenu" style="position: relative; width: 180px;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu2.jsp" %> --%>
								<%-- <%@include file="menuPage.jsp" %> --%>
								<jsp:include page="menuPage.jsp"></jsp:include>
								<%-- <div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
									<%@include file="testMenu2.jsp" %>
								</div> --%>
							</td>
						</tr>
						<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top">
					<!-- shipping Starts -->
					<div id="shipping" style="display:none;padding: 0; position: relative; left: 0;">
						<div id="shippingFreeMethodDiv">
							<fieldset>
								<legend class="h6" style="font-size:12px; padding: 5px;">
									<b><bean:message key="BzComposer.configuration.defaultshippingfreemethod"/></b>
								</legend>
								<div class="form-check" style="font-size:12px;">
									<input type="checkbox" id="manualInsertion" style="class:form-check-input"/>
										<bean:message key="BzComposer.configuration.mannualinsertion"/>
								</div>
							</fieldset>
						</div>
						<div id="tabs1" style="height:auto;">
							<ul>
								<li onclick="showPanel()" style="font-size:12px;"><a href="#userDefinedShippingMethod">
									<bean:message key="BzComposer.configuration.tab.userdefinedshippingmehod" />
								</a></li>
								<li onclick="showPanel()" style="font-size:12px;"><a href="#realTimeShippingAPI">
									<bean:message key="BzComposer.configuration.tab.realtimeapishipping" />
								</a></li>
								<li onclick="showPanel()" style="font-size:12px;"><a href="#shipping">
									<bean:message key="BzComposer.configuration.tab.shipping" />
								</a></li>
							</ul>
							<div id="userDefinedShippingMethod">
								<table style="width:1000px; height:500px;">
									<tr>
										<td style="font-size:12px;">
											<input type="checkbox" id="userDataInsertion">
											<bean:message key="BzComposer.configuration.userdatainsertion"/>
										</td>
										<td style="font-size:12px;">
											<a href="#modalAddModify" rel="modal:open">
											<input type="button" class="formButton" id="AddModify"  
											value="<bean:message key="BzComposer.configuration.addmodifybtn"/>"></a> 
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.shippingtype"/>
											<br>
											<html:select styleId="userShippingType" property="selectedUserDefinedShippingTypeId" 
											style="width:180px;" onchange="setWeightPrice()">
												<option value="0"> </option>
												<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingType" scope="session">
														<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />">
															<bean:write name="objList1" property="userDefinedShipping" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
										<td style="font-size:12px;">
											<a href="#modalviewServices" rel="modal:open">
											<input type="button" class="formButton" id="viewServices" 
											value="<bean:message key="BzComposer.configuration.viewservices"/>">
											</a>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.weightlbs"/> :
										</td>
										<td style="font-size:12px;">
											<input type="text" id="upsWeight">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.shippingfee"/> :
										</td>
										<td style="font-size:12px;">
											<input type="text" id="upsShippingFee">
										</td>
									</tr>
									<tr>
										<td rowspan="6" style="font-size:12px;">
											<table>
												<tr>
													<td style="font-size:12px;">
														<bean:message key="BzComposer.configuration.weight"/>
													</td>
													<td style="font-size:12px;">
														<bean:message key="BzComposer.configuration.fee"/>
													</td>
												</tr>
												<tr>
													<td style="font-size:12px;">
														<html:select styleId="shippingTypeWeight" multiple="multiple" property="listOfExistingUserDefiedShippingWeightAndPrice" style="width:150px; height:250px;" onchange="setPrice()">
															<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingWeightAndPrice"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingWeightAndPrice" scope="session">
																	<option id="weight" value="<bean:write name='objList1' property='userDefinedShippingWeight' />">
																	<bean:write name="objList1" property="userDefinedShippingWeight" />
																	</option>
																	<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />" id="selectedShippingTypeId" style="display: none;">
																	</option>
																</logic:iterate>
															</logic:present>
														</html:select>
													</td>
													<td style="font-size:12px;">
														 <html:select styleId="shippingTypePrice" multiple="multiple" property="listOfExistingUserDefiedShippingWeightAndPrice" style="width:150px; height:250px;">
															<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingWeightAndPrice"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingWeightAndPrice" scope="session">
																	<option id="price" value="<bean:write name='objList1' property='userDefinedShippingWeight' />">
																		<bean:write name="objList1" property="userDefinedShippingPrice" />
																	</option>
																	<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />" id="selectedShippingTypeId" style="display: none;">
																	</option>
																</logic:iterate>
															</logic:present>
														</html:select>
													</td>
												</tr>
											</table>
										</td>
										<td rowspan="6" align="center" style="font-size:12px;">
											<input type="button" class="formButton" id="addSelectedWeight" style="width:80px;" 
											value="<bean:message key="BzComposer.global.add"/>">
											<br>
											<input type="button" class="formButton" id="modifySeletedWeight" style="width:80px;"
											value="<bean:message key="BzComposer.configuration.modify"/>" onclick="updateSelectedWeight()">
											<br>
											<input type="button" class="formButton" id="deleteSeletedWeight" style="width:80px;"
											value="<bean:message key="BzComposer.global.delete"/>" onclick="deleteSelectedWeight()"> 
										</td>
										<td>
											<bean:message key="BzComposer.configuration.valueaddedservices"/>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.mailtype"/> :
										</td>
										<td style="font-size:12px;">
											<html:select styleId="selectedMailTypeId" property="selectedMailTypeId" style="width:100px;">
												<logic:present name="configurationForm" property="listOfExistingMailType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingMailType" scope="session">
														<option value="<bean:write name='objList1' property='mailTypeId' />">
															<bean:write name="objList1" property="mailType" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.packagesize"/> :
										</td>
										<td style="font-size:12px;">
											<html:select styleId="selectedPackageSizeId" property="selectedPackageSizeId" style="width:100px;">
												<logic:present name="configurationForm" property="listOfExistingPackageSize"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPackageSize" scope="session">
														<option value="<bean:write name='objList1' property='packageSizeId' />">
															<bean:write name="objList1" property="packageSize" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.container"/> :
										</td>
										<td style="font-size:12px;">
											<html:select styleId="selectedContainerId" property="selectedContainerId" style="width:100px;">
												<logic:present name="configurationForm" property="listOfExistingContainer"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingContainer" scope="session">
														<option value="<bean:write name='objList1' property='containerId' />">
															<bean:write name="objList1" property="container" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.specialhandlingfee"/> :
										</td>
										<td style="font-size:12px;">
											<input type="text" id="specialHandlingFee" style="width:100px;"/>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" style="font-size:12px;">
											<input type="button" class="formButton" id="addService" 
											value="<bean:message key="BzComposer.configuration.addservicebtn"/>"/>	
										</td>
									</tr>
								</table>
							</div>
							<div id="modalAddModify" class="modal modal1" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
    								<div class="modal-content">
      									<div class="modal-header">
        									<h4 class="modal-title" style="font-size:12px; padding: 5px;">
        										<b><bean:message key="BzComposer.configuration.shippingtype"/></b>
        									</h4>
      									</div>
      									<div class="modal-body" style="font-size:12px;">
        								<html:select styleId="modalShippingType" multiple="multiple" property="selectedUserDefinedShippingTypeId" 
											style="width:400px; height:180px;" onchange="addModalShippingType()">
												<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingType" scope="session">
														<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />">
															<bean:write name="objList1" property="userDefinedShipping" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
      									</div>
      									<div class="modal-body" style="font-size:12px;">
      									<b><bean:message key="BzComposer.configuration.description"/> :</b>
      									<br>
      									<input type="text" id="selectedShippingType" style="width:400px;">
      									</div>
      									<div class="modal-footer" style="font-size:12px;">
      										<button type="button" class="formButton" id="addShippingType" name="addShippingType" onclick="saveModalShippingType()">
      											<bean:message key="BzComposer.global.add"/>
      										</button>
      										<button type="button" class="formButton" id="modifyShippingType" name="modifyShippingType" onclick="editModalShippingType()">
      											<bean:message key="BzComposer.configuration.modify"/>
      										</button>
      										<button type="button" class="formButton" id="deleteShippingType" name="deleteShippingType" onclick="deleteModalShippingType()">
      											<bean:message key="BzComposer.global.delete"/>
      										</button>
        									<a href="#" rel="modal:close">
        										<button type="button" class="formButton" data-dismiss="modal" id="closeShippingType" name="closeShippingType">
        											<bean:message key="BzComposer.global.close"/>
        										</button>
       										</a>
      									</div>
    								</div>
   								</div>
							</div>
							<div id="realTimeShippingAPI" class="tabPage">
								<table class="table-notifications" style="height: 500px;">
									<tr>
										<td style="width:50px;font-size: 12px;">
											<html:checkbox property="shippingAPI">
												<bean:message key="BzComposer.configuration.shippingapi"/>
											</html:checkbox>
										</td>
										<td style="width:150px;font-size:12px;">
											<bean:message key="BzComposer.configuration.accountforeachservice"/>
										</td>
									</tr>
									<tr>
										<td style="width:200px;font-size:12px;">
											<bean:message key="BzComposer.configuration.availableshippingapis"/>
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="left" style="width:auto;">
											<div id="tabs" style="height: 650px;">
												<ul>
													<li style="font-size:12px;"><a href="#ups">
														<b><bean:message key="BzComposer.configuration.tab.ups" /></b>
													</a></li>
													<li style="font-size:12px;"><a href="#usps">
														<b><bean:message key="BzComposer.configuration.tab.usps" /></b>
													</a></li>
													<li style="font-size:12px;"><a href="#fedex">
														<b><bean:message key="BzComposer.configuration.tab.fedex" /></b>
													</a></li>
												</ul>
												<div id="ups" style="width:auto;">
													<table style="width:1200px;">
														<tr>
															<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.upsaccountsettings"/>
															</th>
														</tr>
														<tr>
															<td style="font-size:12px;">
															<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																<%-- <html:checkbox property="isUPSActive" value="<bean:write name='objList1' property='isUPSActive' />">
																	<bean:message key="BizComposer.Configuration.Shipping.ups"/>
																</html:checkbox> --%>
																<input type="checkbox" id="isUPSActive" name="isUPSActive" value="<bean:write name='objList1' property='isUPSActive' />"/>
																<bean:message key="BzComposer.configuration.tab.ups"/>
															</logic:iterate>
															</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.upsuserid"/>
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="upsUserId"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="text" id="upsUserId" name="upsUserId" value="<bean:write name='objList1' property='upsUserId' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.upspassword"/>
															</td>
															<td style="font-size:12px;">
																<%-- <html:password property="upsPassword"></html:password> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="password" id="upsPassword" name="upsPassword" value="<bean:write name='objList1' property='upsPassword' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.accesskey"/>
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="accesskey"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="text" id="accessKey" name="accessKey" value="<bean:write name='objList1' property='accesskey' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.upsaccountnumber"/>
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="upsAccountNo"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="text" id="upsAccountNo" name="upsAccountNo" value="<bean:write name='objList1' property='upsAccountNo' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.valueaddedservices"/>
															</th>
														</tr>
														<tr>
															<td colspan="3" align="left" style="font-size:12px;">
																<bean:message key="BzComposer.configuration.availableservices"/>
															</td>
														</tr>
														<tr>
															<td rowspan="4" style="font-size:12px;">
																<html:select property="selectedRealTimeShippingServiceId" multiple="multiple" style="width:200px; height:200px;" onclick="setServices()" styleId="upsSelect">
																	<logic:present name="configurationForm" property="listOfExistingRealTimeShippingServices"> 
																		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRealTimeShippingServices" scope="session">
																			<option value="<bean:write name='objList1' property='realTimeShippingServiceId' />" >
																				<bean:write name="objList1" property="realTimeShippingService" />
																			</option>
																			<bean:write name="objList1" property="realTimeShippingPrice" />
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.enterservicename"/> :
																<br>
																<html:text property="upsServiceName" styleId="upsServiceName" readonly="true"></html:text>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="add" style="width:60px;" name="add" 
																class="formButton" 
																value="<bean:message key="BzComposer.global.add"/>">
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.enterserviceprice"/> :
																<br>
																<html:text property="upsServicePrice"></html:text>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="edit" style="width:60px;" class="formButton"
																value="<bean:message key="BzComposer.global.edit"/>">
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="edit" style="width:60px;"class="formButton"
																value="<bean:message key="BzComposer.global.delete"/>">
															</td>
														</tr>
													</table>
												</div>
												<div id="usps">
													<table style="width:1200px;">
														<tr>
															<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.uspsaccountsettings"/>
															</th>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<%-- <html:checkbox property="isUSPSActive">
																	<bean:message key="BizComposer.Configuration.Shipping.usps"/>
																</html:checkbox> --%>
																<logic:present name="configurationForm" property="listOfExistingUspsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUspsUSers" scope="session">
																	<input type="checkbox" id="isUSPSActive" name="isUSPSActive" value="<bean:write name='objList1' property='isUSPSActive' />"/>
																	<bean:message key="BzComposer.configuration.tab.usps"/>
															</logic:iterate>
															</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.uspsuserid"/> :
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="uspsUserId"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUspsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUspsUSers" scope="session">
																	<input type="text" id="uspsUserId" name="uspsUserId" value="<bean:write name='objList1' property='uspsUserId' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.valueaddedservices"/>
															</th>
														</tr>
														<tr>
															<td colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.availableservices"/>
															</td>
														</tr>
														<tr>
															<td rowspan="4" style="font-size:12px;">
																<html:select property="selectedRealTimeShippingServiceId" multiple="multiple" styleId="uspsSelect" style="width:200px; height:200px;" onclick="setUSPSService()">
																	<logic:present name="configurationForm" property="listOfExistingRealTimeShippingServices1"> 
																		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRealTimeShippingServices1" scope="session">
																			<option value="<bean:write name='objList1' property='realTimeShippingServiceId' />"><bean:write name="objList1" property="realTimeShippingService" /></option>
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.enterservicename"/> :
																<br>
																<html:text property="upsServiceName" styleId="uspsServiceName"></html:text>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="add" style="width: 60px;" name="add" class="formButton" 
																value="<bean:message key="BzComposer.global.add"/>">
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.enterserviceprice"/>
																<br>
																<html:text property="upsServicePrice"></html:text>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="edit"style="width: 60px;" class="formButton"
																value="<bean:message key="BzComposer.global.edit"/>">
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="edit" style="width: 60px;" class="formButton"
																value="<bean:message key="BzComposer.global.delete"/>">
															</td>
														</tr>
													</table>
												</div>
												<div id="fedex">
													<table style="width:1200px;">
														<tr>
															<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.fedexaccountsettings"/>
															</th>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<%-- <html:checkbox property="isFeDexActive">
																	<bean:message key="BizComposer.Configuration.Shipping.fedex"/>
																</html:checkbox> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="checkbox" id="isFeDexActive" name="isFeDexActive" value="<bean:write name='objList1' property='isFeDexActive' />"/>
																	<bean:message key="BizComposer.Configuration.Shipping.fedex"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.accountnumber"/> :
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="fedexAccountNumber"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="text" id="fedexAccountNumber" name="fedexAccountNumber" value="<bean:write name='objList1' property='fedexAccountNumber' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.meternumber"/> :
															</td>
															<td style="font-size:12px;">
																<%-- <html:password property="fedexMeterNumber"></html:password> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="text" id="fedexMeterNumber" name="fedexMeterNumber" value="<bean:write name='objList1' property='fedexMeterNumber' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.password"/> :
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="fedexPassword"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="password" id="fedexPassword" name="fedexPassword" value="<bean:write name='objList1' property='fedexPassword' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.productiontestkey"/>
															</td>
															<td style="font-size:12px;">
																<%-- <html:text property="fedexTestKey"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="text" id="fedexTestKey" name="fedexTestKey" value="<bean:write name='objList1' property='fedexTestKey' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
																<bean:message key="BzComposer.configuration.valueaddedservices"/>
															</th>
														</tr>
														<tr>
															<td colspan="3" align="left" style="font-size:12px;">
																<b><bean:message key="BzComposer.configuration.availableservices"/></b>
															</td>
														</tr>
														<tr>
															<td rowspan="4" style="font-size:12px;">
																<html:select property="selectedRealTimeShippingServiceId" multiple="multiple" style="width:200px; height:200px;">
																	<logic:present name="configurationForm" property="listOfExistingRealTimeShippingService2"> 
																		<logic:iterate name="configurationForm" id="objList1" property="list2" scope="session">
																			<option value="<bean:write name='objList1' property='listOfExistingRealTimeShippingService2' />" ><bean:write name="objList1" property="realTimeShippingService" /></option>
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.enterservicename"/> :
																<br>
																<html:text property="upsServiceName"></html:text>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="add" name="add" style="width:60px;" class="formButton" 
																value="<bean:message key="BzComposer.global.add"/>">
															</td>
														</tr>
														<tr>
															<td style="font-size:12px;">
																<bean:message key="BzComposer.configuration.enterserviceprice"/> :
																<br>
																<html:text property="upsServicePrice"></html:text>
															</td>
															<td style="font-size:12px;">
																<input type="button" id="edit" style="width:60px;"class="formButton"
																value="<bean:message key="BzComposer.global.edit"/>">
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td style="font-size:12px;">
																<input type="button" style="width: 60px;" id="edit" class="formButton"
																value="<bean:message key="BzComposer.global.delete"/>">
															</td>
														</tr>
													</table>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div id="shipping" class="tabPage">
								<div class="form-check">
									<input type="checkbox" id="shippingdData" style="font-size:12px;">
										<bean:message key="BzComposer.configuration.allowupdateshippingdatamultiple"/>
								</div>
								<div class="form-inline mt-2 align-items-start">
									<div class="form-inline mb-2" style="font-size:12px;">
										<bean:message key="BzComposer.configuration.scheduletimes"/> :
									</div>
									<div class="form-inline mx-sm-3 mb-2" style="font-size:12px;">
										<select id="scheduleTime" name="scheduleTime" multiple="multiple" style="width: 180px;">
										</select>
									</div>
									<div class="form-inline mx-sm-3 mb-2 d-block">	
										<p>
										<br>
										<a href="#m1" rel="modal:open">
											<!-- <button type="button" class="formbutton" style="font-size:1em;width:60px;" data-toggle="modal" data-target="#modal">
												Add
											</button> -->
											<input type="button" class="formButton" style="width:60px;font-size:12px;" name="Add" 
											value="<bean:message key='BzComposer.global.add'/>" data-target="#modal" data-toggle="modal">
										</a>
										<br><br>
										<button type="button" class="formbutton" style="font-size:12px;width:60px;" onclick="removeTime()">
											<bean:message key="BzComposer.configuration.remove"/>
										</button>
										</p>
										<div id="m1" class="modal modal1">
  											<div id="container">
  												<div id="title" style="text-align: center;font-size:12px; padding: 5px;">
  													<h3>
  														<bean:message key="BzComposer.configuration.selecttime"/>
  													</h3>
  												</div>
  												<div id="container">
  													<div class="row" align="center">
  														<table style="text-align: center; width: 600px;">
  															<tr>
  																<td style="font-size: 12px;">
  																	<b>
  																		<bean:message key="BzComposer.configuration.time"/> :
 																	</b>
  																</td>
  																<td style="font-size: 12px;">
  																	<select id="hours">
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5">5</option>
																		<option value="6">6</option>
																		<option value="7">7</option>
																		<option value="8">8</option>
																		<option value="9">9</option>
																		<option value="10">10</option>
																		<option value="11">11</option>
																		<option value="12">12</option>
																	</select>	
																</td>
																<td style="font-size: 12px;">
																	<select id="minutes"> 
																		<option value="0">0</option>
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5">5</option>
																		<option value="6">6</option>
																		<option value="7">7</option>
																		<option value="8">8</option>
																		<option value="9">9</option>
																		<option value="10">10</option>
																		<option value="11">11</option>
																		<option value="12">12</option>
																		<option value="13">13</option>
																		<option value="14">14</option>
																		<option value="15">15</option>
																		<option value="16">16</option>
																		<option value="17">17</option>
																		<option value="18">18</option>
																		<option value="19">19</option>
																		<option value="20">20</option>
																		<option value="21">21</option>
																		<option value="22">22</option>
																		<option value="23">23</option>
																		<option value="24">24</option>
																		<option value="25">25</option>
																		<option value="26">26</option>
																		<option value="27">27</option>
																		<option value="28">28</option>
																		<option value="29">29</option>
																		<option value="30">30</option>
																		<option value="31">31</option>
																		<option value="32">32</option>
																		<option value="33">33</option>
																		<option value="34">34</option>
																		<option value="35">35</option>
																		<option value="36">36</option>
																		<option value="37">37</option>
																		<option value="38">38</option>
																		<option value="39">39</option>
																		<option value="40">40</option>
																		<option value="41">41</option>
																		<option value="42">42</option>
																		<option value="43">43</option>
																		<option value="44">44</option>
																		<option value="45">45</option>
																		<option value="46">46</option>
																		<option value="47">47</option>
																		<option value="48">48</option>
																		<option value="49">49</option>
																		<option value="50">50</option>
																		<option value="51">51</option>
																		<option value="52">52</option>
																		<option value="53">53</option>
																		<option value="54">54</option>
																		<option value="55">55</option>
																		<option value="56">56</option>
																		<option value="57">57</option>
																		<option value="58">58</option>
																		<option value="59">59</option>
																	</select>
																</td>
																<td style="font-size: 12px;">
																	<select id="selectedTime">
																		<option value="AM">
																			<bean:message key="BzComposer.configuration.am"/>
																		</option>
																		<option value="PM">
																			<bean:message key="BzComposer.configuration.pm"/>
																		</option>
																	</select>
																</td>
															</tr>
															<tr>
																<td>
																</td>
																<td style="font-size: 12px;">
																	<b>
																		<%-- <bean:message key="BzComposer.configuration.hours"/> --%>
																		[Hours]
																	</b>
																</td>
																<td style="font-size: 12px;">
																	<b>
																		<%-- <bean:message key="BzComposer.configuration.miuntes"/> --%>
																		[Min.]
																	</b>
																</td>
																<td>
																</td>
  															</tr>
  															<tr>
  																<td colspan="2" style="font-size: 12px;">
  																	<input type="submit" id="ok" style="width:90px;"  name="ok" 
  																	class="formbutton" 
  																	value="<bean:message key='BzComposer.global.ok'/>" onclick="showTime()">
  																</td>
  																<td colspan="2" style="font-size: 12px;">
  																	<a href="#" rel="modal:close">
  																		<input type="reset" id="cancel" style="width:90px;" name="cancel" 
  																		class="formbutton" value="<bean:message key='BzComposer.global.cancel'/>">
																	</a>
  																</td>
  															</tr>
  														</table>
  													</div>
  												</div>
  											</div> 
										</div>						
									</div>
									<div class="container" style="font-size: 12px;">
										<b><bean:message key="BzComposer.configuration.shippingdatabasepath"/></b>
									</div>
									<div style="font-size: 12px;">
										<input type="radio" id="rbdDatabasePath" name="rbdDatabasePath"/>
										<bean:message key="BzComposer.ComboBox.Select"/>
										&nbsp;&nbsp;
										<input type="radio" id="rbdDatabasePath" name="rbdDatabasePath"/>
										<bean:message key="BzComposer.configuration.create"/>
										<br>
										<input type="file" id="selectDatabase" accept="(/*.mdb)" value="SHIPPING.mdb">
									</div> 
								</div>
							</div> 
					</div>
					<div id="valueAddedCalculator">
						<fieldset>
							<legend class="h6" style="font-size:12px; padding: 5px;">
								<b><bean:message key="BzComposer.configuration.valueaddedcalculator"/></b>
							</legend>
							<div style="font-size:12px;">
								<bean:message key="BzComposer.configuration.calculatornote"/>
							</div>
							<div class="col-md-12" style="font-size:12px;">
								<div class="col-md-6" align="left" style="font-size:12px;">
									<bean:message key="BzComposer.configuration.extraamount"/> :
									&nbsp;
									<input type="text" id="extraAmount" style="font-size:12px;">
									&nbsp;&nbsp;
									<bean:message key="BzComposer.configuration.unit"/> :
									&nbsp;
									<select id="unit">
										<option>$</option>
										<option>%</option>
									</select>
								</div>
							</div>
						</fieldset> 
					</div>
			</div>
			<!-- shipping Ends -->
			</td>
		</tr>
	</table>
	<div><html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" />
	</div>
	</div>
	<div>
	<div align="center">
		<html:button property="save"><bean:message key="BzComposer.global.add"/></html:button>
		<%-- <html:cancel><bean:message key="BzComposer.global.cancel"/></html:cancel> --%>
		<input type="reset" name="Cancel" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form>

<%@ include file="/include/footer.jsp"%>
</body>
<script type="text/javascript">
function selectshippingtypedialog()
{
	event.preventDefault();
	$("#selectshippingtypedialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function emptyvaluedialog()
{
	event.preventDefault();
	$("#emptyvaluedialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function duplicatevaluedialog()
{
	event.preventDefault();
	$("#duplicatevaluedialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="selectshippingtypedialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.tax.selectshippingtype'/></p>
</div>
<div id="emptyvaluedialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.tax.selectshippingviatoupdate'/></p>
</div>
<div id="duplicatevaluedialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.tax.duplicatevalue'/></p>
</div>
<!-- Dialog box used in this page -->
<div id="showsuccessdialog" style="display:none;">
	<p>Record updated</p>
</div>