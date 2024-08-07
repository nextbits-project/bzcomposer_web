<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.bankingtitle" /></title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<spring:url value="/cssresources/Myapp.css" var="mycss" />
<script>var ctx = "${pageContext.request.contextPath}";</script>
<style type="text/css">
div#pie { /* 	color:#05A9C5;; */
	padding: 5px 0px 5px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}

table.tabla-listados th thead tr {
	font-size: 12px;
	text-align: left;
	padding: 5px 10px;
	/* 	background: rgba(5, 169, 197, 0.11); */
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	/* 	color: #333; */
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}

table.tabla-listados tbody tr td th {
	font-size: 12px;
	/* 	color: #666; */
	padding: 5px 0px 5px 5px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: #fff;
	vertical-align: top;
}

#popupWindow {
	/* width: 1500px;
    height: 900px;*/
	
}

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}

#popupWindow {
	
}

.arrowButton {
	position: relative;
	padding: 15px 10px;
	background: #fff;
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 400;
	font-size: 0.6em;
	letter-spacing: 1px;
	transition: 0.55;
	clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%);
}

.NewArrowButton {
	position: relative;
	padding: 15px 10px;
	background: #2E8565;
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 400;
	font-size: 0.6em;
	letter-spacing: 1px;
	transition: 0.55;
	/* clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%); */
	clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%);
}

.ArrowButtonSelect {
	position: relative;
	padding: 15px 10px;
	background: #B6D0E2;
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 400;
	font-size: 0.6em;
	letter-spacing: 1px;
	transition: 0.55;
	/* clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%); */
	clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%);
}

.arrowButton a:link, a:visited {
	color: (internal value);
	text-decoration: underline;
	cursor: auto;
}

.horizontal_line {
	background-color: green;
	width: 90%;
	height: 5px;
	border-top: 5px dotted black;
	line-height: 80%;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff;
	padding: 5px;
}
/* .table tr:hover { cursor: pointer;} */
.bz_dialogTable tr td {
	padding: 5px;
}

.bz_dialogTable tr td label {
	font-size: 6px;
}

.bz_dialogTable tr td input {
	font-size: 12px;
}

.bz_dialogTable tr td select {
	font-size: 12px;
}

