<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<title><spring:message code="BzComposer.addnewcustomertitle" /></title>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
<link
	href="${pageContext.request.contextPath}/dist/css/bootstrap-tagsinput.css"
	rel="stylesheet" type="text/css" media="screen" />

<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>

<script
	src="${pageContext.request.contextPath}/dist/js/bootstrap-tagsinput.min.js"></script>
<style>
table.tabla-listados thead tr th {
	font-size: 14px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}

#tabs ul li {
	font-size: 12px !important;
}

input, textarea, select {
	font-size: 12px !important;
}

.bootstrap-tagsinput {
	width: 100% !important;
}
</style>
<script type="text/javascript">
	selectValidCountryMsg = "<spring:message code='BzComposer.register.selectvalidcountry'/>";
	selectValidStateMsg = "<spring:message code='BzComposer.register.selectvalidstate'/>";
	selectValidZipcodeMsg = "<spring:message code='BzComposer.register.selectvalidzipcode'/>";
	noRecordsFoundMsg = "<spring:message code='BzComposer.employee.norecordsfound'/>";

	var success = "${success}";

	if (success) {
		window.opener.location.reload();
		window.close();
	}

	$("input").tagsinput('items')
	
	var contactToday = "${leadDto.contactToday}";
	
 	$( document ).ready(function() {
 		if(contactToday && contactToday === 'true'){
 			$('#contactDateTr').hide();
		}else{
			$('#contactDateTr').show();
		}
		
		$("#contactToday").change(function() {
		    if(this.checked) {
		    	$('#contactDateTr').hide();
		    }else{
		    	$('#contactDateTr').show();
		    }
		});
		
	});
	
