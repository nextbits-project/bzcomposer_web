<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<%@page import="java.util.Currency"%>
<%-- <%@page import="jdk.nashorn.internal.runtime.linker.JavaAdapterFactory"%> --%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPayment"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblAccount"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPaymentType"%>
<%@page import="com.nxsol.bizcomposer.global.clientvendor.ClientVendor"%>
<%@page import="com.nxsol.bizcomposer.common.JProjectUtil"%>
<%@page import="java.util.Date"%>
<%@page import="com.nxsol.bizcompser.global.table.TblCategory"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.ReceivableListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<title><bean:message key="BzComposer.accountreceivabletitle"/></title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!--  Here Is the context path -->
 <script>var ctx = "${pageContext.request.contextPath}";</script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
div#pie { /* 	color:#05A9C5;; */
	padding: 10px 0px 20px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
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
}

table.tabla-listados tbody tr td {
	font-size: .8em;
	/* 	color: #666; */
	padding: 5px 0px 5px 14px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: #fff;
	vertical-align: top;
}
#highlight {
 		background-color: blue; 
	 }
.highlight { background-color: #00CED1 !important;color: #fff }	 
</style>
</head>
<body>
<% int find = 0; %>
<div id="ddcolortabsline">&nbsp;</div>
 <html:form action="AccountReceiveble" method="post" styleId="receivableForm">  						
	<div class="content1 clearfix">
		<h3 class="title1">
			<bean:message key="BzComposer.accountreceivable.accountreceivabletitle"/>
		</h3>
		 <% ReceivableListBean receivablelistbean=(ReceivableListBean)request.getAttribute("Selectedrow");
		 	TblPaymentType payment = (TblPaymentType)request.getAttribute("SelectedPayment");
		 	TblAccount Selectedaccount = (TblAccount)request.getAttribute("SelectedAccount");
		 	TblCategory SelectedCategory = (TblCategory)request.getAttribute("SelectedCategory");
		 	TblPayment SelcetedPaymentForCheck = (TblPayment)request.getAttribute("Payment");
		 	/* System.out.println(request.getSession().getAttribute("checkNum")); */
		 	/* int find = 0; */
		 	
		 	/* if(request.getSession().getAttribute("indexNumber") != null)
		 	{
		 	  find = Integer.parseInt(request.getSession().getAttribute("indexNumber").toString()); 
		 	  System.out.println(find);
		 	} */
		 	if(request.getSession().getAttribute("invoiceId") != null)
		 	{
		 		find = Integer.parseInt(request.getSession().getAttribute("invoiceId").toString());
		 	}
		 %>
		<div class="border1  clearfix">
			<form>
				<div class="row">
					<div class="col-md-4">
						<label><bean:message key="BzComposer.accountreceivable.ordernumber"/>:</label>
						<label id="ordernumber"></label>
						<div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.customer"/>
							</label>
							<div class="col-md-8">
								<select class="form-control devCutNameDrp" id="customerName" >
								<%
									ArrayList<ClientVendor> cv = (ArrayList)request.getAttribute("ClineVendorForCombo");
								/* 	Iterator<ClientVendor> itr1 = cv.iterator(); */
									for(int i=0;i<cv.size();i++)
									{
								%>  
                               		<option value=<%=cv.get(i).getCvID() %>><% out.println(cv.get(i).getName()+"("+cv.get(i).getFirstName()+" "+cv.get(i).getLastName()+")"); %></option>			            	 
								<% } %>	
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.receivedtype"/>
							</label>
							<div class="col-md-8">
								<select class="form-control devReceivedTypeDrp" id="receivedType" onclick="checkType()">
								<%-- <%if(payment!=null) 
								{ %>
								 <option selected="selected"><% out.println(payment.getTypeName()); } else{ %> --%>
								<%	
								ArrayList<TblPaymentType> payType = (ArrayList)request.getAttribute("PaymentTypeForCombo");
								/* Iterator<TblPaymentType> itr3 = payType.iterator(); */
								for(int i=0;i<payType.size();i++)
								{
								%>
									<option value=<%= payType.get(i).getId() %> id="<%= payType.get(i).getId()%>"><%  out.println(payType.get(i).getTypeName()); %></option>
							<%  } 
								%>	
								</select>
							</div>
						</div>
						 <div class="form-group row">
						<label class="col-md-4  col-form-label">
							<bean:message key="BzComposer.accountreceivable.amount"/>
						</label>
				    
				    	<div class="col-md-8">	
				    	<div class="input-group">
							<div class="input-group-prepend">
							 <span class="input-group-text" id="basic-addon1">$</span>
							 </div>
								<label  style="padding-left: 10px" id="devAmount" class="form-control"></label>
								</div>
						</div>
						</div>
						 <div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.receivedamount"/>
							</label>
							 
					<div class="col-md-8">
						<div class="input-group">
							<div class="input-group-prepend">
							 <span class="input-group-text" id="basic-addon1">$</span>
							  </div>
							<input type="text" class="form-control devReceiveAmount" value="" width="20px" id="receivedAmount">
							</div>
					</div>
						</div> 
			
					<%-- <% if(SelcetedPaymentForCheck != null) {%>
					<script>
					  var data = document.getElementById("Check");
					  data.style.display = "none";
					</script>
						<div class="form-group row" id="Check">
							<label class="col-md-5  col-form-label">Check #</label>
							<div class="col-md-7">
							<% if(SelcetedPaymentForCheck!=null) {%>
							    
								<input type="text" class="form-control" value="<%=SelcetedPaymentForCheck.getCheckNumber() %>" id="checkNum">
							<% } else {%>
								<input type="text" class="form-control" id="checkNum">
								<% } %>
							</div>
						</div>
						<% } %> --%>
				<script>
					  var data = document.getElementById("Check");
					  data.style.display = "none";
				</script>
				<div class="form-group row" id="Check">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.checknumber"/>
							</label>
							<div class="col-md-8">
							<input type="text" class="form-control devCheck" id="checkNum" name="checkNum">
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<label>&nbsp;</label>
						<div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.orderdate"/>
							</label>
						   <%--  <html:text property="orderDate" readonly="false"></html:text>  --%>
						    <div class="col-md-8 calendar-img"><input type="text" class="form-control devOrderDate" value="" style="width: 275px" name="orderDate" readonly="true" id="orderDate">
							<img
								src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" class="img-fluid" alt="Responsive image"
								onclick="displayCalendar(document.ReceivableListForm.orderDate,'mm-dd-yyyy',this);">
							</div>   
							
						</div>
						
						<div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.depositto"/>
							</label>
							<div class="col-md-8">
								<select class="form-control devDeposittypeDrp" id="depositId">
									
								<% ArrayList<TblAccount> account = (ArrayList)request.getAttribute("AccountForCombo");
									for(int i=0;i<account.size();i++)
									{
								%>	
									<option value="<%= account.get(i).getAccountID()%>" id="<%= account.get(i).getAccountID()%>"><% out.println(account.get(i).getName());  %></option>
								<%  } %>	
								
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.category"/>
							</label>
							<div class="col-md-8">
								<select class="form-control devCategoryDrp" size="1" id="categoryId">
								<%
									ArrayList<TblCategory> category = (ArrayList)request.getAttribute("CategoryCombo");
							/* 		Iterator<TblCategory> itr2 = category.iterator(); */
									for(int i=0;i<category.size();i++)
									{
								%>
								<option value="<%= category.get(i).getId() %>" id="<%= category.get(i).getId() %>"><% out.println(category.get(i).getName() + " " +category.get(i).getCategoryNumber()); %></option>	
								 <%} %>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-4  col-form-label">
								<bean:message key="BzComposer.accountreceivable.paymentstatus"/>
							</label>
							<div class="col-md-8">
								<select class="form-control paymentOP" size="1" id="payStatus">
									<option><bean:message key="BzComposer.accountreceivable.unpaid"/></option>
									<option><bean:message key="BzComposer.accountreceivable.paid"/></option>
									<option><bean:message key="BzComposer.accountreceivable.layaway"/></option>
								</select>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-md-4  col-form-label"><bean:message key="BzComposer.global.memo"/></label>
							<div class="col-md-8">
								<input type="text" class="form-control devMemotext" id="memo">
							</div>
						</div>
					</div>
					<div class="col-md-4">
					<%-- <% if(receivablelistbean == null) {%>
						<div class="form-group">
								<button class="btn btn-info btn1" onclick="return save(null,null)">Save</button>
							</div>
						<%} else {%>
							<div class="form-group">
								<button class="btn btn-info btn1" onclick="return save(<%= receivablelistbean.getOrderNum()%>,<%= receivablelistbean.getPaidAmount()+receivablelistbean.getBalance()%>)">Save</button>
							</div>
						<% } %>  --%>
						 <div class="form-group">
								<button class="btn btn-info btn2" onclick="return save()">
									<bean:message key="BzComposer.global.save"/>
								</button>
							</div>  
						<div class="form-group">
							<button class="btn btn-info btn1" onclick="return clearTransaction()">
								<bean:message key="BzComposer.accountreceivable.cleartransactionbtn"/>
							</button>
						</div> 
					</div>
				</div>
			</form>
		</div>
				
		<div class="content-tabs">
			<nav>
			   <div class="nav nav-tabs" id="tabId" role="tablist">
			    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" 
			    aria-controls="nav-home" aria-selected="true">
			    	<bean:message key="BzComposer.accountreceivable.tabs.receivablelist"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" 
			    aria-controls="nav-profile" aria-selected="false" onclick="overDueTab()">
			    	<bean:message key="BzComposer.accountreceivable.tabs.overdue"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" 
			    aria-controls="nav-contact" aria-selected="false" onclick="cancelledTab()">
			    	<bean:message key="BzComposer.accountreceivable.tabs.cancelled"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" 
			    aria-controls="nav-contact" aria-selected="false">
			    	<bean:message key="BzComposer.accountreceivable.tabs.vendorrma"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" 
			    aria-controls="nav-contact" aria-selected="false" onclick="layawaysTab()">
			    	<bean:message key="BzComposer.accountreceivable.tabs.layaways"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" 
			    aria-controls="nav-contact" aria-selected="false" onclick="receivedTab()">
			    	<bean:message key="BzComposer.accountreceivable.tabs.received"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" 
			    aria-controls="nav-contact" aria-selected="false">
			    	<bean:message key="BzComposer.accountreceivable.tabs.esales"/>
		    	</a>
			  </div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
			  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
				
				<!-- <div class="filterbar">
				
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  <label class="form-check-label" for="inlineCheckbox1">Show All</label>
						</div>
					
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
					  <label class="form-check-label" for="inlineRadio1">Invoice Order</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Unpaid Opening Balance</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option2">
					  <label class="form-check-label" for="inlineRadio3">Unpaid Credit Amount</label>
					</div>
				</div> -->
				<div class="filterbar" onclick="selectedRadio()">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  <label class="form-check-label" for="inlineCheckbox1">
						  		<bean:message key="BzComposer.accountreceivable.showall"/> 
					  		</label>
						</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdoInvoiceOrder" value="option1" checked="checked">
					  <label class="form-check-label" for="inlineRadio1">
							<bean:message key="BzComposer.accountreceivable.invoiceorder"/> 
						</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdoUnpaidOpeningBalance" value="option2">
					  	<label class="form-check-label" for="inlineRadio2">
							<bean:message key="BzComposer.accountreceivable.unpaidopeningbalance"/>
						</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdoUnpaidCreditAmount" value="option2">
					  	<label class="form-check-label" for="inlineRadio3">
							<bean:message key="BzComposer.accountreceivable.unpaidcreditamount"/>
						</label>
					</div>
				</div>
				<div class="table1" id="tblForInvoiceOrder">
				<table class="table table-bordered table-sm devAcRecDataTbl">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col" ><bean:message key="BzComposer.accountreceivable.select"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.ordernumber"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.companyname"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.customername"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.orderdate"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.global.term"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.duedate"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.amount"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.received"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.balance"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.lineofcredit"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.availablecredit"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.category"/></th>
				      <th scope="col"><bean:message key="BzComposer.global.memo"/></th>
				      <th scope="col"><bean:message key="BzComposer.accountreceivable.consigned"/></th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  	ArrayList<ReceivableListBean> li = (ArrayList)request.getAttribute("ReceivableList");		
				  	Iterator<ReceivableListBean> itr =li.iterator();
							  int index=1;
				  	while(itr.hasNext())
				  	{
				  		ReceivableListBean rb = itr.next();

				  %>
				    <tr onclick="selectrow(<%=rb.getInvoiceID()+","+index%>)">
				      <td class="text-right"><input type="checkbox" id="Checkbox"></td>
				      <td class="text-right" ><% out.println(rb.getOrderNum()); %></td>
				      <td class="text-right"><% out.println(rb.getCompanyName()); %></td>
				      <td value="<%=rb.getCvID() %>" class="text-right"><% out.println(rb.getCvName()); %></td>
				      <td class="text-right"><% out.println(JProjectUtil.dateFormat.format(rb.getDateAdded())); %></td>
				      <td class="text-right"><% out.println(rb.getTblterm()); %></td>
				      <td class="text-right"><% out.println(JProjectUtil.dateFormat.format(rb.getDateAdded())); %></td>
				      <td class="text-right"><% out.println(rb.getAdjustedTotal()); %></td>
				      <td class="text-right"><% out.println(rb.getPaidAmount()); %></td>
				      <td class="text-right"><% out.println(rb.getBalance()); %></td>
				      <td class="text-right"><% out.println(rb.getCustomercreditline());%></td>
				      <td class="text-right"><% out.println(rb.getRemainingcreditamount()); %></td>
				      <td class="text-right" value=<%=rb.getCategoryID() %>><% out.println(rb.getTblcategory()); %></td>
				      <td class="text-right"><% out.println(rb.getMemo()); %></td>
				      <td hidden="PaymentTypeID" value="<%=rb.getPaymentTypeID()%>"></td>
				      <td hidden="BankAccountId" value="<%=rb.getBankAccountID()%>"></td>
				         <% if(find == rb.getInvoiceID()) {%>
				      <td hidden="CheckNumberID" value=<%= request.getSession().getAttribute("checkNum"+rb.getInvoiceID())%>></td>
				      <% } else {%>
				        <td hidden="CheckNumberID" value=<%= request.getSession().getAttribute("checkNum"+rb.getInvoiceID())%>></td>
				        <% }%>
				        <% if(find == rb.getInvoiceID()) {%>
				        <td hidden="amtToPayID" value=<%= request.getSession().getAttribute("amtToPay"+rb.getInvoiceID())%>></td>
				        <% } else {%>
				        <td hidden="amtToPayID" value=<%= request.getSession().getAttribute("amtToPay"+rb.getInvoiceID())%>></td>
				        <% }%> 
				        <% if(find == rb.getInvoiceID()) {%>
				        <td hidden="totalId" value=<%= request.getSession().getAttribute("totalPayable"+rb.getInvoiceID())%>></td>
				        <% } else {%>
				        <td hidden="totalId" value=<%= request.getSession().getAttribute("totalPayable"+rb.getInvoiceID())%>></td>
				        <% }%> 
				      <td><input type="checkbox"></td>
				      
				    </tr>
			<%
			index++;
				  	}
			%>	    
		</tbody>	
	</table>
	</div>
	
	<div class="table1" id="tblForUnpaidOpeningBalance">
				<table class="table table-bordered table-sm">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.select"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.companyname"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.customername"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.dateadded"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.depositto"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.receivedtype"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.checknumber"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.receivable"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.amount"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.category"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.global.memo"/></th>
				    </tr>
				  </thead>
				  <tbody>
				  <% ArrayList<ReceivableListBean> list = (ArrayList)request.getAttribute("listForUnpaidOpeningBal");
						Iterator<ReceivableListBean> itrunpaid =list.iterator();
						while(itrunpaid.hasNext())
					  	{
					  		ReceivableListBean rb1 = itrunpaid.next();
					%>
				    <tr>
				      <td><input type="checkbox"></td>
				      <td class="text-right"><% out.println(rb1.getCompanyName()); %></td>
				      <td class="text-right"><% out.println(rb1.getCvName()); %></td>
				      <td class="text-right"><% out.println(rb1.getDateAdded()); %></td>
				      <td class="text-right"></td>
				      <td class="text-right"></td>
				      <td class="text-right"></td>
				      <td class="text-right"><% out.println(rb1.getBalance()); %></td>
				      <td class="text-right"><% out.println(rb1.getAdjustedTotal()); %></td>
				      <td class="text-right"></td>
				      <td class="text-right"><% out.println(rb1.getMemo()); %></td>
				    </tr>
				    <% }%>
				</table>
	</div>
	 <div class="table1" id="tblForUnpaidCreditAmount">
				<table class="table table-bordered table-sm">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.select"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.companyname"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.customername"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.dateadded"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.global.term"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.duedate"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.depositto"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.receivedtype"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.checknumber"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.receivable"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.lineofcredit"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.creditamount"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.remainingcredit"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.category"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.global.memo"/></th>
				      <th scope="col" class="text-right"><bean:message key="BzComposer.accountreceivable.iscreditused"/></th>
				    </tr>
				  </thead>
				  <tbody>
				  <% ArrayList<ReceivableListBean> listforUnpaidCredit = (ArrayList)request.getAttribute("listForUnpaidCreditAmount");
						Iterator<ReceivableListBean> itrunpaidCredit = listforUnpaidCredit.iterator();
						while(itrunpaidCredit.hasNext())
					  	{
					  		ReceivableListBean rb2 = itrunpaidCredit.next();
					%>
				    <tr>
				      <td><input type="checkbox"></td>
				      <td class="text-right"><% out.println(rb2.getCompanyName()); %></td>
				      <td class="text-right"><% out.println(rb2.getCvName()); %></td>
				      <td class="text-right"><% out.println(rb2.getDateAdded()); %></td>
				      <td class="text-right"></td>
				      <td class="text-right"></td>
				      <td class="text-right"></td>
				      <td class="text-right"><% out.println(rb2.getBalance()); %></td>
				      <td class="text-right"><% out.println(rb2.getAdjustedTotal()); %></td>
				      <td class="text-right"></td>
				      <td class="text-right"><% out.println(rb2.getCustomercreditline()); %></td>
				      <td class="text-right"><% out.println(rb2.getTotalCreditAmount()); %></td>
				      <td class="text-right"><% out.println(rb2.getRemainingcreditamount()); %></td>
				      <td class="text-right"></td>
				      <td class="text-right"><% out.println(rb2.getMemo()); %></td>
				      <td class="text-right"></td>
				    </tr>
				    <% }%>
				</table>
	</div> 
				<div class="footer1">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option1">
						  	<label class="form-check-label" for="inlineCheckbox2">
						  		<bean:message key="BzComposer.accountreceivable.showall"/>
					  		</label>
						</div>
						<button class="btn btn-info btn1" onclick="billingInfo()">
							<bean:message key="BzComposer.accountreceivable.billing"/>
						</button>
						<button class="btn btn-info btn1" onclick="popUp()">
							<bean:message key="BzComposer.accountreceivable.discountandcreditbtn"/>
						</button>
						<button class="btn btn-info btn1">
							<bean:message key="BzComposer.accountreceivable.paymenttobtn"/>
						</button>
						<button class="btn btn-info btn1" onclick="return received()">
							<bean:message key="BzComposer.accountreceivable.received"/>
						</button>
				  </div>
				</div>
			  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
			  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
			</div>
		</div>
	</div>			
 </html:form>                                
<script type="text/javascript">
	var indexNumber = -1;
	var amtToPay = -1;
	var invoiceId = -1;
   function selectrow(invoice,index) {
	    debugger;
	    this.indexNumber = index;
	    this.invoiceId = invoice;
	    var count = 1;
	    var matchFind = <%= request.getSession().getAttribute("indexNumber")%>;
	   	$("#checkNum").val(''); 
	    $("#ordernumber").text($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(2)').text());
	    $("select.devCutNameDrp").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(4)').attr('value'));
	    var amountString = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(8)').text();
	    var balanceString  = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(10)').text();
	    var amount = parseInt(amountString);
	    var balance = parseInt(balanceString);
	    $("#devAmount").text($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(8)').text());
	    $(".devReceiveAmount").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(10)').text()); 
	    $("select.devCategoryDrp").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(13)').attr('value'));
	    if($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(15)').attr('value') == '192' || $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(15)').attr('value') == '1')
	    {
	    		$("#Check").show();
	    }
	    else
	    {
	    		$("#Check").hide();
	    }
	    $("select.devReceivedTypeDrp").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(15)').attr('value'));
	    $("select.devDeposittypeDrp").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(16)').attr('value'));
	    $(".devOrderDate").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(7)').text());
	    $(".devMemotext").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(14)').text());
	    
		if($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(17)').attr('value') != 'null')
		{
	 		$(".devCheck").val($('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(17)').attr('value'));
		}	
   }  
   function save()
   {
	   debugger;	
	   var receivedAmount;
	    var adjustTotal = document.getElementById("devAmount").innerHTML;
		receivedAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(9)').text();
		if(parseFloat(receivedAmount) == 0.0)
			{
				receivedAmount=document.getElementById("receivedAmount").value;
				if(parseFloat(receivedAmount) > parseFloat(adjustTotal))
					{
						//alert("<bean:message key='BzComposer.accountreceivable.recivedamountisnotgreaterthanamount'/>");
						return showreceiveddialog();
				   		return false;
					}
			}
		else{
				receivedAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(9)').text();
				var balance = document.getElementById("receivedAmount").value;
				if(parseFloat(receivedAmount)+parseFloat(balance) > parseFloat(adjustTotal) )
				   {
						//alert("<bean:message key='BzComposer.accountreceivable.recivedamountisnotgreaterthanamount'/>");
						return showreceiveddialog();
				   		return false;
				   }
		}
		this.amtToPay = document.getElementById("receivedAmount").value; 
	   var ReceivableListBean={
			   "orderNum":document.getElementById("ordernumber").innerHTML,
			   "cvID":document.getElementById("customerName").value,
			   "paymentTypeID":document.getElementById("receivedType").value,	   
			   "bankAccountID":document.getElementById("depositId").value,
			   "adjustedTotal": document.getElementById("devAmount").innerHTML,
			   "balance":document.getElementById("receivedAmount").value,
			   "amtToPay":amtToPay,
			   "categoryID":document.getElementById("categoryId").value,
			   "memo":document.getElementById("memo").value,
			   "checkNum":document.getElementById("checkNum").value,
	   }
    sendMyValue(ReceivableListBean);
  	}
   function sendMyValue(ReceivableListBean) {
		debugger;
		var obj=JSON.stringify(ReceivableListBean);
		/* alert(indexNumber); */
   	 $.ajax({
		
			type : "POST",
			url : "AccountReceiveble.do?tabid=UpdateRecord",
			data : "row=" + obj + "&invoiceId="+invoiceId,
		    success : function(data) {
				debugger;
				updateAccountReceivableTab(data);  
			 /*  window.location = "${pageContext.request.contextPath}/AccountReceiveble.do?tabid=AccountReceiveble"; */  
			
			},
			 error : function(data) {
				//alert("<bean:message key='BzComposer.accountreceivable.erroroccurred'/>");
				return showerrordialog();
			} 
		});
   	$(document.forms[0]).submit(function( event ) {
	    event.preventDefault();
	});
	} 
   function setInvoice(index)
   {
	   $.ajax({
			type : "POST",
			url : "AccountReceiveble.do?tabid=selectrow&ordernum="+index,
			data : "row=" +index, 			
			success : function(data,status) {
				/* alert("Hello"); */
				window.location= "${pageContext.request.contextPath}/AccountReceiveble.do?tabid=selectrow&ordernum="+index;
			},
			 error : function(data) {
				 //alert("<bean:message key='BzComposer.accountreceivable.erroroccurred'/>");
				 return showerrordialog();
			} 
		});
   }
   function checkType()
   {
	 	debugger;
	   var type = document.getElementById("receivedType");
	   var ctype = type.options[type.selectedIndex].innerText;
	   if(ctype == 'Cash')
		   {
		   		document.getElementById("Check").style.display = "none";
		   }
	   else if(ctype == 'Check')
		   {
		   		
		   		$("#Check").show();
		   	} 
	    else
		{ 
	    		$("#Check").hide();
	    } 
   }
   function selectedRadio()
   {
	 debugger;
	   if(document.getElementById("rdoUnpaidOpeningBalance").checked)
		   {
		   		$("#tblForInvoiceOrder").hide();
	   			$("#tblForUnpaidOpeningBalance").show();
	   			$("#tblForUnpaidCreditAmount").hide();
		   }
	   else if(document.getElementById("rdoUnpaidCreditAmount").checked)
		   {
				   	$("#tblForInvoiceOrder").hide();
		  			$("#tblForUnpaidOpeningBalance").hide();
		  			$("#tblForUnpaidCreditAmount").show();
		   }
	   else
		   {
		   			$("#tblForInvoiceOrder").show();
		   			$("#tblForUnpaidOpeningBalance").hide();
		   			$("#tblForUnpaidCreditAmount").hide();
		   }
   }
   function dayName(date) {
	 
       var days = new Array(31);
       var j = 0;
       var d  = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
       for(var i=0;i<=31;i++)
    	   {
    	   		days[i] = d[j];
    	   		j++;
    	   		if(j == 7)
    	   			{
    	   				j = 0;
    	   			}
    	   }
        var d = days[date];
     	return d;
   }
   function received()
   {
		debugger;
	   var receivedAmountString = 0.0;
	   var type = document.getElementById("receivedType");
	   var ctype = type.options[type.selectedIndex].label;
	   var paymentTypeIdString = type.options[type.selectedIndex].id;
	   var paymentTypeId = parseInt(paymentTypeIdString);
	   if(ctype == 'Check')
	   {
	   var checkNo = document.getElementById("checkNum").value;
	   	if(checkNo == '0' || checkNo == '')
		{
			//alert("<bean:message key='BzComposer.accountreceivable.entervalidchecknumber'/>");
			return entervalidchecknumberdialog();
			return false;
		}
	   }
	   var memo = document.getElementById("memo").value;
	   var depositBank = document.getElementById("depositId");
	   var selectedBank = depositBank.options[depositBank.selectedIndex].innerText;
	   var accountId = depositBank.options[depositBank.selectedIndex].id;
	   var category = document.getElementById("categoryId");
	   var customer = document.getElementById("customerName");
	   var selectedCustomer = customer.options[customer.selectedIndex].value;
	   var selectedCategoryString = category.options[category.selectedIndex].value;
	   var categoryId = parseInt(selectedCategoryString);
	   var amountString = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(8)').text();
	   var balaceString = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(10)').text();
	    var amount = parseFloat(amountString);
	   var balance = parseInt(balaceString); 
	   <%-- var receivedAmount = <%= request.getSession().getAttribute("amtToPay")%>; --%>
	     var receivedAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(18)').attr('value');  
	   /*   var total = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(19)').attr('value'); */
	    /* var receivedAmountInt = parseInt(receivedAmount);
	    var totalInt = parseInt(total);  */
	    
	   /*  if(receivedAmountInt > totalInt)
	    	{
	    		
	    	  	receivedAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(10)').attr('value');
	    	}
	    else
	    	{
	    		 receivedAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(18)').attr('value');
	    	} */
	   if(amount == balance)
		   {
		  		 receivedAmountString =  $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(10)').text();
		   }
	   else
		   {
		  		 receivedAmountString = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(9)').text();
		   }
	   
	  /*  	var receivedAmount = parseInt(receivedAmountString); */   
	 /*   var orderNum = $('table.devAcRecDataTbl tbody tr:nth-child('+indexNumber+')').find('td:nth-child(2)').text(); */
	   var ReceivableListBean={
			   "orderNum":document.getElementById("ordernumber").innerHTML,
			   "cvID":selectedCustomer,
			   "paymentTypeID":paymentTypeId,	   
			   "bankAccountID":accountId,
			   "adjustedTotal":amountString,	
			   "paidAmount":receivedAmount,
			   "balance":balance,
			   "categoryID":categoryId,
			   "memo":memo,
			   "checkNum":checkNo,
	   };
	   var obj=JSON.stringify(ReceivableListBean);
	   $.ajax({
			type : "POST",
			url : "AccountReceiveble.do?tabid=ReceivedInvoice",
				data :"row=" + obj + "&index="+indexNumber,
		    success : function(data) {
			updateAccountReceivableTab(data);	
			},
			 error : function(data) {
				 //alert("<bean:message key='BzComposer.accountreceivable.erroroccurred'/>");
				 return showerrordialog();
			} 
		});
  	$(document.forms[0]).submit(function( event ) {
	    event.preventDefault();
	});
	   return false;
	   
   }
   $(document).ready(function(){
		debugger;
		var day = new Date().getDay();
		var dName = dayName(day);
	   $("#tblForUnpaidOpeningBalance").hide();
	   $("#tblForUnpaidCreditAmount").hide();
	   $("#orderDate").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
	   var type = document.getElementById("receivedType");
	   var ctype = type.options[type.selectedIndex].innerText;
	   if(ctype != 'Check')
		   {
		  		 $("#Check").hide();
		   }
});
  function popUp()
   {
	   window.open();
   }
   function clearTransaction()
   {
	   var answer;
	   debugger;
	  /*  alert(indexNumber);
	   alert(invoiceId); */
	   if(parseInt(invoiceId) <= 0)
		   {
		   		//alert("<bean:message key='BzComposer.accountreceivable.selecttransaction'/>");
		   		return selecttranactiondialog();
		   		return false;
		   }
	   else
	   {
		  /* answer = window.confirm("<bean:message key='BzComposer.accountreceivable.cleartransaction'/>");
		  if(answer != true)
			  {
			  		return false;
			  } */
		   debugger;
			event.preventDefault();
			$("#showcleartransactiondialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			        	"<bean:message key='BzComposer.global.ok'/>": function () {
			            	
			            },
			            "<bean:message key='BzComposer.global.cancel'/>": function () {
			                $(this).dialog("close");
			                return false;
			            }
			        }
			    });
			    return false;
		  
	   }
	   var invId = invoiceId; 
	   $.ajax({
			type : "POST",
			url : "AccountReceiveble.do?tabid=ClearTransaction",
			data :"invoiceId=" + invId,
		    success : function(data) {
				/* var html = "" + data.msg; */
				updateAccountReceivableTab(data);
				/* window.location = "${pageContext.request.contextPath}/AccountReceiveble.do?tabid=AccountReceiveble"; */
			},
			 error : function(data) {
				 //alert("<bean:message key='BzComposer.accountreceivable.erroroccurred'/>");
				 return showerrordialog();
			} 
		});
		$(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
   }
   function cancelledTab()
   {
	   debugger;
	   window.location = "${pageContext.request.contextPath}/CancelledTab.do?tabid=canCelledTab"; 
   }
   function receivedTab()
   {
		window.location = "${pageContext.request.contextPath}/ReceivedTab.do?tabid=receivedTab";
   }
   function overDueTab()
   {
	   window.location = "${pageContext.request.contextPath}/OverDueTab.do?tabid=overDueTab";
   }
   function billingInfo()
   {
	   debugger;
	   var h = window.screen.height;
	   var w = window.screen.width;
	   
	   var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
	   var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;
	   
	   var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	   var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	    
	   var left = (screen.width/2) - (w / 2);
	   var top = (screen.height/2) - (h / 2);
	    
	   /* window.open("BillingInfo.do?tabid=showBilling","Billing ","scrollbars=yes,width="+w/2+",height="+h/2+",top=150,left="+(left+300)+",status=yes,toolbar=no,menubar=no,location=no," ); */
	   window.open("BillingInfo.do?tabid=showBilling","Billing ","scrollbars=yes,width="+w/2+",height="+h/2+",top=150,left="+(left+300)+",status=yes,toolbar=no,menubar=no,location=no," );
	   
	   $(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
   }
   function checkPaymentStatus()
   {
	   debugger;
	   //alert("here");
	  	/* var pay = document.getElementById("payStatus");
	  	vat option = pay.options[pay.selectedIndex].value; */
	   $(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
   }
   $( ".paymentOP" ).change(function() {
	debugger;
	var pay = document.getElementById("payStatus");
	var payment = pay.options[pay.selectedIndex].value; 
	if(payment == 'Layaway')
	{
		/* var option = window.confirm("<bean:message key='BzComposer.accountreceivable.savelayawaysinvoice'/>")
		if(option != true)
		{
			return;
		}
		$.ajax({
			type : "POST",
			url : "AccountReceiveble.do?tabid=layaway",
			data :"invoiceId=" + invoiceId,
			success : function(data) {
				//var html = "" + data.msg;
				updateAccountReceivableTab(data);
				//window.location = "${pageContext.request.contextPath}/AccountReceiveble.do?tabid=AccountReceiveble";
			},
			error : function(data) {
				//alert("<bean:message key='BzComposer.accountreceivable.erroroccurred'/>");
				return showerrordialog(); 
			} 
		});*/
		event.preventDefault();
		$("#savelayawaysinvoicedialod").dialog({
		    resizable: false,
		    height: 200,
		    width: 500,
		    modal: true,
			buttons: {
		        "<bean:message key='BzComposer.global.ok'/>": function () {
		           	//$('form').submit();
		        },
				"<bean:message key='BzComposer.global.cancel'/>": function () {
		            $(this).dialog("close");
		        	return false;
		    	}
			}
		});
		$.ajax({
			type : "POST",
			url : "AccountReceiveble.do?tabid=layaway",
			data :"invoiceId=" + invoiceId,
			success : function(data) {
				//var html = "" + data.msg;
				updateAccountReceivableTab(data);
				//window.location = "${pageContext.request.contextPath}/AccountReceiveble.do?tabid=AccountReceiveble";
			},
			error : function(data) {
				//alert("<bean:message key='BzComposer.accountreceivable.erroroccurred'/>");
				return showerrordialog(); 
			} 
		});
	}
});
    $(document).ready(function () {
	    $('tr').click(function () {
	         var selected = $(this).hasClass("highlight"); 
	         $("tr").removeClass("highlight");
	         if(!selected)
	             $(this).addClass("highlight");
	    });
	}); 
   function layawaysTab()
   {
	  window.location = "${pageContext.request.contextPath}/Layaway.do?tabid=layawayTab";
   }
   function addCss()
   {
	   $(document).ready(function () {
		    $('tr').click(function () {
		         var selected = $(this).hasClass("highlight"); 
		         $("tr").removeClass("highlight");
		         if(!selected)
		             $(this).addClass("highlight");
		    });
		}); 
	   	var day = new Date().getDay();
		var dName = dayName(day);
	   	$("#orderDate").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
   }
   function updateAccountReceivableTab(data)
   {
	   document.getElementById("devAmount").innerHTML = "";
	   $("#receivableForm")[0].reset();
	   $(document).find('div#tblForInvoiceOrder table').replaceWith($(data).find('div#tblForInvoiceOrder').html());
	   $(document).find('div#tblForUnpaidOpeningBalance table').replaceWith($(data).find('div#tblForUnpaidOpeningBalance').html());
	   $(document).find('div#tblForUnpaidCreditAmount table').replaceWith($(data).find('div#tblForUnpaidCreditAmount').html());
	   addCss();
   }
   
function showreceiveddialog()
{
	event.preventDefault();
	$("#showreceiveddialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
   
function entervalidchecknumberdialog()
{
	event.preventDefault();
	$("#entervalidchecknumberdialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selecttranactiondialog()
{
	event.preventDefault();
	$("#selecttranactiondialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showerrordialog()
{
	event.preventDefault();
	$("#showerrordialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
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
</body>
</html>
<!-- Dialog box used in this page -->
<div id="showreceiveddialog" style="display:none;">
	<p><bean:message key='BzComposer.accountreceivable.recivedamountisnotgreaterthanamount'/></p>
</div>
<div id="entervalidchecknumberdialog" style="display:none;">
	<p><bean:message key='BzComposer.accountreceivable.entervalidchecknumber'/></p>
</div>
<div id="selecttranactiondialog" style="display:none;">
	<p><bean:message key='BzComposer.accountreceivable.selecttransaction'/></p>
</div>
<div id="showcleartransactiondialog" style="display:none;">
	<p><bean:message key='BzComposer.accountreceivable.cleartransaction'/></p>
</div>
<div id="savelayawaysinvoicedialod" style="display:none;">
	<p><bean:message key='BzComposer.accountreceivable.savelayawaysinvoice'/></p>
</div>
<div id="showerrordialog" style="display:none;">
	<p><bean:message key='BzComposer.accountreceivable.erroroccurred'/></p>
</div>