.bzbtn {
	position: relative;
	top: 10px;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

.titl1 {
	color: #373D3F;
}

label {
	display: inline-block;
	margin-bottom: 0;
}

.nav {
	padding-left: 15px;
}

.nav-item {
	border-color: #dee2e6 ! important;
}

.nav-item.active {
	border-color: 2px solid #dee2e6 ! important;
}

.errorField {
	color: red ! important;
}

.customSearch {
	display: none;
}
</style>
</head>
<body>
	<div id="ddcolortabsline">&nbsp;</div>


	<form:form name="opportunityDetails" id="opportunityManagerForm"
		method="post" modelAttribute="customerDto">


		<div class="content1 clearfix">
			<h3 class="title1">
				<img style="margin: 0;"
					src="${pageContext.request.contextPath}/images/oppotunityIcon.png"
					height='28' width='28'>
				<spring:message code="BzComposer.customer.opportunity" />
			</h3>
			<h5 class="titl1">${oppoDto.opportunityName}</h5>
			<div class="filterbar filterbar1">

				<table style="width: 50%;">
					<tr class="title1" style="font-size: 13px">
						<td><spring:message
								code="BzComposer.customer.opportunity.accountName" /></td>

						<td><spring:message
								code="BzComposer.customer.opportunity.startDate" /></td>
						<td><spring:message
								code="BzComposer.customer.opportunity.closeDate" /></td>




						<td><spring:message
								code="BzComposer.customer.opportunity.amount" /></td>
						<td><spring:message
								code="BzComposer.customer.opportunity.opportunityOwner" /></td>
					</tr>
					<tr>
						<td>${oppoDto.clientVendor.name}</td>



						<td rowspan="2" style="border-color: #96D4D4;">

							${oppoDto.startDate}</td>
						<td rowspan="2" style="border-color: #96D4D4;">

							${oppoDto.closedDate}</td>

						<td>${oppoDto.amount}</td>

						<td>${oppoDto.opportunityOwner}</td>
					</tr>

				</table>

			</div>
			<div class="filterbar filterbar1">
				<table style="width: 100%;">
					<tr>

						<td><a id="S1" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.opportunities.prospecting" /></a></td>
						<td><a id="S2" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.opportunities.qualification" /></a></td>
						<td><a id="S3" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.opportunities.needAnalysis" /></a></td>
						<td><a id="S4" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.opportunities.valueProposition" /></a></td>
						<td><a id="S5" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.opportunities.decisionMakers" /> </a></td>
						<td><a id="S6" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.opportunities.perceptionAnalysis" />
						</a></td>

						<td><a id="S7" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.opportunities.proposalPriceQuote" />
						</a></td>

						<td><a id="S8" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.opportunities.negotiationReview" />
						</a></td>
						<td><a id="S9" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.opportunities.closedWon" /></a></td>
						<td><a id="S10" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.opportunities.closedLoss" /></a></td>
						<td>
							<button type="button" class="btn btn-info"
								style="font-size: 12px;" onclick="markStageCompleted()">
								✓
								<spring:message
									code="BzComposer.customer.opportunity.markStageCompleted" />


							</button>

							<button type="button" class="btn btn-info"
								style="float: right; font-size: 12px;" onclick="saveStage()">

								<spring:message
									code="BzComposer.customer.opportunity.saveChanges" />
							</button>

						</td>
					</tr>
				</table>
			</div>

			<div class="row">
				<div class="col-md-12 d-flex flex-column full-height">
					<div id="selectedAccount" style="width: 100%;">
						<h4 class="title2"></h4>
						<!-- <h4 class="title2">Personal Checking 5423</h4> -->
					</div>

				</div>
			</div>



			<div id="table-negotiations"
				style="padding: 0; border: 1px solid #ccc;">
				<table cellspacing="0"
					style="border: 0; width: 100%; overflow-y: scroll;"
					class="section-border">

					<tr>

						<td valign="top">
							<div id="tabs" style="height: auto;">
								<ul>
									<li style="font-size: 12px;"><a href="#activityTab"><spring:message
												code="BzComposer.customer.opportunity.activity" /></a></li>
									<li style="font-size: 12px;"><a
										href="#opportunityDetailsTab"><spring:message
												code="BzComposer.customer.opportunity.details" /></a></li>
								</ul>
								<!-- activityTab Starts -->
								<div id="activityTab" style="display: none;">
									<table class="table-notifications" width="100%">
										<tr>
											<td colspan="4"><a href="#"
												class="btn btn-primary btn-sm active" role="button"
												aria-pressed="true" onclick="openCalendar()"><spring:message
														code="BzComposer.customer.opportunity.calendar" /> <i
													class="fa fa-calendar" aria-hidden="true"
													style="font-size: 18px; color: red"></i> </a> <a href="#"
												class="btn btn-primary btn-sm active" role="button"
												aria-pressed="true" onclick="addEvent()"> <spring:message
														code="BzComposer.customer.opportunity.manageEvent" /> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="currentColor" class="bi bi-calendar4-event"
														viewBox="0 0 16 16">
  <path
															d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z" />
  <path
															d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z" />
</svg>
											</a></td>
										</tr>
									</table>

									<div style="width: 80%;" align="center">
										<img
											src="${pageContext.request.contextPath}/images/EventsIcon.png">
										<label for="css" style="color: #05A9C5">
											<h5>Upcoming Events</h5>
										</label><br>
										<table id="custTable" class="tabla-listados sortable"
											cellspacing="0"
											style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
											align="center">
											<thead>
												<tr valign="center" style="width: 80%;">

													<th style="padding-right: 30px !important;"><spring:message
															code="BzComposer.Customer.opportunities.id" /></th>
													<th><spring:message
															code="BzComposer.customer.opportunity.eventName" /></th>

													<th><spring:message
															code="BzComposer.customer.opportunity.eventMemo" /></th>
													<th><spring:message
															code="BzComposer.customer.opportunity.eventStartDate" /></th>

													<th><spring:message
															code="BzComposer.customer.opportunity.eventEndDate" /></th>
												</tr>
											</thead>

											<tbody id="custTableBody">
												<c:if test="${not empty eventList}">
													<c:forEach items="${eventList}" var="objList"
														varStatus="loop">
														<tr id='${loop.index}$$'
															onclick="setRowId(${objList.eventId}, ${loop.index}, true);">

															<td><input type="checkbox" id="eventId${loop.index}"
																value="${objList.eventId}"
																onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
																${objList.eventId}</td>
															<td>${objList.eventName}</td>
															<td>${objList.eventMemo}</td>
															<td>${objList.eventStartDate}</td>
															<td>${objList.eventEndDate}</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

									</div>


								</div>


								<!--       activity end  -->
								<!--  opportunity details start  -->
								<div id="opportunityDetailsTab">




									<div id="content1" class="tabPage">
										<div align="right">
											<input type="button" class="formbutton"
												style="padding: 7 15px;" onclick="editOpportunity()"
												value="<spring:message code='BzComposer.global.edit'/>" />
											<input type="button" class="formbutton"
												style="padding: 7 15px;" onclick="saveOpportunity()"
												value="<spring:message code='BzComposer.global.save'/>" />
										</div>
										<table class="table-notifications" style="width: 100%">
											<tr>
												<th colspan="9" align="left"
													style="font-size: 12px; padding: 5px;"><spring:message
														code="BzComposer.customer.opportunity.opportunityDetails" />
												</th>
											</tr>


											<tr>
												<td><spring:message
														code="BzComposer.customer.opportunityid" /> <span
													class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /> </span></td>
												<td><form:input path="opportunityId" readonly="true"
														size="20" /></td>


												<td><spring:message
														code="BzComposer.customer.opportunity.name" /> <span
													class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /> </span></td>
												<td><form:input type="text" path="opportunityName"
														readonly="true" size="20" /></td>

												<td><spring:message
														code="BzComposer.customer.opportunity.stage" /></td>
												<td><form:input type="text" path="opportunityStage"
														readonly="true" size="20" /></td>






												<td><spring:message
														code="BzComposer.customer.opportunity.amount" /> <span
													class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /></span></td>
												<td><form:input readonly="true" type="text"
														path="opportunityAmount" /></td>
											</tr>
											<tr>

												<td><spring:message
														code="BzComposer.customer.opportunity.startDate" /></td>
												<td><form:input type="text" path="startDate"
														readonly="true" /></td>
												<td><spring:message
														code="BzComposer.customer.opportunity.closeDate" /></td>
												<td><form:input type="text" readonly="true"
														path="dateClosed" /></td>

												<td><spring:message
														code="BzComposer.Customer.opportunities.opportunityOwner" />
												</td>
												<td><form:select readonly="true" disabled="true"
														path="opportunityOwner">

														<form:option value="0">
															<spring:message code="BzComposer.ComboBox.Select" />
														</form:option>



														<form:options items="${opportunityOwnerList}"
															itemValue="name" itemLabel="name" />
													</form:select></td>
												<!--  
														<td><spring:message
															code="BzComposer.customer.opportunity.active" /></td>
													<td><input  type="checkbox" readonly="readonly"
														value="${oppoDto.active}"
														${oppoDto.active=='true'? 'checked':''} /></td>
															-->
											</tr>
											<tr>
												<td><spring:message
														code="BzComposer.customer.opportunity.sourceID" /></td>


												<td><form:select path="leadSource" id="sourceID"
														disabled="true" style="width:150px;">
														<option value="0"><spring:message
																code="BzComposer.ComboBox.Select" /></option>
														<c:forEach items="${leadSource}" var="curObject">
															<option value="${curObject.leadSourceId}"
																${curObject.leadSourceId==customerDto.leadSource?'selected':''}>${curObject.name}</option>
														</c:forEach>
													</form:select></td>
											</tr>
											<tr>
												<th colspan="8" align="left"
													style="font-size: 12px; padding: 5px;"><spring:message
														code="BzComposer.customer.opportunity.accountDetails" />
												</th>
											</tr>

											<tr>

												<td><spring:message
														code="BzComposer.customer.opportunity.compnayName" /> <span
													class="inputHighlighted"></span>
												<spring:message code="BzComposer.CompulsoryField.Validation" />
												</td>
												<td><form:input path="companyName" readonly="true"
														size="20" /></td>

												<td><spring:message code="BzComposer.global.homepage" />
												</td>
												<td><form:input readonly="true" path="homePage"
														size="40" /></td>
												<td><spring:message code="BzComposer.global.phone" />
												</td>
												<td><form:input readonly="true" path="phone"
														maxlength="16"
														onkeypress="return numbersonly(event,this.value)"
														onchange="validateUSAPhoneNumber(this, true);" /></td>
											</tr>

											<tr>
												<th colspan="8" align="left"
													style="font-size: 12px; padding: 5px;"><spring:message
														code="BzComposer.customer.opportunity.contactDetails" />
												</th>
											</tr>
											<tr>


												<td><spring:message code="BzComposer.global.firstname" />
													<span class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /></span></td>
												<td><form:input readonly="true" path="firstName"
														size="20" /></td>
												<td><spring:message code="BzComposer.global.middlename" /></td>
												<td><form:input readonly="true" path="middleName"
														size="20" /></td>

												<td><spring:message code="BzComposer.global.lastname" />
													<span class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /></span></td>
												<td><form:input readonly="true" path="lastName"
														size="20" /></td>

											</tr>

											<tr>
												<td><spring:message code="BzComposer.global.address1" />
													<span class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /></span></td>
												<td><form:input readonly="true" path="address1"
														size="20" /></td>

												<td><spring:message code="BzComposer.global.address2" />
												</td>
												<td><form:input readonly="true" path="address2"
														size="20" /></td>

												<td style="color: #black !important;">
													<div class="lblZipcodeShow float-left">
														<spring:message code="BzComposer.global.zipcode" />
													</div>
													<div class="lblPostalcodeShow float-left">
														<spring:message code="BzComposer.global.postalcodes" />
													</div>&nbsp; <span class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /></span>
												</td>
												<td><form:input path="zipCode" readonly="true"
														onfocusout="loadAddressDetailsByZipcode(this.value, 1)"
														onkeypress="return numbersonly(event,this.value)"
														value="${zipcode }" /></td>
											</tr>
											<tr>
												<td><spring:message code="BzComposer.global.city" /> <span
													class="inputHighlighted"><spring:message
															code="BzComposer.CompulsoryField.Validation" /></span></td>
												<td><form:select path="city" disabled="true"
														id="cityID" style="width:200px;">
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
													</div> <!--<div class="lblProvinceShow"><spring:message code="BzComposer.global.province" /></div> -->
												</td>
												<td><form:select disabled="true" path="state"
														id="stateID"
														onchange="loadCitiesByStateID(this.value, 1);"
														style="width:180px;">
														<form:option value="0">
															<spring:message code="BzComposer.register.selectstate" />
														</form:option>
														<c:forEach items="${stateList}" var="currObject">
															<form:option value="${currObject.stateId}">${currObject.state}</form:option>
														</c:forEach>
													</form:select> <form:hidden path="province" /></td>

												<td id="t_country"><spring:message
														code="BzComposer.global.country" /></td>
												<td><form:select disabled="true" path="country"
														id="countryID"
														onchange="loadStatesByCountryID(this.value, 1);"
														style="width:180px">
														<form:option value="0">
															<spring:message code="BzComposer.register.selectcounry" />
														</form:option>
														<c:forEach items="${countryList}" var="currObject">
															<form:option data-code="${currObject.phoneCode}"
																value="${currObject.countryId}">${currObject.countryName}</form:option>
														</c:forEach>
													</form:select></td>
											<tr>

											</tr>
											<tr>
												<td><spring:message code="BzComposer.global.mobile" />
												</td>
												<td colspan="3"><form:input readonly="true"
														path="cellPhone" maxlength="16"
														onkeypress="return numbersonly(event,this.value)"
														onchange="validateUSAPhoneNumber(this, true);" />&nbsp;&nbsp;&nbsp;
													<form:checkbox path="isPhoneMobileNumber"
														onchange="copyPhoneNumber(this.form);"
														onckick="setMobileNumber()" /> (<spring:message
														code="BzComposer.global.isPhoneNumber" />)</td>
												<td><spring:message code="BzComposer.global.email" />
												</td>
												<td colspan="3"><form:input type="email"
														readonly="true" path="email" size="20" /></td>
											</tr>
										</table>
									</div>

								</div>



								<!--  opportunity details end -->
						</td>
					</tr>
				</table>
			</div>


		</div>

		<input type="hidden" id="tabid" name="tabid" value="" />
	</form:form>
	<script type="text/javascript">                            
	const stages= ["prospecting", "qualification","needAnalysis", "valueProposition","decisionMakers","proposalPriceQuote","negotiationReview","perceptionAnalysis","closedWon","closedLoss"];
	
	let stageArray = new Array(10).fill(false);
	var selectedStage="";
	<!-- Javascript Begins Here -->
	
	$(function() {
	    $( "#tabs" ).tabs();
	  });
	
	$(document).ready(function() 			{
 var stage='${oppoDto.stage}';

let j;
let  currentStage;


for ( j = 0; j < 10; j++)
{
   if(stage==stages[j])
	{
	   currentStage=j;
	   break;
	}
}

for (k = 0;k <=currentStage&&k <8; k++)
{
 stageArray[k]=true;
 selectedStage="S"+(k+1);
 
  markStageCompleted(); 
}

if(currentStage==8)
{
stageArray[9]=false;
stageArray[8]=true;
selectedStage="S"+9;
 markStageCompleted(); 
}

if(currentStage==9)
	{
	stageArray[8]=false;
	selectedStage="S"+10;
	 markStageCompleted(); 
	}
});
	
	
	function editOpportunity()
	{

		$("#editOpportunityDialog").dialog({
            resizable: false,
            height:180,
            width: 400,
            modal: true,
            buttons: 
            {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                    $(this).dialog("close");
                    
                    
                    document.getElementById('opportunityName').readOnly = false;
            		
                	
            		
            		document.getElementById('opportunityOwner').disabled = false;
            		
            		document.getElementById('cityID').disabled = false;
            		document.getElementById('stateID').disabled = false;
            		document.getElementById('countryID').disabled = false;
            		document.getElementById('opportunityAmount').readOnly = false;
            		document.getElementById('companyName').readOnly = false;
            	
            	
            		document.getElementById('firstName').readOnly = false;
            		document.getElementById('middleName').readOnly = false;
            		document.getElementById('lastName').readOnly = false;
            		
            		document.getElementById('address1').readOnly = false;
            		document.getElementById('address2').readOnly = false;
            		document.getElementById('zipCode').readOnly = false;
            		
            		document.getElementById('sourceID').disabled = false;
            		
            	
            		document.getElementById('cellPhone').readOnly = false;
            		document.getElementById('homePage').readOnly = false;
            		document.getElementById('phone').readOnly = false;
                    
                },
                "<spring:message code='BzComposer.global.cancel'/>": function ()
                {
                	 $(this).dialog("close");
                	location.reload();
                
                }
                
                
            }
        });
	

		
		
		
		
		
	
	
	
	}
	
 function saveStage()
	{
   let i;

	 for ( i = 0; i <10; i ++)
	  {
         if(stageArray[i]==false)
        	 break;
	  } 
	 var updateOpportunityDetails= 
	   {
	     "opportunityID": '${oppoDto.opportunityID}',
	     "stage": stages[i-1],
	    };
	 
	 var obj=JSON.stringify(updateOpportunityDetails);
	 
	 $.ajax({
	 		type : "POST",
	 		url : "opportunityUpdate?tabid=update",
	 	    data :"data=" + obj,
	 	    success : function(data)
	 	    {
	 	    
	 	      alert("opportunity  Stage updated  Successfully !!");
	 	    	location.reload();
	 		}
	 		,
	 		 error : function(data) 
	 		 {
	 			 
	 			 //return showerrordialog();
	 		}
	 	});
         
	}

 function validateStage(index)
 {
	 let i;
	 
	 for(i=index;i>=0;i--)
		 {
		 if(stageArray[i]==false)
			 return false;		 
		 
		 }
	 return  true; 
 }
	
	function openCalendar()
	{
		window.open("Opportunity?tabid=calendarEvent&opportunityID="+${oppoDto.opportunityID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function addEvent()
	{
		window.open("Opportunity?tabid=manageEvent&opportunityID="+${oppoDto.opportunityID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function stageSelected(selectedStage)
	{
		 document.getElementById(selectedStage).classList.remove("NewArrowButton");
		  document.getElementById(selectedStage).classList.add("ArrowButtonSelect");
		  document.getElementById(selectedStage).style.color ="white";
	
	}
	

	function chooseStage(className,id)
	{
		   	
		
		
		if(id=="S1"&& stageArray[0]==false )
			{
			 selectedStage="S1";
			 stageSelected(selectedStage);
			
			}
		
		   
		   if(id=="S2"&& stageArray[1]==false)
			   {
			   selectedStage="S2";
			   stageSelected(selectedStage);
			   }	
	   
		   if(id=="S3"&& stageArray[2]==false)
			   {
			   selectedStage="S3";
			   stageSelected(selectedStage);
			   }
		   if(id=="S4")
			   {
			   selectedStage="S4";
			   stageSelected(selectedStage);
			   }
		   
		   if(id=="S5")
			   {
			   selectedStage="S5";
			   stageSelected(selectedStage);
			   }
		   
		   if(id=="S6")
			   {
			   selectedStage="S6";
			   stageSelected(selectedStage);
			   }
		   
		   if(id=="S7")
			   {
			   selectedStage="S7";
			   stageSelected(selectedStage);
			   }
		   
		   if(id=="S8")
			   {
			   selectedStage="S8";
			   stageSelected(selectedStage);
			   }
		   
		   if(id=="S9")
			   {
			   selectedStage="S9";
			   stageSelected(selectedStage);
			   }
		   if(id=="S10")
			   {
			   selectedStage="S10";
			   stageSelected(selectedStage);
			   }
		   
	}
	
	
	function saveOpportunity()
	{
		$("#saveOpportunityDialog").dialog({
            resizable: false,
            height:180,
            width: 400,
            modal: true,
            buttons: 
            {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                    $(this).dialog("close");
                    
                    
                	document.forms["opportunityManagerForm"].action = "/Opportunity?tabid=updateOpportunity";
					document.forms["opportunityManagerForm"]
							.submit();
                    
                    
                    /*
                    $.ajax({
            	 		type : "POST",
            	 		url : "Opportunity?tabid=updateOpportunity",
            	 	    success : function(data)
            	 	    {
            	 	    
            	 	      alert("opportunity  updated  Successfully !!");
            	 	    	location.reload();
            	 		}
            	 		,
            	 		 error : function(data) 
            	 		 {
            	 			 
            	 			 //return showerrordialog();
            	 		}
            	 	});
                    */
                    
                },
                
                "<spring:message code='BzComposer.global.cancel'/>": function ()
                {
                    $(this).dialog("close");
                    
                }
            }
        });
	
	
	
	}
	
	function  showErrorDialog()
	{
		$("#showErrorDialog").dialog({
            resizable: false,
            height:180,
            width: 400,
            modal: true,
            buttons: 
            {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                    $(this).dialog("close");
                    
                }
            }
        });
	
	}
	
	function changeStageClass()
	{
		  document.getElementById(selectedStage).classList.remove("ArrowButtonSelect");
		  document.getElementById(selectedStage).classList.add("NewArrowButton");
		  document.getElementById(selectedStage).style.color ="white";
	}
	
	function markStageCompleted()
	{

		  if(selectedStage=="S1")
			  {
			  changeStageClass();
			  document.getElementById("S1").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.prospecting"/>" ;
		     stageArray[0]=true;
			  }
		  if(selectedStage=="S2")
			  { 

						if(validateStage(0)==true)
						{
							 changeStageClass();
						 document.getElementById("S2").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.qualification"/>";
						 stageArray[1]=true;
						}
						else
							{
							showErrorDialog();
                                    							
							}
			  }
		  if(selectedStage=="S3")
			  {

				if(validateStage(1)==true)
				{
					 changeStageClass();
					  document.getElementById("S3").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.needAnalysis"/>";
			          stageArray[2]=true;
			          
				}
				 else
					{
					showErrorDialog();
					}
			  }
		  if(selectedStage=="S4")
			  {

					  if(validateStage(2)==true)
						{
							  changeStageClass();
							  document.getElementById("S4").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.valueProposition"/>";
							  stageArray[3]=true;
						}
					  else
						{
						showErrorDialog();
						}
			  }
		    if(selectedStage=="S5")
			  {
				    	if(validateStage(3)==true)
						{
				    	 changeStageClass();
					     document.getElementById("S5").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.decisionMakers"/>";
					     stageArray[4]=true;
						}
				    	else
				    		{
				    		showErrorDialog();
				    		}
               }
		    
			  
		   if(selectedStage=="S6")
			  {
			   if(validateStage(4)==true)
				{
			     changeStageClass();
			     document.getElementById("S6").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.perceptionAnalysis"/>";
			    stageArray[5]=true;
				}
			   else
				   {
				   showErrorDialog();
				   } 

			  }
		    if(selectedStage=="S7")
			  {

		    	if(validateStage(5)==true)
				{
     		      changeStageClass();
			      document.getElementById("S7").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.proposalPriceQuote"/>";
			      stageArray[6]=true;
				
				}
		    	 else
		    		{
		    		 showErrorDialog();
		    		}
			  }
		    if(selectedStage=="S8")
			  {
			    	if(validateStage(6)==true)
					{
			    	  changeStageClass();
				      document.getElementById("S8").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.negotiationReview"/>";
				      stageArray[7]=true;
					}
			    	else
			    		{

			    		   showErrorDialog();
	                    }
			  }
			    if(selectedStage=="S9")
				  {
				    	if(validateStage(7)==true&&stageArray[9]==false)
						{
				    	 changeStageClass();
					     document.getElementById("S9").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.closedWon"/>";
					     stageArray[8]=true;
						}
				    	else
				    		{
                          
				    		  showErrorDialog();
				    		}
	           }  
		     if(selectedStage=="S10")
			  {
          	 
		    	 if(validateStage(7)==true&& stageArray[8]==false)
					{
			    	  changeStageClass();
			    	  document.getElementById(selectedStage).style.backgroundColor="Red";
			    	  document.getElementById(selectedStage).style.color = "white";
				      document.getElementById("S10").innerHTML="&#10003;<spring:message code="BzComposer.customer.opportunities.closedLoss"/>";
				      stageArray[9]=true;
					}
		    	    else
		    		{
		    	    	
		    		  showErrorDialog();
		    		}
		  	  }  
	}
</script>
</body>
</html>

<div id="saveOpportunityDialog" title="Warning  .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.saveOpportunity"/>
	</p>
</div>
<div id="editOpportunityDialog" title="Warning .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.editOpportunity" />
	</p>
</div>
<div id="showErrorDialog" title="Invalid Stage .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.invalidStage" />
	</p>
</div>

