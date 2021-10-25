<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.nxsol.bizcomposer.common.BillingStatement"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.ReceivableListBean"%>
<%@page import="com.nxsol.bizcompser.global.table.TblCategory"%>
<%@page import="com.nxsol.bizcomposer.global.clientvendor.ClientVendor"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPaymentType"%>
<%@page import="com.nxsol.bizcomposer.common.JProjectUtil"%>
<%@ page isELIgnored="false"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPayment"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@page
	import="com.pritesh.bizcomposer.accounting.bean.TblAccountCategory"%>
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
<title><bean:message key="BzComposer.billingboardtitle"/></title>

<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script>
	var ctx = "${pageContext.request.contextPath}";
</script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

#popupWindow {
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

#popupWindow {
	
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff;
	padding: 5px;
}
/* .table tr:hover { cursor: pointer;} */
.bz_dialogTable tr td {
	padding: 10px
}

.bz_dialogTable tr td label {
	font-size: 12px;
}

.bz_dialogTable tr td input {
	font-size: 12px;
}

.bz_dialogTable tr td select {
	font-size: 12px;
}

.bzbtn {
	position: relative;
	top: 87px;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}
#errmsg
{
color: red;
}
</style>
</head>
<body>
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="row">
			<div class="col">
				<h4><bean:message key="BzComposer.billingboard.fileteroptions"/></h4>
				<div class="row">
					<div class="col-sm-4">
						<div class="form-horizontal">
							<div class="form-row">
								<label class="col control-label"><bean:message key="BzComposer.billingboard.searchby"/></label>
							</div>
							<div class="form-row">
								<div class="form-group col">
									<label for="inputCity"><bean:message key="BzComposer.billingboard.column"/></label>
								</div>
								<div class="form-group col">
									<select id="advanceSearchCriteria" class="form-control" onchange="propertyDisableEnable()">
									    <option></option>
										<option value="Invoice#"><bean:message key="BzComposer.billingboard.invoicenumber"/></option>
										<option value="Bill#"><bean:message key="BzComposer.billingboard.billnumber"/></option>
										<option value="First Name"><bean:message key="BzComposer.global.firstname"/></option>
										<option value="Last Name"><bean:message key="BzComposer.global.lastname"/></option>
										<option value="Email"><bean:message key="BzComposer.global.email"/></option>
									</select>
								</div>
								<div class="form-group col">                                          <!-- search data for billing Statement -->
									<select id="searchDataForBillingStatement" class="form-control">
									    <option></option>
										<option value="Statement#"><bean:message key="BzComposer.billingboard.statementnumber"/></option>
										<option value="FirstName"><bean:message key="BzComposer.billingboard.firstname"/></option>
										<option value="LastName"><bean:message key="BzComposer.billingboard.lastname"/></option>
									</select>
								</div>
								<div class="form-group col">
									<button class="btn btn-defult btn-block" onclick="return searchByColumn()" id="columnSearchId">
										<bean:message key="BzComposer.billingboard.search"/>
									</button>
									<button class="btn btn-defult btn-block" onclick="return searchByColumnBillingStatement()" 
									id="columnSearchForBilling">
										<bean:message key="BzComposer.billingboard.search"/>
									</button>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col">
									<label for="inputCity"><bean:message key="BzComposer.billingboard.text"/></label>
								</div>
								<div class="form-group col">
									<input type="text" class="form-control" id="advanceSearchData" placeholder=""><span id="errmsg"></span>                             <!-- id="advanceSearchData" -->
								</div>
								<div class="form-group col">
									<button class="btn btn-defult btn-block" disabled="disabled" id="clearButtonId">
										<bean:message key="BzComposer.global.clear"/>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col" id="section2DivId">
						<div class="form-inline">
							<div class="form-group mb-2">
								<label for="staticEmail2"><bean:message key="BzComposer.billingboard.overdueinvoice"/></label>
								<button type="submit" class="btn bbtn-defult ml-2"><bean:message key="BzComposer.billingboard.search"/></button>
							</div>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" name="exampleRadios"
								id="exampleRadios1" value="option1" checked> 
								<label class="form-check-label" for="exampleRadios1">
									<bean:message key="BzComposer.billingboard.showallonverdueinvoice"/>
								</label>
						</div>
						<div class="form-check ">
							<input class="form-check-input" type="radio" name="exampleRadios"
								id="exampleRadios2" value="option2" style="margin-top: 10px;">
							<label class="form-check-label form-inline" for="exampleRadios2">
							<bean:message key="BzComposer.billingboard.overduedate"/> <input type="text" class="form-control ml-2 mr-2"
								id="inputAddress" placeholder=""> <bean:message key="BzComposer.billingboard.days"/>
							</label>
						</div>

						<div class="row">
							<div class="col">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="exampleCheckbos1"  
										id="exampleCheckbos1" value="option1" checked> 
										<label class="form-check-label" for="exampleCheckbos1">
											<bean:message key="BzComposer.billingboard.recurringbillinginvoice"/>
										</label>
								</div>

							</div>
							<div class="col">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="exampleCheckbos2" 
										id="exampleCheckbos2" value="option1" checked> 
										<label class="form-check-label" for="exampleCheckbos2">
											<bean:message key="BzComposer.billingboard.showall"/>
										</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col" id="section3DivId">              <!-- second tab  div --> 
						<div class="form-check">
							<div class="form-group mb-2">
								<label for="staticEmail2">
									<bean:message key="BzComposer.billingboard.customername"/>
								</label>
								<label for="staticEmail2"></label>
							</div>
						</div>

						<div class="form-check">
							<div class="form-group mb-2">
								<label for="staticEmail2">
									<bean:message key="BzComposer.billingboard.overdueinvoiceamount"/>
								</label>
								<label for="staticEmail2"></label>
							</div>
						</div>
						<div class="form-check ">
						  <div class="form-group mb-2">
							<label class="form-check-label form-inline" for="exampleRadios2">
								<bean:message key="BzComposer.billingboard.recurringservicecharge"/>
							</label>
							<label for="staticEmail2"></label>
						  </div>
						</div>
					</div>	
				</div>
			</div>
			<div class="col-sm-2" id="buttonsTabDiv">
				<div class="form-group">
					<button type="button" class="btn btn-default btn-block">
						<bean:message key="BzComposer.billingboard.createrecurringbillsbtn"/>
					</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-default btn-block" onclick="return PrintBilling()">
						<bean:message key="BzComposer.billingboard.printbillingbtn"/>
					</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-default btn-block"
						disabled="disabled">
						<bean:message key="BzComposer.billingboard.sendemailbtn"/>
					</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-default btn-block" onclick="return CreateBillingStatement()">
						<bean:message key="BzComposer.billingboard.createbillingstatementbtn"/>
					</button>
				</div>
			</div>
		</div>

		<hr>

		<div class="content-tabs">


			<div id="tabs" class="mb-3">
				<ul>
					<li class="tab">
						<a href="#tabs-1">
							<bean:message key="BzComposer.billingboard.tabs.recurringbillsandinvoice"/>
						</a>
					</li>
					<li class="tab">
						<a href="#tabs-2">
							<bean:message key="BzComposer.billingboard.tabs.billingstatements"/>
						</a>
					</li>
				</ul>
				<div id="tabs-1" class="pl-2 pr-2 pt-3 pb-1">
					<div class="table-responsive" id="billingTab1">
						<table class="table table-bordered text-nowrap" id="recBillId">
							<thead>
								<tr>
									<th scope="col"><bean:message key="BzComposer.billingboard.select"/></th>
									<%-- <th scope="col"><bean:message key="BzComposer.billingboard.billinumber"/></th> --%>
									<th scope="col"><bean:message key="BzComposer.billingboard.invoicenumber"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.customername"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.customerjob"/></th>
									<%-- <th scope="col"><bean:message key="BzComposer.global.email"/></th> --%>
									<th scope="col"><bean:message key="BzComposer.billingboard.billingcycle"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.orderdate"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.duedate"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.amount"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.paidamount"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.lastpayment"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.balance"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.billed"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.scheduledbillingdate"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.emailed"/></th>
									<th scope="col"><bean:message key="BzComposer.global.memo"/></th>
								</tr>
							</thead>
							<tbody>
							<% ArrayList<ReceivableListBean> billingList = (ArrayList)request.getAttribute("billingList");
												  int index = 1;  
								for(int i=0;i<billingList.size();i++)
								{	
                            %>
								<tr onclick="selctRow(<%= billingList.get(i).getInvoiceID()%>,<%= index%>)">
									<th><input type="checkbox" name="checkbox"></th>
									<!-- <td>&nbsp;</td> -->
									<td class="text-right"><% out.println(billingList.get(i).getOrderNum()); %></td>
									<td class="text-right"><% out.println(billingList.get(i).getCvName()); %></td>
									<td>&nbsp;</td>
									<!-- <td>&nbsp;</td> -->
									<td>&nbsp;</td>
									<td class="text-right"><% out.println(billingList.get(i).getDateAdded()); %></td>
									<td class="text-right"><% out.println(billingList.get(i).getOverDueDate()); %></td>
									<td class="text-right"><% out.println(billingList.get(i).getAdjustedTotal()); %></td>
									<td class="text-right"><% out.println(billingList.get(i).getPaidAmount()); %></td>
									<td></td>
									<td class="text-right"><% out.println(billingList.get(i).getBalance()); %></td>
									<td><input type="checkbox"/></td>
									<td ></td>
									<th><input type="checkbox"></th>
									<td class="text-right"><% out.println(billingList.get(i).getMemo()); %></td>
									
								</tr>
							<% index++; } %>	
							</tbody>
						</table>
					</div>
				</div>


				<div id="tabs-2" class="pl-2 pr-2 pt-3 pb-1">
					<div class="table-responsive" id="billingStatement">
						<table class="table table-bordered text-nowrap" id="BillingStatementId">
							<thead>
								<tr>
									<th scope="col"><bean:message key="BzComposer.billingboard.select"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.statementnumber"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.statementfor"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.customername"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.statementdate"/></th>
									<th scope="col"><bean:message key="BzComposer.billingboard.amount"/></th>
								</tr>
							</thead>
							<tbody>
							<% ArrayList<BillingStatement> billingStatementList = (ArrayList)request.getAttribute("billingStatementList"); 
							   for(int i=0;i<billingStatementList.size();i++)
							   {   
							%>
								<tr>
									<th><input type="checkbox" name="checkbox"></th>
									<td><% out.println(billingStatementList.get(i).getStatementNo());%></td>
									<td class="text-right"><% out.println(billingStatementList.get(i).getStatementFor());%></td>
									<td class="text-right"><% out.println(billingStatementList.get(i).getCustomerName());%></td>
									<td class="text-right"><% out.println(JProjectUtil.getdateFormat().format(billingStatementList.get(i).getStatementDate()));%></td>
									<td class="text-right"><% out.println(billingStatementList.get(i).getAmount());%></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="form-inline">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="inlineRadioOptions" id="selectAll" value="option1">
				<label class="form-check-label" for="inlineRadio1">
					<bean:message key="BzComposer.billingboard.selectallbtn"/>
				</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="inlineRadioOptions" id="unSelectAll" value="option2">
				<label class="form-check-label" for="inlineRadio2">
					<bean:message key="BzComposer.billingboard.unselectallbtn"/>
				</label>
			</div>
			<div class="form-check form-check-inline">
				<button class="btn btn-pripary">
					<bean:message key="BzComposer.billingboard.undobtn"/>
				</button>
			</div>
		</div>
		<script>
			$(function() {
				debugger;
				$("#tabs").tabs();
			});
		</script>
	</div>
<script type="text/javascript">
var invoiceId = -1;
var index = -1;
function selctRow(id,inv)
{
	debugger;
	this.invoiceId = id;
	this.index = inv;
}
function selectinvoicefirstdialog()
{
	event.preventDefault();
	$("#selectinvoicefirstdialog").dialog({
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
function showemptydatadialog()
{
	event.preventDefault();
	$("#showemptydatadialog").dialog({
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
$("#tabs").tabs({
  
	activate: function(event, ui) {
		debugger;
        
        var activeTab = $('#tabs').tabs('option', 'active');
        if(activeTab == 1)
        {
        	$("#buttonsTabDiv").hide();
        	$("#section2DivId").hide();
        	$('input[name="checkbox"]', '#BillingStatementId').prop('checked', false);
        	$("#section3DivId").show();
        	$("#searchDataForBillingStatement").show();
        	$("#advanceSearchCriteria").hide();
        	$("#columnSearchId").hide();
        	$("#columnSearchForBilling").show();
        }
        else
        {
        	$("#buttonsTabDiv").show();
        	$("#section2DivId").show();
        	$("#section3DivId").hide();
        	$("#searchDataForBillingStatement").hide();
        	$("#advanceSearchCriteria").show();
        	$("#columnSearchId").show();
        	$("#columnSearchForBilling").hide();
        }
    }
});

function PrintBilling()
{
	if(invoiceId == -1)
	{

		return selectinvoicefirstdialog();
		return false;
	}
	$.ajax({
			
			type : "POST",
			url : "BillingBoard.do?tabid=PrintBill",
		 	data:"invoiceId=" +invoiceId ,
		    success : function(data)
		    {
		    debugger;
		    updateBillingBoard(data);
				 
			},
			 error : function(data) {

				return showerrordialog();
			} 

});
}
function CreateBillingStatement()
{
	if(invoiceId == -1)
	{

		return selectinvoicefirstdialog();
		return false;
	}
	$.ajax({
			
			type : "POST",
			url : "BillingBoard.do?tabid=CreateBillingStatement",
		 	data:"invoiceId=" +invoiceId ,
		    success : function(data)
		    {
		    debugger;
		    updateBillingBoard(data);
				 
			},
			 error : function(data) {

				 return showerrordialog();
			} 

});
}
function searchByColumn()
{
	debugger;
	var searchCriteriaCombo = document.getElementById("advanceSearchCriteria");
	var advanceSerchCriteria = searchCriteriaCombo.options[searchCriteriaCombo.selectedIndex].value;
	
	var advanceSearchData = $("#advanceSearchData").val();
	if(advanceSearchData == '')
	{

		return showemptydatadialog();
		return false;
	}
	 $.ajax({
			
			type : "POST",
			url : "BillingBoard.do?tabid=searchByColumn",
		 	data:"advanceSerchCriteria=" + advanceSerchCriteria + "&advanceSearchData=" +advanceSearchData,
		    success : function(data)
		    {
		    debugger;
		    updateBillingBoard(data);
				 
			},
			 error : function(data) {

				 return showerrordialog();
			} 

});
	
}
function searchByColumnBillingStatement()
{
	debugger;
	var searchCriteriaCombo = document.getElementById("searchDataForBillingStatement");
	var advanceSerchCriteria = searchCriteriaCombo.options[searchCriteriaCombo.selectedIndex].value;
	
	var advanceSearchData = $("#advanceSearchData").val();
	if(advanceSearchData == '')
	{

		return showemptydatadialog()
		return false;
	}
	 $.ajax({
			
			type : "POST",
			url : "BillingBoard.do?tabid=searchForBillingStatement",
		 	data:"advanceSerchCriteria=" + advanceSerchCriteria + "&advanceSearchData=" +advanceSearchData,
		    success : function(data)
		    {
		    debugger;
		    updateBillingBoard(data);
				 
			},
			 error : function(data) {

				 return showerrordialog()
			} 

});
	
}

function updateBillingBoard(data)
{
	$(document).find('div#billingTab1 table').replaceWith($(data).find('div#billingTab1').html());
	$(document).find('div#billingStatement table').replaceWith($(data).find('div#billingStatement').html());
}
$(document).ready(function () {
	var searchCriteriaCombo = document.getElementById("advanceSearchCriteria");
	var advanceSerchCriteria = searchCriteriaCombo.options[searchCriteriaCombo.selectedIndex].value;
	if(advanceSerchCriteria == '')
	{
		$("#columnSearchId").prop("disabled",true);
		$("#clearButtonId").prop("disabled",true);
	}
	$("#section3DivId").hide();
	$("#searchDataForBillingStatement").hide();
	$("#columnSearchForBilling").hide();
});
/* $("#advanceSearchData").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    debugger;
    var searchCriteriaCombo = document.getElementById("advanceSearchCriteria");
	var advanceSerchCriteria = searchCriteriaCombo.options[searchCriteriaCombo.selectedIndex].value;
if(advanceSerchCriteria == "Invoice#" || advanceSerchCriteria == "Bill#")
{	
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
       //display error message
       $("#errmsg").html("Digits Only").show().fadeOut("slow");
              return false;
   }
   
} 
else
{
	 var keyCode = e.which ? e.which : e.keyCode;
	 var result = ((keyCode >= 65 && keyCode <= 90) || 
             (keyCode >= 97 && keyCode <= 122));
	 if(result == false)
	{
		 $("#errmsg").html("Digits Not Allowed").show().fadeOut("slow");
         return false;
	}
}
  }); */
function propertyDisableEnable()
{
	var searchCriteriaCombo = document.getElementById("advanceSearchCriteria");
	var advanceSerchCriteria = searchCriteriaCombo.options[searchCriteriaCombo.selectedIndex].value;
	if(advanceSerchCriteria != '')
	{
		$("#columnSearchId").prop("disabled",false);
		$("#clearButtonId").prop("disabled",false);
	}
	else
	{
		$("#columnSearchId").prop("disabled",true);
		$("#clearButtonId").prop("disabled",true);
	}
	$("#advanceSearchData").val('');
}
$(document).ready(function () {
    $('tr').click(function () {
         var selected = $(this).hasClass("highlight"); 
         $("tr").removeClass("highlight");
         if(!selected)
             $(this).addClass("highlight");
    });
}); 	
$(document).ready(function () {
	  $('body').on('click', '#selectAll', function () {
	    if ($(this).hasClass('allChecked')) {
	        $('input[name="checkbox"]', '#recBillId').prop('checked', false);
	        $('input[name="checkbox"]', '#BillingStatementId').prop('checked', false);
	    } else {
	        $('input[name="checkbox"]', '#recBillId').prop('checked', true);
	        $('input[name="checkbox"]', '#BillingStatementId').prop('checked', true);
	    }
	   /*  $(this).toggleClass('allChecked'); */
	  })
	  $('body').on('click', '#unSelectAll', function () {
	    if ($(this).hasClass('allChecked')) {
	        $('input[name="checkbox"]', '#recBillId').prop('checked', true);
	        $('input[name="checkbox"]', '#BillingStatementId').prop('checked', true);
	    } else {
	        $('input[name="checkbox"]', '#recBillId').prop('checked', false);
	        $('input[name="checkbox"]', '#BillingStatementId').prop('checked', false);
	    }
	   /*  $(this).toggleClass('allChecked'); */
	  })
});
</script>	
</body>
</html>
<!-- Dialog box used in this page -->
<div id="selectinvoicefirstdialog" style="display:none;">
	<p><bean:message key='BzComposer.billingboard.selectinvoicefirst'/></p>
</div>
<div id="showerrordialog" style="display:none;">
	<p><bean:message key='BzComposer.billingboard.someerroroccurred'/></p>
</div>
<div id="showemptydatadialog" style="display:none;">
	<p><bean:message key='BzComposer.billingboard.dataisempty'/></p>
</div>