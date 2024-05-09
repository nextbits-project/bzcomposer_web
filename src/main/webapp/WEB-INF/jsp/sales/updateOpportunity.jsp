<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<title><spring:message
		code="BzComposer.customer.opportunity" /></title>
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


input, textarea, select {
	font-size: 12px !important;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body onload="newValues();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<%-- <form action="Vendor?tabid=AOVODO" method="post"> --%>
	<form:form method="post" id="frmOpportunity" name="OpportunityForm" modelAttribute="opportunityDto">
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
									<spring:message code="BzComposer.customer.opportunity.update" />
								</span>
							</div>
							<table cellpadding="0" cellspacing="0" border="0" align="center"
								style="width: 50%;">
								<tr>
									<td class="pageWin">
										<table cellpadding="0" cellspacing="0" border="0"
											style="width: 100%;">
											<c:if test="${not empty Status}">
												<tr>
													<td colspan="3"><span class="msgstyle">${Status}</span></td>
												</tr>
											</c:if>
											<c:if test="${not empty actionMsg}">
												<tr>
													<td colspan="3"><span class="msgstyle">${actionMsg}</span></td>
													<%
													session.removeAttribute("actionMsg");
													%>
												</tr>
											</c:if>
										</table>
									</td>
								</tr>
							</table>


							<div id="table-negotiations" align="center" >
								<table class="tabla-listados" style="width: 60%;"  >
									<thead>
										<tr  >
											<th colspan="7"><spring:message
													code="BzComposer.customer.opportunity" /></th>
										</tr>
									</thead>

									<tbody>
										

<tr>
											<td>  <spring:message code="BzComposer.customer.opportunityid" />
												
												 <td colspan="3"><form:input type="text"  readonly="true"  path="opportunityID"
													style="width:90%;" /></td>
											  </td>
											
									   </tr>
									    
										<tr>
											<td>  <spring:message code="BzComposer.customer.opportunity.name" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" />
												</span> 
												 <td colspan="3"><form:input type="text" path="name"
													style="width:90%;" /></td>
											  </td>
											
									   </tr>
								


										<tr>
											<td><spring:message
													code="BzComposer.customer.opportunity.stage" /></td>
											<td>
											<form:select path="stageName">
													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													<!--  form:options items="${VendorCategoryList}"
														itemValue="value" itemLabel="label" /-->
												</form:select >
											
											</td>
										</tr>
										<tr>
											<td><spring:message code="BzComposer.customer.opportunity.amount" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											 <td colspan="3"><form:input type="text" path="amount"
													style="width:90%;" /></td>

										</tr>

										<tr>
											<td><spring:message code="BzComposer.customer.opportunity.closeDate" /></td>
											<td><form:input type="text" path="closeDate"
													readonly="true" /> <img
												src="${pageContext.request.contextPath}/images/cal.gif"
												onclick="displayCalendar(document.OpportunityForm.closeDate,'mm-dd-yyyy',this);">
											</td>
											<td>&nbsp;</td>

										</tr>
									</tbody>
								</table>
							</div>
<div>
					<table cellpadding="0" cellspacing="0" border="0" align=center  style="width: 100%;margin-top:5px;">
				
				
				<tr>
					<td align="center">
						<button type="button" class="formbutton" title="New Customer" onclick="NewCustomer();"><spring:message code='BzComposer.global.new'/></button>
						<button type="button" class="formbutton" title="Save Customer" onclick="CheckMambership();"><spring:message code='BzComposer.global.update'/></button>
						<button type="button" class="formbutton" title="Close" onclick="CloseMe();"><spring:message code='BzComposer.global.close'/></button>
						<input type="hidden" name="stname" value="" id="stateId" />
					</td>
				</tr>
			</table>
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


