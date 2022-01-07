<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.nxsol.bizcomposer.common.TblCategoryType"%>
<%@page import="com.nxsol.bizcomposer.common.TblBudgetCategory"%>
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
<title><bean:message key="BzComposer.reconsilationtitle"/></title>

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
/*.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable {
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
   
}*/

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}

#highlight {
	
 		background-color: blue; 
 
	 }
.highlight { background-color: #00CED1 !important;color: #fff }	 
	
</style>

</head>
<body>
<% ArrayList<TblAccount> accountList = (ArrayList)request.getAttribute("accountList"); 
   int accountId = Integer.parseInt(request.getAttribute("selectedAccount").toString());
   System.out.println(accountId);
%>
<div class="clearfix"></div>
<div id="ddcolortabsline">&nbsp;</div>
<div class="content1 clearfix">
<div class="form-inline  d-flex justify-content-center mb-4">
	<div class="form-group ml-3">
		<label>
			<bean:message key="BzComposer.reconciliation.account"/>
		</label>
		<select class="form-control ml-1" id="account" onchange="executeQuery()">
			<% /* ArrayList<TblAccount> accountList = (ArrayList)request.getAttribute("accountList"); */
				for(int i=1;i<accountList.size();i++)
				{	
			%>
			<option value="<%=accountList.get(i).getAccountID() %>" label="<%=accountList.get(i).getCustomerCurrentBalance() %>">
				<% out.println(accountList.get(i).getName());%>
			</option>
			<% }%>
		</select>
	</div>
	<div class="form-group ml-3">
		<label>
			<bean:message key="BzComposer.reconciliation.searchrange"/>		
		</label>
	</div>
	<div class="form-group ml-3">
		<label>
			<bean:message key="BzComposer.reconciliation.from"/>
		</label>
		<div class="d-flex ml-1">
			<input type="text" class="form-control"
				id="fromDate" name="fromDate" onselect="getDateVisePayment()">
			<div class="input-group-append input-group-append1">
				<a class="input-group-text">&#9662;</a>
			</div>
		</div>
	</div>
	<div class="form-group ml-3">
		<label>
			<bean:message key="BzComposer.reconciliation.to"/>
		</label>
		<div class="d-flex ml-1">
			<input type="text" class="form-control"
				id="toDate">
			<div class="input-group-append input-group-append1">
				<a class="input-group-text" href="#">&#9662;</a>
			</div>
		</div>
	</div>
	<div class="form-group ml-3">
		<label>
			<bean:message key="BzComposer.reconciliation.moveby1month"/>
		</label>
	</div>	
	<button class="btn btn-info btn-sm pt-0 pb-0 ml-2" onclick="getDateVisePayment('backward')">
		<img width="26px" src="<bean:write name="path" property="pathvalue"/>/images/left.png">
	</button>
	<button class="btn btn-info btn-sm pt-0 pb-0  ml-2" onclick="getDateVisePayment('forward')">
		<img width="26px" src="<bean:write name="path" property="pathvalue"/>/images/right.png">
	</button>
</div>
<div class="row">
	<div class="col-md-6">
		<h3 class="title1 text-center">
			<bean:message key="BzComposer.reconciliation.payments"/>
		</h3>
		<div class="table1 mb-3" id="PaymentsTable">
			<table class="table table-bordered table-sm devPaymentsTable">
		  		<thead class="thead-light">
		    		<tr>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.crosssign"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.date"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.checknumber"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.payee"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.amount"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.category"/></th>
		    		</tr>
		  		</thead>
		  		<tbody>
					<% ArrayList<TblPayment> listOfPayments = (ArrayList)request.getAttribute("listOfPayments");
				  	if((!listOfPayments.isEmpty()) && listOfPayments != null)
				  	{	  
						int index = 1;
						String type = "Payment"; 
						for(int i=0;i<listOfPayments.size();i++ )
						{	
							/* System.out.println("payer id----------->"+listOfPayments.get(i).getPayerID()); */						
						 	if(accountId == listOfPayments.get(i).getPayerID())
							{ 
					%>
					<tr onclick="getPayments(<%=index %>,<%= listOfPayments.get(i).getId()%>,<%=accountId %>,'<%= type%>')">
						<td>
				      		<input type="checkbox">
			      		</td>
						<td class="text-center">
							<% out.println(JProjectUtil.getdateFormat().format(listOfPayments.get(i).getDateAdded())); %>
						</td>
						<td class="text-right">
							<% out.println(listOfPayments.get(i).getCheckNumber()); %>
						</td>
						<% if(!listOfPayments.get(i).getCvName().startsWith("null")) {%>
						<td value="<%=listOfPayments.get(i).getCvID()%>">
							<% out.println(listOfPayments.get(i).getCvName()); %>
						</td>
						<% } else { %>
						<td value = "-1"></td>
						<% }%>
						<td class="text-right">
							<% out.println(listOfPayments.get(i).getAmount());%>
						</td>
						<td class="text-right" value="<%=listOfPayments.get(i).getCategoryId()%>">
							<% out.println(listOfPayments.get(i).getCategoryName()); %>
						</td>
						<% if(listOfPayments.get(i).getPaymentTypeID() != -1) {%>
						<td hidden="paymentTypId" class="text-right" value="<%=listOfPayments.get(i).getPaymentTypeID()%>">
						</td>
						<% } else {%>
						<td value="-1"></td>
						<% } %>
						<td hidden="oldAccountId" class="text-right" value="<%=listOfPayments.get(i).getAccountID()%>">
						</td>
					</tr>
					<% } index++; }  }%>
				</tbody>	
			</table>
		</div>
		<div class="row">
			<div class="col-md-5" id="paymentsCountBottom">
				<strong>
					<bean:message key="BzComposer.reconciliation.paymentcount"/>:
				</strong>
				<label id="paymentCount">
		 			<% if(listOfPayments != null && (!listOfPayments.isEmpty()))
		   			{
						int size = 0;
			 			for(int i=0;i<listOfPayments.size();i++)
						{
			   				if(accountId == listOfPayments.get(i).getPayerID())
			   				{  
				  				size++;			  
		   					} } out.println(size); }%>
		 		</label>
			</div>
			<div class="col-md-7" id="paymentsTotalBottom">
				<strong>
					<bean:message key="BzComposer.reconciliation.paymenttotal"/>:
				</strong>
				<label id="paymentTotal">
					<% if(listOfPayments != null && (!listOfPayments.isEmpty()))
		   			{
						double total = 0.00; 
						for(int i=0;i<listOfPayments.size();i++)
			 			{ 
			   				if(accountId == listOfPayments.get(i).getPayerID())
			   				{   
				   				total+=listOfPayments.get(i).getAmount();				   
		     				} } out.println(new DecimalFormat("0.00").format(total));} %>
				</label> 
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<h3 class="title1 text-center">
			<bean:message key="BzComposer.reconciliation.creditordeposits"/>
		</h3>
		<div class="table1  mb-3" id="DepositsTable">
			<table class="table table-bordered table-sm devDepositTable">
		  		<thead class="thead-light">
		    		<tr>
						<th scope="col"><bean:message key="BzComposer.reconciliation.crosssign"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.date"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.checknumber"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.payer"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.amount"/></th>
		      			<th scope="col"><bean:message key="BzComposer.reconciliation.category"/></th>
		    		</tr>
		  		</thead>
		  		<tbody>
					<% ArrayList<TblPayment> listOfDepositPayments = (ArrayList)request.getAttribute("listOfDepositPayments");
				  	if(listOfDepositPayments !=null && (!listOfDepositPayments.isEmpty()))
				  	{	  
						String type = "Deposit";
					  	int index = 1;
					  	for(int i=0;i<listOfDepositPayments.size();i++ )
						{	
							if(accountId == listOfDepositPayments.get(i).getPayeeID())
							{ 
					%>
				  	<tr onclick="getPayments(<%=index %>,<%= listOfDepositPayments.get(i).getId()%>,<%=accountId %>,'<%= type%>')">
						<td>
				      		<input type="checkbox">
			      		</td>
						<td class="text-center">
							<% out.println(JProjectUtil.getdateFormat().format(listOfDepositPayments.get(i).getDateAdded())); %>
						</td>
				      	<% if(!listOfDepositPayments.get(i).getCheckNumber().equals("null")) {%>
				      	<td class="text-right">
				      		<% out.println(listOfDepositPayments.get(i).getCheckNumber()); %>
			      		</td>
				      	<% } else { %>
				      	<td></td>
				      	<% } %>
				       	<% if(!listOfDepositPayments.get(i).getCvName().startsWith("null")) {%>
				      	<td value="<%= listOfDepositPayments.get(i).getCvID()%>">
				      		<% out.println(listOfDepositPayments.get(i).getCvName()); %>
			      		</td>
				      	<% } else { %>
				      	<td value="-1"></td>
				      	<% }%>
				      	<td class="text-right">
				      		<% out.println(listOfDepositPayments.get(i).getAmount());%>
			      		</td>
				      	<td class="text-right" value="<%= listOfDepositPayments.get(i).getCategoryId()%>">
				      		<% out.println(listOfDepositPayments.get(i).getCategoryName()); %>
			      		</td>
				       	<% if(listOfDepositPayments.get(i).getPaymentTypeID() != -1) {%>
				      	<td hidden="paymentTypId" class="text-right" value="<%=listOfDepositPayments.get(i).getPaymentTypeID()%>">
			      		</td>
				      	<% } else {%>
				      	<td value="-1"></td>
				      	<% } %>
				      	<td hidden="oldAccountId" class="text-right" value="<%=listOfDepositPayments.get(i).getAccountID()%>">
				      	</td>
				 	</tr>
					<% } index++;} }%>
				</tbody>	
			</table>
		</div>
		<div class="row">
			<div class="col-md-5" id="depositsCountBottom">
				<strong>
					<bean:message key="BzComposer.reconciliation.depositcount"/>:
				</strong>
				<label id="depositCount">
					<% if(listOfDepositPayments != null && (!listOfDepositPayments.isEmpty()))
		   			{
						int size = 0;
						for(int i=0;i<listOfDepositPayments.size();i++)
						{
			   				if(accountId == listOfDepositPayments.get(i).getPayeeID())
			   				{  
				   				size++;
		   					} } out.println(size); }%>
				</label>
			</div>
			<div class="col-md-7" id="depositsTotalBottom">
				<strong>
					<bean:message key="BzComposer.reconciliation.deposittotal"/>:
				</strong>
				<label id="depositTotal">
					<% if(listOfDepositPayments != null && (!listOfDepositPayments.isEmpty()))
		   			{
						double total = 0.00;
			 			for(int i=0;i<listOfDepositPayments.size();i++)
			 			{ 
			   				if(accountId == listOfDepositPayments.get(i).getPayeeID())
			   				{   
								total+=listOfDepositPayments.get(i).getAmount();
		     				} } out.println(new DecimalFormat("0.00").format(total)); } %>
		 		</label> 
			</div>
		</div>
	</div>
</div>
<div class="text-center mt-5">
	<button class="btn btn-info"><bean:message key="BzComposer.reconciliation.resetbtn"/></button>
	<button class="btn btn-info" onclick="return deletePayment()"><bean:message key="BzComposer.global.delete"/></button>
	<button class="btn btn-info" id="ReconcileButton"><bean:message key="BzComposer.reconciliation.reconcilebtn"/></button>
	<button class="btn btn-info" id="AssetButton"><bean:message key="BzComposer.reconciliation.assetsbtn"/></button>
	<button class="btn btn-info" id="AddButton"><bean:message key="BzComposer.global.add"/></button>
	<button class="btn btn-info" id="EditButton"><bean:message key="BzComposer.global.edit"/></button>
</div>
<div id="ReconcileDlgId">
	<div class="form2">
		<h3 class="title1 text-center mt-2">
			<label id="ReconcileBankName">
				<bean:message key="BzComposer.reconciliation.reconcilebusinesschecking"/>
			</label>
		</h3>
		<hr>
		<div class="form-horizontal">
			<div class="">
				<label>
					<bean:message key="BzComposer.reconciliation.addmissingdisbursements"/>
				</label>
			</div>
			<div class="form-group row">
				<label class="col-md-2"></label>
				<div class="col-md-9">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
					  	<label class="form-check-label" for="inlineCheckbox1">
					  		<bean:message key="BzComposer.reconciliation.addpayments"/>
				  		</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
					  	<label class="form-check-label" for="inlineCheckbox2">
					  		<bean:message key="BzComposer.reconciliation.adddeposit"/>
				  		</label>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<div class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.paymenttype"/>:
						</label>
						<div class="col-md-7">
							<select class="form-control" id="CategoryTypeForReconsile" onchange="getCategoryAndCharge()">
								<% ArrayList<TblCategoryType> categoryType = (ArrayList)request.getAttribute("categoryType");
								if(categoryType !=null)
								{	 
									for(int i=0;i<categoryType.size();i++)
								   	{	   
										if(categoryType.get(i).getCategoryTypeName().equals("EXPENSE") || 
										categoryType.get(i).getCategoryTypeName().equals("INCOME"))
										{   
								%>
								<option value="<%=categoryType.get(i).getCategoryTypeID() %>">
									<% out.println(categoryType.get(i).getCategoryTypeName()); %>
								</option>
								<% } } }%>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.selectcategory"/>:
						</label>
						<div class="col-md-7" id="CategoryForReconsileDiv">
							<select class="form-control" id="CategoryForReconsile" onchange="getCharge()">
								<% ArrayList<TblCategory> categoryList = (ArrayList)request.getAttribute("initCategory"); 
								if(categoryList != null)
								{	 
									for(int i=0;i<categoryList.size();i++)
									{	
								%>
								<option value="<%=categoryList.get(i).getId() %>">
									<% out.println(categoryList.get(i).getCategoryNumber()); %>
								</option>
								<% } }%>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.selectcharge"/>:
						</label>
						<div class="col-md-7" id="ChrgeForReconsileDiv">
							<select class="form-control" id="ChrgeForReconsile">
								<% ArrayList<TblCategory> chargerList = (ArrayList)request.getAttribute("initCharge");
								if(chargerList != null)
								{	
									for(int i=0;i<chargerList.size();i++)
									{
										if((!chargerList.isEmpty()) && chargerList != null)
										{
								%>
								<option value="<%=chargerList.get(i).getId() %>">
									<% out.println(chargerList.get(i).getCategoryNumber());%>
								</option>
								<% } } }%>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.date"/>:
						</label>
						<div class="col-md-7">
							<div class="d-flex">
								<input type="text" class="form-control" id="ReconcileDate">
								<div class="input-group-append input-group-append1">
									<a class="input-group-text" href="#" >&#9662;</a>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.amount"/>:
						</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="AmountForReconcileDlg">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<input type="checkbox" id="CheckBoxForReconcile" onclick="getCheckboxForReconcile()"> 
							<bean:message key="BzComposer.reconciliation.checknumber"/>
						</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="checkNumberForReconcile">
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<button class="btn btn-info" onclick="return addNewSituation()">
					<bean:message key="BzComposer.reconciliation.addnewsituationbtn"/>
				</button>
			</div>
			<div class="col-md-6 text-right">
				<button class="btn btn-info" onclick="return AddFromReconcileDlg()">
					<bean:message key="BzComposer.global.add"/>
				</button>
				<button class="btn btn-info">
					<bean:message key="BzComposer.global.close"/>
				</button>
			</div>
		</div>
	</div>
</div>
<div id="AssetDlgId">
	<div class="form2">
		<h3 class="title1 text-center mt-2">
			<bean:message key="BzComposer.reconciliation.assetsaccount"/>
		</h3>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<div class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.selectcategory"/>:
						</label>
						<div class="col-md-7">
							<select class="form-control" onchange="changeAssetCategory()" id="AssetCategoryId">
								<% ArrayList<TblCategory> getCategoryListForAsset = (ArrayList)request.getAttribute("getCategoryListForAsset"); 
							    	for(int i=0;i<getCategoryListForAsset.size();i++)
                                	{
								%>	
								<option value="<%=getCategoryListForAsset.get(i).getId() %>">
									<% out.println(getCategoryListForAsset.get(i).getCategoryNumber()); %>
								</option>
								<% } %>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.selectcharge"/>:
						</label>
						<div class="col-md-7" id="AssetChargeCategoryDiv">
							<select class="form-control" id="ChrgeIdForAsset">
								<% ArrayList<TblCategory> chrgeListForAsset = (ArrayList)request.getAttribute("subCategoryChrgeListForAsset");
							  	if(chrgeListForAsset != null && !chrgeListForAsset.isEmpty())
							  	{	  
							   		for(int i=0;i<chrgeListForAsset.size();i++)
							   		{	   
								%>
								<option>
									<% out.println(chrgeListForAsset.get(i).getCategoryNumber()); %>
								</option>
								<% } } else {   %>
								<option></option>
								<% }%>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.date"/>:
						</label>
						<div class="col-md-7">
							<div class="d-flex">
								<input type="text" class="form-control" id="AssetDate">
								<div class="input-group-append input-group-append1">
									<a class="input-group-text" href="#" id="billDuedateCalendar">&#9662;</a>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.amount"/>:
						</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="AssetAmount">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-5 col-form-label">
							<bean:message key="BzComposer.reconciliation.depreciation"/>:
						</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="AssetDescription">
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12 text-center">
				<button class="btn btn-info" onclick="return AddAssets()">
					<bean:message key="BzComposer.global.add"/>
				</button>
				<button class="btn btn-info">
					<bean:message key="BzComposer.global.close"/>
				</button>
			</div>
		</div>
	</div>
</div>
<div id="AddDlgId">
	<div class="form2">
		<div id="tabs">
			<ul>
				<li>
					<a href="#tabs-1">
						<bean:message key="BzComposer.reconciliation.fundtransfer"/>
					</a>
				</li>
				<li>
					<a href="#tabs-2">
						<bean:message key="BzComposer.reconciliation.payment"/>
					</a>
				</li>
				<li>
					<a href="#tabs-3">
						<bean:message key="BzComposer.reconciliation.deposit"/>
					</a>
				</li>
			</ul>
			<div id="tabs-1" class="pl-2 pr-2 pt-3 pb-1">
				<h3 class="title1 text-left mt-2">
					<bean:message key="BzComposer.reconciliation.payerinformation"/>
				</h3>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payeraccount"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payamount"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.paymethod"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option value="Check">
											<bean:message key="BzComposer.reconciliation.check"/>
										</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.date"/>:
								</label>
								<div class="col-md-7">
									<div class="d-flex">
										<input type="text" class="form-control" id="billDuedateCalendarText">
										<div class="input-group-append input-group-append1">
											<a class="input-group-text" href="#" id="billDuedateCalendar">&#9662;</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.endingbalance"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">&nbsp;</label>
								<div class="col-md-7">
									&nbsp;
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.checknumber"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payeeaccount"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option value="Check">
											<bean:message key="BzComposer.reconciliation.check"/>
										</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.endingbalance"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn btn-info" disabled><bean:message key="BzComposer.global.add"/></button>
						<button class="btn btn-info"><bean:message key="BzComposer.global.cancel"/></button>
					</div>
				</div>
			</div>
			<div id="tabs-2" class="pl-2 pr-2 pt-3 pb-1">
				<h3 class="title1 text-left mt-2">
					<bean:message key="BzComposer.reconciliation.payerinformation"/>
				</h3>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payeraccount"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payamount"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.paymethod"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option value="Check">
											<bean:message key="BzComposer.reconciliation.check"/>
										</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.date"/>:
								</label>
								<div class="col-md-7">
									<div class="d-flex">
										<input type="text" class="form-control" id="billDuedateCalendarText">
										<div class="input-group-append input-group-append1">
											<a class="input-group-text" href="#" id="billDuedateCalendar">&#9662;</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.endingbalance"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">&nbsp;</label>
								<div class="col-md-7">
									&nbsp;
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.checknumber"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payeeaccount"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control" style="overflow-x: auto;" multiple>
										<option>Check Check</option>
										<option>Check4</option>
										<option>Check2</option>
										<option>Check</option>
										<option>Check4</option>
										<option>Check7</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.endingbalance"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.category"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option></option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn btn-info"><bean:message key="BzComposer.global.add"/></button>
						<button class="btn btn-info"><bean:message key="BzComposer.global.cancel"/></button>
					</div>
				</div>
			</div>
			<div id="tabs-3" class="pl-2 pr-2 pt-3 pb-1">
				<h3 class="title1 text-left mt-2">
					<bean:message key="BzComposer.reconciliation.payerinformation"/>
				</h3>
				<hr>
				<div class="row">
					<div class="col-md-8">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-4 col-form-label">
									<bean:message key="BzComposer.reconciliation.payeraccount"/>:
								</label>
								<div class="col-md-8">
									<select class="form-control" style="overflow-x: auto;" multiple>
										<option>Check Check</option>
										<option>Check4</option>
										<option>Check2</option>
										<option>Check</option>
										<option>Check4</option>
										<option>Check7</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.endingbalance"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payamount"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.paymethod"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option value="Check"><bean:message key="BzComposer.reconciliation.check"/></option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.date"/>:
								</label>
								<div class="col-md-7">
									<div class="d-flex">
										<input type="text" class="form-control" id="billDuedateCalendarText">
										<div class="input-group-append input-group-append1">
											<a class="input-group-text" href="#" id="billDuedateCalendar">&#9662;</a>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">&nbsp;</label>
								<div class="col-md-7">
									&nbsp;
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.checknumber"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.payeeaccount"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option>Check Check  </option>
										<option>Check4</option>
										<option>Check2</option>
										<option>Check</option>
										<option>Check4</option>
										<option>Check7</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-horizontal">
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.endingbalance"/>:
								</label>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-5 col-form-label">
									<bean:message key="BzComposer.reconciliation.category"/>:
								</label>
								<div class="col-md-7">
									<select class="form-control">
										<option>3000 Products Sales</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn btn-info"><bean:message key="BzComposer.global.add"/></button>
						<button class="btn btn-info"><bean:message key="BzComposer.global.cancel"/></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid" id="EditDlgId">
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
		 												<bean:message key="BzComposer.reconciliation.payer"/>
	 												</label>
 												</td>
		 										<td>
		 											<select class="payerField" id="payerForEdit" onchange="">
		 											<!-- <option>dfdfdfdf</option> -->
		 		 										<% ArrayList<ClientVendor> listOfVendorForEdit = (ArrayList)request.getAttribute("allClientVendor");
		 												for(int i=0;i<listOfVendorForEdit.size();i++)
		 												{
		 												%>
		 												<option value="<%=listOfVendorForEdit.get(i).getCvID() %>">
		 													<% out.println(listOfVendorForEdit.get(i).getFirstName() + " " + listOfVendorForEdit.get(i).getLastName() + "(" + listOfVendorForEdit.get(i).getName() + ")"); %>
	 													</option>
		 												<% } %> 
		 											</select>
	 											</td>
		 										<td>
		 											<input type="hidden" value="" id="categoryIdForPayerForDeposit">
	 											</td>
	 										</tr>
	 										<tr>
		 										<td>
		 											<label>
		 												<bean:message key="BzComposer.reconciliation.payee"/>
	 												</label>
 												</td>
		 										<td>
		 											<select class="accountFieldForEdit" id="payeeForEdit">
		 											<!-- <option>lkjljlkjklj</option> -->
		 		 										<% 
	 			 											ArrayList<TblAccount> listOfAccountForEdit = (ArrayList)request.getAttribute("accountList");  
		 													for(int i=1;i<listOfAccountForEdit.size();i++)
		 													{
	 													%>			
		 												<option value="<%= listOfAccountForEdit.get(i).getAccountID() %>">
		 													<% out.println(listOfAccountForEdit.get(i).getName()); %>
	 													</option>
			 											<% } %> 
		 											</select>
	 											</td>
	 										</tr>
		 									<tr>
	 											<td>
	 												<label>
	 													<bean:message key="BzComposer.reconciliation.paymethod"/>
 													</label>
												</td>
	 											<td>
	 												<select class="payMethodForEdit" style="width:100%" onchange="" id="payMethodForEdit">
	 												<!-- <option>jkyhkjhjk</option> -->
											 			 <% 
											 				ArrayList<TblPaymentType> allPaymentList = (ArrayList)request.getAttribute("allPaymentList");
											 				for(int i=0;i<allPaymentList.size();i++)
											 				{	
											 			%>
	 													<option value="<%= allPaymentList.get(i).getId() %>">
	 														<% out.println(allPaymentList.get(i).getTypeName());%>
 														</option>
	 													<% } %> 
	 												</select>
 												</td>
	 										</tr>
	 		 								<tr>
	 											<td>
	 												<label>
	 													<bean:message key="BzComposer.reconciliation.category"/>
 													</label>
												</td>
	 											<td>
	 												<select class="categoryForEdit" id="categoryForEdit">
	 												<!-- <option>khklhkhklhl</option> -->
	 			 										<% ArrayList<TblCategory> getAllcategory = (ArrayList) request.getAttribute("allCategoryList");
	 														for(int i=0;i<getAllcategory.size();i++)
	 														{
	 													%>
	 													<option value="<%= getAllcategory.get(i).getId() %>">
	 														<% out.println(getAllcategory.get(i).getName() + " " + getAllcategory.get(i).getCategoryNumber()); %>
 														</option>
	 													<% } %> 
	 												</select>
 												</td>
	 										</tr>				
	 									</table>	
	 								</div>
	 								<div class="col-md-6 " id="editTable2">
	 									<table class="bz_dialogTable devSecondEditTable">
	 										<tr>
	 											<td>
	 												<label>
	 													<bean:message key="BzComposer.reconciliation.amount"/>
 													</label>
												</td>
	 											<td>
	 												<input class="devAmount" type="text" id="amountToEdit"/>
 												</td>
	 										</tr>
	 										<tr>
	 											<td>
	 												<label>
	 													<bean:message key="BzComposer.reconciliation.date"/>
 													</label>
												</td>
	 											<td>
	 												<input type="text" class="devDate" id="devDateForEdit"/>
 												</td> 
	 										</tr>
	 										<tr>
	 											<td>
	 												<label>
	 													<bean:message key="BzComposer.reconciliation.checknumber"/>
 													</label>
												</td>
	 											<td>
	 												<input type="text" class="checkNumberForEdit" id="checkNumberEdit"/>
 												</td>
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
  		<button type="button" class="btn btn-success" style="float: right;margin-right: 10px;" onclick="return editTransaction()" id="addButtonForDeposit">
  			<bean:message key="BzComposer.global.save"/>
  		</button>
	</div> 	
</div>
<script type="text/javascript">
var inv = -1;
var paymentId = -1;
var acId = -1;
var accountId = -1;
var tableName = "";
function getPayments(index,payId,accId,type)
{
	debugger;
	this.inv = index;
	this.paymentId = payId;
	this.accountId = accId; 
	var accountCombo = document.getElementById("account");
	this.acId = accountCombo.options[accountCombo.selectedIndex].value; 
	this.tableName = type;
	
	if(tableName == "Payment")
	{	
			$("select.payerField").val($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(4)').attr('value'));
			$("select.categoryForEdit").val($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(6)').attr('value'));
			$(".devAmount").val($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(5)').text());
			$("select.accountFieldForEdit").val(accountId);
			$("select.payMethodForEdit").val($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value'));
			
			if($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '1' || $('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '192' || $('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '-1')
			{
				if($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '-1')
				{
					$("#checkNumberEdit").prop("disabled",true);
				}
				else
				{
					$("#checkNumberEdit").prop("disabled",false);
				}
				if($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(3)').text() != '')
				{	
					$(".checkNumberForEdit").val($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(3)').text());
				}	
			}
			else
			{
				$(".checkNumberForEdit").val('');
			}
			$(".devDate").val($('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(2)').text());
	}
	else
	{
		$("select.payerField").val($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(4)').attr('value'));
		$("select.categoryForEdit").val($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(6)').attr('value'));
		$(".devAmount").val($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(5)').text());
		$("select.accountFieldForEdit").val(accountId);
		$("select.payMethodForEdit").val($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value'));
		
		if($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '1' || $('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '192' || $('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '-1')
		{
			if($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value') == '-1')
			{
				$("#checkNumberEdit").prop("disabled",true);
			}
			else
			{
				$("#checkNumberEdit").prop("disabled",false);
			}
			if($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(3)').text() != '')
			{	
				$(".checkNumberForEdit").val($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(3)').text());
			}	
		}
		else
		{
			$(".checkNumberForEdit").val('');
		}
		$(".devDate").val($('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(2)').text());
	}
}
$(document).ready(function () {
   
}); 
$(document).ready(function(){
	debugger;
	$("#fromDate").val("11/14/2007");
	$("#toDate").val((new Date().getMonth()+1) + "/" + new Date().getDate() + "/" + new Date().getFullYear());
	$("#ReconcileDate").val((new Date().getMonth()+1) + "/" + new Date().getDate() + "/" + new Date().getFullYear());
    document.getElementById("account").selectedIndex = 1;
    $("#ReconcileDlgId").hide();
    $("#AssetDlgId").hide();
    $("#AddDlgId").hide();
    $("#EditDlgId").hide();
    $("#CheckBoxForReconcile").prop("checked",false);
    $("#checkNumberForReconcile").prop("disabled",true);
    $("#AssetDate").val((new Date().getMonth()+1) + "/" + new Date().getDate() + "/" + new Date().getFullYear());
});
$('tr').click(function () {
    var selected = $(this).hasClass("highlight"); 
    $("tr").removeClass("highlight");
    if(!selected)
        $(this).addClass("highlight");
});
$(function() {
	
	$("#AssetDate" ).datepicker();
	$("#ReconcileDate" ).datepicker();
});

$(function() {
	   $( "#ReconcileButton").on("click", function(){
		  debugger;
		  var bankAccountCombo = document.getElementById("account");
		  $("#ReconcileBankName").html("Reconcile"+ " "+bankAccountCombo.options[bankAccountCombo.selectedIndex].text);
		  
		   $( "#ReconcileDlgId").dialog({
	    	   modal: true,
	    	   title: 'Reconcile'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 });
$(function() {
	   $( "#AssetButton").on("click", function(){
		  debugger;
		
		   $( "#AssetDlgId").dialog({
	    	   modal: true,
	    	   title: 'Set Assest Amount'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 });
/* $(function() {
	   $( "#AddButton").on("click", function(){
		  debugger;
		
		   $( "#AddDlgId").dialog({
	    	   modal: true,
	    	   title: 'Add Transaction'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 }); */
	 $(function() {
		   $( "#AddButton").on("click", function(){
			  debugger;

				return gotobankandadddialog();
		    });
		 });
$(function() {
	   $( "#EditButton").on("click", function(){
		  debugger;
		
		   $( "#EditDlgId").dialog({
	    	   modal: true,
	    	   title: 'Edit Transaction'
	        });   
	    });
	    
	   $(document.forms[0]).submit(function(event) {
		    event.preventDefault();
		});
	 });
function editTransaction()
{
	debugger;
	var oldClientVendorId;
	var oldAccountId;
	var oldPaymentTypeId;
	
	if(tableName == "Payment")
	{	
		oldClientVendorId = $('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(4)').attr('value');
		oldAccountId = $('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(8)').attr('value');
		oldPaymentTypeId = $('table.devPaymentsTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value');
	}
	else
	{
		oldClientVendorId = $('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(4)').attr('value');
		oldAccountId = $('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(8)').attr('value');
		oldPaymentTypeId = $('table.devDepositTable tbody tr:nth-child('+inv+')').find('td:nth-child(7)').attr('value');
	}
	
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
	$('#EditDlgId').dialog('close'); 
	$.ajax({
		
		type : "POST",
		url : "Reconsilation.do?tabid=EditTransaction",
		data : "row=" + obj + "&PaymentId=" + paymentId + "&amount=" +amount + "&date=" + date + "&tableName=" +tableName,
	    success : function(data) {
			/* var html = "" + data.msg; */
			debugger;   
			updateReconsilationTab(data);
		
		},
		 error : function(data) {

			return showerrordialog();
		} 
	});
}
function executeQuery()
{
	debugger;
	var accountCombo = document.getElementById("account");
	var accountId = accountCombo.options[accountCombo.selectedIndex].value;
	
	var fromDate = $("#fromDate").val();
	var toDate = $("#toDate").val();
	
	var TblPayment={
			  
			 "accountID":accountId,
			 "fromDate":fromDate,
			 "toDate":toDate
	};
   var obj=JSON.stringify(TblPayment); 
	$.ajax({
		
		type : "POST",
	 	url : "Reconsilation.do?tabid=Payment", 
		data :"data=" + obj,
	    success : function(data) {
			debugger;
	    	
			updateReconsilationTab(data);
		},
		 error : function(data) {

			 return showerrordialog();
		} 
	}); 
}
function deletePayment()
{
	if(paymentId == -1)
	{

		return selectpaymentdialog();
		return false;
	}
	/* var status = window.confirm("<bean:message key='BzComposer.reconciliation.liketoremovetransaction'/>");
	if(status == true)
	{	
	
		$.ajax({
				
				type : "POST",
			 	url : "Reconsilation.do?tabid=DeletePayment", 
				data :"PaymentId=" + paymentId + "&AccountId=" +acId,
			    success : function(data) {
					debugger;
			    	
					updateReconsilationTab(data);
					paymentId = -1;
				},
				 error : function(data) {

					return showerrordialog();
				} 
			});
	}
	else{
		return false;
	} */
	
	debugger;
	event.preventDefault();
	$("#removeselectedtransactiondialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	        		$.ajax({
	    				
	    				type : "POST",
	    			 	url : "Reconsilation.do?tabid=DeletePayment", 
	    				data :"PaymentId=" + paymentId + "&AccountId=" +acId,
	    			    success : function(data) {
	    					debugger;
	    			    	
	    					updateReconsilationTab(data);
	    					paymentId = -1;
	    				},
	    				 error : function(data) {

	    					return showerrordialog();
	    				} 
	    			});
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
function getCategoryAndCharge()
{
	var categoryTypCombo = document.getElementById("CategoryTypeForReconsile");
	var categoryTypeId = categoryTypCombo.options[categoryTypCombo.selectedIndex].value;
	
	var bankAccountCombo = document.getElementById("account");
	var accountId = bankAccountCombo.options[bankAccountCombo.selectedIndex].value;
	TblCategoryType = {
			
		"categoryTypeID":categoryTypeId,	
		"accountID": accountId
	};
	var obj = JSON.stringify(TblCategoryType);
	
$.ajax({
		
		type : "POST",
	 	url : "Reconsilation.do?tabid=CategoryType", 
		data :"data1=" + obj,
	    success : function(data) {
			debugger;
	    	
			updateReconsilationTab(data);
		},
		 error : function(data) {

			return showerrordialog()
		} 
	}); 
}
function getCharge()
{
	var categoryCombo = document.getElementById("CategoryForReconsile");
	var categoryId = categoryCombo.options[categoryCombo.selectedIndex].value;
	
	/* var categoryTypCombo = document.getElementById("CategoryTypeForReconsile");
	var categoryTypeId = categoryTypCombo.options[categoryTypCombo.selectedIndex].value; */
	
	var bankAccountCombo = document.getElementById("account");
	var accountId = bankAccountCombo.options[bankAccountCombo.selectedIndex].value;
	
	TblCategory = {
			
		"id":categoryId,
		"accountID": accountId
	};
	/* TblCategoryType = {
			
			"categoryTypeID":categoryTypeId	
		}; */
	/* var obj1 = JSON.stringify(TblCategoryType); */
	var obj = JSON.stringify(TblCategory);
	
$.ajax({
		
		type : "POST",
	 	url : "Reconsilation.do?tabid=CategoryType", 
		data :"data2=" + obj,
	    success : function(data) {
			debugger;
	    	
			/* updateReconsilationTab(data); */
			updateChargeDropdown(data);
		},
		 error : function(data) {

			return showerrordialog()
		} 
	}); 
}
function updateChargeDropdown(data)
{
	$(document).find('div#ChrgeForReconsileDiv select').replaceWith($(data).find("div#ChrgeForReconsileDiv").html());
}
function getCheckboxForReconcile()
{
	if($("#CheckBoxForReconcile").prop("checked"))
	{
		$("#checkNumberForReconcile").prop("disabled",false);
	}
	else
	{
		$("#checkNumberForReconcile").prop("disabled",true);
	}
}
function AddFromReconcileDlg()
{
	debugger;
	
	var checkNumber = "";
	var categoryTypeCombo = document.getElementById("CategoryTypeForReconsile");
	var categoryTypeId = categoryTypeCombo.options[categoryTypeCombo.selectedIndex].value;
	var categoryCombo = document.getElementById("CategoryForReconsile");
	var categoryId = categoryCombo.options[categoryCombo.selectedIndex].value;
	
	var chargeForreconcileCombo = document.getElementById("ChrgeForReconsile");
	if(chargeForreconcileCombo.length > 0)
	{	
		var chargeForReconcileCategoryId = chargeForreconcileCombo.options[chargeForreconcileCombo.selectedIndex].value;
	}	
	else
	{

		return entervalidnamedialog();
		return false;
	}
	
	var date = $("#ReconcileDate").val();
	var amount = $("#AmountForReconcileDlg").val();
	if(amount == '')
	{

		return entervalidamountdialog();
		return false;
	}
	var checkboxForReconcile = $("#CheckBoxForReconcile").prop("checked");
	
	if(checkboxForReconcile)
	{
		checkNumber = $("#checkNumberForReconcile").val();
		if(checkNumber == '' || checkNumber == '0')
		{

			return entervalidchecknumberdialog();
			return false;
		}
	}
	var bankAccountCombo = document.getElementById("account");
	var accountId = bankAccountCombo.options[bankAccountCombo.selectedIndex].value;
	var customerCurrentbalance = bankAccountCombo.options[bankAccountCombo.selectedIndex].label
	
	TblPayment = {
			"accountID":accountId ,
			"categoryId":chargeForReconcileCategoryId ,
			"amount":amount,
			"selectedCheckbox":checkboxForReconcile,
			"checkNumber":checkNumber,
			"fromDate":date 
	};
	var obj = JSON.stringify(TblPayment);
	 $('#ReconcileDlgId').dialog('close');
$.ajax({
		
		type : "POST",
	  	url : "Reconsilation.do?tabid=AddReconcile",  
		data :"data3=" + obj,
	    success : function(data) {
			debugger;
	    	
			updateReconsilationTab(data);
		},
		 error : function(data) {

			return showerrordialog();
		} 
	}); 
}
function changeAssetCategory()
{
	debugger;
	var categoryCombo = document.getElementById("AssetCategoryId");
	var categoryId = categoryCombo.options[categoryCombo.selectedIndex].value; 
	
	var bankAccountCombo = document.getElementById("account");
	var accountId = bankAccountCombo.options[bankAccountCombo.selectedIndex].value;
	
	TblCategory = {
			"id":categoryId,
			"accountID": accountId
	};
	var obj = JSON.stringify(TblCategory);
$.ajax({
		
		type : "POST",
	  	url : "Reconsilation.do?tabid=SubAssetCategory",  
		data :"data4=" + obj,
	    success : function(data) {
			debugger;
	    	
			$(document).find('div#AssetChargeCategoryDiv select').replaceWith($(data).find("div#AssetChargeCategoryDiv").html());
		},
		 error : function(data) {
			/* alert("<bean:message key='BzComposer.reconciliation.someerroroccurred'/>"); */
			 return showerrordialog();
		} 
	}); 
}
function AddAssets()
{
	debugger;
	 $('#AssetDlgId').dialog('close');
	 $("#AssetAmount").val("");
	 $("#AssetCategoryId").val($("#AssetCategoryId option:first").val());
	 $("#ChrgeIdForAsset").children('option').hide();
	 $("#AssetDescription").val("");
}
function addNewSituation()
{

	return gotobankandeditdialog();
	return false;
}
function addCss()
{
	$('tr').click(function () {
	    var selected = $(this).hasClass("highlight"); 
	    $("tr").removeClass("highlight");
	    if(!selected)
	        $(this).addClass("highlight");
	});
}
function updateReconsilationTab(data)
{
	$(document).find('div#PaymentsTable table').replaceWith($(data).find('div#PaymentsTable').html());
	$(document).find('div#DepositsTable table').replaceWith($(data).find('div#DepositsTable').html());
	$(document).find('div#CategoryForReconsileDiv select').replaceWith($(data).find("div#CategoryForReconsileDiv").html());
	$(document).find('div#ChrgeForReconsileDiv select').replaceWith($(data).find("div#ChrgeForReconsileDiv").html());
	
	if($(data).find('div#paymentsCountBottom label').eq(0).text(this.value).text() == "")
	{	
		$(document).find('div#paymentsCountBottom label').eq(0).text(this.value).replaceWith("<label id='paymentCount'>"+0+"</label>");
	}
	else
	{
		$(document).find('div#paymentsCountBottom label').eq(0).text(this.value).replaceWith($(data).find('div#paymentsCountBottom label').eq(0).text(this.value));
	}
	if($(data).find('div#paymentsTotalBottom label').eq(0).text(this.value).text() == "")
	{
		$(document).find('div#paymentsTotalBottom label').eq(0).text(this.value).replaceWith("<label id='paymentTotal'>"+0.00+"</label>");
	}
	else
	{
		$(document).find('div#paymentsTotalBottom label').eq(0).text(this.value).replaceWith($(data).find('div#paymentsTotalBottom label').eq(0).text(this.value));
	}
	if($(data).find('div#depositsCountBottom label').eq(0).text(this.value).text() == "")
	{
		$(document).find('div#depositsCountBottom label').eq(0).text(this.value).replaceWith("<label id='depositCount'>"+0+"</label>");
	}
	else
	{
		$(document).find('div#depositsCountBottom label').eq(0).text(this.value).replaceWith($(data).find('div#depositsCountBottom label').eq(0).text(this.value));
	}
	if($(data).find('div#depositsTotalBottom label').eq(0).text(this.value).text() == "")
	{
		$(document).find('div#depositsTotalBottom label').eq(0).text(this.value).replaceWith("<label id='depositTotal'>"+0.00+"</label>");
	}
	else
	{
		$(document).find('div#depositsTotalBottom label').eq(0).text(this.value).replaceWith($(data).find('div#depositsTotalBottom label').eq(0).text(this.value));
	}
	$("#AmountForReconcileDlg").val('');
	$("#ReconcileDate").val((new Date().getMonth()+1) + "/" + new Date().getDate() + "/" + new Date().getFullYear());
	$("#CheckBoxForReconcile").prop("checked",false);
	$("#checkNumberForReconcile").prop("disabled",true);
	$("#AssetAmount").val("");
	$("#AssetCategoryId").val($("#AssetCategoryId option:first").val());
	$("#AssetDescription").val("");
	addCss();
}
$( function() {
    $( "#tabs" ).tabs();
  });
function gotobankandadddialog()
{
	event.preventDefault();
	$("#gotobankandadddialog").dialog({
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
function showerrordialog()
{
	event.preventDefault();
	$("#showerrordialog").dialog({
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
function selectpaymentdialog()
{
	event.preventDefault();
	$("#selectpaymentdialog").dialog({
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
function entervalidnamedialog()
{
	event.preventDefault();
	$("#entervalidnamedialog").dialog({
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
function entervalidamountdialog()
{
	event.preventDefault();
	$("#entervalidamountdialog").dialog({
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
function entervalidchecknumberdialog()
{
	event.preventDefault();
	$("#entervalidchecknumberdialog").dialog({
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
function gotobankandeditdialog()
{
	event.preventDefault();
	$("#gotobankandeditdialog").dialog({
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


function getDateVisePayment(status)
{
if(status == 'backward')
{	
	fromDate = $("#fromDate").val();
	if(new Date(this.fromDate).getMonth() == 2)
	{
		this.fromDate = new Date(this.fromDate).getMonth() + "/" + 28 + "/" + new Date(this.fromDate).getFullYear();
		this.fromDate = 2 + "/" + new Date(this.fromDate).getDate() + "/" + new Date(this.fromDate).getFullYear();
	}
	else if(this.fromDate.substring(0) == '0')
	{
		this.fromDate = 12 + "/" + 28 + "/" + this.fromYear - 1;
		this.fromDate = new Date(this.fromDate).getMonth() + "/" + new Date(this.fromDate).getDate() + "/" + new Date(this.fromDate).getFullYear();
	} 
	else
	{	
		this.fromDate = new Date(this.fromDate).getMonth() + "/" + new Date(this.fromDate).getDate() + "/" + new Date(this.fromDate).getFullYear();
		if(this.fromDate.substring(0,1) == '0')
		{
			this.fromDate = 12 + "/" + 28 + "/" + (fromYear-1);
			this.fromYear = (fromYear-1);
		}
	}	
	toDate = $("#toDate").val();
	if(new Date(this.toDate).getMonth() == 2)
	{
		this.toDate = new Date(this.toDate).getMonth() + "/" + 28 + "/" + new Date(this.toDate).getFullYear();
		this.toDate = 2 + "/" + new Date(this.toDate).getDate() + "/" + new Date(this.toDate).getFullYear();
	}
	else if(this.toDate.substring(0) == '0')
	{
		this.toDate = 12 + "/" + 28 + "/" + this.toYear - 1;
		this.toDate = new Date(this.toDate).getMonth() + "/" + new Date(this.toDate).getDate() + "/" + new Date(this.toDate).getFullYear();
	} 
	else if(new Date(this.toDate).getDate() == 31)
	{
		this.toDate = new Date(this.toDate).getMonth() + "/" + (new Date(this.toDate).getDate()-1) + "/" + new Date(this.toDate).getFullYear();
	}	
	else
	{	
		this.toDate = new Date(this.toDate).getMonth() + "/" + new Date(this.toDate).getDate() + "/" + new Date(this.toDate).getFullYear();
		if(this.toDate.substring(0,1) == '0')
		{
			this.toDate = 12 + "/" + 28 + "/" + (toYear-1);
			this.toYear = (toYear-1);
		}
	}	
	$("#fromDate").val(this.fromDate);
	$("#toDate").val(this.toDate);
	/* executeQuery(); */
}
 else
{
	 fromDate = $("#fromDate").val();
	if((new Date(this.fromDate).getMonth()+2) == 2)
	{
		this.fromDate = (new Date(this.fromDate).getMonth()+2) + "/" + 28 + "/" + new Date(this.fromDate).getFullYear();
		this.fromDate = 2 + "/" + new Date(this.fromDate).getDate() + "/" + new Date(this.fromDate).getFullYear();
	}
	else if(this.fromDate.substring(0) == '0')
	{
		this.fromDate = 12 + "/" + 28 + "/" + this.fromYear - 1;
		this.fromDate = (new Date(this.fromDate).getMonth()+2) + "/" + new Date(this.fromDate).getDate() + "/" + new Date(this.fromDate).getFullYear();
	} 
	else
	{	
		this.fromDate = (new Date(this.fromDate).getMonth()+2) + "/" + new Date(this.fromDate).getDate() + "/" + new Date(this.fromDate).getFullYear();
		if(this.fromDate.substring(0,1) == '11')
		{
			this.fromDate = 12 + "/" + 28 + "/" + (fromYear-1);
			this.fromYear = (fromYear-1);
		}
		if(this.fromDate.substring(0,2) == '13')
		{
			this.fromDate = 1 + "/" + 28 + "/" + (fromYear+1);
			this.fromYear = fromYear + 1;
		}
	}	
	toDate = $("#toDate").val();
	if((new Date(this.fromDate).getMonth()+2) == 2)
	{
		this.toDate = (new Date(this.fromDate).getMonth()+2) + "/" + 28 + "/" + new Date(this.toDate).getFullYear();
		this.toDate = 2 + "/" + new Date(this.toDate).getDate() + "/" + new Date(this.toDate).getFullYear();
	}
	else if(this.toDate.substring(0) == '0')
	{
		this.toDate = 12 + "/" + 28 + "/" + this.toYear - 1;
		this.toDate = (new Date(this.fromDate).getMonth()+2) + "/" + new Date(this.toDate).getDate() + "/" + new Date(this.toDate).getFullYear();
	} 
	else if(new Date(this.toDate).getDate() == 31)
	{
		this.toDate = (new Date(this.fromDate).getMonth()+2) + "/" + (new Date(this.toDate).getDate()-1) + "/" + new Date(this.toDate).getFullYear();
	}	
	else
	{	
		this.toDate = (new Date(this.fromDate).getMonth()+2) + "/" + new Date(this.toDate).getDate() + "/" + new Date(this.toDate).getFullYear();
		if(this.toDate.substring(0,1) == '11')
		{
			this.toDate = 12 + "/" + 28 + "/" + new Date(this.toDate).getFullYear();
			
		}
		if(this.toDate.substring(0,2) == '13')
		{
			this.toDate = 1 + "/" + 28 + "/" + (toYear+1);
			this.toYear = toYear + 1;
		}
	}	
	$("#fromDate").val(this.fromDate);
	$("#toDate").val(this.toDate);
} 
	executeQuery();									//calling method to execute
}
</script>
</body>
</html>
<!-- Dialog box used in this page -->
<div id="gotobankandadddialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.gotobankingtabandaddbutton'/></p>
</div>
<div id="showerrordialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.someerroroccurred'/></p>
</div>
<div id="selectpaymentdialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.selectpaymentfirst'/></p>
</div>
<div id="removeselectedtransactiondialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.liketoremovetransaction'/></p>
</div>
<div id="entervalidnamedialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.changenamecantempty'/></p>
</div>
<div id="entervalidamountdialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.entervalidamount'/></p>
</div>
<div id="entervalidchecknumberdialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.entervalidchecknumber'/></p>
</div>
<div id="gotobankandeditdialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.gotocategorymanagerandeditbutton'/></p>
</div>