<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.nxsol.bizcomposer.common.TblVendorDetail"%>
<%@ page isELIgnored="false"%>
<%@page import="java.util.Currency"%>
<%-- <%@page import="jdk.nashorn.internal.runtime.linker.JavaAdapterFactory"%> --%>
<%@page import="javax.script.ScriptEngineManager"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>

<title><spring:message code="BzComposer.billpayabletitle" /></title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!--  Here Is the context path -->
<script>
	var ctx = "${pageContext.request.contextPath}";
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
div#pie { /* 	color:#05A9C5;; */
	padding: 10px 0px 20px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 4px solid rgb(207, 207, 207);
	margin: 10px 0px 10px 0px;
}
.scrollit {
    overflow:scroll;
    height:50vh;
}

table.tabla-listados thead tr th
 {
	font-size: .8em;
	text-align: left;
	padding: 5px 10px;
	/* 	background: rgba(5, 169, 197, 0.11); */
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	/* 	color: #333; */
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
	 position:sticky;
	 top:0;
}
table.tabla-listados tbody tr td {
	font-size: .8em;
	/* 	color: #666; */
	padding: 5px 0px 5px 14px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: 4px solid rgba(5, 169, 197, 0.2);
	vertical-align: top;
}

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	min-height: 500px;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}

#highlight 
{
	background-color: blue;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

</style>
</head>
<body onload="setWindowOnLoad()">
	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="LeadConvertForm" id="frmLeadConvert" method="post"
							modelAttribute="opportunityDto">
		<div class="content1 clearfix">
			<table style="width: 100%">
				 <tr align="center">
					<td align="left">
						<h2 class="title1">
							   <b>   
							  <spring:message
							   code="BzComposer.customer.opportunity.leadtoopportunity.conversion"/>	
							   </b>	  
							  </h2>
					</td>
				  </tr>
			  </table>
			</div>
		                           <div align="center" style="font-size:4px; ">												
														<table class="tabla-listados"   style="width:80%; apdding: 0; background:#f0f8ff" >
														<thead>
														<tr>
														
														<th>
														<div>
													  	<img style="margin: 5;"
														src="${pageContext.request.contextPath}/images/opportunityCompanyIcon.png" height='38' width='38'>
														<span>
														 <spring:message code="BzComposer.customer.account"/>
														 </span>
														 </div>
														</th>
														<th>
														<img style="margin: 5;"
														src="${pageContext.request.contextPath}/images/opportunityContactIcon.png" height='38' width='38'>
															<span>
														<spring:message code="BzComposer.customer.opportunity.contact"/>
														</span>
														</th>
														<th>
							                           <img style="margin: 5; 
							                           "src="${pageContext.request.contextPath}/images/oppotunityIcon.png" height='38' width='38'>
							                           <span>
			                           			         <spring:message code="BzComposer.customer.opportunity"/>
													    	</span>
													    	</th>
														</tr>
														</thead>
														 <tbody>
														 <tr>
														 <td rowspan="2" style= "border-color: #96D4D4;">
														 <b>
														 
													      Account Name:${opportunityDto.companyName} <br><br>
														     Address1 :${customerDetails.address1}    <br><br>
														      Address2:${customerDetails.address2}    <br><br>
														        Phone1:${companyDetails.phone1}      <br><br>
														       Website:${companyDetails.homePage}    <br><br>
														       
														 </b>
														 </td>
														 <td  rowspan="2" style= "border-color: #96D4D4;">
														  <b> Full Name:${opportunityDto.fullName}  <br><br>
														   Account Name:${opportunityDto.companyName}<br><br>
														       Address1:${customerDetails.address1}<br><br>
														       Address2:${customerDetails.address2}<br><br>
														   Phone Number:${customerDetails.cellPhone}<br></b>
														 </td>
														 <td  rowspan="2" style= "border-color: #96D4D4;">
														  
														 <b>				      
												      Opportunity Name:${opportunityDto.opportunityName}<br><br>
														  Account Name:${opportunityDto.companyName}<br><br>
														         stage:${opportunityDto.stage}<br><br>
														        Amount:${opportunityDto.amount}<br><br>
														   closed Date:${opportunityDto.closedDate}<br><br>
												      Opportunity owner:${opportunityDto.opportunityOwner}<br><br>
														 </b>
				
														 </td>
														 </tr>
														 </tbody>
											</table>    
	                      	<table style="width: 80%; apdding: 0;">		
														<tr align="right">
														<td >
												 <div>
													<input type="button" class="formbutton"
													onclick="goToLeads();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.Customer.opportunities.gotoLeads'/>" />
													
										         	</div>
														</td>
														</tr>
											</table>
			   <form:hidden path="clientVendorID" />
							</div>											
	</form:form>
	
	<script type="text/javascript">

	function setWindowOnLoad()
	 {
		 window.moveTo(350, 100);
		 window.resizeTo(900,600); 
	 }
	 function goToLeads()
	 { 

		
		 window.close();
		 location.reload();
		 
	 }
	
	 
</script>
</body>
</html>

<div id="showValidationDialog" title="Invalid Data !! " style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.validationMessage" />
	</p>
</div>
