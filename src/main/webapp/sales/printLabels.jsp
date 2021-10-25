<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title>
	<bean:message key="BzComposer.printlabelstitle" />
</title>
<style type="text/css">
.height250 {
height: 315px;
}
.fht-tbody{
height: 405px !important;
overflow: auto !important;
overflow-x: auto !important;
}
.fht-table-wrapper .fht-tbody { 
		}
table.tabla-listados {
width: 100%;
border: 1px solid rgb(207, 207, 207);
margin: 0px 0px 0px 0px;
margin: 0px 0px 0px 0px;
}


table {
font-family: arial, sans-serif;
border-collapse: collapse;
width: 100%;
}

td, th {
border: 1px solid #dddddd;
text-align: left;
padding: 8px;
}

tr:nth-child(even) {
background-color: #dddddd;
}
</style>
</head>
<script type="text/javascript">
function showCustomerValidationDialog()
{
	event.preventDefault();
	$("#showCustomerValidationDialog").dialog({
		resizable: false,
	    height: 200,
	    width: 400,
	    modal: true,
	    buttons: {
			"<bean:message key='BzComposer.global.ok'/>": function () {
	        	$(this).dialog("close");
			}
		}
	    });
	    return false;
}
function showlabelValidationDialog()
{
	event.preventDefault();
	$("#showlabelValidationDialog").dialog({
		resizable: false,
	    height: 200,
	    width: 400,
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
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<html:form action="Sales.do" method="post" styleId="printlabels">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div id="pagebreak">&nbsp;<P style="page-break-before: always">   </div>
<div>
	<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.printlabels.printlabeltitle"/>
	</span>
</div>
<div>
	<div id="table-negotiations" style="overflow:auto;width:100%">
		<table cellspacing="0" style="width: 100%;">
			<tbody>
				<tr>
					<td valign="top">
						<!-- <div style="overflow-x:auto;width:925px;"> -->							<!-- commented on 04-10-2019 -->
						<div style="overflow-x:auto;width:1200px;">								
	                 		<table id="printLabelCustomerList" class="tabla-listados" cellpadding="0" cellspacing="0">
					   			<thead style="font-weight: bold;">
									<tr>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.printlabels.id"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.printlabels.companyandname"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.address1"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.address2"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.city"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.state"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.zipcode"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.cellphone"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.fax"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.global.email"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="emblem" style="font-size:12px;">
											<bean:message key="BzComposer.printlabels.dateadded"/>
										</th>
										<th class="emblem" style="font-size:12px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
									</tr>
								</thead>
								<tbody>
									<logic:present name="CustomerDetails" scope="request">
										<logic:notEmpty name="CustomerDetails" scope="request">
											<bean:size name="CustomerDetails" id="CustomerDetailsSize" />
												<input type="hidden" name="listSize" id="lSize" value='<bean:write name="CustomerDetailsSize" />'>
													<logic:iterate name="CustomerDetails" id="objList" scope="request" indexId="ndx">
														<tr id='<bean:write name="ndx" />$$'
														onclick="setRowId(<bean:write name="objList" property="clientVendorID" />,'<bean:write name="ndx" />$$');"
														ondblclick="setRidOnDblClk(<bean:write name="objList" property="clientVendorID" />,'<bean:write name="ndx" />$$');">
															<td style="font-size:12px;">
																<bean:write name="objList" property="clientVendorID" />
															</td>
															<td style="font-size:12px;">
																<bean:write name="objList" property="cname" />&nbsp;(<bean:write name="objList" property="firstName" />&nbsp;<bean:write name="objList" property="lastName" />)
															</td>										
															<td colspan="2" style="font-size:12px;">
																<bean:write name="objList" property="address1" />
															</td>
															<td colspan="2" style="font-size:12px;">
																<bean:write name="objList" property="address2" />
															</td>
															<td colspan="2" style="font-size:12px;">
																&nbsp;<bean:write name="objList" property="city"/>
															</td>
															<td colspan="4" style="font-size:12px;"> 
																&nbsp;<bean:write name="objList" property="stateName"/>
															</td>
															<td colspan="2" style="font-size:12px;">
																&nbsp;<bean:write name="objList" property="zipCode"/>
															</td>
															<td colspan="2" style="font-size:12px;">
																&nbsp;<bean:write name="objList" property="cellPhone"/>
															</td>
															<td colspan="2" style="font-size:12px;">
																&nbsp;<bean:write name="objList" property="fax"/>
															</td>
															<td colspan="2" style="font-size:12px;">
																&nbsp;<bean:write name="objList" property="email"/>
															</td>
															<td colspan="2" style="font-size:12px;">
																&nbsp;<bean:write name="objList" property="dateAdded"/>
															</td>
														</tr>
													</logic:iterate>
										</logic:notEmpty>
									</logic:present>
								</tbody>
							</table>
						</div>
					</td>
					<td valign="top">
						<table class="tabla-listados" cellspacing="0" style="height: 406px;">
							<thead>
								<tr>
									<th align="right" style="font-size:12px;">
										<bean:message key="BzComposer.printlabels.selectaddresslabeltype"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="font-size:12px;">
										<select name="lblType" id="ltype">
											<option value=""></option>
											<logic:present name="Labels" scope="request">
												<logic:iterate name="Labels" id="Labels" scope="request">
													<option value=<bean:write name="Labels" property="id"/>>
														<bean:write name="Labels" property="labeltype" />
												</logic:iterate>
											</logic:present>
										</select>
									</td>
								</tr>
								<tr>
									<td align="center">
										<table>
											<thead>
												<tr>
													<th style="font-size:12px;">
														<strong>
															<bean:message key="BzComposer.printlabels.setuplabel"/>
														</strong>
													</th>
												</tr>
											</thead>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<table>
											<tr>
												<td style="font-size:12px;">
													<input type="button" class="formbutton" title="Add new label"
													value="<bean:message key="BzComposer.global.add" />"
													onclick="AddLabel();"/>
												</td>
												<td style="font-size:12px;">
													<input type="button" class="formbutton" title="Update label"
													value="<bean:message key="BzComposer.global.update" />"
													onclick="UpdateLabel();"/>
												</td>
												<td style="font-size:12px;">
													<input type="button" class="formbutton"
													value="<bean:message key="BzComposer.printlabels.refresh" />"
													onclick="Refresh();"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center" style="font-size:12px;">
										<bean:message key="BzComposer.printlabels.customerlisttoprint"/>
									</td>
								</tr>
								<tr>
									<td style="font-size:12px;">
										<select id="list" name="lbltype" size="16" style="width:200;font-size:12px;">
							</select></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<div>
		<div style="float: left;">	
			<input type="button" value="<bean:message key="BzComposer.printlabels.sendto" />" class="formbutton" onclick="sendTo();">
		</div>
		<div style="float: right;">	
			<input type="hidden" name="SelectedRID" id="setRID" value=""> 
			<input type="button" value="<bean:message key='BzComposer.printlabels.printlabelbtn'/>" onclick="printlabel();" class="formbutton">
			&nbsp;&nbsp;&nbsp; 
			<input type="button" value="<bean:message key="BzComposer.printlabels.cleardata" />" class="formbutton" onclick="clearData();" />
		</div>
	</div>
	</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
</html>
<script type="text/javascript">

function printlabel()
{
	debugger;
	//lbltype
	 var list=document.getElementById("list");
	 var ops=list.getElementsByTagName('OPTION');
	 var pagebreak= document.getElementById("pagebreak").innerHTML;
	 var customerdetails;
	/*  for (var i = 0; i < ops.length; i++) {
		 var customerdetails = ops[i].textContent;
		
	 } */
	 
	 if(customerdetails == ""){
		alert("Please select a customer"); 
	 }else{
		 var i;
		 var a = window.open('', '', 'height=500, width=500'); 
			a.document.write('<html>'); 
			a.document.write('<body>'); 
			var lengt = ops.length;
			
			for ( i = 0; i < ops.length; i++) {
				var j =lengt-1;
				 var customerdetails = ops[i].textContent;
				 if(j != i){
					 a.document.write(customerdetails,pagebreak);  
				 }else{
					 a.document.write(customerdetails); 
				 }
				
			 }

			//a.document.write(customerdetails); 
			a.document.write('</body></html>'); 
			a.document.close(); 
			a.print(); 	 
	 }
	 
	
	
	}
function setRowId(rowid,rid){
 	size=document.getElementById("lSize").value;
// 	for(i=0;i<size;i++){
// 		var row1=document.getElementById(i+"$$");
// 		row1.className = "";
// 	}
// 	var rd=document.getElementById(rid);
// 	rd.className ="draft";
	for(i=0;i<size;i++){ 
		 document.getElementById(i+"$$").classList.remove('draft');		
		 if(i%2==0){	
			 if(size !=(i+1)){
			 document.getElementById((i+1)+"$$").classList.add('odd');
			 }
		 }
	}
	 rowValue= rid.replace("$$","");

	if((rowValue-1)%2==0){ 		
		document.getElementById((rowValue)+"$$").classList.remove('odd'); 		
	}
	var rd = document.getElementById(rowValue+"$$").classList.add('draft');
	document.getElementById("setRID").value=rid;
}
function sendTo()
{
	debugger;
	rid=document.getElementById("setRID").value
	if(rid=="")
	{

		debugger;
		return showCustomerValidationDialog();	
	}
	else{
	  	var sel=document.getElementById(rid);

		var cells= sel.getElementsByTagName("td");
		var name=cells[0].innerHTML +"   "+cells[2].innerHTML +"   "+ cells[3].innerHTML;
		var op=document.createElement('OPTION');
		var txt=document.createTextNode(name);
		op.setAttribute('value',name);
		op.appendChild(txt);
		document.getElementById("list").appendChild(op);
	}
}
function setRidOnDblClk(rowid,rid)
{
	setRowId(rowid,rid);
	sendTo();
}
function clearData()
{
	 var list=document.getElementById("list");
	 var ops=list.getElementsByTagName('OPTION');
	 list.options.length=0;
}
function UpdateLabel()
{
	debugger;
	lbltype=document.getElementById('ltype').value;
	debugger;
	if(lbltype=="")
	{

		debugger;
		return showlabelValidationDialog();	
	}
	else
	{
		window.open("Customer.do?tabid=UpdateLabel&lblId="+lbltype,null,"scrollbars=yes,height=475,width=650,status=yes,toolbar=no,menubar=no,location=no" );
	}
}
function AddLabel()
{
	window.open("Customer.do?tabid=AddNewLabel",null,"scrollbars=yes,height=475,width=650,status=yes,toolbar=no,menubar=no,location=no" );
}
function Refresh()
{

	//document.forms[0].action="Customer.do?tabid=PrintLabels";
	//document.forms[0].submit();
	//Added by tulsi
	window.location = "Customer.do?tabid=PrintLabels";
}
</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.printlabels.selectcustomer"/></p>
</div>
<div id="showlabelValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.printlabels.selectlabeltoupdate"/></p>
</div>