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
<%@page import="com.nxsol.bizcompser.global.table.TblCategoryDto"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.ReceivableListDto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.paidbilllisttitle"/></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!--  Here Is the context path -->
<script>var ctx = "${pageContext.request.contextPath}";</script>
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

	<form:form action="/BillPayable" method="post" id="billPayableForm">
		
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">

							<!-- begin Contents -->
							<div>
								<div style="float: left;">
									<span
										style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
										<spring:message code="BzComposer.billpayable.billpayabletitle" />
									</span> <br>
									<table>
										<tr>
											<td><spring:message code="BzComposer.billpayable.sortby" /></td>
											<td><select id="sortBy">
													<option value="1"><spring:message
															code="BzComposer.customerinfo.companyname" /></option>
													<option value="2"><spring:message
															code="BzComposer.global.firstname" /></option>
													<option value="3"><spring:message
															code="BzComposer.global.lastname" /></option>
											</select>
											  </td>
										</tr>
									</table>
								</div>
								<div style="float: right;">
									<table>
										<tr align="right">
											<td colspan="12">
												<div>
													<input type="button" class="formbutton"
														onclick="AddPayee();" style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.add'/>" />
													<input type="button" class="formbutton"
														onclick="editPayee('EDIT');" style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.edit'/>" />
													<input type="button" class="formbutton"
														onclick="deletePayee('DELETE');" style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<br><br>


							<table style="width: 100%; apdding: 0;">
								<tr>
									<td>
										<table style="padding: 0; width: 100%; margin-top: 10px;"
											align="center">
											<tr>
												<td valign="top" colspan="1"
													style="width: 350px; padding: 0; height: 40vh; border: 1px solid #ccc;">
													<input type="hidden" name="listSize" id="lSize"
													value='${CustomerDetails.size()}' />
													<table id="custTable" class="tabla-listados"
														cellspacing="0"
														style="border: 0; padding: 0; margin: 0; height: auto;">
														<thead>
															<tr valign="top">
																<th class="emblem" style="font-size: 12px;">
																	<div align="center">
																		<spring:message
																			code="BzComposer.paidbilllist.payeename" />
																	</div>
																</th>
															</tr>
														</thead>
														<tbody id="custTableBody">
															<c:forEach items="${cvForCombo}" var="objList1"
																varStatus="loop">
																<tr id='${loop.index}$$'>

																	<td colspan="2" style="font-size: 12px;" align="left">
																		${objList1.lastName} ${objList1.firstName}
																		(${objList1.name})</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</td>
												<!-- Added on 26-04-2019 -->
												<td colspan="10" style="vertical-align: 0;">
													<!-- ================== Billing  Information =============== -->




													<div id="table-negotiations" style="height: auto;">
														<table cellspacing="0" class="tabla-listados"
															style="margin-top: 0; margin-left: 20px;">
															<thead>
																<tr>
																	<th colspan="3" style="font-size: 12px;"><spring:message
																			code="BzComposer.billcreation.billDetails" /></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td style="width: 40%;">
																		<table cellspacing="0" class="tabla-listados">
																			<tr>
																				<td style="width: 50%;"><strong><spring:message
																							code="BzComposer.billpayable.billno" />:</strong></td>
																				<td style="width: 50%;" id="customerID"></td>
																			</tr>

																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.billpayable.payee" />:</strong></td>
																				<td id="cname"></td>
																			</tr>
																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.billpayable.duedate" />:</strong></td>
																				<td id="dbaName"></td>
																			</tr>
																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.billpayable.payfrom" />:</strong></td>
																				<td><select
																					class="form-control devReceivedTypeDrp"
																					id="receivedType" onclick="checkType()">
																						<%
																						ArrayList<TblAccount> accountForBill1 = (ArrayList) request.getAttribute("accountListForBill");
																						if (accountForBill1 != null) {
																							for (int i = 1; i < accountForBill1.size(); i++) {
																						%>
																						<option
																							value="<%=accountForBill1.get(i).getAccountID()%>"
																							id="<%=accountForBill1.get(i).getAccountID()%>">
																							<%
																							out.println(accountForBill1.get(i).getName());
																							%>
																						</option>
																						<%
																						}
																						}
																						%>
																				</select></td>
																			</tr>
																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.billpayable.paidamount" />:</strong></td>
																				<td id="billingAddress"></td>
																			</tr>
																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.global.balance" />:</strong></td>
																				<td id="shippingAddress"></td>
																			</tr>
																		</table>
																	</td>



																	<td style="width: 30%;">
																		<table cellspacing="0" class="tabla-listados">
																			<tr>
																				<td style="width: 50%;"><strong><spring:message
																							code="BzComposer.global.memo" />:</strong></td>
																				<td style="width: 50%;" id="phone"></td>
																			</tr>
																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.global.type" />:</strong></td>
																				<td id="cellPhone"></td>
																			</tr>
																			<tr>
																				<td><strong><spring:message
																							code="BzComposer.billpayable.status" />:</strong></td>
																				<td id="fax"></td>
																			</tr>

																		</table>
																	</td>
																	<td style="width: 30%;">
																		<table cellspacing="0" class="tabla-listados">
                            <div class="col-md-4" style="top: 35px;">
							<div class="form-group">
								<a class="btn btn-info" onclick="return save()"
									style="color: white; width: 120px; font-size: 14px;"> <spring:message
										code="BzComposer.global.save" />
								</a>
							</div>
							<div class="form-group">
								<a class="btn btn-info" onclick="return clearTransaction()"
									style="color: white; width: 120px; font-size: 14px;"> <spring:message
										code="BzComposer.global.clear" />
								</a>
							</div>
							<div class="form-group">
								<a class="btn btn-info" onclick="return makePayment()"
									style="color: white; width: 120px; font-size: 14px;"> <spring:message
										code="BzComposer.billpayable.makepaymentbtn" />
								</a>
							</div>
						</div>

																		</table>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</table>

			<div class="content-tabs">
				<nav>
					<div class="nav nav-tabs" id="tabId" role="tablist">
						<a class="nav-item nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true" onclick="billPayableTab()">
							<spring:message code="BzComposer.billpayable.tabs.unpaidbilllist"/>
						</a> 
						<a class="nav-item nav-link active" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" 
						role="tab" aria-controls="nav-profile" aria-selected="false">
							<spring:message code="BzComposer.billpayable.tabs.paibilllist"/>
						</a> 
						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" 
						role="tab" aria-controls="nav-contact" aria-selected="false" onclick="billCreationTab()">
							<spring:message code="BzComposer.billpayable.tabs.billcreation"/>
						</a>
						<a class="nav-item nav-link" id="nav-contact-tab"
							data-toggle="tab" href="#nav-contact" role="tab"
							aria-controls="nav-contact" aria-selected="false"
							onclick="billCompaniesTab()"> <spring:message
								code="BzComposer.billpayable.tabs.billingcompanies" />
						</a>
					</div>
				</nav>
				<div class="unpaid">
					<div class="unpaid-header">
						<div class="filterbar" onclick="selectedRadio()">
							<div class="form-check form-check-inline">
					  			<input class="form-check-input" type="radio" name="inlineRadioOptions" 
					  			id="rdoBillPayments" value="option1" checked="checked" onclick="showBillPayaments()">
					  			<label class="form-check-label" for="inlineRadio1">
					  				<spring:message code="BzComposer.paidbilllist.showbillpayments"/>
				  				</label>
							</div>					
							<div class="form-check form-check-inline">
					  			<input class="form-check-input" type="radio" name="inlineRadioOptions" 
					  			id="rdoRecurrentPayments" value="option1" onclick="showRecurrent()">
					  			<label class="form-check-label" for="inlineRadio2">
					  				<spring:message code="BzComposer.paidbilllist.showrecurrentpaymentsbtn"/>
				  				</label>
							</div>
							<div class="form-check form-check-inline">
					  			<input class="form-check-input" type="radio" name="inlineRadioOptions" 
					  			id="rdoPurchaseBill" value="option2">
					  			<label class="form-check-label" for="inlineRadio3">
					  				<spring:message code="BzComposer.paidbilllist.showpurchasebillpaymentsbtn"/>
				  				</label>
							</div>
							<div class="form-check form-check-inline">
					  			<input class="form-check-input" type="radio" name="inlineRadioOptions" 
					  			id="rdoUnpaidCreditPayments" value="option2">
					  			<label class="form-check-label" for="inlineRadio4">
					  				<spring:message code="BzComposer.paidbilllist.showpaidcreditpaymentsbtn"/>
				  				</label>
							</div>
							<div class="unpaid-right" id="totalAmountLabelDiv">
								<ul>
									<li>
										<label>
											<spring:message code="BzComposer.billpayable.total"/> 
										</label>
								 		<% ArrayList<TblPayment> paid = (ArrayList) request.getAttribute("paidBillLists");
								 		ArrayList<TblPayment> recurrentTotal = (ArrayList) request.getAttribute("recurrentPaymentList");
								 		if(!paid.isEmpty())
								 		{	
								 		%>
										<label id="paidBillTotal">
											<% out.println(paid.get(paid.size() - 1).getTotalAmount()); }%>
										</label>
								 		<% if(!recurrentTotal.isEmpty()) {%>
										<label id="recurrentTotal">
											<% out.println(recurrentTotal.get(recurrentTotal.size() - 1).getTotalAmount()); }%>
										</label>
									</li>   
									<li>
										<select>
											<option>All Payments</option>
											<option>Past 1 Month</option>
											<option>Past 2 Month</option>
											<option>Past 3 Month</option>
											<option>Past 6 Month</option>
										</select>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" 
						aria-labelledby="nav-home-tab">
							<div class="table1" id="tblForInvoiceOrder">
								<table class="table table-bordered table-sm devAcRecDataTbl">
									<thead class="thead-light">
										<tr>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.billnumber"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.paidbilllist.payeename"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.payfrom"/> 
											</th>
											<th scope="col" class="text-right"><spring:message code="BzComposer.global.balance"/></th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.amount"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.checknumber"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.paymentdate"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.status"/>
											</th>
										</tr>
									</thead>
									<tbody>
									  <%
											ArrayList<TblPayment> paidBillLists = (ArrayList) request.getAttribute("paidBillLists");
												int index = 1;
												for (int i = 0; i < paidBillLists.size(); i++) {
										%> 
										<tr onclick="selectrow(<%=paidBillLists.get(i).getBillNum() + "," + index%>)">
											<td class="text-right">
												<%
													out.println(paidBillLists.get(i).getBillNum());
												%>
											</td>
											<td class="text-right"
												value="<%=paidBillLists.get(i).getCvName()%>">
												<%
													out.println(paidBillLists.get(i).getCvName());
												%>
											</td>
											<td class="text-right">
												<% out.println(paidBillLists.get(i).getAccountNameString()); %>
											</td>
											<td class="text-right">
												<%= String.format("%.2f", paidBillLists.get(i).getAmountDue()) %>
											</td>
											<td class="text-right">
                                                <%= String.format("%.2f", paidBillLists.get(i).getAmount()) %>
                                            </td>
											<td class="text-right">
												<% out.println("ToBePrinted");%>
											</td>
											<td class="text-right">
												<% out.println(paidBillLists.get(i).getDateAdded());%>
											</td>
											<td class="text-right">
												<% out.println("Processed");%>
											</td>
										</tr>
										<%
											index++;
												}
										%> 
									</tbody>
								</table>
							</div>
							 <div class="table1" id="tblRecurrentPayment">
								<table class="table table-bordered table-sm devAcRecDataTbl">
									<thead class="thead-light">
										<tr>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.billnumber"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.paidbilllist.payeename"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.payfrom"/>
											</th>
											<!-- <th scope="col" class="text-right"><spring:message code="BzComposer.global.balance"/></th> -->
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.amount"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.checknumber"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.paymentdate"/>
											</th>
											<th scope="col" class="text-right">
												<spring:message code="BzComposer.billpayable.status"/>
											</th>
										</tr>
									</thead>
									<tbody>
									  <%
										ArrayList<TblPayment> recurrentPaymentLists = (ArrayList) request.getAttribute("recurrentPaymentList");
										int index1 = 1;
										for (int i = 0; i < recurrentPaymentLists.size(); i++) {
									%> 
										<tr onclick="selectrow(<%=recurrentPaymentLists.get(i).getBillNum() + "," + index1%>)">
											<td class="text-right">
												<%
													out.println("Recurrent Payment");
												%>
											</td>
											<td class="text-right" value="<%=recurrentPaymentLists.get(i).getCvName()%>">
												<%
													out.println(recurrentPaymentLists.get(i).getCvName());
												%>
											</td>
											<td class="text-right">
												<% out.println(recurrentPaymentLists.get(i).getAccountNameString()); %>
											</td>
											<!-- <td class="text-right">0.00</td> -->
											<td class="text-right">
												<% out.println(recurrentPaymentLists.get(i).getAmount());%>
											</td>
											<td class="text-right">
												<% out.println(recurrentPaymentLists.get(i).getCheckNumber());%>
											</td>
											<td class="text-right">
												<% out.println(recurrentPaymentLists.get(i).getDateAdded());%>
											</td>
											<td class="text-right">
												<% out.println("Processed");%>
											</td>
										</tr>
										<%
											index1++;
												}
										%> 
									</tbody>
								</table>
							</div>
							<div class="footer2">
								<button class="btn btn-info" onclick="billingInfo()" style="font-size: 14px;">
									<spring:message code="BzComposer.paidbilllist.printablechecksbtn"/>
								</button>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
							...
						</div>
						<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
							...
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<script type="text/javascript">
	var billNo = -1;
	var index = -1;
	var amountToBepaid = 0.00;
	function selectrow(no , indexNumber)
	{
		
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
	}
	
	   function selectedRadio()
	   {

		   if(document.getElementById("rdoRecurrentPayments").checked)
			   {
			   		$("#tblRecurrentPayment").show();
			        $("#tblForInvoiceOrder").hide();
			        $("#recurrentTotal").hide();
			        $("#paidBillTotal").hide();
			   }
		   else if(document.getElementById("rdoPurchaseBill").checked)
			   {
					   	$("#tblRecurrentPayment").show();
			            $("#tblForInvoiceOrder").hide();
			            $("#recurrentTotal").hide();
			            $("#paidBillTotal").hide();
			   }
			else if(document.getElementById("rdoUnpaidCreditPayments").checked)
			   {
						$("#tblRecurrentPayment").show();
			            $("#tblForInvoiceOrder").hide();
			            $("#recurrentTotal").hide();
			            $("#paidBillTotal").hide();
			   }   
		   else
			   {
			   				$("#tblRecurrentPayment").hide();
			                $("#tblForInvoiceOrder").show();
			                $("#recurrentTotal").hide();
			                $("#paidBillTotal").hide();
			   }
	   }
	   
	   
	   tblRecurrentPayment
	
	
	function save()
	{
		
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
			alert("<spring:message code='BzComposer.billpayable.entervalidchecknumber'/>");
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
				url : "billPayablePost?tabid=save",
			    data :"data=" + obj,
			    success : function(data) {
				
				updateBillPayableTab(data);	
				},
				 error : function(data) {
					 alert("<spring:message code='BzComposer.billpayable.someerroroccurred'/>");
				} 
			});
	  	
	  	$(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
		
	}
	function makePayment()
	{
		
		var paidAmount;
		var amountPaid;
		var billNo = document.getElementById("ordernumber").innerHTML;
		var payerIdSelect = document.getElementById("receivedType");
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
			alert("<bean:message key='BzComposer.common.cantPayMoreThanBalance'/>");
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
			alert("<spring:message code='BzComposer.billpayable.entervalidchecknumber'/>");
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
			url : "billPayablePost?tabid=MakePayment",
		    data :"data=" + obj,
		    success : function(data) {
			
			amountToBepaid = 0.00;
			updateBillPayableTab(data);	
			},
			 error : function(data) {
				 alert("<spring:message code='BzComposer.billpayable.someerroroccurred'/>");
			} 
		});
  	
  	$(document.forms[0]).submit(function( event ) {
	    event.preventDefault();
	});
	}
	function showRecurrent()
	{
		$("#tblRecurrentPayment").show();
		$("#tblForInvoiceOrder").hide();
		$("#recurrentTotal").show();
		$("#paidBillTotal").hide();
	}
	function showBillPayaments()
	{
		$("#tblRecurrentPayment").hide();
		$("#tblForInvoiceOrder").show();
		$("#recurrentTotal").hide();
		$("#paidBillTotal").show();
	}
		$(document).ready(
				function() {
					
					//
					var day = new Date().getDay();
					var dName = dayName(day);
					$("#tblForUnpaidOpeningBalance").hide();
					$("#tblForUnpaidCreditAmount").hide();
					$("#orderDate").val(
							dName + " " + ((new Date().getMonth()) + 1) + "-"
									+ new Date().getDate() + "-"
									+ new Date().getFullYear());
					$("#tblRecurrentPayment").hide();
					$("#recurrentTotal").hide();
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
			
			$("#billPayableForm")[0].reset();
			$(document).find('div#tblForInvoiceOrder table').replaceWith($(data).find('div#tblForInvoiceOrder').html());
			$(document).find('div#totalAmountLabelDiv label').eq(1).text(this.value).replaceWith($(data).find('div#totalAmountLabelDiv label').eq(1).text(this.value));
			addCss();
		}
		function billPayableTab()
		{
			window.location = "${pageContext.request.contextPath}/BillPayable?tabid=billpayable";
		}
		function billCreationTab()
		{
			window.location = "${pageContext.request.contextPath}/BillCreation?tabid=billCreation";
		}
		function billCompaniesTab()
		{
			window.location = "${pageContext.request.contextPath}/BillPayable?tabid=billCompanies";
		}
		
		
	</script>
</body>
</html>