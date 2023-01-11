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
<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
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
<body onload="NewCustomer();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="leadForm" method="post" id="frmNewLead"
		modelAttribute="leadDto">
		<input type="hidden" name="tabid" id="tabid" value="" />
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
													<td><form:select path="status">
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
													<td><form:select path="source">
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
													<td><form:select path="assignedId">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
														</form:select></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.tags" /></td>
													<td><form:input path="tags" style="width:100px;" /></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.firstname" /></td>
													<td><form:input path="firstName" style="width:100px;" /></td>
													<td><spring:message code="BzComposer.global.lastname" /></td>
													<td><form:input path="lastName" style="width:100px;" /></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.address1" /></td>
													<td><form:input path="address1" style="width:100px;" /></td>
													<td><spring:message code="BzComposer.global.address2" /></td>
													<td><form:input path="address2" style="width:100px;" /></td>
													<td></td>
													<td></td>
												</tr>

												<tr>
													<td><spring:message code="BzComposer.lead.position" /></td>
													<td><form:input path="position" style="width:100px;" /></td>
													<td><spring:message code="BzComposer.global.city" /> <span
														class="inputHighlighted"><spring:message
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
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.email" /></td>
													<td><form:input path="email" style="width:100px;" /></td>
													<td><spring:message code="BzComposer.global.state" /></td>
													<td><form:select path="state" id="stateID"
															onchange="loadCitiesByStateID(this.value, 1);"
															style="width:200px;">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectstate" />
															</form:option>
															<c:forEach items="${stateList}" var="currObject">
																<form:option value="${currObject.stateId}">${currObject.state}</form:option>
															</c:forEach>
														</form:select></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.website" /></td>
													<td><form:input path="website" style="width:100px;" /></td>
													<td id="t_country"><spring:message
															code="BzComposer.global.country" /></td>
													<td><form:select path="country" id="countryID"
															onchange="loadStatesByCountryID(this.value, 1);"
															style="width:200px;">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectcounry" />
															</form:option>
															<c:forEach items="${countryList}" var="currObject">
																<form:option value="${currObject.countryId}">${currObject.countryName}</form:option>
															</c:forEach>
														</form:select></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.global.phone" /></td>
													<td><form:input path="phone" style="width:100px;" /></td>
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
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.leadvalue" /></td>
													<td><form:input path="leadValue" style="width:100px;" /></td>
													<td><spring:message code="BzComposer.global.company" /></td>
													<td><form:input path="company" style="width:100px;" /></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.global.description" /></td>
													<td><form:input path="description"
															style="width:100px;" /></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.lead.datecontacted" /></td>
													<td><form:input path="contactDate"
															style="width:100px;" /></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td><spring:message code="BzComposer.lead.chkpublic" /></td>
													<td><form:checkbox path="leadPublic" /></td>
													<td><spring:message
															code="BzComposer.lead.chkcontacttoday" /></td>
													<td><form:checkbox path="contactToday" /></td>
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
											<button type="button" class="formbutton" title="New Customer"
												onclick="NewCustomer();">
												<spring:message code='BzComposer.global.new' />
											</button>
											<button type="button" class="formbutton"
												title="Save Lead" onclick="CheckMambership();">
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
window.onunload = refreshParent;
function refreshParent() {
    window.opener.location.reload();
}
function validate() {
    var email = document.CustomerForm.email.value;
    var mail =String(email);
    var pattern=/^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
    if(email==""){
        //return enterEmailValidationDialog();
        return true;
    }
    else if (!pattern.test(email)) {
        document.CustomerForm.email.focus();
        return showEmailValidationDialog();
        return false;
    }
    if(mail.length>=50){
        document.CustomerForm.email.value="";
        document.CustomerForm.email.focus();
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

function CopyBilladdToShipAdd()
{
	document.CustomerForm.shcname.value= document.CustomerForm.bscname.value;
	document.CustomerForm.shdbaName.value = document.CustomerForm.bsdbaName.value;
	document.CustomerForm.shfirstName.value= document.CustomerForm.bsfirstName.value;
	document.CustomerForm.shlastName.value= document.CustomerForm.bslastName.value;
	document.CustomerForm.shaddress1.value= document.CustomerForm.bsaddress1.value;
	document.CustomerForm.shaddress2.value= document.CustomerForm.bsaddress2.value;
	document.CustomerForm.shzipCode.value = document.CustomerForm.bszipCode.value;
	document.CustomerForm.shprovince.value=document.CustomerForm.bsprovince.value;
	document.CustomerForm.shcountry.value= document.CustomerForm.bscountry.value;
	document.CustomerForm.shstate.value = document.CustomerForm.bsstate.value
	document.CustomerForm.shcity.value= document.CustomerForm.bscity.value;
}

function clearBillingAdd()
{
	document.CustomerForm.bscname.value="";
	document.CustomerForm.bsdbaName.value="";
	document.CustomerForm.bsfirstName.value="";
	document.CustomerForm.bslastName.value="";
	document.CustomerForm.bsaddress1.value="";
	document.CustomerForm.bsaddress2.value="";
	document.CustomerForm.bscity.value="0";
	document.CustomerForm.bszipCode.value="";
	document.CustomerForm.bsprovince.value="";
	document.CustomerForm.bscountry.value="0";
	document.CustomerForm.bsstate.value="0";
}
function clearShippingAdd()
{
	document.CustomerForm.shcname.value="";
	document.CustomerForm.shdbaName.value="";
	document.CustomerForm.shfirstName.value="";
	document.CustomerForm.shlastName.value= "";
	document.CustomerForm.shaddress1.value= "";
	document.CustomerForm.shaddress2.value= "";
	document.CustomerForm.shcity.value= "0";
	document.CustomerForm.shzipCode.value = "";
	document.CustomerForm.shprovince.value="";
	document.CustomerForm.shcountry.value= "0";
	document.CustomerForm.shstate.value="0";
}
function CheckMambership() {
	var membershipLevel = "<%=request.getAttribute("membershipLevel")%>";
	var size = "<%=request.getAttribute("CustomerSize")%>
	";
		var st = "Standared";
		var pf = "Professional";
		if (membershipLevel.toLowerCase() === st.toLowerCase()) {
			if (size >= 1000) {
				return maxnumberofuserdialog();
			} else {
				return AddCustomer();
			}
		} else if (membershipLevel.toLowerCase() == pf.toLowerCase()) {
			if (size >= 10000) {

				return maxnumberofuserdialog();
			} else {
				return AddCustomer();
			}
		}
	}
	function AddCustomer() {

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
											document.getElementById('tabid').value = "AddCustomer";
											document.forms["frmNewCustomer"].action = "Customer?tabid=AddCustomer";
											document.forms["frmNewCustomer"]
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
			document.CustomerForm.annualIntrestRate.disabled = false;
			document.CustomerForm.minFCharges.disabled = false;
			document.CustomerForm.gracePrd.disabled = false;
			document.getElementById('chk1').disabled = false;
			document.getElementById('chk2').disabled = false;
		} else {
			document.CustomerForm.annualIntrestRate.disabled = true;
			document.CustomerForm.minFCharges.disabled = true;
			document.CustomerForm.gracePrd.disabled = true;
			document.getElementById('chk1').disabled = true;
			document.getElementById('chk2').disabled = true;
		}
	}
	function hidebsaddress(form) {
		chbox = document.getElementById('chk_setaddress');
		if (!chbox.checked) {
			document.CustomerForm.bscname.disabled = false;
			document.CustomerForm.bsdbaName.disabled = false;
			document.CustomerForm.bsfirstName.disabled = false;
			document.CustomerForm.bslastName.disabled = false;
			document.CustomerForm.bsaddress1.disabled = false;
			document.CustomerForm.bsaddress2.disabled = false;
			document.CustomerForm.bscity.disabled = false;
			document.CustomerForm.bszipCode.disabled = false;
			document.CustomerForm.bsprovince.disabled = false;
			document.CustomerForm.bsstate.disabled = false;
			document.CustomerForm.bscountry.disabled = false;

			document.CustomerForm.shcname.disabled = false;
			document.CustomerForm.shdbaName.disabled = false;
			document.CustomerForm.shfirstName.disabled = false;
			document.CustomerForm.shlastName.disabled = false;
			document.CustomerForm.shaddress1.disabled = false;
			document.CustomerForm.shaddress2.disabled = false;
			document.CustomerForm.shcity.disabled = false;
			document.CustomerForm.shzipCode.disabled = false;
			document.CustomerForm.shprovince.disabled = false;
			document.CustomerForm.shstate.disabled = false;
			document.CustomerForm.shcountry.disabled = false;
			document.CustomerForm.setdefaultbs.value = "0";
		} else {
			document.CustomerForm.bscname.disabled = true;
			document.CustomerForm.bsdbaName.disabled = false;
			document.CustomerForm.bsfirstName.disabled = true;
			document.CustomerForm.bslastName.disabled = true;
			document.CustomerForm.bsaddress1.disabled = true;
			document.CustomerForm.bsaddress2.disabled = true;
			document.CustomerForm.bscity.disabled = true;
			document.CustomerForm.bszipCode.disabled = true;
			document.CustomerForm.bsprovince.disabled = true;
			document.CustomerForm.bsstate.disabled = true;
			document.CustomerForm.bscountry.disabled = true;

			document.CustomerForm.shcname.disabled = true;
			document.CustomerForm.shdbaName.disabled = true;
			document.CustomerForm.shfirstName.disabled = true;
			document.CustomerForm.shlastName.disabled = true;
			document.CustomerForm.shaddress1.disabled = true;
			document.CustomerForm.shaddress2.disabled = true;
			document.CustomerForm.shcity.disabled = true;
			document.CustomerForm.shzipCode.disabled = true;
			document.CustomerForm.shprovince.disabled = true;
			document.CustomerForm.shstate.disabled = true;
			document.CustomerForm.shcountry.disabled = true;
			document.CustomerForm.setdefaultbs.value = "";
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

			document.CustomerForm.table_size.value++;
			document.CustomerForm.table_serID.value += invID + ";";
			document.CustomerForm.table_serviceName.value += serviceName + ";";
			document.CustomerForm.table_bal.value += ServiceBalance + ";";
			if (InvoiceStyle == "") {
				form.table_invId.value += "0;";
			} else {
				for (p = 0; p < InvSize; p++) {
					invoiceName = document.getElementById(p + 'iname').value;
					if (invoiceName == InvoiceStyle) {
						document.CustomerForm.table_invId.value += document
								.getElementById(p + 'invid').value
								+ ";";
					}
				}
			}
			count = ((count) / 1 + 1);
			document.getElementById('hidn').value = ((hidn_val) / 1 + 1);
		}
		name = document.CustomerForm.table_serviceName.value;
	}
	function setDefault(invID1, form) {
		//form.table_defaultVal.value+=1+":"+invID1+";";
		document.CustomerForm.table_defaultVal.value = invID1;
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
		document.CustomerForm.bscname.value = "";
		document.CustomerForm.bsfirstName.value = "";
		document.CustomerForm.bslastName.value = "";
		document.CustomerForm.bsaddress1.value = "";
		document.CustomerForm.bsaddress2.value = "";
		document.CustomerForm.bscity.value = "0";
		document.CustomerForm.bszipCode.value = "";
		document.CustomerForm.bsprovince.value = "";
		document.CustomerForm.bscountry.value = "0";
		//shipping addresses
		document.CustomerForm.shcname.value = "";
		document.CustomerForm.shfirstName.value = "";
		document.CustomerForm.shlastName.value = "";
		document.CustomerForm.shaddress1.value = "";
		document.CustomerForm.shaddress2.value = "";
		document.CustomerForm.shcity.value = "0";
		document.CustomerForm.shzipCode.value = "";
		document.CustomerForm.shprovince.value = "";
		document.CustomerForm.shcountry.value = "0";
		//genaral Tab
		document.CustomerForm.firstName.value = "";
		document.CustomerForm.lastName.value = "";
		document.CustomerForm.address1.value = "";
		document.CustomerForm.address2.value = "";
		document.CustomerForm.city.value = "0";
		//document.CustomerForm.stateName.value="";
		document.CustomerForm.zipCode.value = "";
		document.CustomerForm.phone.value = "";
		document.CustomerForm.cellPhone.value = "";
		document.CustomerForm.fax.value = "";
		document.CustomerForm.email.value = "";
		//	document.CustomerForm.title.value="";
		document.CustomerForm.province.value = "";
		//	document.CustomerForm.country.value="0";
		document.CustomerForm.homePage.value = "www.";
		//	document.CustomerForm.type.value="";
		document.CustomerForm.texID.value = "";
		document.CustomerForm.openingUB.value = "";
		document.CustomerForm.extCredit.value = "";
		document.CustomerForm.memo.value = "";
		document.CustomerForm.ccType.value = "";
		document.CustomerForm.cardNo.value = "";
		document.CustomerForm.expDate.value = "";
		document.CustomerForm.cw2.value = "";
		document.CustomerForm.cardHolderName.value = "";
		document.CustomerForm.cardBillAddress.value = "";
		document.CustomerForm.cardZip.value = "";
		//document.CustomerForm.dateAdded.value="";
		document.CustomerForm.cname.value = "";
		document.CustomerForm.chk_alsovendor.checked = false;
		document.CustomerForm.chk_useind.checked = false;

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
<div id="addNewCustomerDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.insertnewcustomer" />
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