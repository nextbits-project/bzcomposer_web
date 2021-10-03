<%@ page contentType="text/html;charset=UTF-8" %>
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
<title><bean:message key="BzComposer.categorydetailtitle"/></title>

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
.highlight { background-color: #00CED1 !important;color: #fff }	 
</style>
</head>
<body>
<div class="clearfix"></div>
<div id="ddcolortabsline">&nbsp;</div>
<div class="content1 clearfix">
<div class="form-inline  d-flex justify-content-center">
	<div class="form-group ml-2">
		<label>
			<bean:message key="BzComposer.categorydetail.account"/>
		</label>
		<select class="form-control ml-1" id="accountId" onchange="executeQuery()">
			<% ArrayList<TblAccount> accountList = (ArrayList)request.getAttribute("accountList");
			for(int i=1;i<accountList.size();i++)
			{
			%>
			<option value="<%=accountList.get(i).getAccountID() %>">
				<% out.println(accountList.get(i).getName()); %>
			</option>
		<% }%>	
		</select>
	</div>
	<div class="form-group ml-2">
		<label>
			<bean:message key="BzComposer.categorydetail.category"/>
		</label>
		<select class="form-control ml-1" id="categoryId" onchange="executeQuery()">
			<option></option>
			<%ArrayList<TblCategory> categoryList = (ArrayList)request.getAttribute("listOfCategory"); 
			for(int i=0;i<categoryList.size();i++)
			{	  
				if(categoryList.get(i).getParent().equals("root"))
				{	
			%>
			<option class="font-weight-bold" value="<%=categoryList.get(i).getId() %>">
				<% out.println(categoryList.get(i).getName()); %>
			</option>
			<% } else { %>
			<option value="<%=categoryList.get(i).getId() %>">
				<% out.println(categoryList.get(i).getName()); %>
			</option>
			<% } }%>
		</select>
	</div>
	<div class="form-group ml-2">
		<div class="d-flex ml-1">
			<input type="text" class="form-control" id="fromDate" name="fromDate" onselect="getDateVisePayment()">
			<div class="input-group-append input-group-append1">
				<a class="input-group-text">&#9662;</a>
			</div>
		</div>
	</div>
	<div class="form-group ml-2">
		<div class="d-flex ml-1">
			<input type="text" class="form-control" id="toDate">
			<div class="input-group-append input-group-append1">
				<a class="input-group-text" href="#">&#9662;</a>
			</div>
		</div>
	</div>
	<button class="btn btn-info btn-sm pt-0 pb-0 ml-2" onclick="getDateVisePayment('backward')">
		<img width="26px" src="<bean:write name="path" property="pathvalue"/>/images/left.png">
	</button>
	<button class="btn btn-info btn-sm pt-0 pb-0  ml-2" onclick="getDateVisePayment('forward')">
		<img width="26px" src="<bean:write name="path" property="pathvalue"/>/images/right.png">
	</button>
</div>
<h3 class="title1">
	<bean:message key="BzComposer.categorydetail.payments"/>
</h3>
<div class="table1 mb-3" id="PaymentsTable">
	<table class="table table-bordered table-sm ">
		<thead class="thead-light">
			<tr>
				<th scope="col"><bean:message key="BzComposer.categorydetail.category"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.budgetcategory"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.date"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.checknumorreference"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.payee"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.amount"/></th>
		    </tr>
		</thead>
		<tbody>
			<% ArrayList<TblPayment> listOfPayments = (ArrayList)request.getAttribute("listOfPayments");
			if(listOfPayments != null)
		    {	
				for(int i=0;i<listOfPayments.size();i++)
				{
					if((!listOfPayments.isEmpty()) && listOfPayments != null )
					{  
	    	%>
	 	   	<tr>
				<td class="text-right">
					<% out.println(listOfPayments.get(i).getCategoryName()); %>
				</td>
				<td class="text-right" >
					<% out.println(listOfPayments.get(i).getBudgetCategoryName()); %>
				</td>
				<td class="text-right">
					<% out.println(listOfPayments.get(i).getDateAdded()); %>
				</td>
				<% if(!listOfPayments.get(i).getCheckNumber().equals("null")) {%>
				<td class="text-right">
					<% out.println(listOfPayments.get(i).getCheckNumber()); %>
				</td>
				<% } else {%>
				<td class="text-right"></td>
				<% } %>
				<td class="text-right">
					<% out.println(listOfPayments.get(i).getCompanyName()); %>
				</td>
				<td class="text-right">
					<% out.println(listOfPayments.get(i).getAmount()); %>
				</td>
			</tr>
			<% } else {
				for(int j=0;j<20;j++)
				{
			%>
			<tr>
				<td class="text-right"></td>
				<td class="text-right" ></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
			</tr>
			<% } } }} else { 
			for(int i=0;i<20;i++)
			{	
			%>
			<tr>
				<td class="text-right"></td>
				<td class="text-right" ></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
			</tr>
			<% } }%>     
		</tbody>	
	</table>
</div>
<h3 class="title1">
	<bean:message key="BzComposer.categorydetail.deposits"/>
</h3>
<div class="table1" id="DepositsTable">
	<table class="table table-bordered table-sm ">
		<thead class="thead-light">
			<tr>
				<th scope="col"><bean:message key="BzComposer.categorydetail.category"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.budgetcategory"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.date"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.checknumorreference"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.payer"/></th>
		      	<th scope="col"><bean:message key="BzComposer.categorydetail.amount"/></th>
		    </tr>
		</thead>
		<tbody>
			<% ArrayList<TblPayment> listOfDepositPayment = (ArrayList)request.getAttribute("listOfDepositPayments");
			if(listOfDepositPayment != null)
			{	  
				for(int i=0;i<listOfDepositPayment.size();i++)
				{
					if(!listOfDepositPayment.isEmpty() && listOfDepositPayment != null)
		          	{  
		    %>
			<tr>
				<td class="text-right">
					<% out.println(listOfDepositPayment.get(i).getCategoryName()); %>
				</td>
				<td class="text-right" >
					<% out.println(listOfDepositPayment.get(i).getBudgetCategoryName()); %>
				</td>
				<td class="text-right">
					<% out.println(listOfDepositPayment.get(i).getDateAdded()); %>
				</td>
				<% if(!listOfDepositPayment.get(i).getCheckNumber().equals("null")) {%>
				<td class="text-right">
					<% out.println(listOfDepositPayment.get(i).getCheckNumber()); %>
				</td>
				<% } else {%>
				<td class="text-right"></td>
				<% } %>
				<td class="text-right">
					<% out.println(listOfDepositPayment.get(i).getCompanyName()); %>
				</td>
				<td class="text-right">
					<% out.println(listOfDepositPayment.get(i).getAmount()); %>
				</td>
			</tr>
			<% } else {
				for(int j=0;j<20;j++)
				{
			%>
			<tr>
				<td class="text-right"></td>
				<td class="text-right" ></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
			</tr>
			<% }}}} else { 
			for(int i=0;i<20;i++)
			{	
			%>
			<tr>
				<td class="text-right"></td>
				<td class="text-right" ></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
				<td class="text-right"></td>
			</tr>
			<% } }%>     
		</tbody>	
	</table>
</div>
</div>
<script type="text/javascript">
var fromDate = '';
var toDate = '';
var fromYear = '';
var toYear = '';
$(function() {
	
	$( "#fromDate" ).datepicker();
	$( "#toDate" ).datepicker();
});
$(document).ready(function(){
	fromYear = new Date().getFullYear();
	toYear = new Date().getFullYear();
	/* fromDate = new Date().getMonth() +"/"+(new Date().getDate()-1)+"/"+new Date().getFullYear(); */
	if(new Date().getDate() == '31')
	{	
		$("#fromDate").val(new Date().getMonth() +"/"+(new Date().getDate()-1)+"/"+new Date().getFullYear());
	}
	else
	{
		$("#fromDate").val(new Date().getMonth() +"/"+(new Date().getDate())+"/"+new Date().getFullYear());
	}
	fromDate = $("#fromDate").val();
	$("#toDate").val(new Date().getMonth()+1 +"/"+(new Date().getDate())+"/"+new Date().getFullYear());
	toDate = $("#toDate").val();
});
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
function executeQuery()
{
	var categoryId = -1;
	var accountCombo = document.getElementById("accountId");
	var accountId = accountCombo.options[accountCombo.selectedIndex].value;
	var categoryCombo = document.getElementById("categoryId");
	categoryId = categoryCombo.options[categoryCombo.selectedIndex].value;
	if(categoryId == '')
	{
		categoryId = -1;
	}
	var fromDateToGet = $("#fromDate").val();
	var toDateToGet = $("#toDate").val();
	var TblPayment={			  
		 "accountID":accountId,
		 "categoryId":categoryId,
		 "fromDate":fromDateToGet,
		 "toDate":toDateToGet
	};
    var obj=JSON.stringify(TblPayment); 
	$.ajax({
		type : "POST",
	 	url : "CategoryDetail.do?tabid=Payment", 
		data :"data=" + obj,
	    success : function(data) {
			debugger;
	    	UpdateCategoryDetailpanel(data);
		},
		 error : function(data) {
			//alert("<bean:message key='BzComposer.categorydetail.erroroccurred'/>");
			return showerrordialog();
		} 
	}); 
}
$('#fromDate').datepicker({ 
	onSelect: function(date) {
		/* getDateVisePayment(); */
		 executeQuery();
		}
});
$('#toDate').datepicker({ 
	onSelect: function(date) {
		/* getDateVisePayment(); */
		 executeQuery();
		}
});
function UpdateCategoryDetailpanel(data)
{
	$(document).find('div#PaymentsTable table').replaceWith($(data).find('div#PaymentsTable').html());
	$(document).find('div#DepositsTable table').replaceWith($(data).find('div#DepositsTable').html()); 
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
</script>
</body>
</html>
<!-- Dialog box used in this page -->
<div id="showerrordialog" style="display:none;">
	<p><bean:message key='BzComposer.categorydetail.erroroccurred'/></p>
</div>