<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%-- <title><spring:message code="BzComposer.addnewleadtitle" /></title> --%>
<title>${pageTitle }</title>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />

<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
<style>
table.tabla-listados thead tr th {
	font-size: 14px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}

.center {
  margin-left: auto;
  margin-right: auto;
}
#tabs ul li {
	font-size: 12px !important;
}

input, textarea, select {
	font-size: 12px !important;
}
</style>
<script type="text/javascript">
selectValidCountryMsg = "<spring:message code='BzComposer.register.selectvalidcountry'/>";
selectValidStateMsg = "<spring:message code='BzComposer.register.selectvalidstate'/>";
selectValidZipcodeMsg = "<spring:message code='BzComposer.register.selectvalidzipcode'/>";
noRecordsFoundMsg = "<spring:message code='BzComposer.employee.norecordsfound'/>";

$(function() {
    self.moveTo(100, 10);
    $( "#tabs" ).tabs();
});
</script>
</head>
<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<%-- <form:form action="Customer/AddCustomer" method="post" id="frmNewCustomer"> action="postNewLead"  --%>
	<form:form name="newOpportunityForm" method="post" id="frmNewOpportunity"
		modelAttribute="customerDto">
		<input type="hidden" name="tabid" id="tabid" value="" />
		<form:input path="leadId" type="hidden" />
		<form:input path="shippingAddressId" type="hidden" />
	    <form:input path="billingAddressId" type="hidden"/>
	    <input type="hidden" name="purpose" value="${ purpose }"/>
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<!-- begin Contents -->
							<!-- add the code for tab here -->
							<div>
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									${pageHeading}
								</span>
							</div>
							<table class="center" style="width: 100%;">
								<c:if test="${not empty Status}">
									<tr>
										<td colspan="3"><span class="msgstyle">${Status}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty actionMsg}">
									<tr>
										<td colspan="3"><span class="msgstyle">${actionMsg}</span>
											<%
											session.removeAttribute("actionMsg");
											%></td>
									</tr>
								</c:if>
							</table>
							<div id="tabs" style="min-height: 550px;">
								<ul>
									<li><a href="#General-1"><spring:message
												code="BzComposer.addnewcustomer.tabs.general" /></a></li>
									
								</ul>
								<div id="General-1">
									<div id="content1" class="tabPage">
										<!-- add here the content of first tab -->
										<div id="table-negotiations">
										
									
											<table class="tabla-listados" cellspacing="0">
											  <thead>
													<tr>
														<th colspan="7"><spring:message
																code="BzComposer.customer.opportunity.opportunityInfo" />
																</th>
													</tr>
												</thead>
												<tbody>
												<tr>
														<td><spring:message code="BzComposer.customer.opportunityid" /></td>
														<td><form:input path="opportunityId" readonly="true"
																size="20" /></td>
														
													</tr>
													<tr>
													<td>  <spring:message code="BzComposer.customer.opportunity.name" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" />
												</span>
												</td>
												 <td ><form:input type="text" path="opportunityName"
													size="20" /></td>
											
											<td>
											
											
											 
											 <td><spring:message code="BzComposer.customer.opportunity.amount" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											 <td ><form:input type="text" path="opportunityAmount"
												 />
												 </td>
												  </tr>
											
											 <tr>
										  
										      <td>
											 <spring:message
													code="BzComposer.customer.opportunity.owner" />
													
												<td>	
											   <span
																		class="inputHighlighted"><spring:message
																				code="BzComposer.CompulsoryField.Validation" />
												  </span>
												
														<form:select path="opportunityOwner">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>



																<form:options items="${opportunityOwnerList}"
																	itemValue="name" itemLabel="name" />
															</form:select></td>

													</tr>
													
													
													
													
												</tbody>
											
												<thead>
													<tr>
														<th colspan="7"><spring:message
																code="BzComposer.customer.opportunity.accountDetails" /></th>
													</tr>
												</thead>
												<tbody>
													
													<tr>
														<td><spring:message
																code="BzComposer.global.titlename" /></td>
														<td colspan="5">
															<table style="width: 100%;">
																<tr>
																	<td>
																	<form:select path="title" style="width:100px;">
								                                        <option value=""><spring:message code="BzComposer.ComboBox.Select" /></option>
								                                        <c:forEach items="${titleList}" var="curObject">
								                                           <option value="${curObject.value}" ${curObject.value==customerDto.title?'selected':''}>${curObject.label}</option>
								                                        </c:forEach>
								                                    </form:select>
																	</td>
																	<td><spring:message
																			code="BzComposer.global.firstname" /> <span
																		class="inputHighlighted"><spring:message
																				code="BzComposer.CompulsoryField.Validation" /></span></td>
																	<td>
																	<form:input path="firstName" size="20" />
																	</td>
																	<td><spring:message
																			code="BzComposer.global.middlename" /></td>
																	<td><form:input path="middleName" size="20" /></td>
																	<td><spring:message
																			code="BzComposer.global.lastname" /> <span
																		class="inputHighlighted"><spring:message
																				code="BzComposer.CompulsoryField.Validation" /></span></td>
																	<td><form:input path="lastName" size="20" /></td>
																</tr>
															</table>
														</td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.global.company" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span></td>
														<td colspan="3"><form:input path="companyName"
																style="width:90%;" /></td>
														<td><spring:message
																code="BzComposer.register.dbaName" /></td>
														<td><form:input path="dbaName" /></td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.global.address1" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span></td>
														<td colspan="3"><form:input path="address1"
																style="width:90%;" /></td>
														<td colspan="3">&nbsp;</td>
													<tr>
													</tr>
													<td><spring:message code="BzComposer.global.address2" />
													</td>
													<td colspan="3"><form:input path="address2"
															style="width:90%;" /></td>
													<td colspan="3">&nbsp;</td>
													</tr>
													<tr>
														<td style="color: #black !important;">
															<div class="lblZipcodeShow float-left">
																<spring:message code="BzComposer.global.zipcode" />
															</div>
															<div class="lblPostalcodeShow float-left">
																<spring:message code="BzComposer.global.postalcodes" />
															</div>&nbsp; <span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span>
														</td>
														<td><form:input path="zipCode"
																onfocusout="loadAddressDetailsByZipcode(this.value, 1)"
																onkeypress="return numbersonly(event,this.value)" /></td>
														<td><spring:message code="BzComposer.global.city" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span></td>
														<td><form:select path="city" id="cityID"
																style="width:200px;">
																<form:option value="0">
																	<spring:message code="BzComposer.register.selectcity" />
																</form:option>
																<c:forEach items="${cityList}" var="currObject">
																	<form:option value="${currObject.cityId}" selected="${currObject.cityId == customerDto.city ? 'selected' : ''}">${currObject.cityName}</form:option>
																</c:forEach>
															</form:select></td>
														<td>													
															<div class="lblStateShow">															
																<spring:message code="BzComposer.global.state" />
															</div> <!--<div class="lblProvinceShow"><spring:message code="BzComposer.global.province" /></div> -->
														</td>
														<td><form:select path="state" id="stateID"
																onchange="loadCitiesByStateID(this.value, 1);"
																style="width:200px;">
																<form:option value="0">
																	<spring:message code="BzComposer.register.selectstate" />
																</form:option>
																<c:forEach items="${stateList}" var="currObject">
																	<form:option value="${currObject.stateId}" >${currObject.state}</form:option>
																</c:forEach>
															</form:select> <form:hidden path="province" /></td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td id="t_country"><spring:message
																code="BzComposer.global.country" /></td>
														<td><form:select path="country" id="countryID"
																onchange="loadStatesByCountryID(this.value, 1);"
																style="width:200px">
																<form:option value="0">
																	<spring:message code="BzComposer.register.selectcounry" />
																</form:option>
																<c:forEach items="${countryList}" var="currObject">
																	<form:option data-code="${currObject.phoneCode}"
																		value="${currObject.countryId}">${currObject.countryName}</form:option>
																</c:forEach>
															</form:select></td>
														<td colspan="5">&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.global.phone" />
														</td>
														<td><form:input path="phone" maxlength="16"
																onkeypress="return numbersonly(event,this.value)"
																onchange="validateUSAPhoneNumber(this, true);" /></td>
														<td><spring:message code="BzComposer.global.mobile" />
														</td>
														<td colspan="2"><form:input path="cellPhone"
																maxlength="16"
																onkeypress="return numbersonly(event,this.value)"
																onchange="validateUSAPhoneNumber(this, true);" />&nbsp;&nbsp;&nbsp;
															<form:checkbox path="isPhoneMobileNumber"
																onchange="copyPhoneNumber(this.form);"
																onckick = "setMobileNumber()" /> (<spring:message
																code="BzComposer.global.isPhoneNumber" />)</td>
														<td><spring:message code="BzComposer.global.fax" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<form:input path="fax"
																onkeypress="return numbersonly(event,this.value)"
																onchange="validateUSAPhoneNumber(this, true);" /></td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.global.email" />
														</td>
														<td colspan="3"><form:input type="email" path="email"
																size="40" /></td>
														<td><spring:message code="BzComposer.global.homepage" />
														</td>
														<td><form:input path="homePage" size="40" /></td>
														<td>&nbsp;</td>
													<tr>
													<tr>
														<td><spring:message
																code="BzComposer.global.dateadded" /></td>
														<td><form:input path="dateAdded" readonly="true" />
															<img
															src="${pageContext.request.contextPath}/images/cal.gif"
															onclick="displayCalendar(document.newOpportunityForm.dateAdded,'mm-dd-yyyy',this);">
														</td>
														<td>&nbsp;</td>
														<td><form:checkbox path="terminated" /> <spring:message
																code="BzComposer.global.terminated" /></td>
														<td><spring:message
																code="BzComposer.global.terminatedDate" /></td>
														<td><form:input path="terminatedDate"
																readonly="false" /> <img
															src="${pageContext.request.contextPath}/images/cal.gif"
															onclick="displayCalendar(document.newOpportunityForm.terminatedDate,'mm-dd-yyyy',this);">
														</td>
														<td>&nbsp;</td>
													<tr>
														<td><spring:message
																code="BzComposer.Companyinformation.Type" /></td>
													
															<td>
															<form:select path="type">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<c:forEach items="${VendorCategoryList}" var="currObject">
																	<form:option value="${currObject.value}">${currObject.label}</form:option>
																</c:forEach>
															</form:select>
															</td>
														<td><spring:message code="BzComposer.global.taxid" />
														</td>
														<td><form:input path="texID" /></td>
														<td>
												
														</td>
																	
														<td colspan="2">&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message
																code="BzComposer.Companyinformation.CustomerGroup" /></td>
														<td>
															<form:select path="customerGroup">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<%-- <form:options items="${customerGroupList}"
																	itemValue="value" itemLabel="label"/> --%>
																<c:forEach items="${customerGroupList}" var="currObject">
																	<option value="${currObject.value}"  <c:if test="${currObject.value == customerDto.customerGroup}">selected</c:if><%-- selected="${currObject.value == customerDto.customerGroup ? 'selected' : '' }" --%>>${currObject.label}</option>
																</c:forEach>
															</form:select>																
														</td>
														<td><spring:message code="BzComposer.lead.LeadSource" /></td>
														<td><form:select path="leadSource"
																style="width:150px;">
																<option value="0"><spring:message
																		code="BzComposer.ComboBox.Select" /></option>
																<c:forEach items="${leadSource}" var="curObject">
																	<option value="${curObject.leadSourceId}" ${curObject.leadSourceId==customerDto.leadSource?'selected':''}>${curObject.name}</option>
																</c:forEach>
															</form:select></td>
													
														<td colspan="5">&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.global.memo" />
														</td>
														<td colspan="5"><form:textarea path="memo"
																style="width:100%;" /></td>
														<td>&nbsp;</td>
													</tr>
												</tbody>
											</table>
										</div>

										
										<!-- Manage Address END here -->
									</div>
								</div>

								</div>
							<table cellpadding="0" cellspacing="0" border="0" align=center
								style="width: 100%; margin-top: 5px;">
								<script>
					count=0;
					cnt=0;
					var exist= new Array(10); 
					for (i=0; i<exist.length; i++){
						exist[i]=-1;
					}
				</script>
								<tr>
									<td valign=top class="tabPage"></td>
								</tr>
								<tr>
									<td align="center">
										<button type="button" class="formbutton" title="New Opportunity"
											onclick="NewCustomer();">
											<spring:message code='BzComposer.global.new' />
										</button>
										<button type="button" class="formbutton" title="Save Opportunity"
											onclick="addOpportunity();">
											<spring:message code='BzComposer.global.save' />
										</button>
										<button type="button" class="formbutton" title="Close"
											onclick="CloseMe();">
											<spring:message code='BzComposer.global.close' />
										</button> <input type="hidden" name="stname" value="" id="stateId" />
									</td>
								</tr>
							</table>
							<div>
								<input type="hidden" name="bst" id="bsst" value="0" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<script>