</script>
</head>
<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="leadForm" method="post" id="frmNewLead"
		modelAttribute="leadDto">
		<form:input path="leadId" type="hidden" />
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
									<spring:message code="BzComposer.lead.addleadtitle" />
								</span>
							</div>
							<table cellpadding="0" cellspacing="0" border="0" align=center
								style="width: 100%;">
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
								<div id="content1" class="tabPage">
									<!-- add here the content of first tab -->
									<div id="table-negotiations">
										<table class="tabla-listados" cellspacing="0">
											<tbody>
												<tr>
													<td><spring:message code="BzComposer.lead.status" /></td>
													<td><form:select path="status" style="width:150px;">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
															<form:option value="NEW">
																<spring:message code="BzComposer.lead.status.new" />
															</form:option>
															<form:option value="CONTACTED">
																<spring:message code="BzComposer.lead.status.contacted" />
															</form:option>
															<form:option value="QUALIFIED">
																<spring:message code="BzComposer.lead.status.qualified" />
															</form:option>
															<form:option value="WORKING">
																<spring:message code="BzComposer.lead.status.working" />
															</form:option>
															<form:option value="PROSENT">
																<spring:message
																	code="BzComposer.lead.status.proposalsent" />
															</form:option>
															<form:option value="CUSTCONVERT">
																<spring:message
																	code="BzComposer.lead.status.customerconverted" />
															</form:option>
														</form:select></td>
													<td><spring:message code="BzComposer.lead.source" /></td>
													<td><form:select path="source" style="width:150px;">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
															<form:option value="FB">
																<spring:message code="BzComposer.lead.source.fb" />
															</form:option>
															<form:option value="GOOGLE">
																<spring:message code="BzComposer.lead.source.google" />
															</form:option>
															<form:option value="GOOGLE">
																<spring:message code="BzComposer.lead.source.sitemeaweb" />
															</form:option>
														</form:select></td>
													<td><spring:message code="BzComposer.lead.assignedId" /></td>
													<td><form:select path="assignedId"
															style="width:150px;">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
														</form:select></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.tags" /></td>
													<td><form:input path="tags" style="width:150px;"
															data-role="tagsinput" /></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.titlename" /></td>
													<td><form:select path="title" style="width:100px;">
															<form:options items="${titleList}" itemValue="value"
																itemLabel="label" />
														</form:select></td>
													<td><spring:message code="BzComposer.global.firstname" /></td>
													<td><form:input path="firstName" size="20" /></td>
													<td><spring:message code="BzComposer.global.lastname" /></td>
													<td><form:input path="lastName" size="20" /></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.position" /></td>
													<td><form:input path="position" style="width:150px;" /></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.company" /></td>
													<td colspan="3"><form:input path="company"
															style="width:90%;" /></td>
													<td colspan="3"></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.address1" /></td>
													<td colspan="3"><form:input path="address1"
															style="width:90%;" /></td>
													<td colspan="3"></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.address2" /></td>
													<td colspan="3"><form:input path="address2"
															style="width:90%;" /></td>
													<td colspan="3"></td>
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
																<form:option value="${currObject.cityId}">${currObject.cityName}</form:option>
															</c:forEach>
														</form:select></td>
													<td>
														<div class="lblStateShow">
															<spring:message code="BzComposer.global.state" />
														</div>
														<div class="lblProvinceShow">
															<spring:message code="BzComposer.global.province" />
														</div>
													</td>
													<td><form:select path="state" id="stateID"
															onchange="loadCitiesByStateID(this.value, 1);"
															style="width:200px;">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectstate" />
															</form:option>
															<c:forEach items="${stateList}" var="currObject">
																<form:option value="${currObject.stateId}">${currObject.state}</form:option>
															</c:forEach>
														</form:select> <form:hidden path="province" /></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td id="t_country"><spring:message
															code="BzComposer.global.country" /></td>
													<td><form:select path="country" id="countryID"
															onchange="loadStatesByCountryID(this.value, 1);"
															style="width:200px;">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectcounry" />
															</form:option>
															<c:forEach items="${countryList}" var="currObject">
																<form:option data-code="${currObject.phoneCode}"
																	value="${currObject.countryId}">${currObject.countryName}</form:option>

															</c:forEach>
														</form:select></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.phone" /></td>
													<td><form:input path="phone" maxlength="16"
															onkeypress="return numbersonly(event,this.value)"
															onchange="validateUSAPhoneNumber(this, true);" /></td>
													<td style="color: #black !important;"></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.email" /></td>
													<td><form:input path="email" style="width:150px;" /></td>
													<td><spring:message code="BzComposer.lead.website" /></td>
													<td><form:input path="website" style="width:150px;" /></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.leadvalue" /></td>
													<td><form:input path="leadValue" maxlength="16"
															style="width:150px;"
															onkeypress="return numbersonly(event,this.value)" /></td>

													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.global.description" /></td>
													<td colspan="3"><form:input path="description"
															style="width:90%;" /></td>
													<td colspan="2"></td>
												</tr>
												<tr id="contactDateTr" style="display:none">
													<td><spring:message
															code="BzComposer.lead.datecontacted" /></td>
													<td><form:input path="contactDate" readonly="true" /><img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.leadForm.contactDate,'mm-dd-yyyy',this);"></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.chkpublic" /></td>
													<td><form:checkbox path="leadPublic" /></td>
													<td><spring:message
															code="BzComposer.lead.chkcontacttoday" /></td>
													<td><form:checkbox id="contactToday" path="contactToday" /></td>
													<td></td>
													<td></td>
												</tr>


											</tbody>
										</table>
									</div>

								</div>
								<table cellpadding="0" cellspacing="0" border="0" align=center
									style="width: 100%; margin-top: 5px;">
									<script>
										count = 0;
										cnt = 0;
										var exist = new Array(10);
										for (i = 0; i < exist.length; i++) {
											exist[i] = -1;
										}
									</script>
									<tr>
										<td valign=top class="tabPage"></td>
									</tr>
									<tr>
										<td align="center">
											<button type="button" class="formbutton" title="New Customer"
												onclick="addLead();">
												<spring:message code='BzComposer.global.save' />
											</button>
											<button type="button" class="formbutton" title="Close"
												onclick="CloseMe();">
												<spring:message code='BzComposer.global.close' />
											</button>
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
		</div>
	</form:form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<script>
	// window.onunload = refreshParent;

	function refreshParent() {
		window.opener.location.reload();
	}

	function validate() {
		var email = document.CustomerForm.email.value;
		var mail = String(email);
		var pattern = /^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
		if (email == "") {
			//return enterEmailValidationDialog();
			return true;
		} else if (!pattern.test(email)) {
			document.CustomerForm.email.focus();
			return showEmailValidationDialog();
			return false;
		}
		if (mail.length >= 50) {
			document.CustomerForm.email.value = "";
			document.CustomerForm.email.focus();
			return showEmailLengthValidationDialog();
			return false;
		}
		return true;
	}
	function addLead() {
		$("#addLeadDialog")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 500,
							modal : true,
							buttons : {
								"<spring:message code='BzComposer.global.ok'/>" : function() {

									$(this).dialog("close");
									document.forms["frmNewLead"].action = "Lead?tabid=AddLead";
									document.forms["frmNewLead"].submit();
								},
								"<spring:message code='BzComposer.global.cancel'/>" : function() {
									$(this).dialog("close");
									return false;
								}
							}
						});
	}
	function addLeadOld() {

		if (document.CustomerForm.cname.value == "") {
			document.CustomerForm.cname.focus();
			return showNameDialog();
		} else if (document.CustomerForm.firstName.value == "") {
			document.CustomerForm.firstName.focus();
			return showFirstNameDialog();
		} else if (document.CustomerForm.lastName.value == "") {
			document.CustomerForm.lastName.focus();
			return showLastNameDialog();
		} else if (document.CustomerForm.address1.value == "") {
			document.CustomerForm.address1.focus();
			return showAddress1Dialog();
		} else if (document.CustomerForm.city.value == "") {
			document.CustomerForm.city.focus();
			return showCityDialog();
		} else if (document.CustomerForm.zipCode.value == "") {
			document.CustomerForm.zipCode.focus();
			return showZipCodeDialog();
		} else if (String(document.CustomerForm.cellPhone.value).length > 16) {
			document.CustomerForm.cellPhone.value = "";
			document.CustomerForm.cellPhone.focus();
			return showCellPhoneLengthDialog();
		} else {
			if (validate()) {

				event.preventDefault();
				$("#addNewCustomerDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 500,
									modal : true,
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {

											$(this).dialog("close");
											document.forms["frmNewLead"].action = "Lead?tabid=AddLead";
											document.forms["frmNewLead"]
													.submit();
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
	function CloseMe() {
		window.close();
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
<div id="addLeadDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.lead.savelead" />
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