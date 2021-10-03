<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.nxsol.bizcompser.global.table.TblCategory"%>
<%@page import="com.nxsol.bizcomposer.global.clientvendor.ClientVendor"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPaymentType"%>
<%@page import="com.nxsol.bizcomposer.common.JProjectUtil"%>
<%@ page isELIgnored="false"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPayment"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblAccountCategory"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblAccount"%>
<%@page import="java.util.Collections"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.bankingtitle"/></title>
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="<bean:write name="path" property="pathvalue"/>/includeAll/jquery.min.js"></script>
<script>var ctx = "${pageContext.request.contextPath}";</script>
<script src="<bean:write name="path" property="pathvalue"/>/includeAll/jquery-ui.js"></script>
<link rel="stylesheet" href="<bean:write name="path" property="pathvalue"/>/includeAll/jquery-ui.css">
<!-- <script>var ctx = "${pageContext.request.contextPath}";</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
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
#popupWindow
{
	
   /* width: 1500px;
    height: 900px;*/
}	 
/* .ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable {
    min-width: 55%;
    min-height: 500px;
    overflow:"auto";
   	position: absolute;
    height: auto;
    width: 300px;
    top: 300px !important;
    left: 356px;
    display: block;
    z-index: 101;
   
} */
.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}
#popupWindow
{

}
.highlight { background-color: #00CED1 !important;color: #fff ;padding: 5px ;}	
 /* .table tr:hover { cursor: pointer;} */ 
 
.bz_dialogTable tr td
{
  padding: 10px
}
.bz_dialogTable tr td label
{
	font-size: 12px;
} 
.bz_dialogTable tr td input
{
	font-size: 12px;
} 
.bz_dialogTable tr td select
{
	font-size: 12px;
}
.bzbtn
{
	position: relative;
    top: 87px;
}

.highlight { background-color: #00CED1 !important;color: #fff }	
</style>
</head>
<body>
<% double total = -1;%>
	<div id="ddcolortabsline">&nbsp;</div>
	<html:form action="Banking.do" method="post">
		<div class="content1 clearfix">
			<h3 class="title1">
				<bean:message key="BzComposer.banking.bankingtitle"/>
			</h3>
			<div class="filterbar filterbar1">
				<div class="form-inline float-right">
					<label>
						<bean:message key="BzComposer.banking.datefrom"/>
					</label> 
					<input type="text" readonly="true" class="form-control" id="dateFrom">
					<div class="input-group-append">
						<a class="input-group-text" href="#">&#9662;</a>
					</div>
					<label>
						<bean:message key="BzComposer.banking.dateto"/>
					</label> 
					<input type="text" readonly="true" class="form-control" id="dateTo">
					<div class="input-group-append">
						<a class="input-group-text" href="#">&#9662;</a>
					</div>
				</div>
				<div class="form-inline">
					<label>
						<bean:message key="BzComposer.banking.filterby"/>
					</label> 
					<select class="form-control rangeOP" id="rangeId">
						<option value="1">All</option>
						<option value="2">Custom</option>
						<option value="3">Today</option>
						<option value="4">This Month</option>
						<option value="5">This Quarter</option>
						<option value="6">This Year</option>
						<option value="7">1 Year</option>
						<option value="8">2 year</option>
						<option value="9">3 Year</option>
						<option value="10">This Month-To-Date</option>
						<option value="11">This Quarter-To-Date</option>
						<option value="12">This Year-To-date</option>
						<option value="13">Last 10 Days</option>
						<option value="14">Last 30 Days</option>
						<option value="15">Last 60 Days</option>
						<option value="16">1 Week</option>
					</select> 
					<label>
						<bean:message key="BzComposer.banking.show"/>
					</label> 
					<select class="form-control transactionFilter" id="transactionFilterId">
						<option value="">All Transaction</option>
						<option value="ALLPAYMENTS">Payments</option>
						<option value="ALLDEPOSITE">Deposits</option>
						<option value="INVOICE">Invoices</option>
						<option value="PURCHASE">Purchase Bill</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 d-flex flex-column full-height">
					<h4 class="title2">
						<bean:message key="BzComposer.banking.accountcategory"/>
					</h4>
					<div id="treeView2" class="treeview">
						<ul class="list-group">
						<div style="float: left; width: 100%; margin-bottom: 10px;">
							<bean:message key="BzComposer.banking.accountcategory"/>
						</div>
						<%
								
							  	ArrayList<TblAccountCategory> listOfCategory = (ArrayList)request.getAttribute("AccountCategoryList");	
								ArrayList<TblAccount> listOfAccount = (ArrayList)request.getAttribute("accountList");
										  int index=1;
							  	for(int j=0;j<listOfCategory.size();j++)
							  	{	

				 			 %>
							<li class="list-group-item">
							
							<label
								class="tree-toggler node-treeview2 node-selected" value="<%=listOfCategory.get(j).getAccountCategoryID() %>" id="<%=listOfCategory.get(j).getAccountCategoryID() %>" onclick="getAccountCategoryId(<%=listOfCategory.get(j).getAccountCategoryID()%>)"> <img
									src="<bean:write name="path" property="pathvalue"/>/images/folder-lightblue-icon.png"
									class="iconImg"/> <% out.println(listOfCategory.get(j).getName()); %>
							</label>
								<% 
									 for(int i=1;i<listOfAccount.size();i++)
									 {
										 /* TblAccount acc = accountIterator.next(); */
										if(listOfAccount.get(i).getAccountCategoryID() == listOfCategory.get(j).getAccountCategoryID())
										{			
								%>
									<ul class="nav nav-list tree">
				      				<li><label style="font-size: 14px;cursor: pointer;" value="<%=listOfAccount.get(i).getAccountID() %>" id="<%= listOfAccount.get(i).getIsitmainaccount() %>" onclick="showTransaction(<%=listOfAccount.get(i).getAccountID()%>)"><% out.println(listOfAccount.get(i).getName()); %></label></li>	
									<li hidden="currentBalanceForAccount" value="<%= listOfAccount.get(i).getCustomerStartingBalance()%>" id="<%= "Account"+listOfAccount.get(i).getAccountID()%>"></li>
									<li hidden="isItMainAccount" value="<%= listOfAccount.get(i).getIsitmainaccount()%>" id="<%= "IsItMain"+listOfAccount.get(i).getAccountID()%>"></li>
									</ul>
								<% }%>
								<% }}%>
								</li>
								
							<!-- <li class="list-group-item">	<label class="  node-treeview2 node-selected">Header 2</label></li>
						<li class="list-group-item"><label class=" node-treeview2 node-selected">Header 3</label></li> -->
						</ul>
					</div>
					<div class="mb-auto"></div>
					<div class="filterbar filterbar1 text-center mb-0">
						<button class="btn btn-info" id="AddAccount"><bean:message key="BzComposer.global.add"/></button>
						<button class="btn btn-info" id="EditAccount"><bean:message key="BzComposer.global.edit"/></button>
						<button class="btn btn-info"><bean:message key="BzComposer.banking.transeferfundsbtn"/></button>
					</div>
				</div>			
				<div class="col-md-9 d-flex flex-column full-height">
					<div id="selectedAccount">
				<% TblAccount account = (TblAccount)request.getAttribute("selectedAccount");%>
					  <h4 class="title2"><% out.println(account.getName());%></h4>  
					 <!-- <h4 class="title2">Personal Checking 5423</h4> --> 
					</div>
					<div id="transactionTable">
					<table class="table table-bordered table-sm  devBankingDatatable">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.date"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.payerorpayee"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.payment"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.deposit"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.balance"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.invoiceorponumber"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.paymentmethod"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.category"/></th>
								<th scope="col" class="text-right"><bean:message key="BzComposer.banking.memo"/></th>
							</tr>
						</thead>
						<tbody>
						<%
							ArrayList<TblPayment> paymentList = (ArrayList)request.getAttribute("payMentList");
						ArrayList<ClientVendor> listOfVendor = (ArrayList)request.getAttribute("cvList");  
						int vendorId = -1;
						int indexForVendor = -1;
						int paymentIndex = 1;
						int rowCount = paymentIndex;
						/* System.out.println(paymentList);
						System.out.println(listOfVendor); */
						if(paymentList != null)
						{	
							System.out.println("hello");
							if(request.getSession().getAttribute("indexForPayeeVendor") != null){
							 indexForVendor = Integer.parseInt(request.getSession().getAttribute("indexForPayeeVendor").toString());
							 /* System.out.println(indexForVendor); */
							vendorId = Integer.parseInt(request.getSession().getAttribute("vendorID").toString());
							 /* System.out.println(indexForVendor); */
							}
							int selectedAccountId = Integer.parseInt(request.getAttribute("selectedAccountId").toString());
							String checkNumber = "";
							
							for(int i=0;i<paymentList.size();i++) 
							{	
								
						%>
						<%if(account.getAccountID() == paymentList.get(i).getPayeeID() || account.getAccountID() == paymentList.get(i).getPayerID()) {%>
	
      					<tr onclick="return selectRow(<%=paymentIndex %>,<%=paymentList.get(i).getId()%>,<%=account.getAccountID() %>)">
								<td class="text-right"><% out.println(JProjectUtil.getdateFormat().format(paymentList.get(i).getDateAdded())); %></td>
								<% if(paymentList.get(i).getPayeeID() == vendorId && vendorId != -1) {%>
								<td class="text-right" value="<%=listOfVendor.get(i).getCvID()%>"><% out.println(listOfVendor.get(indexForVendor).getFirstName() + " " + listOfVendor.get(indexForVendor).getLastName()); %></td>
								<% } else { %>
								<% if(paymentList.get(i).getCvName().equals(account.getName())) {
								    if(paymentList.get(i).getPyerAccountForBanking() != null)
								    {	
								%>
								     <td class="text-right"><% out.println(paymentList.get(i).getPyerAccountForBanking()); %></td>
								<%} else { %>
								    <td class="text-right"><% out.println(paymentList.get(i).getCategoryName().replaceAll("[^A-Za-z]", "")); %></td>
								
							    <%} } else {
							       if(!paymentList.get(i).getCvName().startsWith("null"))
							       {   
							    %>
								<td class="text-right" value="<%= paymentList.get(i).getCvID() %>" label="<%=account.getAccountID() %>"><% out.println(paymentList.get(i).getCvName()); %></td>
								<%} else {%>
								<td class="text-right"><% out.println(paymentList.get(i).getCategoryName().replaceAll("[^A-Za-z]", "")); %></td>
								<% } } } %>
								<% if(selectedAccountId == paymentList.get(i).getPayerID()) {%>
								<td class="text-right"><% out.println(paymentList.get(i).getAmount()); %></td>
								<% } else {%>
								<td class="text-right"></td>
								<% } if(selectedAccountId == paymentList.get(i).getPayerID()) {%>
								<td class="text-right"></td>
								<% } else {%>
								<td class="text-right"><% out.println(paymentList.get(i).getToCurrentBalance()); %></td>
								<% }%>
								<td class="text-right"><% out.println(Double.parseDouble(new DecimalFormat("##.##").format(paymentList.get(i).getBalanceForBanking())));%></td>
								<% if(paymentList.get(i).getOrderNum() != 0 && paymentList.get(i).getOrderNum() > 0) {%>
								<td class="text-right"><% out.println("Order#"+paymentList.get(i).getOrderNum()); %></td>
								<%} else if(paymentList.get(i).getPoNum() != 0 && paymentList.get(i).getPoNum() > 0) { %>
								<td class="text-right"><% out.println("PO#"+paymentList.get(i).getPoNum()); %></td>
								<% } else {
								     if(paymentList.get(i).getBillNum() != -1)
								     { 
								%>
								<td class="text-right"><% out.println("Bill#"+paymentList.get(i).getBillNum()); %></td>
								<% } else { %>
								<td></td>
								<% } }%>
								<% if(!paymentList.get(i).getCheckNumber().isEmpty() && !paymentList.get(i).getCheckNumber().equals("null"))
								{
									if(paymentList.get(i).getCheckNumber().length() > 5)
									{
										checkNumber = "#" + paymentList.get(i).getCheckNumber().substring(0,4); 
									}	 else 
									{
										checkNumber = "#" + paymentList.get(i).getCheckNumber();
									}
									if(paymentList.get(i).getPaymentTypeID() != -1)
									{	
								 %>
								 <td class="text-right" value="<%=paymentList.get(i).getPaymentTypeID() %>"><% out.println(paymentList.get(i).getPaymentTypeName() + checkNumber); %></td>
								 <%} else { %>
									 <td class="text-right" value="1"><% out.println("Check" + checkNumber); %></td>
							     <% } } else {%>
							      <% if(paymentList.get(i).getPaymentTypeID() != -1) {%>
							     
								 <td class="text-right" value="<%=paymentList.get(i).getPaymentTypeID() %>"><% out.println(paymentList.get(i).getPaymentTypeName()); %></td>
								<% } else { %> 
							      
							     <td class="text-right" value="1"><% out.println("Check"); %></td>
							     
							    <% } }%>
								<% if(!paymentList.get(i).getCategoryName().equals("null null") ) {%>
								<td class="text-right" value="<%=paymentList.get(i).getCategoryId() %>"><% out.println(paymentList.get(i).getCategoryName());%></td>
								<%} else {%>
								<td class="text-right"></td>
								<% }%>
								<td class="text-right"></td>
								<td hidden="oldBankAccount" value="<%=account.getAccountID() %>"></td>
							</tr>
						<% paymentIndex++ ;}%>
						<% }%>
						<% } %>	
						<tr><td hidden="totalrowCount" value="<%= paymentList.size() %>" id="RowCount"></tr>
						</tbody>
					</table>
	</div>				
					<div class="mb-auto"></div>
					<div class="filterbar filterbar1 text-center mb-0" id="bottom">
						<label class=" float-left text-danger">
							<bean:message key="BzComposer.banking.deletetransactionnote"/>
						</label>

						<button class="btn btn-info" id="AddTransaction"><bean:message key="BzComposer.global.add"/></button>
						<button class="btn btn-info" id="showEditTransactionDialog"><bean:message key="BzComposer.global.edit"/></button>
						<button class="btn btn-info" onclick="return clearTransaction()"><bean:message key="BzComposer.global.delete"/></button>
						<!--  <div id="totalLabel"> --> 
						 <% if(!paymentList.isEmpty()) {%>
						 
						 	<% for(int i=0;i<paymentList.size();i++) { %>
						 	  <% if(account.getAccountID() == paymentList.get(i).getAccountID() || account.getAccountID() == paymentList.get(i).getPayeeID() || account.getAccountID() == paymentList.get(i).getPayerID()) { %>
						 <label class="text-right float-right" id="totalLabel"><% out.println(Double.parseDouble(new DecimalFormat("##.##").format(paymentList.get(i).getBalanceForBanking())));%></label>
						 
						 <% break; } } }%>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="tabid" name="tabid" value=""/>
	</html:form>
<div class="container" id="popupWindow">                                                                                      
  <div class="table-responsive" style="padding-top: 20px">  
  <div class="d-flex flex-column full-height">    
  
  <div class="modal-body1">
  <div class="content-tabs" id="dialogTabs">		
			<nav>
			   <div class="nav nav-tabs" id="tabId" role="tablist">
			    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" 
			    role="tab" aria-controls="nav-home" aria-selected="true">
			    	<bean:message key="BzComposer.banking.fundtransfer"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-home1-tab" data-toggle="tab" href="#nav-profile" 
			    role="tab" aria-controls="nav-profile" aria-selected="false" onclick="paymentTab()">
			    	<bean:message key="BzComposer.banking.payment"/>
		    	</a>
			    <a class="nav-item nav-link" id="nav-home2-tab" data-toggle="tab" href="#nav-contact" 
			    role="tab" aria-controls="nav-contact" aria-selected="false" onclick="depositTab()">
			    	<bean:message key="BzComposer.banking.deposit"/>
		    	</a>
			  </div>
			</nav>
  </div> 
  <div class="container-fluid" id="fundTrasferTab">                       <!-- Here is the Fund Trasfer Tab Started -->
  <div class=" row" >
  <div class=" col-12">
  <div class="border1  clearfix">
  <form>	
	 <div class="row">
	 	<div class="col-md-6" id="firstTable">
	 	<table class="bz_dialogTable">
	 		<tr>		
		 		<td>
		 			<label>
		 				<bean:message key="BzComposer.banking.payeraccount"/>
	 				</label>
 				</td>
		 		<% TblAccount account = (TblAccount)request.getAttribute("selectedAccount");%>
		 		<td><input type="text" value="<%= account.getName() %>" readonly="true" style="width:150px" id="<%= account.getAccountID() %>"/></td>
		 		<td><input type="hidden" value="<%= account.getAccountCategoryID()%>" id="categoryIdForPayer"></td>
	 		</tr>
	 		<tr>
		 		<td>
		 			<label>
		 				<bean:message key="BzComposer.banking.payamount"/>
	 				</label>
 				</td>
		 		<td>
		 			<input type="text" style="width:150px" id="payAmount"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>
	 				<label>
	 					<bean:message key="BzComposer.banking.paymethod"/>
 					</label>
				</td>
	 			<td><select style="width:100%" onchange="slectedPayMethod()" id="payMethodForDlg">
	 			<% 
	 				ArrayList<TblPaymentType> types = (ArrayList)request.getAttribute("simpleTypes");
	 				for(int i=0;i<types.size();i++)
	 				{	
	 			%>
	 				<option id="<%= types.get(i).getId() %>"><% out.println(types.get(i).getTypeName());%></option>
	 			<% }%>	
	 			</select></td>
	 		</tr>
	 		 <tr>
	 			<td>
	 				<label>
	 					<bean:message key="BzComposer.banking.date"/>
 					</label>
				</td>
	 			<td>
	 				<input type="text" readonly="true" style="width:150px" id="dlgDate"/></td>
	 		</tr>				
	 	</table>	
	 	</div>
	 <div class="col-md-6" id="secondTable">
	 	<table class="bz_dialogTable">
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.endingbalance"/>
 				</label>
				</td>
	 		<% 
	 			ArrayList<TblPayment> paymentList = (ArrayList)request.getAttribute("payMentList");
	 			if(!paymentList.isEmpty())
	 			{	
	 		%>
	 		<td><input type="text" readonly="true" style="width:150px" value="<%= paymentList.get(0).getBalanceForBanking() %>" id="payerBalance"/></td>
	 		<% } else { %>
	 		 <td><input type="text" readonly="true" style="width:150px"/></td>
	 		 <% } %>
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.check"/>
 				</label>
			</td>
	 		<td><input type="text" style="width:150px" id="checkNumForDlg"/></td> 
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.payeeaccount"/>
 				</label>
			</td>
	 		<td>
	 			<select style="width:100%" id="payeename" onchange="changeBank()">
	 			<option></option>
	 		<% 
	 			 ArrayList<TblAccount> listOfAccount = (ArrayList)request.getAttribute("accountList");  
	 			for(int i=0;i<listOfAccount.size();i++)
	 			{
	 				
	 				if(listOfAccount.get(i).getAccountCategoryID() == 1 || listOfAccount.get(i).getAccountCategoryID() == 2 || listOfAccount.get(i).getAccountCategoryID() == 3)
	 				{	
	 		%>			
	 					<option value="<%= listOfAccount.get(i).getCustomerCurrentBalance()%>" id="<%= listOfAccount.get(i).getAccountID() %>"><% out.println(listOfAccount.get(i).getName());%></option>
	 					
	 				<%} %>
	 				<% } %>	
	 		 		</select></td>
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.endingbalance"/>
 				</label>
			</td>
	 		<td><input type="text" readonly="true" style="width:150px" id="payeeBalance"/></td> 
	 	</tr>
	 	
	 	</table>
	 	</div>
	 </div>
  </form>
</div>
</div>
  </div> 
  <div class="bzbtn">
  	<button type="button" class="btn btn-success" style="float: right;">
		<bean:message key="BzComposer.global.cancel"/>
	</button>	
  	<button type="button" class="btn btn-success" style="float: right;margin-right: 10px;" 
  	onclick="return addTransactionFromDialog()" id="addButton">
  		<bean:message key="BzComposer.global.add"/>
	</button>
  </div> 
  </div>
  <div class="container-fluid" id="paymentTab">                                          <!-- Here is the Payment Tab started -->
  <div class=" row">
  <div class=" col-12">
  <div class="border1  clearfix">
  <form>	
	 <div class="row">
	 	<div class="col-md-6" id="thirdTable">
	 	<table class="bz_dialogTable">
	 		<tr>		
		 		<td>
		 			<label>
		 				<bean:message key="BzComposer.banking.payeraccount"/>
	 				</label>
 				</td>
		 		<% TblAccount account1 = (TblAccount)request.getAttribute("selectedAccount");%>
		 		<td><input type="text" value="<%= account1.getName()%>" readonly="true" style="width:150px" id="<%= account1.getAccountID() %>"/></td>
		 		<td><input type="hidden" value="<%= account1.getAccountCategoryID()%>" id="categoryIdForPayerForPayment"></td>
	 		</tr>
	 		<tr>
		 		<td>
		 			<label>
		 				<bean:message key="BzComposer.banking.payamount"/>
	 				</label>
 				</td>
		 		<td><input type="text" style="width:150px" id="payAmountForPayment"/></td>
	 		</tr>
	 		<tr>
	 			<td>
	 				<label>
	 					<bean:message key="BzComposer.banking.paymethod"/>
 					</label>
				</td>
	 			<td><select style="width:100%" onchange="selectedPaymenthodForPayment()" id="payMethodForDlgForPayment">
	 			<% 
	 				ArrayList<TblPaymentType> types1 = (ArrayList)request.getAttribute("simpleTypes");
	 				for(int i=0;i<types1.size();i++)
	 				{	
	 			%>
	 				<option id="<%= types1.get(i).getId() %>"><% out.println(types1.get(i).getTypeName());%></option>
	 			<% }%>	
	 			</select></td>
	 		</tr>
	 		 <tr>
	 			<td>
	 				<label>
	 					<bean:message key="BzComposer.banking.date"/>
 					</label>
				</td>
	 			<td><input type="text" readonly="true" style="width:150px" id="dlgDateForPayment"/></td>
	 		</tr>				
	 	</table>	
	 	</div>
	 <div class="col-md-6" id="fourthTable">
	 	<table class="bz_dialogTable">
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.endingbalance"/>
 				</label>
			</td>
	 		<% 
	 			ArrayList<TblPayment> paymentList1 = (ArrayList)request.getAttribute("payMentList");
	 			if(!paymentList1.isEmpty())
	 			{	
	 		%>
	 		<td><input type="text" readonly="true" style="width:150px" value="<%= paymentList1.get(0).getBalanceForBanking() %>" id="payerBalance"/></td>
	 		<% } else { %>
	 		 <td><input type="text" readonly="true" style="width:150px"/></td>
	 		 <% } %>
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.check"/>
 				</label>
			</td>
	 		<td><input type="text" style="width:150px" id="checkNumForDlgForPayment"/></td> 
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.payeeaccount"/>
 				</label>
			</td>
	 		<td><select style="width:100%" id="payeenameForPayment" onclick="selectVendor()">
	 			<option></option>
	 		<% 
	 			 ArrayList<ClientVendor> listOfVendor = (ArrayList)request.getAttribute("cvList");  
	 			ArrayList<TblAccount> accountListForClient = (ArrayList)request.getAttribute("accountForClientVendor");
	 			for(int i=0;i<listOfVendor.size();i++)
	 			{
	 				for(int j =0;j<accountListForClient.size();j++)
	 				{
						if(accountListForClient.get(j) != null)
						{		
							 
							if(listOfVendor.get(i).getCvID() == accountListForClient.get(j).getCvID())
						{
	 			%>	 		
	 					<option id="<%= listOfVendor.get(i).getCvID() %>" value="<%= accountListForClient.get(j).getCustomerCurrentBalance()%>" label="<%=i %>"><% out.println(listOfVendor.get(i).getFirstName() + " " + listOfVendor.get(i).getLastName() + "(" + listOfVendor.get(i).getName() + ")" );%></option>
	 						
	 				<% }  } %>	
	 				<% } }%>
	 		 		</select></td>
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.category"/>
 				</label>
			</td>
	 		<td><select style="width:100%" id="category">
	 		<option></option>
	 		<% 
	 			 ArrayList<TblCategory> categoryForPayment = (ArrayList)request.getAttribute("categoryListForPayment");  
	 			for(int i=0;i<categoryForPayment.size();i++)
	 			{
	 				
	 		%>			
	 					<option id="<%= categoryForPayment.get(i).getId() %>"><% out.println(categoryForPayment.get(i).getCategoryNumber()+ " " +categoryForPayment.get(i).getName() );%></option>
	 		
	 				<% } %>	
	 		
	 	</tr>
	 	<tr>
	 		<td>
	 			<label>
	 				<bean:message key="BzComposer.banking.endingbalance"/>
 				</label>
			</td>
	 		<td><input type="text" readonly="true" style="width:150px" id="payeeBalance"/></td> 
	 	</tr>
	 	</table>
	 	</div>
	 </div>
  </form>
</div>
</div>
  </div> 
   <div class="bzbtn">
  	<button type="button" class="btn btn-success" style="float: right;">
  		<bean:message key="BzComposer.global.cancel"/>
	</button>	
  	<button type="button" class="btn btn-success" style="float: right;margin-right: 10px;" 
  	onclick="return addTransactionFromDialogForPayment()" id="addButtonForPayment">
  		<bean:message key="BzComposer.global.add"/>
	</button>
  </div> 
  </div>
  <div class="container-fluid" id="depositTab">                                   <!--    Here is the Deposit tab started -->
  <div class=" row">
  <div class=" col-12">
  <div class="border1  clearfix">
  <form>	
	 <div class="row">
	 	<div class="col-md-6" id="fifthTable">
	 	<table class="bz_dialogTable">
	 		<tr>		
		 		<td>
		 			<label>
		 				<bean:message key="BzComposer.banking.payeraccount"/>
	 				</label>
 				</td>
		 		<td><select id="payerForDeposit" onchange="selectVendorForDeposit()">
		 		<option></option>
		 	<% ArrayList<ClientVendor> vendorForDeposit = (ArrayList)request.getAttribute("cleintListForDeposit");
		 		ArrayList<TblAccount> accountForDeposit = (ArrayList)request.getAttribute("accountForClientListForDeposit");	
		 	
				for(int i=0;i<vendorForDeposit.size();i++)
				{
		 			if(accountForDeposit.get(i) != null) {
		 				if(accountForDeposit.get(i).getCvID() == vendorForDeposit.get(i).getCvID()) {
		 	%>
		 		<option value="<%=accountForDeposit.get(i).getCustomerCurrentBalance()%>" id="<%= accountForDeposit.get(i).getAccountID()%>" label="<%= accountForDeposit.get(i).getAccountTypeID()%>"><%out.println(vendorForDeposit.get(i).getFirstName() + " " +vendorForDeposit.get(i).getLastName() + "(" + vendorForDeposit.get(i).getName() + ")"); %></option>
		 		
		 	<% }}}%>	
		 		</select></td>
		 		<td><input type="hidden" value="" id="categoryIdForPayerForDeposit"></td>
	 		</tr>
	 		<tr>
		 		<td><label><bean:message key="BzComposer.banking.payamount"/></label></td>
		 		<td><input type="text" style="width:150px" id="payAmountForDeposit"/></td>
	 		</tr>
	 		<tr>
	 			<td><label><bean:message key="BzComposer.banking.paymethod"/></label></td>
	 			<td><select style="width:100%" onchange="selectedPaymenthodForPayment()" id="payMethodForDeposit">
	 			
	 				<% 
	 				ArrayList<TblPaymentType> types2 = (ArrayList)request.getAttribute("simpleTypes");
	 				for(int i=0;i<types2.size();i++)
	 				{	
	 			%>
	 				<option id="<%= types2.get(i).getId() %>"><% out.println(types2.get(i).getTypeName());%></option>
	 			<% }%>	
	 			
	 			</select></td>
	 		</tr>
	 		 <tr>
	 			<td><label><bean:message key="BzComposer.banking.date"/></label></td>
	 			<td><input type="text" readonly="true" style="width:150px" id="dateForDeposit"/></td>
	 		</tr>				
	 	</table>	
	 	</div>
	 <div class="col-md-6" id="sixthTable">
	 	<table class="bz_dialogTable">
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.endingbalance"/></label></td>
	 		
	 		<td><input type="text" readonly="true" style="width:150px" value="" id="payerBalanceForDeposit"/></td>
	 		
	 	</tr>
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.check"/></label></td>
	 		<td><input type="text" style="width:150px" id="checkNumForDeposit"/></td> 
	 	</tr>
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.payeeaccount"/></label></td>
	 		<td><select style="width:100%" id="payeenameForDeposit" onchange="changeBankForDeposit()">
	 			<option></option>
	 		<% 
	 			 ArrayList<TblAccount> listOfAccountForDeposit = (ArrayList)request.getAttribute("accountList");  
	 			for(int i=1;i<listOfAccountForDeposit.size();i++)
	 			{
	 		%>			
	 					<option value="<%= listOfAccountForDeposit.get(i).getCustomerCurrentBalance()%>" id="<%= listOfAccountForDeposit.get(i).getAccountID() %>"><% out.println(listOfAccountForDeposit.get(i).getName());%></option>
	 				<% } %>	
	 						
	 			
	 		 		</select></td>
	 	</tr>
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.category"/></label></td>
	 		<td><select style="width:100%" id="categoryForDeposit">
	 		<option></option>
	 		<% ArrayList<TblCategory> categoryListForDeposit = (ArrayList)request.getAttribute("categoryListForDeposit"); 
	 			for(int i=0;i<categoryListForDeposit.size();i++) {
	 		%>
	 					<option id="<%=categoryListForDeposit.get(i).getId() %>"><% out.println(categoryListForDeposit.get(i).getCategoryNumber() + " " + categoryListForDeposit.get(i).getName());%></option>
	 		<% }%>
	 			
	 		
	 	</tr>
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.endingbalance"/></label></td>
	 		<td><input type="text" readonly="true" style="width:150px" id="payeeBalanceForDeposit"/></td> 
	 	</tr>
	 	
	 	</table>
	 	</div>
	 </div>
  </form>
</div>
</div>
  </div> 
   <div class="bzbtn">
		<button type="button" class="btn btn-success" style="float: right;">
			<bean:message key="BzComposer.global.cancel"/>
		</button>	
  		<button type="button" class="btn btn-success" style="float: right;margin-right: 10px;" 
  		onclick="return addTrafsactioFromDeposit()" id="addButtonForDeposit">
  			<bean:message key="BzComposer.global.add"/>
		</button>
  </div> 
  </div>
   </div>
   
  </div>
</div>
</div>
<div class="container-fluid" id="EditTransactionDialog">                                   <!--    Here is the EditTransaction dialog started -->
<div class="table-responsive" style="padding-top: 20px">  
  <div class="d-flex flex-column full-height">    
  
   <div class="modal-body1">
  <div class=" row">
  <div class=" col-12">
  <div class="border1  clearfix">
  <form>	
	 <div class="row">
	 	<div class="col-md-6 " id="editTable1">
	 	<table class="bz_dialogTable devFirstEditTable">
	 		<tr>		
		 		<td>
		 			<label>
		 				<bean:message key="BzComposer.banking.payer"/>
		 			</label>
	 			</td>
		 		<td><select class="payerField" id="payerForEdit" onchange="">
		 		<option></option>
		 		<% ArrayList<ClientVendor> listOfVendorForEdit = (ArrayList)request.getAttribute("allClientVendor");
		 			for(int i=0;i<listOfVendorForEdit.size();i++)
		 			{
		 		%>
		 		<option value="<%=listOfVendorForEdit.get(i).getCvID() %>"><% out.println(listOfVendorForEdit.get(i).getFirstName() + " " + listOfVendorForEdit.get(i).getLastName() + "(" + listOfVendorForEdit.get(i).getName() + ")"); %></option>
		 		<% } %>
		 		</select></td>
		 		<td><input type="hidden" value="" id="categoryIdForPayerForDeposit"></td>
	 		</tr>
	 		<tr>
		 		<td><label><bean:message key="BzComposer.banking.payee"/></label></td>
		 		<td><select class="accountFieldForEdit" id="payeeForEdit">
		 		<% 
	 			 ArrayList<TblAccount> listOfAccountForEdit = (ArrayList)request.getAttribute("accountList");  
		 			for(int i=1;i<listOfAccountForEdit.size();i++)
		 			{
	 			%>			
		 			<option value="<%= listOfAccountForEdit.get(i).getAccountID() %>"><% out.println(listOfAccountForEdit.get(i).getName()); %></option>
		 			
		 		<% } %>
		 		</select></td>
	 		</tr>
	 		<tr>
	 			<td><label><bean:message key="BzComposer.banking.paymethod"/></label></td>
	 			<td><select class="payMethodForEdit" style="width:100%" onchange="" id="payMethodForEdit">
	 			<% 
	 				ArrayList<TblPaymentType> allPaymentList = (ArrayList)request.getAttribute("allPaymentList");
	 				for(int i=0;i<allPaymentList.size();i++)
	 				{	
	 			%>
	 				<option value="<%= allPaymentList.get(i).getId() %>"><% out.println(allPaymentList.get(i).getTypeName());%></option>
	 			<% } %>
	 			</select></td>
	 		</tr>
	 		 <tr>
	 			<td><label><bean:message key="BzComposer.banking.category"/></label></td>
	 			<td><select class="categoryForEdit" id="categoryForEdit">
	 			<% ArrayList<TblCategory> getAllcategory = (ArrayList) request.getAttribute("allCategoryList");
	 				for(int i=0;i<getAllcategory.size();i++)
	 				{
	 			%>
	 				<option value="<%= getAllcategory.get(i).getId() %>"><% out.println(getAllcategory.get(i).getName() + " " + getAllcategory.get(i).getCategoryNumber()); %></option>
	 			<% } %>
	 			</select></td>
	 		</tr>				
	 	</table>	
	 	</div>
	 <div class="col-md-6 " id="editTable2">
	 	<table class="bz_dialogTable devSecondEditTable">
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.amount"/></label></td>
	 		
	 		<td><input class="devAmount" type="text" id="amountToEdit"/></td>
	 		
	 	</tr>
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.date"/></label></td>
	 		<td><input type="text" class="devDate" id="devDateForEdit"/></td> 
	 	</tr>
	 	<tr>
	 		<td><label><bean:message key="BzComposer.banking.checknumber"/></label></td>
	 		<td><input type="text" class="checkNumberForEdit" id="checkNumberEdit"/></td>
	 	</tr>
	 	</table>
	 	</div>
	 </div>
  </form>
</div>
</div>
  </div> 
 </div>
 </div>
 </div> 
   <div class="bzbtn">
  	<button type="button" class="btn btn-success" style="float: right;">
  		<bean:message key="BzComposer.global.cancel"/>
	</button>	
  	<button type="button" class="btn btn-success" style="float: right;margin-right: 10px;" 
  	onclick="return editTransaction()" id="addButtonForDeposit">
  		<bean:message key="BzComposer.global.save"/>
	</button>
  </div> 
  </div>
  <div class="container-fluid" id="AddAccountDialog">                                   <!--    Here is the AddAccount dialog started -->
<div class="table-responsive" style="padding:0 15px">
<div class="row">  
   <div class="col-sm-6"><div class="inline-form"><label><bean:message key="BzComposer.banking.accountcategory"/></label>   
   <select class="acForAddAccount" onchange="afterCategoryChange()" id="acForAddAccount"> 
   <% ArrayList<TblAccountCategory> listOfCategory = (ArrayList)request.getAttribute("AccountCategoryList");	
   	for(int i=0;i<listOfCategory.size();i++)	
   	{
   %>
   <option value="<%=listOfCategory.get(i).getAccountCategoryID() %>"><% out.println(listOfCategory.get(i).getName());%></option>
   <% }%>
   </select>   
   </div></div>
   </div>
   <h6><bean:message key="BzComposer.banking.accountinformation"/></h6>
   <div class="boxborderd">
  
   <div class="text-center">
   <div class="inline-form">  
   <label><bean:message key="BzComposer.banking.accountname"/></label>
   <input type="text" id="accountName" name="accountName" class="form-control" />
   <label class="checkboxWrapLable" for="isCategory"><input type="checkbox" name="isCategory" id="isCategory" onclick="isCategory()"> Is Category</label>   
      
   </div>
   </div>
  
   <div class="text-right">
   <div class="inline-form"> 
   <label><bean:message key="BzComposer.banking.subaccountof"/></label>
   <select id="subaccountof" class="form-control"></select>
   </div>
  </div>
  
    <div class="text-left">
   <div class="inline-form">  
   <label class="checkboxWrapLable" for="mainbankAccount">
   <input id="mainbankAccount" name="mainbankAccount" type="checkbox" /> <bean:message key="BzComposer.banking.isthatmainbankaccount"/></label>   
      
   </div>
   </div>
  
   <div class="text-left">
   <div class="row">  
   <label class="col-sm-3"><bean:message key="BzComposer.banking.description"/></label>
   <div class="col-sm-4">
   <input type="text" name="" class="form-control" id="descriptionAd"/>
   </div>
   </div>
   </div>
  
	  <hr>
	  
     <div class="text-left">
     <div class="row">  
   <label class="col-sm-3">
	<bean:message key="BzComposer.banking.openingbalance"/>
</label>
<div class="col-sm-9">   
   <div class="form-inline">  
     <div class="form-inline">
   <input type="text" name="" class="form-control" id="openingBalanceToAddAccount"/>
   </div>
   <div class="form-inline">
   <label><bean:message key="BzComposer.banking.asof"/></label>
   <input type="text" name="" class="form-control" id="dateForAddAccount"/>
  <div class="input-group-append">
								 <a class="input-group-text" href="#">&#9662;</a>
					</div>
</div>
   </div>
   </div>
   </div>
</div>
   <div class="text-left">
        <div class="row">  
   <label class="col-sm-3">
   <bean:message key="BzComposer.banking.depositfrom"/>
   </label>
<div class="col-sm-6">   
   <div class="inline-form"> 
   <select class="form-control" id="devAdAccount">
   <% ArrayList<TblAccount> listOfAccountForAdd = (ArrayList)request.getAttribute("accountList");
	  for(int i=0;i<listOfAccountForAdd.size();i++)
	  {	  
   %>
   <option id="<%=listOfAccountForAdd.get(i).getAccountID()%>" value="<%=listOfAccountForAdd.get(i).getCustomerCurrentBalance()%>"><% out.println(listOfAccountForAdd.get(i).getName()); %></option>
  <% } %>
   </select>
   </div>
  </div>
  </div>
  </div>
   <div class="text-left">
      <div class="row">  
   <label class="col-sm-3"><bean:message key="BzComposer.banking.checkno"/>
   </label>
   <div class="col-sm-6">
   
   <div class="inline-form">  
   <input type="text" name="" class="form-control" id="devAdCheck"/>
   </div>
   </div>
  </div>
  
  </div>
  </div>		
  <div class="bzbtn text-center">
  <button type="button" class="btn btn-success" onclick="return deleteBankAccount()" id="deleteBank"><bean:message key="BzComposer.global.delete"/></button>	
  <button type="button" class="btn btn-success" onclick="return addAccount()" id="addButtonForDeposit"><bean:message key="BzComposer.global.save"/></button>
  <!-- <button type="button" class="btn btn-success" onclick="return addAccount()" id="EditButtonForDeposit">Save</button> -->
  <button type="button" class="btn btn-success" onclick="return editTransaction()" id="addButtonForDeposit"><bean:message key="BzComposer.global.cancel"/></button>
  </div> 
  </div>
 </div> 

<script type="text/javascript">                               <!-- Javascript Begins Here -->
	var accountId = -1;
	var acID = -1;
	var day = new Date().getDay();
	var dName = dayName(day);
	var paymentMethod = '';
	var paymentMethodId = -1;
	var payeeId = -1;
	var Index = -1;
	var paymentId = -1;
	/* var accountId = -1; */
	var tableName = '';
	var accountCategoryId = -1;
	var custStartBalance = 0.00;
	var AcName = "";
	var IsItMain = -1;
	var status;
	var totalPaymentList = -1;
	function selectRow(index , payId,accId)
	{
		debugger;
		this.Index = index;
		this.paymentId = payId;
		this.accountId = accId;
		$("select.payerField").val($('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(2)').attr('value'));
		 var id = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(2)').attr('value'); 
		 if(id == '-1')
			{
			 	id = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(2)').attr('label');
			}
		$("select.accountFieldForEdit").val(accountId);
		$("select.payMethodForEdit").val($('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(7)').attr('value'));
		var paymentType = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(7)').text();
		$("select.categoryForEdit").val($('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(8)').attr('value'));
		if($('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(7)').attr('value') == '1' || $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(7)').attr('value') == '192')
		{
			var checkNumber = paymentType.substring(6, 10);
			$(".checkNumberForEdit").val(checkNumber);
		}
		var payAmount = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(3)').text();
		if(payAmount == '')
		{
			this.tableName = 'Deposit';
			payAmount = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(4)').text();
		}
		else
		{
			this.tableName = 'Payment';
		}
		$(".devAmount").val(payAmount);
		$(".devDate").val($('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(1)').text());
		
		/* $(".accountFieldForEdit>option").map(function() 
				{
					var idv = $(this).val();
					if(idv == id)
					{
						debugger;
						$("#payerForEdit").empty();
						$('#payeeForEdit option').clone().appendTo('#payerForEdit');	
					}
					else
						{
							$("#payerForEdit").empty();
							$('#payerForEditExtra option').clone().appendTo('#payerForEdit');
						}
					
				}); */
	}       
function getAccountCategoryId(catId)
{
	debugger;
	this.accountCategoryId = catId;
	$("select.acForAddAccount").val(catId);
	
}
	function editTransaction()
	{
		debugger;
		var oldClientVendorId = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(2)').attr('value');
		var oldAccountId = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(10)').attr('value');
		var oldPaymentTypeId = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(7)').attr('value');
		
		var customerIdString = document.getElementById("payerForEdit");
		var customerId = customerIdString.options[customerIdString.selectedIndex].value;
		
		var paymenttypeIdString = document.getElementById("payMethodForEdit");
		var paymentTypeId = paymenttypeIdString.options[paymenttypeIdString.selectedIndex].value;
		
		var accountIdString = document.getElementById("payeeForEdit");
		var accountId = accountIdString.options[accountIdString.selectedIndex].value;
		
		var categoryIdString = document.getElementById("categoryForEdit");
		var categoryId = categoryIdString.options[categoryIdString.selectedIndex].value; 
		
		var paymenTypeNameString = document.getElementById("payMethodForEdit");
		var paymentTypeName = paymenTypeNameString.options[paymenTypeNameString.selectedIndex].text; 
		
		var checkNumber = document.getElementById("checkNumberEdit").value;
		var amount = document.getElementById("amountToEdit").value;
		
		var date = document.getElementById("devDateForEdit").value;
		
		var TblPayment={
				   "cvID":customerId,
				   "paymentTypeID":paymentTypeId,	   
				   "accountID":accountId,
				   "categoryID":categoryId,
				   "oldclientVendorID":oldClientVendorId,
				   "oldAccountID":oldAccountId,
				   "paymentTypeName":paymentTypeName,
				   "oldPaymentTypeId":oldPaymentTypeId,
				   "checkNumber":checkNumber,
		   };
		var obj=JSON.stringify(TblPayment);
		 $('#EditTransactionDialog').dialog('close'); 
		$.ajax({
			
			type : "POST",
			url : "Banking.do?tabid=EditTransaction",
			data : "row=" + obj + "&PaymentId=" + paymentId + "&amount=" +amount + "&date=" + date + "&tableName=" +tableName,
		    success : function(data) {
				/* var html = "" + data.msg; */
				debugger;   
		    	updatebankingTab(data);
			
			},
			 error : function(data) {
				//alert("<bean:message key='BzComposer.common.erroroccurred'/>");
				return errorMessageDialog();
			} 
		});
	}
function addAccount()
{
	debugger;
	var payerIdString = document.getElementById("devAdAccount");
	var payerId = payerIdString.options[payerIdString.selectedIndex].id;
	var customerCurrentBalanceString = payerIdString.options[payerIdString.selectedIndex].value; 
	var customerCurrentBalance = parseFloat(customerCurrentBalanceString);
	var openingBalanceString = document.getElementById("openingBalanceToAddAccount").value;
	
	var opeingBalance = parseFloat(openingBalanceString);
	if(opeingBalance >= 999)
	{
		
	}
	else
	{
		//alert("<bean:message key='BzComposer.banking.startingaccountbalance'/>");
		return shostartingaccbalancedialog();
		return false;
	}
	var isCategory = $('#isCategory').is(':checked');
	if(status == 'Save')
		{		
			if(payerId == '-1' && opeingBalance > customerCurrentBalance)
			{
				//alert("Insufficient Amount in the Payer Account");
				return showInsufficientAmountDialog();
				return false;
			}
		}	
	var isMainAccount = $('#mainbankAccount').is(':checked');
	var description = document.getElementById("descriptionAd").value;
	var accountName = document.getElementById("accountName").value;
	var checkNumber = document.getElementById("devAdCheck").value;
	var date = document.getElementById("dateForAddAccount").value;
	var TblPayment = {
			"checkNumber": checkNumber,
			"accountCategoryId":accountCategoryId,
			"payerID": payerId,
			"accountID":payerId,
			"isCategory":isCategory,
			"isMainAccount":isMainAccount,
			"openingbalance":opeingBalance,
			"descriptionForAddAccount":description,
			"accountNameString":accountName,
			
		};
	
	var obj=JSON.stringify(TblPayment);
	 $('#AddAccountDialog').dialog('close'); 
	 $.ajax({
			
			type : "POST",
			url : "Banking.do?tabid=AddAccount",			
			data :"obj=" + obj + "&date=" + date + "&Status=" + status + "&AccountId=" + acID,
		    success : function(data) {
		    	debugger;
		    	/* window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking"; */
		    	/* $(document).find('div#treeView2').replaceWith('<div id="treeView2" class="treeview">'+ $(data).find('div#treeView2').html() + '</div>'); */
		    	$(document).find('div#treeView2').replaceWith('<div id="treeView2" class="treeview">'+ $(data).find('div#treeView2').html() + '</div>');
		    	updatebankingTab(data);
		    	updateTree();
		    	
		    },
			 error : function(data) {
					/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
					return errorMessageDialog();
				} 
			});
	 
	// $(document.forms[0]).submit(function( event ) {
		//    event.preventDefault();
	//	});
	}
	function clearTransaction()
	{
		if(paymentId == '' || paymentId == -1)
		{
			//alert("Please select a transaction")
			return selectTransactionDialog();
			return false;
		}
		else
		{
			/* var status = window.confirm("<bean:message key='BzComposer.banking.removetransaction'/>");
		   	if(status != true)
	   		{
	   			return false;
	   		} */
	   		return showremovetranactiondialog();
		}
		 $.ajax({
				
				type : "POST",
				url : "Banking.do?tabid=deleteTransaction",
			/* 	data : "row=" + row + "&paymentTypeId=" +paymentTypeId + "&memo=" + memo + "&accountId=" +accountId + "&categoryId=" +categoryId + "&receivedAmount=" +receivedAmount, */			
					data :"paymentId=" + paymentId,
			    success : function(data) {
			    	
			    	/* window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking"; */
			    
			    	updatebankingTab(data);
			    },
				 error : function(data) {
						/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
						return errorMessageDialog();
					} 
				});
		   $(document.forms[0]).submit(function( event ) {
			    event.preventDefault();
			});
	}
$(document).ready(function () {
    debugger;
	$('#transactionTable table tr').click(function () {
         var selected = $(this).hasClass("highlight"); 
          $("tr").removeClass("highlight"); 
         if(!selected)
             $(this).addClass("highlight");
    });
}); 
$(document).ready(function () {
    $('label.tree-toggler').click(function () {
        $(this).toggleClass('thisOpen').parent().children('ul.tree').toggle(300);
    });
    debugger;
	this.dName = dayName(this.day);
	$("#dateFrom").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
	$("#dateTo").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
	$("#popupWindow").hide(); 
	$("#EditTransactionDialog").hide(); 
	$("#AddAccountDialog").hide();
	$("#payerForEditExtra").hide();
	
});
function afterCategoryChange()
{
	debugger;
	var indexForCategory = document.getElementById("acForAddAccount");
	var index = indexForCategory.options[indexForCategory.selectedIndex].value; 
	
	if(index == '1')
	{
		document.getElementById("openingBalanceToAddAccount").value = 1000.00
	}
	else
	{
		document.getElementById("openingBalanceToAddAccount").value = 0.00
	}
}
 function updateTree()
{
	$(document).ready(function () {
	    $('label.tree-toggler').click(function () {
	        $(this).toggleClass('thisOpen').parent().children('ul.tree').toggle(300);
	    });
	    $('li label').click(function () {
	         var selected = $(this).hasClass("highlight"); 
	         $("li label").removeClass("highlight");
	         if(!selected)
	             $(this).addClass("highlight");
	    });
	});
} 
function deleteBankAccount()
{
	if(totalPaymentList > 1)
	{
		//alert("<bean:message key='BzComposer.banking.cantdeletaccount'/>");
		return shownotdeletedaccountdialog();
		$('#AddAccountDialog').dialog('close'); 
		return false;
	}
	else
	{
		$('#AddAccountDialog').dialog('close'); 
		
		event.preventDefault();
		$("#deleteaccountdialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		        	"<bean:message key='BzComposer.global.ok'/>": function () {
		            	debugger;
		            	$.ajax({
		        			
		        			type : "POST",
		        			url : "Banking.do?tabid=DeleteAccount",			
		        			data :"AccountId=" +acID,
		        		    success : function(data) {
		        				debugger;
		        			/*  window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking&Ac="+accountId; */  
		        				$(document).find('div#treeView2').replaceWith('<div id="treeView2" class="treeview">'+ $(data).find('div#treeView2').html() + '</div>');
		        		    	updatebankingTab(data);
		        		    	updateTree();
		        			},
		        			 error : function(data) {
		        				/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
		        				return errorMessageDialog();
		        			} 
		        		});
		            },
		            "<bean:message key='BzComposer.global.cancel'/>": function () {
		                $(this).dialog("close");
		                return false;
		            }
		        }
		    });
		    return false;
		
		/* var answer = window.confirm("<bean:message key='BzComposer.banking.wanttodeleteaccount'/>");
		if(answer == true)
		{	
			$.ajax({
				
				type : "POST",
				url : "Banking.do?tabid=DeleteAccount",			
				data :"AccountId=" +acID,
			    success : function(data) {
					debugger;
					//window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking&Ac="+accountId;  
					$(document).find('div#treeView2').replaceWith('<div id="treeView2" class="treeview">'+ $(data).find('div#treeView2').html() + '</div>');
			    	updatebankingTab(data);
			    	updateTree();
				},
				 error : function(data) {
					//alert("<bean:message key='BzComposer.common.erroroccurred'/>");
					return errorMessageDialog();
				} 
			});
		}
		else
		{
			return false;
		} */
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

$(function() {
    $( "#dateFrom" ).datepicker();
    /* $( "#dateTo" ).datepicker(); */
});
function showTransaction(Id)
{
	debugger;
   this.accountId = Id;
   this.acID = Id;
   this.IsItMain = document.getElementById("IsItMain"+accountId).value;
   if(IsItMain == '0')
{
	   document.getElementById("mainbankAccount").checked = false;
}
 else
	   {
	 document.getElementById("mainbankAccount").checked = true;
	   }
   
   this.custStartBalance = document.getElementById("Account"+Id).value;
   this.AcName = document.getElementById(Id).text;
   $("#TotalRow").empty();
	$.ajax({
		
		type : "POST",
		url : "Banking.do?tabid=Banking",			
		data :"Ac=" +accountId,
	    success : function(data) {
			debugger;
		/*  window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking&Ac="+accountId; */  
			
			updatebankingTab(data);
			var totalPaymentListString = $("#RowCount").attr('value');
			totalPaymentList = parseInt(totalPaymentListString);
			$('#EditTransactionDialog').hide();
		},
		 error : function(data) {
			/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
			return errorMessageDialog();
		} 
	});
	
	$(document.forms[0]).submit(function( event ) {
    event.preventDefault();
});
}
$(document).ready(function () {
    $('li label').click(function () {
         var selected = $(this).hasClass("highlight"); 
         $("li label").removeClass("highlight");
         if(!selected)
             $(this).addClass("highlight");
    });
});
$(function() {
	   $( "#AddTransaction").on("click", function(){
		   
		   document.getElementById('tabid').value="AddAccount";
		   debugger;
		   if(accountId == '-1')
			   {
			   		//alert("Please select a bank Account");
			   		return selectBankAccountDialog();
			   		return false;
			   }
		   else {
		   $( "#popupWindow").dialog({
	    	   modal: true,
	    	   title: 'Add Transaction'
	        });
		   $("#dlgDate").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
		   $("#dlgDateForPayment").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
		   $("#dateForDeposit").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
		    $("#paymentTab").hide(); 
		    $("#fundTrasferTab").show();
		    $("#depositTab").hide();
		    
		   }      
	    });
	   
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 });
$(function() {
	   $( "#showEditTransactionDialog").on("click", function(){
		   debugger;
		   if(Index == -1)
			{
				//alert("Please select a Payment first");
				return selectPaymentDialog();
				return false;
			}
		   $( "#EditTransactionDialog").dialog({
	    	   modal: true,
	    	   title: 'Edit Transaction'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 }); 
$(function() {
	   $( "#AddAccount").on("click", function(){
		  debugger;
		  $('#deleteBank').prop('disabled', true);
		   if(accountCategoryId != -1)
		{
			  if(accountId != -1)
			{
				  //alert("<bean:message key='BzComposer.banking.selectcategory'/>");
				  return showselectcategorydialog();
				  accountId = -1;
				  return false; 
			}
		}
		  if(accountId != -1)
		{
			  //alert("<bean:message key='BzComposer.banking.selectcategory'/>");
			  return showselectcategorydialog();
			  return false; 
		}
		  var indexForCategory = document.getElementById("acForAddAccount");
		  var index = indexForCategory.options[indexForCategory.selectedIndex].value;
		  status = "Save";
		  if(index == '1')
			{
			  	document.getElementById("openingBalanceToAddAccount").value = 1000.00
			}
		  else {
			  document.getElementById("openingBalanceToAddAccount").value = 0.00
		  }
		  $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
		  debugger;
		   $( "#AddAccountDialog").dialog({
	    	   modal: true,
	    	   title: 'Add Account'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 });
$(function() {
	   $( "#EditAccount").on("click", function(){
		  debugger;
		  $('#deleteBank').prop('disabled', false);
		  if(accountCategoryId == '6' || accountCategoryId == '7')
		{
			  //alert("<bean:message key='BzComposer.banking.canteditesalesbankaccount'/>");
			  return canteditesalesbankaccountdialog();
			  return false;
		}
		   if(accountId != -1)
		{
			   accountCategoryId = -1;
			   accountId = -1;	
		}
		  if(accountCategoryId != -1)
		{
			  //alert("<bean:message key='BzComposer.banking.canteditaccountcategory'/>");
			  return editableaccountcategorydialog()
			  return false; 
		}
		  var indexForCategory = document.getElementById("acForAddAccount");
		  var index = indexForCategory.options[indexForCategory.selectedIndex].value;
		  if(custStartBalance == '2.2E-306')
		{
			  document.getElementById("openingBalanceToAddAccount").value = 0.00;
			  document.getElementById("openingBalanceToAddAccount").readOnly  = true;
		}
		  else
		{
			  document.getElementById("openingBalanceToAddAccount").value = custStartBalance;
			  document.getElementById("openingBalanceToAddAccount").readOnly  = true;
		}
		  document.getElementById("subaccountof").options = document.getElementById(accountCategoryId).text;
			var isItMain = document.getElementById("IsItMain"+accountId);		  
			status = 'Edit';
		  
		  document.getElementById("accountName").value = AcName;
		  $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear());
		  debugger;
		   $( "#AddAccountDialog").dialog({
	    	   modal: true,
	    	   title: 'Edit Bank Account'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 });
function isCategory()
{
 	debugger;
	if($('#isCategory').is(':checked'))
  {  
	$( "#devAdAccount" ).prop( "disabled", true );
	$( "#devAdCheck" ).prop( "disabled", true );
	$( "#openingBalanceToAddAccount" ).prop( "disabled", true );
	$( "#subaccountof" ).prop( "disabled", true );
  }
  else
	{
	  $( "#devAdAccount" ).prop( "disabled", false );
		$( "#devAdCheck" ).prop( "disabled", false );
		$( "#openingBalanceToAddAccount" ).prop( "disabled", false );
		$( "#subaccountof" ).prop( "disabled", false );
	}
}
 function addCss()
 {
	 $(document).ready(function () {
		    debugger;
			$('#transactionTable table tr').click(function () {
		         var selected1 = $(this).hasClass("highlight"); 
		          $("tr").removeClass("highlight"); 
		         if(!selected1)
		             $(this).addClass("highlight");
		    });
			/* $('label.tree-toggler').click(function () {
		        $(this).toggleClass('thisOpen').parent().children('ul.tree').toggle(300);
		    });
		    $('li label').click(function () {
		         var selected2 = $(this).hasClass("highlight"); 
		         $("li label").removeClass("highlight");
		         if(!selected2)
		             $(this).addClass("highlight");
		    }); */
		}); 
 }
function paymentTab()
{
	debugger;
	/* $( "#dialogTabs" ).tabs({ active: "#nav-home1-tab" }); */
	$("#paymentTab").show();
	$("#fundTrasferTab").hide();
	$("#depositTab").hide();
}
function depositTab()
{
	$("#depositTab").show();
	$("#paymentTab").hide();
	$("#fundTrasferTab").hide();
}

function vendorIndex(index)
{
	debugger;
	this.Index = index;
}
function changeBank()
{
	debugger;
	 var payeeName = document.getElementById("payeename");
	 var balance = payeeName.options[payeeName.selectedIndex].value;
	 this.payeeId = payeeName.options[payeeName.selectedIndex].id;
	 if(parseInt(payeeId) == parseInt(accountId))
		 {
		 		//alert("<bean:message key='BzComposer.banking.selectotherbank'/>");
		 		return selectotherbankdialog();
		 		 $('#addButton').attr('disabled',true);
		 		return false;
		 }
	 else{
	 document.getElementById("payeeBalance").value = balance; 
	 $('#addButton').attr('disabled',false);
	 }
}
function selectVendorForDeposit()
{
	debugger;
	var payerName = document.getElementById("payerForDeposit");
	var balance = payerName.options[payerName.selectedIndex].value;
	if(balance == '2.2E-306')
	{
		document.getElementById("payerBalanceForDeposit").value = 0.0; 
	}
	else{
		document.getElementById("payerBalanceForDeposit").value = balance;
	}
}
function changeBankForDeposit()
{
	debugger;
	var payeeName = document.getElementById("payeenameForDeposit");
	var balance = payeeName.options[payeeName.selectedIndex].value;
	document.getElementById("payeeBalanceForDeposit").value = balance; 
}
function selectVendor()
{
	debugger;
	var payeeName = document.getElementById("payeenameForPayment");
	this.payeeId = payeeName.options[payeeName.selectedIndex].id;
	this.Index = payeeName.options[payeeName.selectedIndex].label;
}
function slectedPayMethod()
{
	debugger;
	var pType = document.getElementById("payMethodForDlg");
	this.paymentMethod =  pType.options[pType.selectedIndex].value;
	this.paymentMethodId = pType.options[pType.selectedIndex].id;
	if(paymentMethod == 'Check')
	{
		document.getElementById("checkNumForDlg").readOnly = false;
	}	
	else
		{
			document.getElementById("checkNumForDlg").readOnly = true;
		}
}
function selectedPaymenthodForPayment()
{
	var pType = document.getElementById("payMethodForDlgForPayment");
	this.paymentMethodId = pType.options[pType.selectedIndex].id;
}
function addTransactionFromDialog()
{
	debugger; 
	var pType = document.getElementById("payMethodForDlg");
	this.paymentMethod =  pType.options[pType.selectedIndex].value;
	if(paymentMethod == 'Check')
		{
			if(document.getElementById("checkNumForDlg").value == '0' || document.getElementById("checkNumForDlg").value == '')
			{
				//alert("please enter a valid check number");
				return selectValidNumberDialog();
				return false;
			}
		}	
			var payerBalance  = parseFloat(document.getElementById("payerBalance").value);
			var payeeBalance = parseFloat(document.getElementById("payeeBalance").value);
			var payAmount = parseFloat(document.getElementById("payAmount").value);
			if(payAmount > payerBalance)
				{
					//alert("Insufficient Balance please enter a valid amount")
					return showInsufficientBalanceDialog();
					return false;
				}
			var checkNum = document.getElementById("checkNumForDlg").value;
			var date = document.getElementById("dlgDate").value;
			var AccountCategoryId = document.getElementById("categoryIdForPayer").value;
			
			var TblPayment = {
				"fromBalance":payerBalance ,
				"toBalance": payeeBalance,
				"checkNumber": checkNum,
				"accountCategoryId":-6,
				"paymentTypeID": paymentMethodId,
				"payerID": accountId,
				"payeeID" : payeeId,
				"accountID":accountId,
				"amount":payAmount
			}
			var obj=JSON.stringify(TblPayment);
			$('#popupWindow').dialog('close');
			$.ajax({
				
				type : "POST",
				url : "Banking.do?tabid=Transferfund",			
				data :"payment=" + obj + "&date=" + date,
			    success : function(data) {
					debugger;
				
					/* window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking"; */
					updatebankingTab(data);
				},
				 error : function(data) {
					/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
					return errorMessageDialog();
				} 
			});
			
}
function addTransactionFromDialogForPayment()
{
	debugger; 
	var pType = document.getElementById("payMethodForDlgForPayment");
	this.paymentMethod =  pType.options[pType.selectedIndex].value;
	if(paymentMethod == 'Check')
		{
			if(document.getElementById("checkNumForDlgForPayment").value == '0' || document.getElementById("checkNumForDlgForPayment").value == '')
			{
				//alert("please enter a valid check number");
				return selectValidNumberDialog();
				return false;
			}
		}	
			var payerBalance  = parseFloat(document.getElementById("payerBalance").value);
			var payeeBalance = parseFloat(document.getElementById("payeenameForPayment").value);
			var payAmount = parseFloat(document.getElementById("payAmountForPayment").value);
			if(payAmount > payerBalance)
				{
					//alert("Insufficient Balance please enter a valid amount")
					return showInsufficientBalanceDialog();
					return false;
				}
			var checkNum = document.getElementById("checkNumForDlgForPayment").value;
			var date = document.getElementById("dlgDateForPayment").value;
			var AccountCategoryId = document.getElementById("categoryIdForPayerForPayment").value;
			var categoryIdString =  document.getElementById("category");
			var categoryId = categoryIdString.options[categoryIdString.selectedIndex].id;
			var TblPayment = {
				"fromBalance":payerBalance ,
				 "toBalance": payeeBalance, 
				"checkNumber": checkNum,
				"accountCategoryId":AccountCategoryId,
				"paymentTypeID": paymentMethodId,
				"payerID": accountId,
				"payeeID" : payeeId,
				"accountID":accountId,
				"amount":payAmount,
				"categoryId":categoryId
			}
			var obj=JSON.stringify(TblPayment);
			$('#popupWindow').dialog('close');
			$.ajax({
				
				type : "POST",
				url : "Banking.do?tabid=TransferfundFromPayment",			
				data :"payment=" + obj + "&date=" + date + "&index=" + Index,
			    success : function(data) {
					debugger;
				
					/* window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking"; */
					updatebankingTab(data);
				},
				 error : function(data) {
					/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
					return errorMessageDialog();
				} 
			});
}
function addTrafsactioFromDeposit()
{
	debugger;
	var pType = document.getElementById("payMethodForDeposit");
	this.paymentMethod =  pType.options[pType.selectedIndex].value;
	var paymentMethodId = pType.options[pType.selectedIndex].id;
	if(paymentMethod == 'Check')
		{
			if(document.getElementById("checkNumForDeposit").value == '0' || document.getElementById("checkNumForDeposit").value == '')
			{
				//alert("please enter a valid check number");
				return selectValidNumberDialog();
				return false;
			}
		}	
	var payerBalance  = parseFloat(document.getElementById("payerBalanceForDeposit").value);
	var payerName = document.getElementById("payerForDeposit");
	var payerId = payerName.options[payerName.selectedIndex].id;
	var accountTypeId = payerName.options[payerName.selectedIndex].label;
	var payeeName = document.getElementById("payeenameForDeposit");
	var payeeId = payeeName.options[payeeName.selectedIndex].id;
	var payeeBalance = parseFloat(document.getElementById("payeeBalanceForDeposit").value);
	var payAmount = parseFloat(document.getElementById("payAmountForDeposit").value);
	
	if(payAmount > payerBalance)
	{
		//alert("Insufficient Balance please enter a valid amount")
		return showInsufficientBalanceDialog();
		return false;
	}
	var checkNum = document.getElementById("checkNumForDeposit").value;
	var date = document.getElementById("dateForDeposit").value;
	var categoryIdString =  document.getElementById("categoryForDeposit");
	var categoryId = categoryIdString.options[categoryIdString.selectedIndex].id;
	
	var TblPayment = {
			"fromBalance":payerBalance ,
			 "toBalance": payeeBalance, 
			"checkNumber": checkNum,
			/* "accountCategoryId":AccountCategoryId, */
			"paymentTypeID": paymentMethodId,
			"payerID": payerId,
			"payeeID" : payeeId,
			"amount":payAmount,
			"categoryId":categoryId,
			"accountTypeId":accountTypeId
		}
	var obj=JSON.stringify(TblPayment);
	$('#popupWindow').dialog('close');
	$.ajax({
		
		type : "POST",
		url : "Banking.do?tabid=TransferfundFromDeposit",			
		data :"payment=" + obj + "&date=" + date,
	    success : function(data) {
			debugger;
		
			/* window.location = "${pageContext.request.contextPath}/Banking.do?tabid=Banking"; */
			updatebankingTab(data);
		},
		 error : function(data) {
			/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
			return errorMessageDialog();
		} 
	});
}
function updatebankingTab(data)
{
	debugger;
	$(document).find('div#selectedAccount h4').replaceWith($(data).find('div#selectedAccount').html()); 
	$(document).find('div#transactionTable table').replaceWith($(data).find('div#transactionTable').html());
	if($(data).find('div#bottom label').eq(1).text(this.value).text() == "")
	{
		$(document).find('div#bottom label').eq(1).text(this.value).replaceWith("<label class='text-right float-right' id='totalLabel'>"+0.00+"</label>");
	}
	else
	{	
		$(document).find('div#bottom label').eq(1).text(this.value).replaceWith($(data).find('div#bottom label').eq(1).text(this.value));
	}	
	$(document).find('div#firstTable table').replaceWith($(data).find('div#firstTable').html());
	$(document).find('div#secondTable table').replaceWith($(data).find('div#secondTable').html());
	$(document).find('div#thirdTable table').replaceWith($(data).find('div#thirdTable').html());
	$(document).find('div#fourthTable table').replaceWith($(data).find('div#fourthTable').html());
	$(document).find('div#fifthTable table').replaceWith($(data).find('div#fifthTable').html());
	$(document).find('div#sixthTable table').replaceWith($(data).find('div#sixthTable').html());
	$(document).find('div#editTable1 table').replaceWith($(data).find('div#editTable1').html());
	$(document).find('div#editTable2 table').replaceWith($(data).find('div#editTable2').html());
	/* updateTree(); */ 
	addCss();
}
$( ".rangeOP" ).change(function() {
	   debugger;  
	   var rangeType = document.getElementById("rangeId");
	   if(acID == '-1')
	{
		   acID = '56933';
	}
	   var range = rangeType.options[rangeType.selectedIndex].value;
	   var transactionFilterType = document.getElementById("transactionFilterId");
	   var transactionFilterId = transactionFilterType.options[transactionFilterType.selectedIndex].value;
		  $.ajax({
				
				type : "POST",
			 	url : "Banking.do?tabid=slectedMenu&SelectedRange=" + range,
			 	data:"Ac=" +acID + "&TransactionRange=" + transactionFilterId,		
			    success : function(data)
			    {debugger;
			
			    updatebankingTab(data);
					 
				},
				 error : function(data) {
					/* alert("<bean:message key='BzComposer.common.erroroccurred'/>"); */
					return errorMessageDialog();
				} 
	  
	 });
});
$( ".transactionFilter" ).change(function() {
	   debugger;  
	   var rangeType = document.getElementById("rangeId");
	   var transactionFilterType = document.getElementById("transactionFilterId");
	   var transactionFilterId = transactionFilterType.options[transactionFilterType.selectedIndex].value;
	   if(acID == '-1')
	{
		   acID = '56933';
	}
	   var range = rangeType.options[rangeType.selectedIndex].value;
		  $.ajax({
				
				type : "POST",
				url : "Banking.do?tabid=slectedMenu&SelectedRange=" + range,
			 	data:"Ac=" +acID + "&TransactionRange=" + transactionFilterId,
			    success : function(data)
			    {debugger;
			
			    updatebankingTab(data);
					 
				},
				 error : function(data) {
					//alert("<bean:message key='BzComposer.common.erroroccurred'/>");
					return errorMessageDialog();
				} 
	  
	 });
})
function errorMessageDialog()
{
	debugger;
	event.preventDefault();
	$("#errorMessageDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectValidNumberDialog()
{
	debugger;
	event.preventDefault();
	$("#selectValidNumberDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectBankAccountDialog()
{
	debugger;
	event.preventDefault();
	$("#selectBankAccountDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showInsufficientBalanceDialog()
{
	debugger;
	event.preventDefault();
	$("#showInsufficientBalanceDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showInsufficientAmountDialog()
{
	debugger;
	event.preventDefault();
	$("#showInsufficientAmountDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectPaymentDialog()
{
	debugger;
	event.preventDefault();
	$("#selectPaymentDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectTransactionDialog()
{
	debugger;
	event.preventDefault();
	$("#selectTransactionDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectotherbankdialog()
{
	debugger;
	event.preventDefault();
	$("#selectotherbankdialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function editableaccountcategorydialog()
{
	debugger;
	event.preventDefault();
	$("#editableaccountcategorydialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function canteditesalesbankaccountdialog()
{
	debugger;
	event.preventDefault();
	$("#canteditesalesbankaccountdialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showselectcategorydialog()
{
	debugger;
	event.preventDefault();
	$("#showselectcategorydialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function shownotdeletedaccountdialog()
{
	debugger;
	event.preventDefault();
	$("#shownotdeletedaccountdialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function shostartingaccbalancedialog()
{
	debugger;
	event.preventDefault();
	$("#shostartingaccbalancedialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showremovetranactiondialog()
{
	debugger;
	event.preventDefault();
	$("#showremovetranactiondialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            },
            "<bean:message key='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}
</script>
</body>
</html>
<!-- Dialog box used in this page -->
<div id="errorMessageDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.erroroccured"/></p>
</div>
<div id="selectValidNumberDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.entervalidchecknumber"/></p>
</div>
<div id="selectBankAccountDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.selectbankaccount"/></p>
</div>
<div id="showInsufficientBalanceDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.entervalidamount"/></p>
</div>
<div id="showInsufficientAmountDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.insuffientamountinaccount"/></p>
</div>
<div id="selectPaymentDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.selectpayment"/></p>
</div>
<div id="selectTransactionDialog" style="display:none;">
	<p><bean:message key="BzComposer.banking.selecttransaction"/></p>
</div>
<div id="selectotherbankdialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.selectotherbank'/></p>
</div>
<div id="editableaccountcategorydialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.canteditaccountcategory'/></p>
</div>
<div id="canteditesalesbankaccountdialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.canteditesalesbankaccount'/></p>
</div>
<div id="showselectcategorydialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.selectcategory'/></p>
</div>
<div id="shownotdeletedaccountdialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.selectcategory'/></p>
</div>
<div id="showremovetranactiondialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.removetransaction'/></p>
</div>
<div id="shostartingaccbalancedialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.startingaccountbalance'/></p>
</div>
<div id="deleteaccountdialog" style="display:none;">
	<p><bean:message key='BzComposer.banking.wanttodeleteaccount'/></p>
</div>