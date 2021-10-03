<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.nxsol.bizcomposer.common.TblVendorDetail"%>
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
<title><bean:message key="BzComposer.billpayabletitle"/></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!--  Here Is the context path -->
<script>
	var ctx = "${pageContext.request.contextPath}";
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable {
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
<body>
	<div id="ddcolortabsline">&nbsp;</div>
	<html:form action="BillPayable.do?" method="post" styleId="billPayableForm">
		<div class="content1 clearfix">
			<h3 class="title1">
				<bean:message key="BzComposer.billpayable.billpayabletitle"/>
			</h3>
			<div class="border1  clearfix">
				<form>
					<div class="row">
						<div class="col-md-4">
							<label>
								<bean:message key="BzComposer.billpayable.billnumber"/>
							</label> 
							<label id="ordernumber"> </label>
							<div class="form-group row">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.payee"/>
								</label>
								<div class="col-md-8">
									<select class="form-control devCutNameDrp" id="customerName">
										<%
											ArrayList<ClientVendor> cvListForBill = (ArrayList) request.getAttribute("cvForCombo");
												for (int i = 0; i < cvListForBill.size(); i++) {
										%>
										<option value="<%=cvListForBill.get(i).getCvID()%>">
											<%
												out.println(cvListForBill.get(i).getLastName() + " " + cvListForBill.get(i).getFirstName() + "("
																+ cvListForBill.get(i).getName() + ")");
											%>
										</option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.payfrom"/>
								</label>
								<div class="col-md-8">
									<select class="form-control devReceivedTypeDrp"
										id="receivedType" onclick="checkType()">
										<%
											ArrayList<TblAccount> accountForBill = (ArrayList) request.getAttribute("accountListForBill");
												for (int i = 1; i < accountForBill.size(); i++) {
										%>
										<option value="<%=accountForBill.get(i).getAccountID()%>" label="<%=accountForBill.get(i).getCustomerCurrentBalance() %>">
											<%
												out.println(accountForBill.get(i).getName());
											%>
										</option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.amount"/>
								</label>
								<div class="col-md-8">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">
												<bean:message key="BzComposer.billpayable.dollersign"/>
											</span>
										</div>
										<label style="padding-left: 10px" id="devAmount" class="form-control"></label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.paymentamount"/>
								</label>
								<div class="col-md-8">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">
												<bean:message key="BzComposer.billpayable.dollersign"/>
											</span>
										</div>
										<input type="text" class="form-control devReceiveAmount"
											value="" width="20px" id="receivedAmount">
									</div>
								</div>
							</div>
							<div class="form-group row" id="Check">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.checknumber"/>
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
									<bean:message key="BzComposer.billpayable.date"/>
								</label>
								<%--  <html:text property="orderDate" readonly="false"></html:text>  --%>
								<div class="col-md-8 calendar-img">
									<input type="text" class="form-control devOrderDate" value=""
										style="width: 275px" name="orderDate" readonly="true"
										id="orderDate"> <img
										src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
										class="img-fluid" alt="Responsive image"
										onclick="displayCalendar(document.ReceivableListForm.orderDate,'mm-dd-yyyy',this);">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.category"/>
								</label>
								<div class="col-md-8">
									<select class="form-control devCategoryDrp" size="1"
										id="categoryId">
										<%
											ArrayList<TblCategory> categoryList = (ArrayList) request.getAttribute("categoryListForCombo");
												for (int i = 1; i < categoryList.size(); i++) {
										%>
										<option value="<%=categoryList.get(i).getId()%>">
											<%
												out.println(categoryList.get(i).getName() + " " + categoryList.get(i).getCategoryNumber());
											%>
										</option>
										<%
											}
										%>

									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-4  col-form-label">
									<bean:message key="BzComposer.billpayable.paymentstatus"/>
								</label>
								<div class="col-md-8">
									<select class="form-control paymentOP" size="1" id="payStatus">
										<option value="Unpaid"><bean:message key="BzComposer.billpayable.unpaid"/></option>
										<option value="Paid"><bean:message key="BzComposer.billpayable.paid"/></option>
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
							<div class="form-group">
								<a class="btn btn-info btn2" onclick="return save()" style="color:white">
									<bean:message key="BzComposer.global.save"/>
								</a>
							</div>
							<div class="form-group">
								<a class="btn btn-info btn2" onclick="return clearTransaction()"  style="color:white">
									<bean:message key="BzComposer.billpayable.cleartransactionbtn"/>
								</a>
							</div>
							<div class="form-group">
								<a class="btn btn-info btn2" onclick="return makePayment()" style="color:white">
									<bean:message key="BzComposer.billpayable.makepaymentbtn"/>
								</a>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="content-tabs">
				<nav>
					<div class="nav nav-tabs" id="tabId" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" 
						role="tab" aria-controls="nav-home" aria-selected="true">
							<bean:message key="BzComposer.billpayable.tabs.unpaidbilllist"/>
						</a> 
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" 
						role="tab" aria-controls="nav-profile" aria-selected="false" onclick="paidBillLists()">
							<bean:message key="BzComposer.billpayable.tabs.paibilllist"/>
						</a> 
						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" 
						role="tab" aria-controls="nav-contact" aria-selected="false" onclick="billCreationTab()">
							<bean:message key="BzComposer.billpayable.tabs.billcreation"/>
						</a>
					</div>
				</nav>
				<div class="unpaid">
					<div class="unpaid-header">
						<h5 class="unpaid-header-title">
							<bean:message key="BzComposer.billpayable.findpayees"/>
						</h5>
						<div class="unpaid-right" id="totalAmountLabelDiv">
							<ul>
								<li>
									<label>
										<bean:message key="BzComposer.billpayable.total"/> 
									</label>
								<%ArrayList<TblVendorDetail> unpaidBillList1 = (ArrayList) request.getAttribute("unpaidBillList"); %>
									<label>
										<%-- <% out.println(unpaidBillList1.get(unpaidBillList1.size() - 1).getTotalBillAmount()); %> --%>
									</label>
								</li>
								<li>
									<a class="btn btn-info btn2" style="color:white">
										<bean:message key="BzComposer.billpayable.payandprintbtn"/>
									</a>
								</li>
								<li>
									<a onclick="AddPayee()" class="btn btn-info btn2" style="color:white">
										<bean:message key="BzComposer.billpayable.addpayeebtn"/>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="table1" id="tblForInvoiceOrder">
								<table class="table table-bordered table-sm devAcRecDataTbl">
									<thead class="thead-light">
										<tr>
											<th scope="col"><bean:message key="BzComposer.ComboBox.Select"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.billno"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.payee"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.duedate"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.paidamount"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.amttopay"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.amount"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.global.memo"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.global.type"/></th>
											<th scope="col" class="text-right"><bean:message key="BzComposer.billpayable.status"/></th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<TblVendorDetail> unpaidBillList = (ArrayList) request.getAttribute("unpaidBillList");
												int index = 1;
												for (int i = 0; i < unpaidBillList.size(); i++) {
										%>
										<tr
											onclick="selectrow(<%=unpaidBillList.get(i).getBillNo() + "," + index%>)">
											<td class="text-right"><input type="checkbox"
												id="Checkbox"></td>
											<td class="text-right">
												<%
													out.println(unpaidBillList.get(i).getBillNo());
												%>
											</td>
											<td class="text-right" value="<%=unpaidBillList.get(i).getVendorId()%>"><% out.println(unpaidBillList.get(i).getVendorName());%></td>
											<td class="text-right"><% out.println(unpaidBillList.get(i).getDueDate()); %></td>
											<td class="text-right"><% out.println(unpaidBillList.get(i).getAmountPaid());%></td>
											<td class="text-right"><% out.println(unpaidBillList.get(i).getAmountTopay()); %></td>
											<td class="text-right"><% out.println(unpaidBillList.get(i).getAmount());%></td>
											<td class="text-right"><% out.println(unpaidBillList.get(i).getMemo());%></td>
											<td class="text-right"><% out.println("Bill");%></td>
											<td class="text-right"><%out.println(unpaidBillList.get(i).getStatus());%></td>
											<td hidden="bankID" value = "<%= unpaidBillList.get(i).getPayerId() %>"></td>
											<td hidden="check" value = "<%= unpaidBillList.get(i).getCheckNo() %>"></td>
											<td hidden="creditUsed" value = "<%= unpaidBillList.get(i).getCreditUsed() %>"></td>
										</tr>
										<%
											index++;
												}
										%>
									</tbody>
								</table>
							</div>
							<div class="footerForCreatingRecurrent">
							<a class="btn btn-info btn1" id="CreatingEditingRecurrentPaymentId" style="color:white">
								<bean:message key="BzComposer.billpayable.creatinrecurringpaymentbtn"/>
							</a>
							</div>
							<div class="footer1">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="inlineCheckbox2" 
									value="option1"> 
									<label class="form-check-label" for="inlineCheckbox2">
										<bean:message key="BzComposer.billpayable.selectall"/>
									</label>
								</div>
								<a class="btn btn-info btn1" onclick="billingInfo()" style="color:white">
									<bean:message key="BzComposer.billpayable.createbillbtn"/>
								</a>
								<button class="btn btn-info btn1" onclick="return deleteBill()">
									<bean:message key="BzComposer.billpayable.deletebillbtn"/>
								</button>
								<a class="btn btn-info btn1" id="PaybillId"  style="color:white">
									<bean:message key="BzComposer.billpayable.paybillsbtn"/>
								</a>
								<a class="btn btn-info btn1" id="MemorizeBillId" style="color:white">
									<bean:message key="BzComposer.billpayable.memorizebillbtn"/>
								</a>
								<a class="btn btn-info btn1" id="MemorizeTransactionListId" style="color:white">
									<bean:message key="BzComposer.billpayable.memorizetransactionlistbtn"/>
								</a> 
							</div>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">...</div>
						<div class="tab-pane fade" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">...</div>
					</div>
				</div>
			</div>
		</div>
<div class="container-fluid" id="ScheduleMemorizedTransaction" class="">                                   <!--    Here is the AddAccount dialog started -->
	<div class="table-responsive memorized-popup" style="padding:0 15px">
		<div class="row form-group">  
		   <div class="col-md-12 form-inline">
			   	<div class="form-group">
				   	<label>
				   		<bean:message key="BzComposer.billpayable.nameoftransaction"/> 
				   		&nbsp;
			   		</label> 
				   	<input class="form-control" type="text" id="nameOfTransaction"/>   
			   </div>
		   </div>
	   	</div>
	   <div class="row form-group">
	   		<div class="col-md-4">
	   			<div class="form-check col-form-label">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="remindMe" value="0" checked="checked" onclick="remindMe()">
				  <label class="form-check-label" for="exampleRadios1">
				    <bean:message key="BzComposer.billpayable.remindme"/>
				  </label>
				</div>
			</div>		
			 <div class="col-md-8 ">
			  	<div class="row">
			  		<label class="col-sm-5 col-form-label">
			  			<bean:message key="BzComposer.billpayable.howoften"/>  
			  			&nbsp;
		  			</label>
			  		<div class="col-sm-6"><select class="form-control howOften" id="howOften">
			  			<option value="Never">Never</option>
			  			<option value="Daily">Daily</option>
			  			<option value="Weekly">Weekly</option>
			  			<option value="Monthly">Monthly</option>
			  			<option value="Quarterly">Quarterly</option>
			  			<option value="Annualy">Annualy</option>
			  		</select></div>
			  	</div>
			</div>		
		</div>
		
		<div class="row form-group">
	   		<div class="col-md-4">
	   			<div class="form-check col-form-label">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="dontRemindMe" value="1"  onclick="dontRemindMe()">
				  <label class="form-check-label" for="exampleRadios2">
				    <bean:message key="BzComposer.billpayable.dontremindme"/>
				  </label>
				</div>
			</div>		
			 <div class="col-md-8 ">
			  	<div class="row">
			  		<label class="col-sm-5 col-form-label">
			  			<bean:message key="BzComposer.billpayable.nextdate"/>  
			  			&nbsp;
		  			</label>
			  		<div class="col-sm-6 d-flex"><input type="text" class="form-control schrduleMemorizedTransactionDate" id="schrduleMemorizedTransactionDate">
			  		<div class="input-group-append input-group-append1">
						 <a class="input-group-text" href="#">&#9662;</a>
					</div></div>
			  	</div>
			</div>		
		</div>
		
		<div class="row form-group">
	   		<div class="col-md-4">
	   			<div class="form-check col-form-label">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="automaticEnter" value="2" onclick="automaticEnter()">
				  <label class="form-check-label" for="exampleRadios3">
				    <bean:message key="BzComposer.billpayable.automaticallyenter"/>
				  </label>
				</div>
			</div>		
			 <div class="col-md-8" >
			  	<div class=" row" >
			  		<label class="col-sm-5  col-form-label">
			  			<bean:message key="BzComposer.billpayable.numberremaining"/>  
			  			&nbsp;
		  			</label>
			  		<div class="col-sm-6"><input type="text" class="form-control" id="numberRemaining"></div>
			  	</div>
			</div>		
		</div>
		
		<div class="row form-group">
	   		<div class="col-md-4">
	   			<div class="form-check col-form-label">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="withTransactionGroup" value="3" onclick="withTransactionGroup()">
				  <label class="form-check-label" for="exampleRadios3">
				    <bean:message key="BzComposer.billpayable.withtransactioningroup"/>
				  </label>
				</div>
			</div>		
			 <div class="col-md-8 " >
			  	<div class=" row">
			  		<label class="col-sm-5 col-form-label">
			  			<bean:message key="BzComposer.billpayable.daysinadvancetoenter"/>  
			  			&nbsp;
		  			</label>
			  		<div class="col-sm-6"><input type="text" class="form-control" id="daysInAdvanceToEnter"></div>
			  	</div>
			</div>		
		</div>
		
		<div class="row">
	   		<div class="col-md-4">
			</div>		
			 <div class="col-md-8 " >
			  	<div class="row">
			  		<label class="col-sm-5 col-form-label">
			  			<bean:message key="BzComposer.billpayable.transactiongroup"/>  
			  			&nbsp;
		  			</label>
			  		<div class="col-sm-6"><select class="form-control" id="transactionGroup">
			  		</select></div>
			  	</div>
			</div>		
		</div>
	   	<div class="bzbtn text-right mt-4">
			<button type="button" class="btn btn-success" onclick="return ScheduleMemorizedTransactionOkay()" 
			id="deleteBank">
				<bean:message key="BzComposer.global.ok"/>
			</button>	
			<button type="button" class="btn btn-success" onclick="return addAccount()" 
			id="addButtonForDeposit">
				<bean:message key="BzComposer.global.cancel"/>
			</button>
	  	</div> 
	</div>
</div>
<div class="container-fluid" id="PayBills">                                   <!--    Here is the AddAccount dialog started -->
<div class="table-responsive PayBills-popup" style="padding:0 15px">
	<h4 class="popup-title1">
		<bean:message key="BzComposer.billpayable.selectbilltopay"/>
	</h4>
	<div class="row">
		<div class="col-md-8">
			<div class="row ">
				<label class="col-md-2 col-form-label">
					<bean:message key="BzComposer.billpayable.showbills"/>
				</label>
				<div class="col-md-4">
					<div class="form-check col-form-label">
					  <input class="form-check-input" type="radio" name ="exampleRadios2" id="exampleRadios2" value="option1" checked>
					  <label class="form-check-label" for="exampleRadios2">
					    <bean:message key="BzComposer.billpayable.dueonorbefore"/>
					  </label>
					</div>
				</div>
				<div  class="col-md-5">
					<div class="d-flex"><input type="text" class="form-control" id="payBillsDate">
				  		<div class="input-group-append input-group-append1">
							 <a class="input-group-text" href="#">&#9662;</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-md-2 col-form-label"></label>
				<div class="col-md-4">
					<div class="form-check col-form-label">
					  <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios3" value="option1" >
					  <label class="form-check-label" for="exampleRadios3">
					    <bean:message key="BzComposer.billpayable.showallbills"/>
					  </label>
					</div>
				</div>
				<div  class="col-md-5">
				</div>
			</div>
		</div>
		<div class="col-md-4 form-inline align-items-start">
			<label class="col-form-label">
				<bean:message key="BzComposer.billpayable.sortbillsby"/> 
				&nbsp;
			</label>
			<select class="form-control">
				<option value="Due Date"><bean:message key="BzComposer.billpayable.duedate"/></option>
				<option value="Vendor"><bean:message key="BzComposer.billpayable.vendor"/></option>
				<option value="Amount Due"><bean:message key="BzComposer.billpayable.amountdue"/></option>
			</select>
		</div>
	</div>	
	<div class="table1 popup-table1 mb-2 payBillsTableDiv">
	<table class="table table-bordered table-sm">
		<thead class="thead-light">
		<tr>
			<th><bean:message key="BzComposer.ComboBox.Select"/></th>
			<th><bean:message key="BzComposer.billpayable.billnumber"/></th>
			<th><bean:message key="BzComposer.billpayable.duedate"/></th>
			<th><bean:message key="BzComposer.billpayable.vendor"/></th>
			<th><bean:message key="BzComposer.billpayable.amtdue"/></th>
			<th><bean:message key="BzComposer.billpayable.creditused"/></th>
			<th><bean:message key="BzComposer.billpayable.amttopay"/></th>
			<th><bean:message key="BzComposer.billpayable.payfrom"/></th>
		</tr>
		</thead>
		<tbody>
		<% ArrayList<TblVendorDetail> payBillList = (ArrayList)request.getAttribute("payBillList");
		   for(int i=0;i<payBillList.size();i++)
		   {	   
		%>
			<tr>
				<td><input type="checkbox"></td>
				<td><% out.println(payBillList.get(i).getBillNo()); %></td>
				<td><% out.println(payBillList.get(i).getDueDate()); %></td>
				<td><% out.println(payBillList.get(i).getVendorName()); %></td>
				<td><% out.println(payBillList.get(i).getAmount()); %></td>
				<td><% out.println(payBillList.get(i).getCreditUsed()); %></td>
				<td><% out.println(payBillList.get(i).getAmountTopay()); %></td>
				<td><% out.println(payBillList.get(i).getBankAccount()); %></td>
				
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
	<div class="mb-3">
		<button type="button" class="btn btn-success">
			<bean:message key="BzComposer.billpayable.selectallbillsbtn"/>
		</button>	
	</div>
	<h4 class="popup-title1">
		<bean:message key="BzComposer.billpayable.creditinformation"/>
	</h4>
	
	  <div class=" row">
	    <label for="staticEmail" class="col-sm-3 col-form-label">
	    	<bean:message key="BzComposer.billpayable.numberofcredits"/>
    	</label>
	    <div class="col-sm-3">
	      <input type="text" readonly class="form-control-plaintext  text-right" id="staticEmail" value="0">
	    </div>
	  </div>
	  
	  <div class="form-group row">
	    <label for="staticEmail" class="col-sm-3 col-form-label">
	    	<bean:message key="BzComposer.billpayable.totalcreditsavailable"/>
    	</label>
	    <div class="col-sm-3">
	      <input type="text" readonly class="form-control-plaintext text-right" id="staticEmail" value="0.00">
	    </div>
	    <div class="col-sm-3">
	    	<button type="button" class="btn btn-success">
	    		<bean:message key="BzComposer.billpayable.setcreditsbtn"/>
    		</button>
	    </div>
	  </div>
	  <div class="row">
	  	<div class="col-md-5">
	  		<label>
	  			<bean:message key="BzComposer.billpayable.paymentaccount"/>
  			</label>
	  		<select class="form-control mb-2">
	  			<option value="Chase Bank">
	  				<bean:message key="BzComposer.billpayable.chasebank"/>
  				</option>
	  		</select>
	  		<div class="form-group row">
	  			<label for="staticEmail" class="col-sm-6 col-form-label">
	  				<bean:message key="BzComposer.billpayable.endingbalance"/>
  				</label>
			    <div class="col-sm-6">
			      <input type="text" readonly class="form-control-plaintext text-right" id="staticEmail" value="1177.23">
			    </div>
	  		</div>
	  	</div>
	  	<div class="col-md-4">
	  		<label>
	  			<bean:message key="BzComposer.billpayable.paymentmethod"/>
  			</label>
	  		<select class="form-control mb-2">
	  			<option value="Check"><bean:message key="BzComposer.billpayable.check"/></option>
	  		</select>
	  	</div>
	  	<div class="col-md-3">
	  		<label>
	  			<bean:message key="BzComposer.billpayable.paymentdate"/>
  			</label>
	  		<div class="d-flex"><input type="text" class="form-control">
		  		<div class="input-group-append input-group-append1">
					 <a class="input-group-text" href="#">&#9662;</a>
				</div>
			</div>
	  	</div>
	  </div>
	<div class="bzbtn text-right">
		<button type="button" class="btn btn-success" onclick="return deleteBankAccount()" id="deleteBank">
			<bean:message key="BzComposer.billpayable.payselectedbillsbtn"/>
		</button>
		<button type="button" class="btn btn-success" onclick="return editTransaction()" id="addButtonForDeposit">
			<bean:message key="BzComposer.global.cancel"/>
		</button>
	</div> 
</div>
</div> 
<div class="container-fluid" id="MemorizeTransactionList">                                   <!--    Here is the AddAccount dialog started -->
<div class="table-responsive" style="padding:0 15px" id="MemTraList">
 <table class="table" id="MemorizetranId">
    <thead>
      <tr>
       <th></th>
        <th><bean:message key="BzComposer.billpayable.transactionname"/></th>
        <th><bean:message key="BzComposer.billpayable.sourceaccount"/></th>
        <th><bean:message key="BzComposer.billpayable.amount"/></th>
        <th><bean:message key="BzComposer.billpayable.frequency"/></th>
        <th><bean:message key="BzComposer.billpayable.auto"/></th>
        <th><bean:message key="BzComposer.billpayable.nextdate"/></th>
      </tr>
    </thead>
    <tbody>
    <% ArrayList<TblVendorDetail> getMemorizeTransactionList = (ArrayList)request.getAttribute("getMemorizeTransactionList");
    	int memTransIndex = 1;
    	for(int i=0;i<getMemorizeTransactionList.size();i++)
    	{	
    %>
      <tr onclick="selectMemorizedTransactionList(<%=memTransIndex %>)">
        <td><input type="checkbox"></td>
        <td hidden="billNo"><% out.println(getMemorizeTransactionList.get(i).getBillNo()); %></td>
        <td><% out.println(getMemorizeTransactionList.get(i).getTransactionName()); %></td>
        <td><% out.println(getMemorizeTransactionList.get(i).getBankAccount()); %></td>
        <td><% out.println(getMemorizeTransactionList.get(i).getAmount()); %></td>
        <td value="<%=getMemorizeTransactionList.get(i).getRecurringPeriod()%>"><% out.println(getMemorizeTransactionList.get(i).getRecurringPeriod()); %></td>
        <% if(getMemorizeTransactionList.get(i).getRemindOption() == 2) {%>
        <td value="<%= getMemorizeTransactionList.get(i).getRemindOption() %>"><% out.println("Yes");%></td>
        <% } else { %>
        <td value="<%= getMemorizeTransactionList.get(i).getRemindOption() %>"><% out.println("No");%></td>
        <% } %>
         <td><% out.println(JProjectUtil.getdateFormat().format(getMemorizeTransactionList.get(i).getNextDate())); %></td> 
       <td hidden="howOften"><% out.println(getMemorizeTransactionList.get(i).getHowOften()); %></td>
        <td hidden="recurringPeriod"><% out.println(getMemorizeTransactionList.get(i).getRecurringPeriod()); %></td>
        <td hidden="recurringNumber"><% out.println(getMemorizeTransactionList.get(i).getRecurringNumber()); %></td>
        <td hidden="dayInAdvance"><% out.println(getMemorizeTransactionList.get(i).getDaysInAdvanceToEnter()); %></td>
      </tr>
      <%memTransIndex ++; } %>
    </tbody>
  </table>
  
  <!-- <div class="memorizedbutton">
  <ul>
  <li><button >Add</button></li>
  <li><button onclick="EditMemorizedTransactionList()">Edit</button></li>
  <li><button onclick="DeleteMemorizeTransaction()">Delete</button></li>
  <li><button>Close</button></li>
    
  </ul>
    </div> -->
  
  </div>
  <div class="memorizedbutton">
  <ul>
  <li><button><bean:message key="BzComposer.global.add"/></button></li>
  <li><button onclick="EditMemorizedTransactionList()"><bean:message key="BzComposer.global.edit"/></button></li>
  <li><button onclick="DeleteMemorizeTransaction()"><bean:message key="BzComposer.global.delete"/></button></li>
  <li><button><bean:message key="BzComposer.global.close"/></button></li>
    
  </ul>
    </div>
 </div> 
 <div class="container-fluid" id="CreatingEditingRecurrentPaymentDlgId">                                   <!--    Here is the AddAccount dialog started -->
<div class="table-responsive" style="padding:0 15px">
<div class="row">  
   <div class="col-md-12">
   	<div class="inline-form">
   	<label>
   		<bean:message key="BzComposer.billpayable.nameoftransaction"/>
	</label> 
   	<div><input type="text"/></div>   
   </div>
   </div>
   </div>
   <div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdoInvoiceOrder" value="option1" 
	  checked="checked">
	<label class="form-check-label" for="inlineRadio1">
	  	<bean:message key="BzComposer.billpayable.invoiceorder"/>
	</label>
	</div>		
 
   <div class="bzbtn text-center">
  	<button type="button" class="btn btn-success" onclick="return deleteBankAccount()" id="deleteBank">
  		<bean:message key="BzComposer.global.delete"/>
	</button>	
  	<button type="button" class="btn btn-success" onclick="return addAccount()" id="addButtonForDeposit">
  		<bean:message key="BzComposer.global.save"/>
	</button>
  <!-- <button type="button" class="btn btn-success" onclick="return addAccount()" id="EditButtonForDeposit">Save</button> -->
  	<button type="button" class="btn btn-success" onclick="return editTransaction()" id="addButtonForDeposit">
  		<bean:message key="BzComposer.global.cancel"/>
	</button>
  </div> 
  </div>
 </div> 
	</html:form>
	<script type="text/javascript">
	var billNo = -1;
	var index = -1;
	var amountToBepaid = 0.00;
	var vendorName;
	var vendorId = -1;
	var scheduleTransactionRadioButtonValue = 0;
	var indexForMemTransList = -1;
	function selectrow(no , indexNumber)
	{
		debugger;
		this.billNo = no;
		this.index = indexNumber;
		
		 $("#ordernumber").text($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(2)').text());
		 $("select.devCutNameDrp").val($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(3)').attr('value'));
		 $(".devReceiveAmount").val($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(6)').text());
		 $("#devAmount").text($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(7)').text());
		 $("#memo").val($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(8)').text());
		 $("select.devReceivedTypeDrp").val($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(11)').attr('value'));
		 $(".devOrderDate").val($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(4)').text());
		 if($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(12)').attr('value') != 'null' || $('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(12)').attr('value') != '')
		{
			 $(".devCheck").val($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(12)').attr('value'));
		}
		 this.vendorName = $('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(3)').text();
		 this.vendorId = $('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(3)').attr('value');
		 document.getElementById("nameOfTransaction").value = vendorName; 
		 $('#transactionGroup').append('<option value="'+vendorName+'" selected="selected">'+vendorName+'</option>');
	}
	function selectMemorizedTransactionList(memTransListIndex)
	{
		debugger;
		this.indexForMemTransList = memTransListIndex;
		this.billNo = $('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(2)').text();
		var name = $('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(3)').text();
		document.getElementById("nameOfTransaction").value = name;
		if($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(7)').attr('value') == '2')
		{
			$("#automaticEnter").prop('checked',true);
			automaticEnter();
			$("#numberRemaining").val($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(11)').text());
			$("#daysInAdvanceToEnter").val($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(12)').text());
		}
		else if($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(7)').attr('value') == '0')
		{
			$("#remindMe").prop('checked',true);
			remindMe();
		}
		else if($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(7)').attr('value') == '1')
		{
			$("#dontRemindMe").prop('checked',true);
			dontRemindMe();
		}
		else if($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(7)').attr('value') == '3')
		{
			$("#withTransactionGroup").prop('checked',true);
			withTransactionGroup();
		}
		$("select.howOften").val($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(6)').attr('value'));
		var dateString = $('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(8)').text();
		var day = new Date(dateString).getDay();
		var dName = dayName(day);
		var date = dName + " " + dateString;
		$("#schrduleMemorizedTransactionDate").val(date);
		$('#transactionGroup').append('<option value="'+name+'" selected="selected">'+name+'</option>');
	}
	function save()
	{
		debugger;
		var billNo = document.getElementById("ordernumber").innerHTML;
		var payerIdSelect = document.getElementById("receivedType");
		var payerID = payerIdSelect.options[payerIdSelect.selectedIndex].value;
		var paidAmount = document.getElementById("receivedAmount").value;
		amountToBepaid  = document.getElementById("receivedAmount").value;
		var checkNo = document.getElementById("checkNum").value;
		var customerName = document.getElementById("customerName");
		var vendorId = customerName.options[customerName.selectedIndex].value; 
		
		var dueDate = document.getElementById("orderDate").value;
		var categoryIdString  = document.getElementById("categoryId");
		var categoryId = categoryIdString.options[categoryIdString.selectedIndex].value;
		var memo = document.getElementById("memo").value;
		
		if(checkNo == '' || checkNo == '0')
		{
			//alert("<bean:message key='BzComposer.billpayable.entervalidchecknumber'/>");
			return enterchecknumberdialog();
			return false;
		}
		TblVendorDetail = {
				"billNo": billNo,
				"vendorID": vendorId,
				"payerId": payerID,
				"amount": paidAmount,
				"checkNo" : checkNo,
				"dueDate": dueDate,
				"categoryID": categoryId,
				"memo": memo,
		};
		var obj=JSON.stringify(TblVendorDetail);
		$.ajax({
				
				type : "POST",
				url : "BillPayable.do?tabid=save",			
			    data :"data=" + obj,
			    success : function(data) {
				debugger;
				updateBillPayableTab(data);	
				},
				 error : function(data) {
					 //alert("<bean:message key='BzComposer.billpayable.someerroroccurred'/>");
					 return showerrordialog();
				} 
			});
	  	
	  	$(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
		
	}
	function makePayment()
	{
		debugger;
		var paidAmount;
		var amountPaid;
		var billNo = document.getElementById("ordernumber").innerHTML;
		var payerIdSelect = document.getElementById("receivedType");
		 var index = document.getElementById("receivedType").selectedIndex
		var payerID = payerIdSelect.options[payerIdSelect.selectedIndex].value;
		var totalAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(7)').text();
		/*  if(!$('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(5)').text() == '')
		{	
			paidAmount = $('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(5)').text();
		}
		else
		{
			paidAmount = document.getElementById("receivedAmount").value;
		}
		if(parseFloat(paidAmount) > parseFloat(totalAmount))
		{
			alert("you can not pay more than balance");
			return false;
		}  */
		
		if(amountToBepaid != 0.00)
		{	
			paidAmount = amountToBepaid;
			amountPaid = parseFloat(totalAmount) - parseFloat($('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(6)').text());
		}
		else
		{
			paidAmount = document.getElementById("receivedAmount").value;
			amountPaid = parseFloat(paidAmount);
		}
		var checkNo = document.getElementById("checkNum").value;
		var balance = parseFloat(totalAmount) - parseFloat(amountPaid);
		var customerName = document.getElementById("customerName");
		var vendorId = customerName.options[customerName.selectedIndex].value; 
		var amount = document.getElementById("devAmount").innerHTML;
		var dueDate = document.getElementById("orderDate").value;
		var categoryIdString  = document.getElementById("categoryId");
		var categoryId = categoryIdString.options[categoryIdString.selectedIndex].value;
		var memo = document.getElementById("memo").value;
		
		if(checkNo == '' || checkNo == '0')
		{
			//alert("<bean:message key='BzComposer.billpayable.entervalidchecknumber'/>");
			return enterchecknumberdialog();
			return false;
		}
		TblVendorDetail = {
				"billNo": billNo,
				"vendorID": vendorId,
				"payerId": payerID,
				"amountPaid": amountPaid,
				"amountTopay": paidAmount,
				"balance": balance,
				"amount": amount,
				"checkNo" : checkNo,
				"dueDate": dueDate,
				"categoryID": categoryId,
				"memo": memo,
		};
		var obj=JSON.stringify(TblVendorDetail);
		$.ajax({
			
			type : "POST",
			url : "BillPayable.do?tabid=MakePayment",			
		    data :"data=" + obj,
		    success : function(data) {
			debugger;
			amountToBepaid = 0.00;
			updateBillPayableTab(data);	
			},
			 error : function(data) {
				 //alert("<bean:message key='BzComposer.billpayable.someerroroccurred'/>");
				 return showerrordialog()
			} 
		});
  	
  	$(document.forms[0]).submit(function( event ) {
	    event.preventDefault();
	});
	}
	function deleteBill()
	{
		var status;
		var amount = $('table.devAcRecDataTbl tbody tr:nth-child('+index+')').find('td:nth-child(6)').text();
		/* status = window.confirm("<bean:message key='BzComposer.billpayable.deleteselectedbill'/>")
		if(status == true)
		{			
			$.ajax({
			
				type : "POST",
				url : "BillPayable.do?tabid=DeleteBill",			
		    	data :"BillNum=" + billNo,
		    	success : function(data) {
					debugger;
					updateBillPayableTab(data);	
				},
			 	error : function(data) {
					//alert("<bean:message key='BzComposer.billpayable.someerroroccurred'/>");
					return showerrordialog();
				} 
			});
			$(document.forms[0]).submit(function( event ) {
	    	event.preventDefault();
			});
		}
		else
		{
			return false;
		}	 */
		
		debugger;
		event.preventDefault();
		$("#deleteselectedbilldialog").dialog({
			resizable: false,
		    height: 200,
		    width: 500,
		    modal: true,
		    buttons: {
				"<bean:message key='BzComposer.global.ok'/>": function () {
					$.ajax({
						
						type : "POST",
						url : "BillPayable.do?tabid=DeleteBill",			
				    	data :"BillNum=" + billNo,
				    	success : function(data) {
							debugger;
							updateBillPayableTab(data);	
						},
					 	error : function(data) {
							//alert("<bean:message key='BzComposer.billpayable.someerroroccurred'/>");
							return showerrordialog();
						} 
					});
					$(document.forms[0]).submit(function( event ) {
			    	event.preventDefault();
					});
					$(this).dialog("close");
					/* $('form').submit(); */
				},
		        "<bean:message key='BzComposer.global.cancel'/>": function () {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}
	function paidBillLists()
	{
		window.location = "${pageContext.request.contextPath}/BillPayable.do?tabid=PaidBillLists";
	}
	function billCreationTab()
	{
		window.location = "${pageContext.request.contextPath}/BillCreation.do?tabid=billCreation";
	}
		$(document).ready(
				function() {
					//debugger;
					var day = new Date().getDay();
					var dName = dayName(day);
					$("#tblForUnpaidOpeningBalance").hide();
					$("#tblForUnpaidCreditAmount").hide();
					$("#orderDate").val(
							dName + " " + ((new Date().getMonth()) + 1) + "-"
									+ new Date().getDate() + "-"
									+ new Date().getFullYear());
					$("#schrduleMemorizedTransactionDate").val(dName + " " + ((new Date().getMonth()) + 1) + "-" + new Date().getDate() + "-" + new Date().getFullYear());
					$("#payBillsDate").val(dName + " " + ((new Date().getMonth()) + 1) + "-" + new Date().getDate() + "-" + new Date().getFullYear());
					$("#ScheduleMemorizedTransaction").hide();
					$("#PayBills").hide();
					$("#MemorizeTransactionList").hide();
					$("#CreatingEditingRecurrentPaymentDlgId").hide();
					$("#numberRemaining" ).prop("disabled", true );  
					$("#daysInAdvanceToEnter").prop( "disabled", true );
					$("#transactionGroup").prop( "disabled", true );
				});
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
		 $(document).ready(function () {
			    $('tr').click(function () {
			         var selected = $(this).hasClass("highlight"); 
			         $("tr").removeClass("highlight");
			         if(!selected)
			             $(this).addClass("highlight");
			    });
			}); 
		 $(function() {
			   $( "#MemorizeTransactionListId").on("click", function(){
				/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
				  debugger;
				   $( "#MemorizeTransactionList").dialog({
			    	   modal: true,
			    	   title: 'Memorized Transaction List'
			        });   
			    });
			    
			   $(document.forms[0]).submit(function(event) {
				    event.preventDefault();
				});
			 });
		 $(function() {
			   $( "#MemorizeBillId").on("click", function(){
				/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
				  debugger;
				   $( "#ScheduleMemorizedTransaction").dialog({
			    	   modal: true,
			    	   title: 'Schedule Memorized Transaction'
			        });   
			    });
			    
			   $(document.forms[0]).submit(function(event) {
				    event.preventDefault();
				});
			 });
		 $(function() {
			   $( "#PaybillId").on("click", function(){
				/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
				  debugger;
				   $( "#PayBills").dialog({
			    	   modal: true,
			    	   title: 'Pay Bill'
			        });   
			    });
			    
			   $(document.forms['billPayableForm']).submit(function(event) {
				    event.preventDefault();
				});
			 });
		 $(function() {
			   $( "#CreatingEditingRecurrentPaymentId").on("click", function(){
				/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
				  debugger;
				   $( "#CreatingEditingRecurrentPaymentDlgId").dialog({
			    	   modal: true,
			    	   title: 'Creating Recurrent Payment Plan'
			        });   
			    });
			    
			   $(document.forms[0]).submit(function(event) {
				    event.preventDefault();
				});
			 });
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
		function updateBillPayableTab(data)
		{
			debugger;
			$("#billPayableForm")[0].reset();
			$(document).find('div#tblForInvoiceOrder table').replaceWith($(data).find('div#tblForInvoiceOrder').html());
			$(document).find('div#totalAmountLabelDiv label').eq(1).text(this.value).replaceWith($(data).find('div#totalAmountLabelDiv label').eq(1).text(this.value));
			$(document).find('div#MemTraList table').replaceWith($(data).find("div#MemTraList").html());
			addCss();
			
		}
		function remindMe()
		{
			debugger;
			/* $("#numberRemaining").children().attr("disabled", "disabled"); */
			/* document.getElementById("numberRemaining").disabled = true; */
			/* $("#numberRemaining").disable(); */
			this.scheduleTransactionRadioButtonValue = document.getElementById("remindMe").value;
			 $("#numberRemaining" ).prop("disabled", true );  
			$("#daysInAdvanceToEnter").prop( "disabled", true );
			$("#transactionGroup").prop( "disabled", true );
		}
		function dontRemindMe()
		{
			debugger;
			this.scheduleTransactionRadioButtonValue = document.getElementById("dontRemindMe").value;
			$( "#numberRemaining" ).prop( "disabled", true );
			$( "#daysInAdvanceToEnter" ).prop( "disabled", true );
			$( "#transactionGroup" ).prop( "disabled", true );
			$( "#howOften" ).prop( "disabled", true );
			$( "#schrduleMemorizedTransactionDate" ).prop( "disabled", true );
		}
		function automaticEnter()
		{
			debugger;
			this.scheduleTransactionRadioButtonValue = document.getElementById("automaticEnter").value;
			$( "#howOften" ).prop( "disabled", false );
			$( "#schrduleMemorizedTransactionDate" ).prop( "disabled", false );
			$( "#numberRemaining" ).prop( "disabled", false);
			$( "#daysInAdvanceToEnter" ).prop( "disabled", false);
		}
		function withTransactionGroup()
		{
			debugger;
			this.scheduleTransactionRadioButtonValue = document.getElementById("withTransactionGroup").value;
			$( "#howOften" ).prop( "disabled", true );
			$( "#schrduleMemorizedTransactionDate" ).prop( "disabled", true );
			$( "#numberRemaining" ).prop( "disabled", true);
			$( "#daysInAdvanceToEnter" ).prop( "disabled", true);
			$( "#transactionGroup" ).prop( "disabled", false);
		}
		function ScheduleMemorizedTransactionOkay()
		{
			debugger;
			var remindOption = scheduleTransactionRadioButtonValue;
			var transactionName = "";
			var dayInAdvance = "";
			var howOften = "";
			var nextDate = "";
			var NumRemain = 0;
			var RecurringOption = "";
			var RecurringNumber = "";	
			
			if(remindOption == '0')
			{
				transactionName = document.getElementById("nameOfTransaction").value;
				dayInAdvance = 0;
				var howOftenOption = document.getElementById("howOften");
				howOften = howOftenOption.options[howOftenOption.selectedIndex].value; 
				nextDate = document.getElementById("schrduleMemorizedTransactionDate").value;
				NumRemain = 0;
			}
			else if(remindOption == '1')
			{
				transactionName = document.getElementById("nameOfTransaction").value;
				dayInAdvance = 0;
				howOften = "";
				nextDate = document.getElementById("schrduleMemorizedTransactionDate").value;	
			}
			else if(remindOption == '2')
			{
				transactionName = document.getElementById("nameOfTransaction").value;
				var howOftenOption = document.getElementById("howOften");
				howOften = howOftenOption.options[howOftenOption.selectedIndex].value;
				
				if(document.getElementById("numberRemaining").value == "" )
				{
					//alert("<bean:message key='BzComposer.billpayable.entervaliddatainnumberfield'/>");
					return entervalidnumberdialog();
					return false;
				}
				else{
					NumRemain = document.getElementById("numberRemaining").value;
				}
				if(document.getElementById("daysInAdvanceToEnter").value == "" )
				{
					//alert("<bean:message key='BzComposer.billpayable.entervaliddataindayfield'/>");
					return entervaliddaysinadvancefielddialog();
					return false;
				}
				else{
					dayInAdvance =  document.getElementById("daysInAdvanceToEnter").value;
				}
				
				nextDate = document.getElementById("schrduleMemorizedTransactionDate").value;
			}
			else if(remindOption == '3')
			{
				transactionName = "<none>";
				remindOption = 0;
				nextDate = document.getElementById("schrduleMemorizedTransactionDate").value;
				RecurringOption = 2;
				dayInAdvance =1;
				howOften = "Never";
				RecurringNumber = 2;
			}
			
			TblVendorDetail = {
					"billNo": billNo,
					"transactionName": transactionName,
					"memorizedOption": remindOption,
					"howOften": howOften,
					"numRemain": NumRemain,
					"dayInAdv": dayInAdvance,
					"nextDateString": nextDate,
			};
			var obj=JSON.stringify(TblVendorDetail);
			$('#ScheduleMemorizedTransaction').dialog('close');
			if($('#MemorizeTransactionList').parents('.ui-dialog:visible').length)
			{
				$('#MemorizeTransactionList').dialog('close');
			}
			/* var staus = $('#MemorizeTransactionList').dialog('isOpen');
			if(status == true)
			{
				$('#MemorizeTransactionList').dialog('close');
			} */
			$.ajax({
				
			 	type : "POST",
				url : "BillPayable.do?tabid=MakeScheduleMemorizedTransaction",		 	
			    data :"data=" + obj,
			    success : function(data) {
				debugger;
				amountToBepaid = 0.00;
				updateBillPayableTab(data);	
				},
				 error : function(data) {
					 //alert("<bean:message key='BzComposer.billpayable.someerroroccurred'/>");
					 return showerrordialog();
				} 
			});
	  	
	  	$(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
}
function EditMemorizedTransactionList()
{
	debugger;
	$( "#ScheduleMemorizedTransaction").dialog({
 	   modal: true,
 	   title: 'Schedule Memorized Transaction'
     }); 
}
function DeleteMemorizeTransaction()
{
	debugger;
	if($('#MemorizeTransactionList').parents('.ui-dialog:visible').length)
	{
		$('#MemorizeTransactionList').dialog('close');
	}
	if($('#ScheduleMemorizedTransaction').parents('.ui-dialog:visible').length)
	{
		$('#ScheduleMemorizedTransaction').dialog('close');
	}
	var bill = parseInt($('table#MemorizetranId tbody tr:nth-child('+indexForMemTransList+')').find('td:nth-child(2)').text());
	$.ajax({
		
	 	type : "POST",
		url : "BillPayable.do?tabid=UpdateMemorizedTransaction",		 	
	    data :"BillNumber=" + bill,
	    success : function(data) {
		debugger;
		amountToBepaid = 0.00;
		updateBillPayableTab(data);	
		},
		 error : function(data) {
			//alert("<bean:message key='BzComposer.billpayable.someerroroccurred'/>");
			return showerrordialog();
		} 
	});
}
function AddPayee()
{
	/* window.location = "${pageContext.request.contextPath}/Vendor.do?tabid=AODOVO"; */
	window.open("Vendor.do?tabid=AODOVO",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no," );
}	
function enterchecknumberdialog()
{
	event.preventDefault();
	$("#enterchecknumberdialog").dialog({
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
function showerrordialog()
{
	event.preventDefault();
	$("#showerrordialog").dialog({
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
function entervalidnumberdialog()
{
	event.preventDefault();
	$("#entervalidnumberdialog").dialog({
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
function entervaliddaysinadvancefielddialog()
{
	event.preventDefault();
	$("#entervaliddaysinadvancefielddialog").dialog({
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
</body>
</html>
<!-- Dialog box used in this page -->
<div id="enterchecknumberdialog" style="display:none;">
	<p><bean:message key='BzComposer.billpayable.entervalidchecknumber'/></p>
</div>
<div id="showerrordialog" style="display:none;">
	<p><bean:message key='BzComposer.billpayable.someerroroccurred'/></p>
</div>
<div id="deleteselectedbilldialog" style="display:none;">
	<p><bean:message key='BzComposer.billpayable.deleteselectedbill'/></p>
</div>
<div id="entervalidnumberdialog" style="display:none;">
	<p><bean:message key='BzComposer.billpayable.entervaliddatainnumberfield'/></p>
</div>
<div id="entervaliddaysinadvancefielddialog" style="display:none;">
	<p><bean:message key='BzComposer.billpayable.entervaliddataindayfield'/></p>
</div>