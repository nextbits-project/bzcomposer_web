<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.printlabeltitle" /></title>
<style type="text/css">
.height250 {height: 315px;}
.fht-tbody{
height: 405px !important;
overflow: auto !important;
overflow-x: auto !important;
}
.fht-table-wrapper .fht-tbody { }
table.tabla-listados {
width: 100%;
border: 1px solid rgb(207, 207, 207);
margin: 0px 0px 0px 0px;
margin: 0px 0px 0px 0px;
}
table.tabla-listados tbody tr td {}
table.tabla-listados tbody tr.odd td {
background: #e1e5e9;}
</style>
<script type="text/javascript">
function showselectRecordDialog()
{
	debugger;
	event.preventDefault();
	$("#showselectRecordDialog").dialog({
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
</head>
<body onload="Initialize();">
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<html:form action="PrintLBL.do" method="post">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div id="pagebreak">&nbsp;<P style="page-break-before: always">   </div>
<!-- begin Contents -->
<div>
	<span style="font-size: 14px; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.printlabel.printlabeltitle" />
	</span>
</div>
	<div>
		<div id="table-negotiations" style="overflow:auto;width:100%">
			<table cellspacing="0" style="width:100%;">
				<tbody>
					<tr>
						<td valign="top">
							<div style="overflow-x:auto;width:925px;">
	               				<table id="printLabelList" class="tabla-listados" cellpadding="0" cellspacing="0">
								<!--<div style="overflow:auto;height:500;width:875;;border-bottom: 1px solid #F0F7E2"> -->
									<!--<table class="tabla-listados" cellspacing="0"> -->
									<thead style="font-weight: bold;">
										<tr>
											<th class="emblem" style="font-size: 14px;">
												<bean:message key="BzComposer.printlabel.companyname" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.address1" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.address2" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.city" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.state" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;"
												>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.zipcode" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.cellphone" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.fax"/>
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.global.email" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
											<th class="emblem" style="font-size:14px;">
												<bean:message key="BzComposer.printlabel.dateadded" />
											</th>
											<th class="emblem" style="font-size:14px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</th>
										</tr>
									</thead>
									<tbody>
										<logic:present name="PrintList">
											<logic:notEmpty name="PrintList">
												<bean:size name="PrintList" id="PrintListSize" />
													<input type="hidden" name="listSize" id="lSize" value='<bean:write name="PrintListSize" />'>
													<logic:iterate name="PrintList" id="objList" indexId="ndx">
															<tr id='<bean:write name="ndx" />$$'
															onclick="setRowId(<bean:write name="objList" property="clientVendorID" />,'<bean:write name="ndx" />$$');"
															ondblclick="setRidOnDblClk(<bean:write name="objList" property="clientVendorID" />,'<bean:write name="ndx" />$$');">
																<td colspan="3" style="font-size:14px;">
																	<bean:write name="objList" property="cname" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="address1" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="address2" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="city" />
																</td>
																<td colspan="4" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="state" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="zipCode" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="cellPhone" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="fax" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="email" />
																</td>
																<td colspan="2" style="font-size:14px;">
																	&nbsp;<bean:write name="objList" property="dateAdded" />
																</td>
															</tr>
															<logic:present name="Services">
																<logic:notEmpty name="Services">
																	<bean:size name="Services" id="ssize" />
																		<input type="hidden" name="serSize" id="seSize"
																		value='<bean:write name="ssize" />' />
																		<logic:iterate name="Services" id="service" indexId="index">
																			<logic:equal name="service" property="clientVendorID"
																			value='${objList.clientVendorID}'>
																			<tr id='<bean:write name="index" />*$$'
																			onclick="setRowId(${objList.clientVendorID},'<bean:write name="index" />*$$');"
																			ondblclick="setRidOnDblClk(<bean:write name="service" property="clientVendorID" />,'<bean:write name="index" />*$$');">
																				<td colspan="3" nowrap="nowrap" style="font-size:14px;">
																					&nbsp;&nbsp;&nbsp;&nbsp;
																					<img src="<bean:write name="path" property="pathvalue"/>/images/arrow.jpg"></img>
																						<bean:write name="service" property="serviceName" />
																				</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																				<td>&nbsp;&nbsp;</td>
																			</tr>
																			</logic:equal>
																		</logic:iterate>
																</logic:notEmpty>
															</logic:present>
													</logic:iterate>
												</logic:notEmpty>
											</logic:present>
										</tbody>
									</table>
								</div>
							</td>
<!-- 				<div align="center"> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<td><logic:present name="PageValue"> --%>
<%-- 							<logic:notEqual name="PageValue" --%>
<%-- 								value='<%=(String)session.getAttribute("StartPage") %>'> --%>
<!-- 									&nbsp;&nbsp;&nbsp; -->
<%-- 									<a href="#" onclick="getPreviousRecord();"> <strong> <bean:message --%>
<!-- 									key="BzComposer.Vendor.PrintLabel.Previous" /> </strong> </a> -->
<%-- 							</logic:notEqual> --%>
<%-- 						</logic:present> <logic:iterate name="Total" id="tot"> --%>
<%-- 							<logic:equal name="tot" --%>
<%-- 								value='<%= (String)request.getAttribute("PageValue") %>'> --%>
<%-- 									&nbsp;&nbsp;&nbsp;<font color="red"><bean:write name="tot" /></font> --%>
<%-- 							</logic:equal> --%>
<%-- 							<logic:notEqual name="tot" --%>
<%-- 								value='<%= (String)request.getAttribute("PageValue") %>'> --%>
<!-- 									&nbsp;&nbsp;&nbsp;<a href="#" -->
<%-- 									onclick="getPrintLabelRecord('<bean:write name="tot"/>');"><bean:write --%>
<!-- 									name="tot" /></a> -->
<%-- 							</logic:notEqual> --%>
<%-- 						</logic:iterate> <logic:present name="PageValue"> --%>
<%-- 							<logic:notEqual name="PageValue" --%>
<%-- 								value='<%=(String)request.getAttribute("TotalPages") %>'> --%>
<!-- 									&nbsp;&nbsp;&nbsp; -->
<%-- 									<a href="#" onclick="getNextRecord();"> <strong> <bean:message --%>
<!-- 									key="BzComposer.Vendor.PrintLabel.Next" /> </strong> </a> -->
<%-- 							</logic:notEqual> --%>
<%-- 						</logic:present></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 				</div> -->

							<td valign="top">
								<table class="tabla-listados" cellspacing="0" style="height: 406px;">
									<thead>
										<tr>
											<th style="font-size: 14px;">
												<div align="center">
													<bean:message key="BzComposer.printlabel.selectaddresslabeltype" />
												</div>
											</th>
										</tr>
									</thead>
									<tbody>
									<tr align="center">
										<td style="font-size: 14px;">
											<div id="lbltypeid">
												<select name="lblType" id="ltype" style="width:200;">
													<logic:present name="Labels" scope="request">
														<logic:iterate name="Labels" id="Labels" scope="request">
															<option value=<bean:write name="Labels" property="id"/>>
																<bean:write name="Labels" property="labeltype" />
														</logic:iterate>
													</logic:present>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<table>
												<tr>
													<td style="font-size: 14px;">
														<input type="button" class="formbutton" title="Set Up label"
														value='<bean:message key="BzComposer.printlabel.setuplabel" />' onclick="SetUpLabel();"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									</tbody>
									<thead>
									<tr>
										<th style="font-size: 14px;">
											<div align="center">
												<bean:message key="BzComposer.printlabel.vendorlisttoprint"/>
											</div>
										</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td align="center" style="font-size: 14px;">
											<select id="list" name="lbltype" size="20" style="width:200;">
											</select>
										</td>
									</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
<!-- 	<table class="tabla-listados" cellspacing="0"> -->
<!-- 		<tbody> -->
<!-- 			<tr> -->
<!-- 				<td colspan="3" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input -->
<!-- 					type="button" -->
<%-- 					value="<bean:message key="BzComposer.Employee.SendTo" />" --%>
<!-- 					class="formbutton" onclick="sendTo();"></td> -->
<!-- 				<td align="right"><input type="hidden" name="SelectedRID" -->
<!-- 					id="setRID" value=""> <input type="button" -->
<%-- 					value='<bean:message key="BzComposer.Vendor.PrintLabel.PrintLabelButton"/>' --%>
<!-- 					class="formbutton" disabled="disabled" />&nbsp;&nbsp;&nbsp; <input -->
<!-- 					type="button" -->
<%-- 					value="<bean:message key="BzComposer.Vendor.PrintLabel.ClearAllButton" />" --%>
<!-- 					class="formbutton" onclick="clearData();"></td> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
<!-- 	</table> -->

			<div>
				<div style="float: left;">
					<input type="button" value="<bean:message key="BzComposer.printlabel.sendto" />" class="formbutton" onclick="sendTo();">
				</div>
				<div style="float: right;">
					<input type="hidden" name="SelectedRID" id="setRID" value="">
					<input type="button" value='<bean:message key="BzComposer.printlabel.printlabelbutton"/>' class="formbutton"
					onclick="printlabel();"/>
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="<bean:message key="BzComposer.printlabel.clearallbutton" />" class="formbutton"
					onclick="clearData();">
				</div>
			</div>
		</div>
	</div>
	<div id="VendorInfo">
		<logic:present name="PrintList">
			<logic:notEmpty name="PrintList">
				<logic:iterate name="PrintList" id="objList">
					<input type="hidden" value='<bean:write name="objList" property="fullName" />'
					id='<bean:write name="objList" property="clientVendorID" />' name='<bean:write name="objList" property="fullName" />fname' />
				</logic:iterate>
			</logic:notEmpty>
		</logic:present>
	</div>
	<!-- end Contents -->
	<div>
		<input type="hidden" id="tab" name="tabid" value="PrintLabel" />
		<input type="hidden" id="listvalue" name="VendorName" />
		<html:hidden property="startPage" />
	</div>
</div>
</div>
</div>
</div>
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
</script>

<script>
var vendorid="";
function setRowId(rowid,rid){
	vendorid=rowid;
	size=document.getElementById("lSize").value;

	<logic:present name="Services">
		<logic:notEmpty name="Services">
			size1=document.getElementById("seSize").value;
		</logic:notEmpty>
		<logic:empty name="Services">
			size1=0;
		</logic:empty>
	</logic:present>
	<logic:notPresent name="Services">
		size1=0;
	</logic:notPresent>


// 		for(i=0;i<size;i++){
// 			var row1=document.getElementById(i+"$$");
// 			row1.className = "";
// 		}
// 		for(j=0;j<size1;j++){
// 			row1=document.getElementById(j+"*$$");
// 			row1.className = "";
// 		}
// 	var rd=document.getElementById(rid);

// 	rd.className = "draft";


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

setRowId(null, "0$$");

	function sendTo()
	{
		debugger;
	   rid=document.getElementById("setRID").value
	   debugger;
	   if(rid==""){
		 /* alert("Please select the record"); */
		 debugger;
		 return showselectRecordDialog();
	   }
	   else{
			var sel=document.getElementById(rid);
		   var cells= sel.getElementsByTagName("td");
	   		 var name=vendorid+" "+document.getElementById(vendorid).value;
		   var op=document.createElement('OPTION');
		   var txt=document.createTextNode(name);
		   op.setAttribute('value',name);
		   op.appendChild(txt);
		   document.getElementById("list").appendChild(op);
		   var val = document.getElementById('listvalue').value;
		   document.getElementById('listvalue').value=val+vendorid+" "+document.getElementById(vendorid).value+"/";
	   }
	}

	function setRidOnDblClk(rowid,rid){
		setRowId(rowid,rid);
		sendTo();
	}

	function clearData()
	{
		document.getElementById('listvalue').value ="";
		 var list=document.getElementById("list");
		 var ops=list.getElementsByTagName('OPTION');

		 list.options.length=0;
	}
	function SetUpLabel()
	{
		lbltype=document.getElementById('ltype').value;
		window.open("PrintLBL.do?tabid=UpdateLabel&lblId="+lbltype+"&FormValue=Vendor",null,"scrollbars=yes,height=475,width=650,status=yes,toolbar=no,menubar=no,location=no");
	}

	function getPrintLabelRecord(no)
	{
		document.getElementById('tab').value="PrintLabelList";
		document.PrintLabelForm.startPage.value=no;
		document.forms[0].action = "PrintLBL.do";
		document.forms[0].submit();
	}
	function getPreviousRecord()
	{
		document.getElementById('tab').value="PrintLabelList";
		document.PrintLabelForm.startPage.value=(parseInt(document.PrintLabelForm.startPage.value) - 1);
		document.forms[0].action = "PrintLBL.do";
		document.forms[0].submit();
	}
	function getNextRecord()
	{
		document.getElementById('tab').value="PrintLabelList";
		document.PrintLabelForm.startPage.value=(parseInt(document.PrintLabelForm.startPage.value) + 1);
		document.forms[0].action = "PrintLBL.do";
		document.forms[0].submit();
	}

	var lst_value = "";
	function Initialize()
	{
		<logic:present name="VendorList">
			document.getElementById('listvalue').value = '<bean:write name="VendorList"/>';
			lst_value = '<bean:write name="VendorList"/>';
			var records=lst_value.split("/");
			for(cnt=0;cnt<records.length-1;cnt++){
				AssignValues(records[cnt]);
			}
		</logic:present>
	}

	function AssignValues(name){
		 var op=document.createElement('OPTION');
		 var txt=document.createTextNode(name);
		 op.setAttribute('value',name);
		 op.appendChild(txt);
		 document.getElementById("list").appendChild(op);
	}
</script>
<!-- dialogBox used in this page.. -->
<div id="showselectRecordDialog" style="display:none;">
	<p><bean:message key="BzComposer.common.selectanyrecord"/></p>
	</div>