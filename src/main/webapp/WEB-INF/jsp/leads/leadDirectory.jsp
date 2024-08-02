<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.leadinfotitle" /></title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<spring:url value="/cssresources/Myapp.css" var="mycss" />
<script>var ctx = "${pageContext.request.contextPath}";</script>
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
	padding: 10px;
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
	top: 10px;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

label {
	display: inline-block;
	margin-bottom: 0;
}

.nav {
	padding-left: 15px;
}

.nav-item {
	border-color: #dee2e6 ! important;
}

.nav-item.active {
	border-color: 2px solid #dee2e6 ! important;
}

.errorField {
	color: red ! important;
}
.customSearch{
	display: none;
}

.dataTables_filter {
	font-size: 14px;
}

.dataTables_info {
	font-size: 14px;
}

.dataTables_paginate {
	font-size: 14px;
}

table.sortable thead {
	background-color: #eee;
	color: #666666;
	font-weight: bold;
	cursor: default;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 0px 0px 0px 0px;
}

table.tabla-listados tbody tr.odd td {
	background: #e1e5e9;
}

table.tabla-listados thead tr th {
	font-size: 14px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}
</style>
</head>
<body onload="initialize();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
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
									<spring:message code="BzComposer.sales.LeadDirectory" /> <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
									</c:if>
								</span>
							</div>
							<div style="float: right;">
								<table>
									<tr align="right">
										<td colspan="6">
											<div>
												<input type="button" class="formbutton" onclick="leadsImport()" style="padding: 7 15px;" value="<spring:message code='menu.file.Import'/>" />
												<input type="button" class="formbutton" onclick="exportLead()" style="padding: 7 15px;" value="<spring:message code='menu.file.ExportTo'/>" />
												<input type="button" class="formbutton" onclick="addNewLead();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
												<input type="button" class="formbutton" onclick="manageCustomer('EDIT');" style="padding:7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
												<input type="button" class="formbutton" onclick="manageCustomer('DELETE');" style="padding:7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
											</div>
										</td>
									</tr>
								</table>
							</div>
					<!-- First Table -->
					<div>
					<input type="hidden" id="listSize" value='${LeadDetails.size()}' />
					<div id="transactionTable">
					<table style="padding: 0;width: 100%; margin-top: 10px;" align="center">
					<tr>
					<td colspan="10" style="vertical-align: 0;">
					    <input type="hidden" id="SourceSize" value='${LeadDirectorys.size()}' />
					    <div id="custTable_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="custTable"></label></div>
						<table class="table table-bordered table-sm  devBankingDatatable"
							style="font-size: 12px;">
							<thead class="thead-light">
								<tr>
									<th align="center">
										<spring:message code="BzComposer.lead.file.name" />
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${LeadDirectorys}" var="objList" varStatus="loop">
                               	<tr id='${loop.index}$$' onclick="setDirectoryDataById(${objList.leadDirectoryID});setRowId(${objList.leadDirectoryID}, ${loop.index}, true);">
                               		<td colspan="2" style="font-size:12px;">${objList.fileName}</td>
                             	</tr>
                              </c:forEach>
							</tbody>
						</table>
					</td>
					<!-- Second Table -->
					<td colspan="10" style="vertical-align: 0;">
						<div id="selectedAccount">
							<h4 class="title2"><spring:message code="BzComposer.customerinfo.leadinformation" /></h4>
							<table id="leadInfo" class="table table-bordered table-sm  devBankingDatatable">
							<thead class="thead-light" style="font-size: 14px;white-space: nowrap;">
								<tr>
									<th><spring:message code="BzComposer.Customer.ID" /> &#9650</th>
									<th><spring:message code="BzComposer.customerinfo.lead.source" /> &#9650</th>
									<th><spring:message code="BzComposer.global.name" /> &#9650</th>
									<th><spring:message code="BzComposer.global.company" /> &#9650</th>
									<th><spring:message code="BzComposer.global.address1" /> &#9650</th>
									<th><spring:message code="BzComposer.global.address2" /> &#9650</th>
									<th><spring:message code="BzComposer.global.city" /> &#9650</th>
									<th><spring:message code="BzComposer.global.state" /> &#9650</th>
									<th><spring:message code="BzComposer.global.zip" /> &#9650</th>
									<th><spring:message code="BzComposer.global.country" /> &#9650</th>
									<th><spring:message code="BzComposer.global.dateadded" /> &#9650</th>
									<th><spring:message code="BzComposer.global.phone" /> &#9650</th>
									<th><spring:message code="BzComposer.global.mobile" /> &#9650</th>
									<th><spring:message code="BzComposer.global.fax" /> &#9650</th>
									<th><spring:message code="BzComposer.global.emailaddress" /> &#9650</th>
								</tr>
							</thead>
							<tbody id="MyTable" style="font-size: 12px;">
								<c:if test="${not empty LeadDetails}">
									<c:forEach items="${LeadDetails}" var="objList"
										varStatus="loop">
										<tr id='${loop.index}$$$'
											onclick="setRowLeadId(${objList.leadID}, ${loop.index}, true);">
											<td class=""><input type="checkbox"
												id="custID${loop.index}" value="${objList.leadID}"
												onchange="addRowIndex(${loop.index}, ${objList.leadID})" />
												${objList.leadID}</td>
											<c:if test="${(not empty objList.sourceName)}">
												<td>${objList.sourceName}</td>
											</c:if>
											<c:if test="${(empty objList.sourceName)}">
												<td>Not Specified</td>
											</c:if>
											<td>${objList.fullName}</td>
											<td>${objList.companyName}</td>
											<td>${objList.address1}</td>
											<td>${objList.address2}</td>
											<td>${objList.city}</td>
											<td>${objList.state}</td>
											<td>${objList.zipCode}</td>
											<td>${objList.country}</td>
											<td>${objList.dateAdded}</td>
											<td>${objList.phone}</td>
											<td>${objList.cellPhone}</td>
											<td>${objList.fax}</td>
											<td>${objList.email}</td>
											</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						</div>
					</td>
				</tr>
			</table>
					</div>
					</div>
					</div>
					<div>
						<input type="hidden" name="tabid" id="tabid" value="" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
