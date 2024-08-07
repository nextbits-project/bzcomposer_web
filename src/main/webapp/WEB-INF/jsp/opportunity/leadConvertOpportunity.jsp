<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.nxsol.bizcomposer.common.TblVendorDetail"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border: 1px solid rgb(207, 207, 207);
	margin: 10px 0px 10px 0px;
}
.scrollit {
    overflow:scroll;
    height:50vh;
}

table.tabla-listados thead tr th {
	font-size: .7em;
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
	background: #fff;
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

#highlight {
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
	<form:form name="LeadConvertForm" id="LeadConvertForm" method="post"
							modelAttribute="opportunityDto">
		<div class="content1 clearfix">
			<table style="width: 100%">
				<tr align="center">

					<td align="left">
						<h1 class="title1">
							<b><spring:message
									code="BzComposer.customer.opportunity.leadtoopportunity" />
									</b>
						</h1>
					</td>
					
				</tr>
			</table>
			</div>
					<div align="center" style="background-color: #F1F1F1;">
					
														
														<table class="tabla-listados"   style="width:80%;; apdding: 0;" >
														
														 <tr>
														 <td>
														 
														 <b>
														<label id="account"> <spring:message code="BzComposer.customer.account"/>
														 </label>
														 
														 </b>
														 </td>
														 <td>
														  <input type="radio" id="accountRadio" name="accountRadio" value="1">

																
																	<b>
																	 <label for="accountRadio"> 
																	<spring:message code="BzComposer.customer.opportunity.createNew" />		
																	</label> </b>
														 <input type="text" class="form-control devCheck"
																				id="newCompanyName" />
														 </td>
														 
														 <td>
														 <label id="Or"> <spring:message code="BzComposer.customer.opportunity.or"/>
														 
														 </label>
														 
														 
														 </td>
														 
														 <td>
														 <input type="radio" id="existAccountRadio" name="accountRadio" value="2" checked>

																
																	<b>
																	 <label for="existAccountRadio"> 
																	<spring:message code="BzComposer.customer.opportunity.chooseeExisting" />		
																	</label> </b>
																	<form:input type="text" class="form-control devCheck" placeholder="Enter Account  Name"
																				path="companyName" />
														 
														 </td>
														 
														 </tr> 
														 		 <tr>
														 <td>
														 
														 <b>
														<label id="account"> <spring:message code="BzComposer.customer.opportunity.contact"/>
														 
														 </label>
														 
														 </b>
														 </td>
														 <td>
														  <input type="radio" id="contactRadio" name="contactRadio" placeholder="Enter Contact Full Name" value="1" >

																
																	<b>
																	 <label for="contactRadio"> 
																	<spring:message code="BzComposer.customer.opportunity.createNew" />		
																	</label> </b>
														 <input type="text" class="form-control devCheck"
																				id="newFullName" name="newFullName" />
														 </td>
														 
														 <td>
														 <label id="Or"> <spring:message code="BzComposer.customer.opportunity.or"/>
														 
														 </label>
														 
														 
														 </td>
														 
														 <td>
														 <input type="radio" id="existContactRadio" name="contactRadio" value="2" checked >

																
																	<b>
																	 <label for="existContactRadio"> 
																	<spring:message code="BzComposer.customer.opportunity.chooseeExisting" />		
																	</label> </b>
																	<form:input type="text" class="form-control devCheck" placeholder="Enter Contact Full Name"
																				path="fullName"/>
														 
														 </td>
														 
														 </tr> 
														 		 <tr>
														 <td>
														 
														 <b>
														<label id="account"> <spring:message code="BzComposer.customer.opportunity"/>
														 
														 </label>
														 
														 </b>
														 </td>
														 <td>
														  <input type="radio" id="opportunityRadio" name="opportunityRadio" value="1" checked  >

																	<b>
																	 <label for="opportunityRadio"> 
																	<spring:message code="BzComposer.customer.opportunity.createNew" />		
																	</label> </b>
																	<br>
											
																	<spring:message
																			code="BzComposer.customer.opportunityName" />	
																			
																			 <span
																		class="inputHighlighted"><spring:message
																				code="BzComposer.CompulsoryField.Validation" />
																				</span>
														                  	<form:input type="text" class="form-control devCheck"
																				path="opportunityName" />
														       </td>
														 
														 
														 
											<td><b>
											 <spring:message
													code="BzComposer.customer.opportunity.owner" />
													</b></td>
											<td>
											 <span
																		class="inputHighlighted"><spring:message
																				code="BzComposer.CompulsoryField.Validation" />
												</span>
											<form:select path="opportunityOwner">
											
													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													
							
														
														<form:options items="${opportunityOwnerList}" itemValue="name"
																	itemLabel="name" />
													</form:select>
											
											</td>
										</tr>
														</table>
												<table style="width: 80%; apdding: 0;">
														
														<tr align="right">
														<td >
														 <div>
											
												
												<input type="button" class="formbutton"
													onclick="manageCustomer('DELETE');"
													style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.cancel'/>" />
													<input type="button" class="formbutton"
													onclick="convert();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.convert'/>" />
										         	</div>
														</td>
														</tr>
											</table>
											<input type="hidden" id="tabid" name="tabid" value="" />
											<form:hidden path="clientVendorID" />
											<form:hidden path="sourceID"/>
											<form:hidden path="companyID" />
											</div>
	</form:form>
	<script type="text/javascript">
	 $(document).ready(function(){
		// window.moveTo(350, 100);
		 //window.resizeTo(900,600);
		 
	        $("input[type='button']").click(function()
	       {
	        	var radioValue = $("input[name='opportunityRadio']:checked").val();
	        });
	        
	        $("input[type='button']").click(function(){
	        	var radioValue = $("input[name='accountRadio']:checked").val();
	        	 if(radioValue=="1")
	        	document.LeadConvertForm.companyName.value=document.getElementById("newCompanyName").value;
	        });
	        
	 
	        $("input[type='button']").click(function()
	        		{
	        	var radioValue = $("input[name='contactRadio']:checked").val();
	        	 if(radioValue=="1")
	        	document.LeadConvertForm.fullName.value=document.getElementById("newFullName").value;
	          });
	    });
       	
	 function setWindowOnLoad()
	 {
		  window.moveTo(350, 100);
		  window.resizeTo(900,600); 
		  
		  
	 }
	 
	 function convert()
	 {
		var OpprtunityName=document.LeadConvertForm.opportunityName.value;
		
		
		if(OpprtunityName=="")
			{
			 $("#showValidationDialog").dialog({
		            resizable: false,
		            height: 150,
		            width:400,
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
		else
			{
          
			//var clientVendorID=document.LeadConvertForm.clientVendorID.value; 
     // window.open("leadToOpportunity?tabid=conversion", null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");
           document.forms["LeadConvertForm"].action = "leadToOpportunity?tabid=conversion";
           document.forms["LeadConvertForm"].submit();
          // window.close();
			}
	 }

</script>
</body>
</html>

<div id="showValidationDialog" title="Invalid Data !! " style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.validationMessage" />
	</p>
</div>