window.onunload = refreshParent;
function refreshParent() {
    window.opener.location.reload();
}
function validate() {
    var email = document.newOpportunityForm.email.value;
    var mail =String(email);
    var pattern=/^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
    if(email==""){
        //return enterEmailValidationDialog();
        return true;
    }
    else if (!pattern.test(email)) {
        document.newOpportunityForm.email.focus();
        return showEmailValidationDialog();
        return false;
    }
    if(mail.length>=50){
        document.newOpportunityForm.email.value="";
        document.newOpportunityForm.email.focus();
        return showEmailLengthValidationDialog();
        return false;
    }
    return true;
}


function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;
	if (unicode!=8){
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1){
 			return true;
		} 
		else 
		if (unicode<48||unicode>57){
			return false; //disable key press
		}
	}
}



function CheckMambership() {
	var membershipLevel = "<%=request.getAttribute("membershipLevel")%>";
	var size = "<%=request.getAttribute("CustomerSize")%>";
		var st = "Standared";
		var pf = "Professional";
		if (membershipLevel.toLowerCase() === st.toLowerCase()) {
			if (size >= 1000) {
				return maxnumberofuserdialog();
			} else {
				return AddLead();
			}
		} else if (membershipLevel.toLowerCase() == pf.toLowerCase()) {
			if (size >= 10000) {

				return maxnumberofuserdialog();
			} else {
				return AddLead();
			}
		}
	}

	function addOpportunity() 
	{

		//alert(" at add opportuniy");
		event.preventDefault();
		if (document.newOpportunityForm.opportunityName.value == "") 
		{
			document.newOpportunityForm.opportunityName.focus();
		}
		if (document.newOpportunityForm.opportunityOwner.value =="Select") 
		{
			document.newOpportunityForm.opportunityOwner.focus();
		}
		if (document.newOpportunityForm.companyName.value == "") {
			document.newOpportunityForm.cname.focus();
			return showNameDialog();
		} else if (document.newOpportunityForm.firstName.value == "") {
			document.newOpportunityForm.firstName.focus();
			return showFirstNameDialog();
		} else if (document.newOpportunityForm.lastName.value == "") {
			document.newOpportunityForm.lastName.focus();
			return showLastNameDialog();
		} else if (document.newOpportunityForm.address1.value == "") {
			document.newOpportunityForm.address1.focus();
			return showAddress1Dialog();
		} else if (document.newOpportunityForm.city.value == "") {
			document.newOpportunityForm.city.focus();
			return showCityDialog();
		} else if (document.newOpportunityForm.zipCode.value == "") {
			document.newOpportunityForm.zipCode.focus();
			return showZipCodeDialog();
		} else if (String(document.newOpportunityForm.cellPhone.value).length > 16) {
			document.newOpportunityForm.cellPhone.value = "";
			document.newOpportunityForm.cellPhone.focus();
			return showCellPhoneLengthDialog();
		} else {
			if (validate()) {
				//alert(" at add opportuniy at else");
				
				event.preventDefault();
				$("#addNewOpportunityDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 500,
									modal : true,
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {

											$(this).dialog("close");
											//document.getElementById('tabid').value = "AddCustomer";
											// document.forms["frmNewCustomer"].action = "Customer?tabid=AddCustomer" ;
											//document.forms["frmNewCustomer"].action = "/postNewLead";
											
											document.forms["frmNewOpportunity"].action = "/createOpportunity";
											document.forms["frmNewOpportunity"].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
				return false;
			}
		}
	}
	function maxnumberofuserdialog() {
		event.preventDefault();
		$("#maxnumberofuserdialog").dialog({
			resizable : false,
			height : 250,
			width : 800,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function hideother(form) {
		chbox = document.getElementById('chk_useind');
		if (chbox.checked) {
			document.newOpportunityForm.annualIntrestRate.disabled = false;
			document.newOpportunityForm.minFCharges.disabled = false;
			document.newOpportunityForm.gracePrd.disabled = false;
			document.getElementById('chk1').disabled = false;
			document.getElementById('chk2').disabled = false;
		} else {
			document.newOpportunityForm.annualIntrestRate.disabled = true;
			document.newOpportunityForm.minFCharges.disabled = true;
			document.newOpportunityForm.gracePrd.disabled = true;
			document.getElementById('chk1').disabled = true;
			document.getElementById('chk2').disabled = true;
		}
	}
	function hidebsaddress(form) {
		chbox = document.getElementById('chk_setaddress');
		if (!chbox.checked) {
			document.newOpportunityForm.bscname.disabled = false;
			document.newOpportunityForm.bsdbaName.disabled = false;
			document.newOpportunityForm.bsfirstName.disabled = false;
			document.newOpportunityForm.bslastName.disabled = false;
			document.newOpportunityForm.bsaddress1.disabled = false;
			document.newOpportunityForm.bsaddress2.disabled = false;
			document.newOpportunityForm.bscity.disabled = false;
			document.newOpportunityForm.bszipCode.disabled = false;
			document.newOpportunityForm.bsprovince.disabled = false;
			document.newOpportunityForm.bsstate.disabled = false;
			document.newOpportunityForm.bscountry.disabled = false;

			document.newOpportunityForm.shcname.disabled = false;
			document.newOpportunityForm.shdbaName.disabled = false;
			document.newOpportunityForm.shfirstName.disabled = false;
			document.newOpportunityForm.shlastName.disabled = false;
			document.newOpportunityForm.shaddress1.disabled = false;
			document.newOpportunityForm.shaddress2.disabled = false;
			document.newOpportunityForm.shcity.disabled = false;
			document.newOpportunityForm.shzipCode.disabled = false;
			document.newOpportunityForm.shprovince.disabled = false;
			document.newOpportunityForm.shstate.disabled = false;
			document.newOpportunityForm.shcountry.disabled = false;
			document.newOpportunityForm.setdefaultbs.value = "0";
		} else {
			document.newOpportunityForm.bscname.disabled = true;
			document.newOpportunityForm.bsdbaName.disabled = false;
			document.newOpportunityForm.bsfirstName.disabled = true;
			document.newOpportunityForm.bslastName.disabled = true;
			document.newOpportunityForm.bsaddress1.disabled = true;
			document.newOpportunityForm.bsaddress2.disabled = true;
			document.newOpportunityForm.bscity.disabled = true;
			document.newOpportunityForm.bszipCode.disabled = true;
			document.newOpportunityForm.bsprovince.disabled = true;
			document.newOpportunityForm.bsstate.disabled = true;
			document.newOpportunityForm.bscountry.disabled = true;

			document.newOpportunityForm.shcname.disabled = true;
			document.newOpportunityForm.shdbaName.disabled = true;
			document.newOpportunityForm.shfirstName.disabled = true;
			document.newOpportunityForm.shlastName.disabled = true;
			document.newOpportunityForm.shaddress1.disabled = true;
			document.newOpportunityForm.shaddress2.disabled = true;
			document.newOpportunityForm.shcity.disabled = true;
			document.newOpportunityForm.shzipCode.disabled = true;
			document.newOpportunityForm.shprovince.disabled = true;
			document.newOpportunityForm.shstate.disabled = true;
			document.newOpportunityForm.shcountry.disabled = true;
			document.newOpportunityForm.setdefaultbs.value = "";
			CopyBilladdToShipAdd();
		}
	}
	function addToTable(form) {
		flag = 0;
		flag1 = 0;
		invID = form.serviceID.value;
		SIDSize = document.getElementById('sIDSize').value;

		SLSize = document.getElementById('sSize').value;
		InvSize = document.getElementById('iSize').value;
		DetailSize = document.getElementById('dSize').value;

		var serviceName;
		var InvoiceStyle;
		var ServiceBalance = "0.0";
		var DefaultService;

		for (t = 0; t < exist.length; t++) { //limit=cnt
			if (invID == exist[t]) {
				flag = 1;
				break;
			}
		}

		if (flag == 1) {

			return showServiceValidationDialog();
			return;
		} else {
			flagx = 0;
			for (i = 0; i < SLSize; i++) {
				iinvID = document.getElementById(i + 'sid').value;
				isID = document.getElementById(i + 'isid').value;
				if (invID == iinvID) {

					serviceName = document.getElementById(i + 'sname').value;

					for (j = 0; j < InvSize; j++) {
						isID2 = document.getElementById(j + 'invid').value;
						if (isID == isID2) {
							for (k = 0; k < exist.length; k++) {
								if (exist[k] == -1) {
									exist[k] = invID;
									break;
								}
							}
							InvoiceStyle = document.getElementById(j + 'iname').value;
							flagx = 1;
						}
					}
				}
			}

			if (flagx == 0) {
				InvoiceStyle = "";
				for (k = 0; k < exist.length; k++) {
					if (exist[k] == -1) {
						exist[k] = invID;
						break;
					}
				}
			}

			hidn_val = document.getElementById('hidn').value;
			hidn_val1 = hidn_val;

			var tr = document.createElement("tr");
			tr.setAttribute("id", "row" + invID);

			var tr2 = document.getElementById('tr$$');
			var parentTr = tr2.parentNode;
			parentTr.insertBefore(tr, tr2);

			var td1 = document.createElement("td");
			td1.setAttribute("align", "left");
			tr.appendChild(td1);
			td1.innerHTML = serviceName;

			var td2 = document.createElement("td");
			td2.setAttribute("align", "left");
			tr.appendChild(td2);
			td2.innerHTML = InvoiceStyle;

			var td3 = document.createElement("td");
			td3.setAttribute("align", "left");
			tr.appendChild(td3);
			td3.innerHTML = ServiceBalance;

			var td4 = document.createElement("td");
			td4.setAttribute("align", "left");
			tr.appendChild(td4);
			var rd = "<input type=radio id=setdisable name=defaultService onclick=setDefault("
					+ invID + ",this.form); />";
			td4.innerHTML = rd;
			var button = '<img src="${pageContext.request.contextPath}/images/delete.png" alt="Deletable" onclick=removeFromTable('
					+ invID + '); >';

			var td5 = document.createElement("td");
			td5.setAttribute("align", "left");
			tr.appendChild(td5);
			td5.innerHTML = button;

			document.newOpportunityForm.table_size.value++;
			document.newOpportunityForm.table_serID.value += invID + ";";
			document.newOpportunityForm.table_serviceName.value += serviceName + ";";
			document.newOpportunityForm.table_bal.value += ServiceBalance + ";";
			if (InvoiceStyle == "") {
				form.table_invId.value += "0;";
			} else {
				for (p = 0; p < InvSize; p++) {
					invoiceName = document.getElementById(p + 'iname').value;
					if (invoiceName == InvoiceStyle) {
						document.newOpportunityForm.table_invId.value += document
								.getElementById(p + 'invid').value + ";";
					}
				}
			}
			count = ((count) / 1 + 1);
			document.getElementById('hidn').value = ((hidn_val) / 1 + 1);
		}
		name = document.newOpportunityForm.table_serviceName.value;
	}
	function setDefault(invID1, form) {
		//form.table_defaultVal.value+=1+":"+invID1+";";
		document.newOpportunityForm.table_defaultVal.value = invID1;
		//document.getElementById('setdisable').disabled=true;
	}
	function removeFromTable(idV) {
		var str;
		var trid;
		//	removeStringValues(document.forms[0].table_serID.value,idV);
		trid = "row" + idV;
		for (i = 0; i < exist.length; i++) {
			if (idV == exist[i]) {
				//document.getElementById(trid).style.display='none';
				var ttt = document.getElementById(trid);
				ttt.parentNode.removeChild(ttt);
				exist[i] = -1;
				cnt--;

				//str=removeStringValues(document.forms[0].table_serID.value,idV);
				removeStringValues(idV);

				//do same for other two strings
				break;
			}
		}
	}
	function removeStringValues(key) { //from one string('str'), a substring 'key' will be removed
		var str, str2, str3;
		var temp = new Array(20);
		var temp2 = new Array(20);
		var temp3 = new Array(20);

		str = document.forms[0].table_serID.value;
		str2 = document.forms[0].table_bal.value;
		str3 = document.forms[0].table_invId.value;

		temp = str.split(";");
		temp2 = str2.split(";");
		temp3 = str3.split(";");

		str = str2 = str3 = "";
		for (i = 0; i < temp.length; i++) {
			if (temp[i] != key) {
				k = 0;
				for (k = 0; k < i; k++) {
					if (temp[i] == temp[k]) {
						k = -1;
						break;
					}
				}
				if (k != -1) {
					str = str + temp[i] + ";";
					str2 = str2 + temp2[i] + ";"
					str3 = str3 + temp3[i] + ";"
				}
			}
		}
		str = str.substring(0, str.length - 1); //removes last semi-colon
		str2 = str2.substring(0, str2.length - 1); //removes last semi-colon
		str3 = str3.substring(0, str3.length - 1); //removes last semi-colon

		if (key == document.forms[0].table_defaultVal.value) {
			document.forms[0].table_defaultVal.value = "0"; //reset if no service is set to default
		}

		//		"\n\ntable_bal="+document.forms[0].table_bal.value+"\nstr2="+str2+
		//	"\n\ntable_invId="+document.forms[0].table_invId.value+"\nstr3="+str3+
		//"\n\ndefault service="+document.forms[0].table_defaultVal.value);

		document.forms[0].table_serID.value = str;
		document.forms[0].table_bal.value = str2;
		document.forms[0].table_invId.value = str3;
	}

	function NewCustomer() {
		//billing addressres/*
		/* 	document.newOpportunityForm.bscname.value = "";
			document.newOpportunityForm.bsfirstName.value = "";
			document.newOpportunityForm.bslastName.value = "";
			document.newOpportunityForm.bsaddress1.value = "";
			document.newOpportunityForm.bsaddress2.value = "";
			document.newOpportunityForm.bscity.value = "0";
			document.newOpportunityForm.bszipCode.value = "";
			document.newOpportunityForm.bsprovince.value = "";
			document.newOpportunityForm.bscountry.value = "0"; */
		//shipping addresses
		/* 	document.newOpportunityForm.shcname.value = "";
			document.newOpportunityForm.shfirstName.value = "";
			document.newOpportunityForm.shlastName.value = "";
			document.newOpportunityForm.shaddress1.value = "";
			document.newOpportunityForm.shaddress2.value = "";
			document.newOpportunityForm.shcity.value = "0";
			document.newOpportunityForm.shzipCode.value = "";
			document.newOpportunityForm.shprovince.value = "";
			document.newOpportunityForm.shcountry.value = "0"; */
		//genaral Tab
		document.newOpportunityForm.firstName.value = "";
		document.newOpportunityForm.lastName.value = "";
		document.newOpportunityForm.address1.value = "";
		document.newOpportunityForm.address2.value = "";
		document.newOpportunityForm.city.value = "0";
		//document.newOpportunityForm.stateName.value="";
		document.newOpportunityForm.zipCode.value = "";
		document.newOpportunityForm.phone.value = "";
		document.newOpportunityForm.cellPhone.value = "";
		document.newOpportunityForm.fax.value = "";
		document.newOpportunityForm.email.value = "";
		//	document.newOpportunityForm.title.value="";
		document.newOpportunityForm.province.value = "";
		//	document.newOpportunityForm.country.value="0";
		document.newOpportunityForm.homePage.value = "www.";
		//	document.newOpportunityForm.type.value="";
		document.newOpportunityForm.texID.value = "";
		/* document.newOpportunityForm.openingUB.value = ""; */
		/* document.newOpportunityForm.extCredit.value = ""; */
		document.newOpportunityForm.memo.value = "";
		/* document.newOpportunityForm.ccType.value="";
		document.newOpportunityForm.cardNo.value="";
		document.newOpportunityForm.expDate.value="";
		document.newOpportunityForm.cw2.value="";
		document.newOpportunityForm.cardHolderName.value="";
		document.newOpportunityForm.cardBillAddress.value="";
		document.newOpportunityForm.cardZip.value=""; */
		//document.newOpportunityForm.dateAdded.value="";
		/* document.newOpportunityForm.cname.value=""; */
		/* document.newOpportunityForm.chk_alsovendor.checked = false; */
		//document.newOpportunityForm.chk_useind.checked=false;

		$("#countryID").val(231).change();
		$("#countryID2").val(231).change();
		$("#countryID3").val(231).change();
	}

	function CloseMe() {
		window.close();
	}
	function showNameDialog() {
		event.preventDefault();
		$("#showNameDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function enterEmailValidationDialog() {
		event.preventDefault();
		$("#enterEmailValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 450,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showEmailLengthValidationDialog() {
		event.preventDefault();
		$("#enterEmailValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 450,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showFirstNameDialog() {
		event.preventDefault();
		$("#showFirstNameDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showLastNameDialog() {
		event.preventDefault();
		$("#showLastNameDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showAddress1Dialog() {
		event.preventDefault();
		$("#showAddress1Dialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showCityDialog() {
		event.preventDefault();
		$("#showCityDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showZipCodeDialog() {
		event.preventDefault();
		$("#showZipCodeDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showphoneemptydialog() {
		event.preventDefault();
		$("#showphoneemptydialog").dialog({
			resizable : false,
			height : 200,
			width : 500,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showCellPhoneLengthDialog() {
		event.preventDefault();
		$("#showCellPhoneLengthDialog").dialog({
			resizable : false,
			height : 200,
			width : 500,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showEmailValidationDialog() {
		event.preventDefault();
		$("#showEmailValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 450,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showServiceValidationDialog() {

		event.preventDefault();
		$("#showServiceValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 450,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
</script>

<!-- Dialog box used in this page -->
<div id="enterEmailValidationDialog" style="display: none;">
	<p>
		<spring:message code="Bzcomposer.updatevendor.enteremailaddress" />
	</p>
</div>
<div id="showEmailLengthValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entervalidemaillength" />
	</p>
</div>
<div id="showNameDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entercompanyname" />
	</p>
</div>
<div id="showFirstNameDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enterfirstname" />
	</p>
</div>
<div id="showLastNameDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enterlastname" />
	</p>
</div>
<div id="showAddress1Dialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enteradderss1" />
	</p>
</div>
<div id="showCityDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entercity" />
	</p>
</div>
<div id="showZipCodeDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enterzipcode" />
	</p>
</div>
<div id="showEmailValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entervalidemail" />
	</p>
</div>
<div id="showCellPhoneLengthDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.cellphonelength" />
	</p>
</div>
<div id="showphoneemptydialog" style="display: none;">
	<p>Please Enter Phone First</p>
</div>
<div id="addNewOpportunityDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.insertOpportunity" />
	</p>
</div>
<div id="showServiceValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.serviceexist" />
	</p>
</div>
<div id="errorOccurred" style="display: none; font-size: 12px;">
	<p>
		<spring:message code="BzComposer.common.erroroccurred" />
	</p>
</div>
<!-- Dialog box used in this page -->
<div id="maxnumberofuserdialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.configuration.networksecurity.maxnumberofuser" />
	</p>
</div>