</html>
<script>
let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];

$(document).ready(function() {
    $('#custTable').DataTable({
        "iDisplayLength": 20,
        "ordering": true,
        "order": [[0, 'desc']],
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
        }
    });
});

function initialize(){
    let lSize = document.getElementById("SourceSize").value;
    if(lSize > 0){
        document.getElementById('0$$').className = "even";
    }
}

let tableBody = document.querySelector("#leadInfo > tbody");
let tableData = [];
<c:if test="${not empty LeadDetails}">
	<c:forEach items="${LeadDetails}" var="objList">
		var obj = {
    	'leadID':'${objList.leadID}',
    	<c:if test="${(not empty objList.sourceName)}">
			'sourceName': '${objList.sourceName}',
		</c:if>
		<c:if test="${(empty objList.sourceName)}">
			'sourceName': 'Not Specified',
		</c:if>
    	'fullName': '${objList.fullName}',
    	'companyName': '${objList.companyName}',
    	'address1': '${objList.address1}',
    	'address2': '${objList.address2}',
    	'city': '${objList.city}',
    	'state': '${objList.state}',
		'zipCode': '${objList.zipCode}',
		'country': '${objList.country}',
		'dateAdded': '${objList.dateAdded}',
		'phone': '${objList.phone}',
		'cellPhone': '${objList.cellPhone}',
		'fax': '${objList.fax}',
		'email': '${objList.email}'
		}
		tableData.push(obj);
	</c:forEach>
</c:if>

function setDirectoryDataById(directoryID){
	$.ajax({
        url:"getLeadDirectoryDetailsById/"+directoryID,
        method: "GET",
        success : function(data) {
        	tableData = data;
        	buildTable(data);
        },
        error : function(error) {
             alert(error + "<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
}

function buildTable(data){
	
	while (tableBody.firstChild) {
		tableBody.removeChild(tableBody.firstChild)
	}
	
	if(data.length > 0){
		var headers = Object.keys(data[0]);
		var table = document.getElementById('MyTable')
		var allRecordsHTML='';
    	for(var i=0;i<data.length;i++){
        	allRecordsHTML+='<tr id="'+i+'$$$" onclick="setRowLeadId('+data[i].leadID+', '+i+', true);">';
        	for(var j=0;j<headers.length;j++){
        		var header = headers[j];
        		if(header == 'leadID' || header == 'sourceName' || header == 'fullName' || header == 'companyName' || header == 'address1' || 
        			header == 'address2' || header == 'city' || header == 'state' || header == 'zipCode' || 
        			header == 'country' || header == 'dateAdded' || header == 'phone' || header == 'cellPhone' || 
        			header == 'fax' || header == 'email') {
        			if(header == 'leadID'){
        				allRecordsHTML+='<td><input type="checkbox" id="custID'+i+'" value="'+data[i][header]+'" onchange="addRowIndex('+i+', '+data[i][header]+')"/> '+data[i][header]+'</td>';					
        			}else {
        				allRecordsHTML+='<td>'+data[i][header]+'</td>';
        			}
        		}
        	}
        	allRecordsHTML+='</tr>';
    	}
    	table.innerHTML = allRecordsHTML;
	}
}
        
$('th').on('click', function(){	
	var column = $(this).data('column')
	var order = $(this).data('order')
	var text = $(this).html()
	text = text.substring(0, text.length - 1)
	if(order == 'desc'){
		$(this).data('order', "asc")
		tableData = tableData.sort((a,b) => a[column] > b[column] ? 1 : -1)
		text += '&#9660'
	}else{
		$(this).data('order', "desc")
		tableData = tableData.sort((a,b) => a[column] < b[column] ? 1 : -1)
		text += '&#9650'
	}
	$(this).html(text)
	buildTable(tableData)
})
	
function setRowId(rowid, rowIndex, flag){
    let lSize = document.getElementById("SourceSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        itemID = rowid;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('highlight');
    }
}

function setRowLeadId(rowid, rowIndex, flag){
    let listSize = document.getElementById("listSize").value;
    for (i=0; i<listSize; i++) {
        let currROW = document.getElementById(i+'$$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        itemID = rowid;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$$').classList.add('highlight');
    }
}

function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}

function manageCustomer(cmd){
    
	if (itemID == 0) {
		return showCustomerValidationDialog();
	} else {
		if (cmd=="EDIT") {
			window.open("/editLeadDetails/" + itemID, null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
		}
		else if (cmd=="DELETE") {
			if(confirm("<spring:message code='BzComposer.lead.deleteselecteddelete'/>")==true) {
				window.location = "/removeLead/"+itemID;
			}
			return false;
		}
		else if (cmd=="CONVERTLEADtoCUSTOMER") {
			if(confirm("<spring:message code='BzComposer.customerinfo.convertltocustomer'/>")==true) {
				$.ajax({
                    type : "GET",
                    url : "LeadConvert?customerAction=CONVERT&cvTypeId=Customer&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
		else if (cmd=="CONVERTLEADtoCONTACT")
		{
			if(confirm("<spring:message code='BzComposer.customerinfo.convertltocontact'/>")==true) {
				$.ajax({
                    type : "GET",
                    url : "LeadConvert?customerAction=CONVERT&cvTypeId=Contact&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
		else if (cmd=="CONVERTLEADtoOPPORTUNITY")
		{
			window.open("leadToOpportunity?tabid=newOpportunity&cvID="+itemID, null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");
			

			<!-- 
			if(confirm("<spring:message code='BzComposer.customerinfo.convertltoopportunity'/>")==true) 
			
			
			{
				$.ajax({
                    type : "GET",
                    url : "Customer?tabid=Customer&customerAction=CONVERT&cvTypeId=7&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
		--> 
	}
}

function goToCustomerBoard(clientVendorID){
    window.location = "/Customer?tabid=CustomerBoard&selectedCvID="+clientVendorID;
}

function addNewLead(){
	//window.location = "Customer?tabid=NewCustomer";
	//window.open("Lead?tabid=NewLead", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
	window.open("/newLead", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showCustomerValidationDialog(){
	event.preventDefault();
	$("#showCustomerValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}


//for send email, email template, send through outlook, transform to Customer, import & export functions


function addRowIndex(rowId, custID){
    let isFound = false;
    let isChecked = document.getElementById('custID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == custID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(custID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(custID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}
function openMailSender(){
    if (selectedRowIndexs.length == 0){
        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
        return false;
    }else{
        let CustIDs = "";
        for(let x=0; x<selectedRowIndexs.length; x++){
            CustIDs = CustIDs + selectedRowIndexs[x] +":";
        }
        CustIDs = CustIDs.substring(0, CustIDs.length-1);
        window.open("Customer?tabid=ShowEmailOnLeadList&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function transferToCustomer(){
    if (selectedRowIndexs.length == 0){
        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
        return false;
    }else{
        let CustIDs = "";
        for(let x=0; x<selectedRowIndexs.length; x++){
            CustIDs = CustIDs + selectedRowIndexs[x] +":";
        }
        CustIDs = CustIDs.substring(0, CustIDs.length-1);
        window.open("Customer?tabid=transferToCustomer&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function openMailTemplates(){
	window.open("MailTemplates?tabid=getMailTemplates", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
}

function selectRow(index,payId,accId,payeId,payMethodId,catId,amount,checkNumber,toCurrentbalance, cvID, dateAdded)
	{
		this.Index = index;
		var id = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(2)').attr('value'); 
		 if(id == '-1')
			{
			 	id = $('table.devBankingDatatable tbody tr:nth-child('+Index+')').find('td:nth-child(2)').attr('label');
			}
		 
	}
</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectleadfirst" />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedcustomer" />
	</p>
</div>