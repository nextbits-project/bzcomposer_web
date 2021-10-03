<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.vendorinformationtitle" />
</title>
<script type="text/javascript">
var radio_val;
function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;
	if (unicode!=8)
	{
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
 			return true;
		} 
		else 
		if (unicode<48||unicode>57) //if not a number
			return false; //disable key press
	}
}
function showEditVendor()
{
	debugger;
	var custid = <%= request.getParameter("vendrId")%>;
	debugger;
	//alert("ClientVendorID:"+custid);
	if(custid==0 || custid == null)
	{
		//alert("Please select the vendor");
		return showSelectVendorDialog();
	}
	else
	{
		window.open("Vendor.do?tabid=editVendor&cvId="+custid,null,"scrollbars=yes,height=620,"
				+"width=1600,status=yes,toolbar=no,menubar=no,location=no" );
	}
}
function getVendorInfo(vendorid,rowId)
{
	debugger
	var vendor = vendorid;
	//document.getElementById('venrId').value=vendor;
	$("#venrId").val(vendor);
	//document.getElementById("tabid").value="VONODO";
	/* document.forms[0].action="Vendor.do?";
	document.forms[0].submit(); */
	window.location = "Vendor.do?tabid=VONODO&&vendrId="+vendorid+"&SelectedRID="+rowId;
}
function enableDisableFinanceCharges()
{
	ch_box=document.getElementById('chbox');
	if (ch_box.checked) 
	{
		document.VendorForm.annualIntrestRate.disabled=false;
		document.VendorForm.minFCharges.disabled=false;
		document.VendorForm.gracePrd.disabled=false;
		document.getElementById('chk1').disabled=false;
	}
	else
	{
		document.VendorForm.annualIntrestRate.disabled=true;
		document.VendorForm.minFCharges.disabled=true;
		document.VendorForm.gracePrd.disabled=true;
		document.getElementById('chk1').disabled=true;
	}
}
function initialize()
{
	//	document.VendorForm.sid.disabled=true;
	// 	<logic:present name="CustomerDetails">
	//	<logic:equal name="CustomerDetails"	property="fsUseIndividual" value="1">
	//	enableDisableFinanceCharges();
	//	</logic:equal>
	// 	</logic:present> 	
	debugger
	var rid= "<%= request.getParameter("SelectedRID")%>$$";
	var cvid = <%= request.getParameter("vendrId")%>;
	//alert("clientVedorID is:"+cvid);
	var rd=document.getElementById(rid);
	rd.className = "draft";
	<logic:present name="VendorFrm">
		tableValue();
	</logic:present>
	<logic:notPresent name="VendorFrm">
		document.getElementById('edit').disabled=true;
		document.getElementById('delete').disabled=true;
	</logic:notPresent>
	/* document.getElementById('imgfrm').disabled=true;		
	document.getElementById('imgto').disabled=true; */
	/*document.VendorForm.periodFrom.disabled=true;
	document.VendorForm.periodTo.disabled=true;*/	
}
function lookUpHistory(form,v)
{
	val=document.getElementById('hidn').value;
    var dfrom=document.VendorForm.periodFrom.value;
    var dto=document.VendorForm.periodTo.value;
    custid=document.VendorForm.clientVendorID.value;
    refreshTransationNow(radio_val,custid,dfrom,dto);
}
function hide_details(val,form)
{
	document.getElementById('lookBtn').disabled=false;
	if(val=="ShowAll")
	{
		document.getElementById('imgfrm').disabled=true;
		document.getElementById('imgto').disabled=true;
		document.VendorForm.periodFrom.disabled=true;
		document.VendorForm.periodTo.disabled=true;
	}
	if(val=="ByVal")
	{
		document.getElementById('imgfrm').disabled=false;
		document.getElementById('imgto').disabled=false;
		document.VendorForm.periodFrom.disabled=false;
		document.VendorForm.periodTo.disabled=false;
	}
	radio_val=val;
}
function CopyBilladdToShipAdd()
{
	document.VendorForm.shcname.value= document.VendorForm.bscname.value;
	document.VendorForm.shfirstName.value= document.VendorForm.bsfirstName.value;
	document.VendorForm.shlastName.value= document.VendorForm.bslastName.value;
	document.VendorForm.shaddress1.value= document.VendorForm.bsaddress1.value;
	document.VendorForm.shaddress2.value= document.VendorForm.bsaddress2.value;
	document.VendorForm.shcity.value= document.VendorForm.bscity.value;
	document.VendorForm.shzipCode.value = document.VendorForm.bszipCode.value;
	document.VendorForm.shprovince.value=document.VendorForm.bsprovince.value;
	document.VendorForm.shcountry.value= document.VendorForm.bscountry.value;
	<logic:present name="state_bt">
		document.VendorForm.bsstate.value = '<bean:write name="state_bt" />';
	</logic:present>
	if(flag_state == 1)
	{
		document.VendorForm.bsstate.value = document.getElementById('bsst').value;
	}
	document.VendorForm.shstate.value = document.VendorForm.bsstate.value;
	refreshItemsNow12(document.VendorForm.bscountry.value,document.VendorForm.bsstate.value);
}
function clearBillingAdd()
{
	document.VendorForm.bscname.value="";
	document.VendorForm.bsfirstName.value="";
	document.VendorForm.bslastName.value="";
	document.VendorForm.bsaddress1.value="";
	document.VendorForm.bsaddress2.value="";
	document.VendorForm.bscity.value="";
	document.VendorForm.bszipCode.value="";
	document.VendorForm.bsprovince.value="";
	document.VendorForm.bscountry.value="0";
	document.VendorForm.bsstate.value="0";
	refreshItemsNow22(0,0);
}
function clearShippingAdd()
{
	document.VendorForm.shcname.value="";
	document.VendorForm.shfirstName.value="";
	document.VendorForm.shlastName.value= "";
	document.VendorForm.shaddress1.value= "";
	document.VendorForm.shaddress2.value= "";
	document.VendorForm.shcity.value= "";
	document.VendorForm.shzipCode.value = "";
	document.VendorForm.shprovince.value="";
	document.VendorForm.shcountry.value= "0";
	document.VendorForm.shstate.value="0";
	refreshItemsNow12(0,0);
}
function DeleteVendor()
{
	debugger;
	//vendorid=document.VendorForm.clientVendorID.value;
	vendorid = <%= request.getParameter("vendrId")%>;
	if(vendorid==0 || vendorid == null)
	{
		//alert("Please select the vendor to delete");
		return deleteVendorDialog();
	}
	else
	{
	 	/* if(confirm("Are you sure to parmanently delete selected vendor?"))
	 	{
			document.getElementById('venrId').value=vendorid;
			document.getElementById('tab').value="DeleteVendor";
			document.forms[0].action="Vendor.do";
			document.forms[0].submit();
	 	} */
		debugger;
		event.preventDefault();
		$("#deleteRowDialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 550,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger
	                $(this).dialog("close");
	                document.getElementById('venrId').value=vendorid;
	                document.getElementById('cvId').value = vendorid;
	    			document.getElementById('tabid').value="DeleteVendor";
	    			document.forms[0].action="Vendor.do";
	    			//document.forms[0].submit();
	    			$('form').submit();
	            },
	            <bean:message key='BzComposer.global.cancel'/>: function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	    return false;
	}
}
function setRowId(rowid,rid)
{
	debugger;
	size=document.getElementById("lSize").value;
	//size1=document.getElementById("seSize").value;
	for(i=0;i<size;i++)
	{
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	//for(j=0;j<size1;j++){
	//row1=document.getElementById(j+"*$$");
	//row1.className = "";
	//}
	var rd=document.getElementById(rid);
	debugger
	var rowID = rowid;
	debugger
	var rID = rid;
	var rd1=rid.replace("$$", "");
	debugger
	//alert("RowId:"+rowID+"\nrID:"+rd1);
	rd.className = "draft";
	debugger
	//document.getElementById("setRID").value=rID;
	$("#setRID").val(rID);
	debugger
	//document.VendorForm.clientVendorID.value=rowID;
	$("#clientVendorID").val(rowID);
	debugger
	getVendorInfo(rowID,rd1);
}
function tableValue()
{
	//var rid1=document.VendorForm.selectedRowID.value;
	var rid= "<%= request.getParameter("SelectedRID")%>$$";
	var rd=document.getElementById(rid);
	rd.className = "draft";
	document.getElementById("setRID").value=rid;
}
function showSelectVendorDialog()
{
	debugger;
	event.preventDefault();
	$("#showSelectVendorDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                //window.location="Invoice.do?tabid=DeleteInvoice&&CustomerID="+cid;
            }
        }
    });
    return false;
}
function deleteVendorDialog()
{
	debugger;
	event.preventDefault();
	$("#deleteVendorDialog").dialog({
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
<script type="text/javascript">
flag_state = 0;
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var o22 = null;
var o33 = null;
var oT = null;
var r = null;
function c(r) {
if (___) {
    var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    try {
      o = new ActiveXObject(t);
      o.onreadystatechange = r;
    } catch (ex) {
      alert("<bean:message key='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
    }
  } else {
    o = new XMLHttpRequest();
    o.onload = r;
    o.onerror = r;
  }
  return o;
}
function oGET(oo, url) 
{
  try 
  {
    oo.open("GET", url, true);	
    oo.send(null);
  } 
  catch (ex) 
  {}
}
function writeSelect()
{
	if (o.readyState != 4 || o.status != 200) 
	{ 
      return;
    }
	document.getElementById("t_statedata").innerHTML = o.responseText ;
}
function refreshItemsNow(val)
{
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val)
}
function refreshItemsNow33(val,sval)
{
  o33 = c(writeSelect33);
  oGET(o33,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val+"&sval="+sval)
}
function writeSelect33()
{
	if (o33.readyState != 4 || o33.status != 200) 
	{ 
      return;
    }
    document.getElementById("t_statedata").innerHTML = o33.responseText ;
}
function writeSelect1()
{
	if (o.readyState != 4 || o.status != 200) 
	{ 
      return;
    }
    document.getElementById("t_statedata1").innerHTML = o.responseText ;
}
function refreshItemsNow1(val)
{
  o = c(writeSelect1);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=bsstate&Cid=' + val)
}
function refreshItemsNow12(val,sval)
{
  o = c(writeSelect2);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=shstate&Cid=' + val+"&sval="+sval)
}
function refreshItemsNow22(val,sval)
{
  o22 = c(writeSelect22);
  oGET(o22,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=bsstate&Cid=' + val+"&sval="+sval)
}
function writeSelect22()
{
	if (o22.readyState != 4 || o22.status != 200) 
	{ 
      return;
    }
    document.getElementById("t_statedata1").innerHTML = o22.responseText ;
}
function writeSelect2()
{
	if (o.readyState != 4 || o.status != 200) 
	{ 
      return;
    }
    document.getElementById("t_statedata2").innerHTML = o.responseText ;
}
function refreshItemsNow2(val)
{
  o = c(writeSelect2);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=shstate&Cid=' + val)
}
function writeSelectTH()
{
   if (oT.readyState != 4 || oT.status != 200) 
   {
     return;
   }
   document.getElementById("t_history").innerHTML = o.responseText ;
}
function refreshTransationNow(radio_val,custid,dfrom,dto)
{
       oT = c(writeSelectTH);
       oGET(oT,'<bean:write name="path" property="pathvalue"/>/sales/addTransactionHistory.jsp?custId=' + custid+'&cond='+radio_val+'&pfrom='+dfrom+'&pto='+dto)
}
function setState(state_id,name)
{
	if(name == 'state')
	{
		document.VendorForm.state.value = state_id;	
	}
	else if(name == 'bsstate')
	{
		flag_state = 1;
		document.VendorForm.bsstate.value = state_id;
		document.getElementById('bsst').value = state_id;
	}
	else if(name == 'shstate')
	{
		document.VendorForm.shstate.value = state_id;
	}
}
</script>
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
</style>
</head>
<body onload="initialize();">
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<html:form action="Vendor.do?" enctype="MULTIPART/FORM-DATA"  method="post">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
	<div>
		<div style="float: left;">
			<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
				<bean:message key="BzComposer.vendorlist.vendorinformation" />
			</span>
		</div>
		<div style="float: right;">
			<table>
				<tr align="right">
					<td colspan="6" style="font-size: 14px;">
						<input type="button" name="editAction" value='<bean:message key="BzComposer.global.edit" />'
						title='<bean:message key="BzComposer.vendorlist.edittooltip" />' class="formButton" onclick="showEditVendor();" id="edit" />
						<input type="button" name="deleteAction" value='<bean:message key="BzComposer.global.delete" />'
						title='<bean:message key="BzComposer.vendorlist.deletetooltip" />' class="formButton" onclick="DeleteVendor();" id="delete" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- dialog space -->
	<!-- Dialog used in vendor list page -->
	<div id="showSelectVendorDialog" style="display:none;">
	<p><bean:message key="BzComposer.vendorlist.selectvendordialog"/></p>
	</div>
	<div id="deleteVendorDialog" style="display:none;">
		<p><bean:message key="BzComposer.vendorlist.selectvendortodelete"/></p>
	</div>
	<div id="deleteRowDialog" style="display:none;">
		<p><bean:message key="BzComposer.vendorlist.deleteselectedvendor"/></p>
	</div>
	<div>
		<html:hidden property="clientVendorID" styleId="clientVendorID" />
		<html:hidden property="selectedRowID" />
		<input type="hidden" name="venrId" id="venrId" value="" /> 
		<input type="hidden" name="cvId" id="cvId" value=""/>
		<input type="hidden" name="tabid" id="tabid" value="" /> 
		<input type="hidden" name="SelectedRID" id="setRID" value=""> 
		<input type="hidden" name="bst" id="bsst" value="0" />
		<html:hidden property="state" value="0" />
		<html:hidden property="bsstate" value="0" />
		<html:hidden property="shstate" value="0" />
	</div>
	<!-- end Contents -->
	<input type="hidden" name="actionValidate" value="vendor.jsp">
	<table style="width: 100%;">
		<tr>
			<td style="font-size: 14px;">
				<table style="width: 100%;">
					<tr>
						<td style="border: 1px solid #ccc; width: 300px; padding: 0; margin: 0;">
							<table class="tabla-listados" cellspacing="0" style="border: 0;padding: 0; margin: 0;">
								<thead>
									<!-- <tr valign="top"> -->
									<tr>
										<th class="emblem" style="font-size: 14px;">
											<div align="center">
												<bean:message key="BzComposer.vendorlist.vendor" />
											</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- <td colspan="4" style="padding: 6px 0px 3px 3px"> -->
										<td colspan="4" style="margin: 0; padding: 0;">
											<!-- <div style="overflow: auto; height:340; width: 250;"> -->
											<div style="overflow: auto;height: 80vh;width: 300px;">
												<table>
													<logic:present name="VendorDetails">
														<logic:notEmpty name="VendorDetails">
															<bean:size name="VendorDetails" id="VendorSize" />
																<input type="hidden" name="listSize" id="lSize" value='<bean:write name="VendorSize" />'>
																<logic:iterate name="VendorDetails" id="objList" indexId="ndx">
																	<tr id='<bean:write name="ndx" />$$'
																	onclick="setRowId(<bean:write name="objList" property="clientVendorID" />,'<bean:write name="ndx" />$$');">
																		<td colspan="2" style="font-size: 14px; width: 300px;">
																			<bean:write name="objList" property="cname" />
																		</td>
																	</tr>
																	<logic:present name="Services">
																		<logic:notEmpty name="Services">
																			<bean:size name="Services" id="ssize" />
																			<input type="hidden" name="serSize" id="seSize" value='<bean:write name="ssize" />' />
																			<logic:iterate name="Services" id="service" indexId="index">
																				<logic:equal name="service" property="clientVendorID" value='${objList.clientVendorID}'>
																					<tr id='<bean:write name="index" />*$$'
																					onclick="setRowId(${objList.clientVendorID},'<bean:write name="index" />*$$');">
																						<td colspan="2">&nbsp;&nbsp;
																							<img src="<bean:write name="path" property="pathvalue"/>/images/arrow.jpg"></img>
																							<bean:write name="service" property="serviceName" />
																						</td>
																					</tr>
																				</logic:equal>
																			</logic:iterate>
																		</logic:notEmpty>
																	</logic:present>
																</logic:iterate>
															</logic:notEmpty>
													</logic:present>
												</table>
											</div>
										</tbody>
									</table>
								</td>
								<td style="font-size:14px; margin: 0; padding: 0;vertical-align: 0;">
									<logic:present name="VendorDetails"></logic:present>
									<div id="table-negotiations" >
										<table cellspacing="0" class="tabla-listados" style="margin-top: 0; margin-left: 20px;">
											<thead>
												<tr>
													<th colspan="10" style="font-size: 14px;">
														<bean:message key="BzComposer.vendorlist.vendorinformation"/>
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.firstname" /> 
														<!-- <span class="inputHighlighted">*</span> --> :
													</td>
													<td style="font-size:14px;">
														 <bean:write name="vendorDetails1" property="firstName"  /> 
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.lastname" /> 
														<!-- <span class="inputHighlighted">*</span> --> :
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="lastName" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.startdate" />:
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="dateAdded" />
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.titlename" />:
													</td>
													<td style="font-size:14px;">
														<html:select property="title" name="vendorDetails1" disabled="true" style="width:125px;">
															<html:options collection="titleList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.company" /> 
														<span class="inputHighlighted">*</span>
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="cname" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.province" />
													</td>
													<td style="width: 10%;font-size:14px;">
														<bean:write name="vendorDetails1" property="province" />
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.address1" /> 
														<span class="inputHighlighted">*</span>
													</td>
													<td style="font-size:14px;">
														<%-- <html:text style="width:100%;" property="address1" name="vendorDetails1" readonly="true" /> --%>
														<bean:write name="vendorDetails1" property="address1"/>
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.address2" />
														<span class="inputHighlighted">:</span>
													</td>
													<td style="font-size:14px;">
														<%-- <html:text style="width:100%;" property="address2" name="vendorDetails1" readonly="true" /> --%>
														<bean:write name="vendorDetails1" property="address2"/>
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.homepage" />
													</td>
													<td style="width: 10%;font-size:14px;">
														<bean:write name="vendorDetails1" property="homePage" />
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<tr>
													<td id="t_country" style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.country" />
													</td>
													<td style="font-size:14px;">
														<html:select property="country" name="vendorDetails1" disabled="true">
															<html:option value="0">
																<bean:message key="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="cList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td id="t_state" style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.state" />
													</td>
													<td id="t_statedata" style="font-size:14px;"></td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.city" />
														<span class="inputHighlighted">*</span>
													</td>
													<td style="width:10%;font-size:14px;">
														<bean:write name="vendorDetails1" property="city" />
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<script>
													<logic:present name="state_gen" >
									    				var contry=document.VendorForm.country.value;
														refreshItemsNow33(contry,'<bean:write name="state_gen" />');
												    </logic:present>	    
												</script>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.zipcode" /> 
														<!-- <span class="inputHighlighted">*</span> --> :
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="zipCode" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.fax" />
													</td>
													<td style="width: 10%;font-size:14px;">
														<bean:write name="vendorDetails1" property="fax" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.phone" />
													</td>
													<td style="width: 10%;font-size:14px;">
														<bean:write name="vendorDetails1" property="phone" />
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.cellphone" />:
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="cellPhone" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.email" />
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="email" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.type" />
													</td>
													<td style="font-size:14px;">
														<html:select property="type" name="vendorDetails1" disabled="true">
															<html:option value="0">
																<bean:message key="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="VendorCategoryList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.taxid" />
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="texID" />
													</td>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.oppeningunpaidbalance" />
													</td>
													<td style="font-size:14px;">
														<bean:write name="vendorDetails1" property="openingUB" />
													</td>
													<td style="font-size:14px;">
														<logic:equal name="vendorDetails1" property="taxAble" value="1">
															<input value="on" type="checkbox" name="isTaxable" name="CustomerDetails" 
															checked="checked" disabled="disabled">
														</logic:equal> 
														<logic:notEqual name="vendorDetails1" property="taxAble" value="1">
															<input value="on" type="checkbox" readonly="true" disabled="disabled" name="isTaxable"
															name="CustomerDetails">
														</logic:notEqual>
														<bean:message key="BzComposer.vendorlist.istaxable" />
														<%-- <bean:message key="BzComposer.vendorlist.istaxable" /> --%>
													</td>
													<td style="font-size:14px;">
														<logic:equal name="vendorDetails1" property="isclient" value="1">
															<input value="on" type="checkbox" disabled="disabled" name="isAlsoClient" 
															name="CustomerDetails" checked="checked">
														</logic:equal> 
														<logic:notEqual name="vendorDetails1" property="isclient" value="1">
															<input value="on" type="checkbox" disabled="disabled" name="isAlsoClient" name="CustomerDetails">
														</logic:notEqual> 
														<bean:message key="BzComposer.vendorlist.isalsoclient" />
														<%-- <bean:message key="BzComposer.vendorlist.isalsoclient" /> --%>
													</td>
													<td colspan="4">&nbsp;</td>
												</tr>
												<tr>
													<td style="font-size:14px;">
														<bean:message key="BzComposer.vendorlist.existingcredits" />
													</td>
													<td style="font-size: 14px;">
														<bean:write name="vendorDetails1" property="extCredit" />
													</td>
													<td colspan="8"></td>
												</tr>
											<!--<tr> -->
											<%--<td><bean:message key="BzComposer.Customer.Memo" /></td> --%>
											<%--<td colspan="2"><html:textarea style="width:100%" property="memo" --%>
											<!--name="CustomerDetails" readonly="true"/></td> -->
											<!--</tr> -->
											</tbody>
										</table>
									</div>
									<%-- </logic:present> --%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- Csolution Start hide unused Section 
				<tr>
					<td valign=top class="tabPage">
						<div id="content2" class="tabPage">
							<div id="table-negotiations" style="width:100%">
								<table class="tabla-listados" cellspacing="0">
									<thead>
										<tr>
											<th colspan="4">
												<bean:message key="BzComposer.Customer.PrefrenceInformation" /></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><bean:message key="BzComposer.Customer.term" /></td>
													<td colspan="3"><html:select property="term"
														name="CustomerDetails">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="TermList" property="value"
															labelProperty="label" />
													</html:select></td>
												<tr>
												<tr>
													<td><bean:message key="BzComposer.Customer.Rep" /></td>
													<td colspan="3"><html:select property="rep"
														name="CustomerDetails">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="RepList" property="value"
															labelProperty="label" />
													</html:select></td>
												<tr>
												<tr>
													<td><bean:message key="BzComposer.Customer.PayMethod" /></td>
													<td colspan="3"><html:select property="paymentType"
														name="CustomerDetails">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="PaymentList" property="value"
															labelProperty="label" />
													</html:select></td>
												<tr>
												<tr>
													<td><bean:message key="BzComposer.Customer.ShippingVia" />
													</td>
													<td colspan="3"><html:select property="shipping"
														name="CustomerDetails">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="ShipCarrierList"
															property="value" labelProperty="label" />
													</html:select></td>
												<tr>
											</tbody>
										</table>
										</div>
										<div id="table-negotiations" style="width:700">
										<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th colspan="4"><bean:message
														key="BzComposer.Customer.CreditCardInformation" /></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><bean:message key="BzComposer.Customer.CardType" /></td>
													<td colspan="3"><html:select property="ccType"
														name="CustomerDetails">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="CreditCardList" property="value"
															labelProperty="label" />
													</html:select></td>
												<tr>
													<td><bean:message key="BzComposer.Customer.CardNumber" /></td>
													<td colspan="3"><html:text property="cardNo"
														name="CustomerDetails" /></td>
												</tr>

												<tr>
													<td><bean:message key="BzComposer.Customer.ExpDate" /></td>
													<td colspan="3"><html:text property="expDate"
														name="CustomerDetails" readonly="true" /> <img
														src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
														onclick="displayCalendar(document.VendorForm.expDate,'mm/yyyy',this);">
													<bean:message key="BzComposer.Customer.mformate" /></td>
												</tr>
												<tr>

													<td><bean:message key="BzComposer.Customer.CW2" /></td>
													<td colspan="3"><html:text property="cw2"
														name="CustomerDetails" size="7" /></td>
												</tr>
												<tr>
													<td><bean:message key="BzComposer.Customer.CardHolderName" />
													</td>
													<td><html:text property="cardHolderName"
														name="CustomerDetails" /></td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><bean:message key="BzComposer.Customer.BillingAddress" />
													</td>
													<td><html:text property="cardBillAddress"
														name="CustomerDetails" size="50" /></td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td><bean:message key="BzComposer.Customer.ZipCode" /></td>
													<td><html:text
														onkeypress="return numbersonly(event,this.value)"
														property="cardZip" name="CustomerDetails" /></td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>

											</tbody>
										</table>
										</div>
										</div>
										</td>
									</tr>
									<tr>
										<td valign=top class="tabPage">
										<div id="content3" class="tabPage">

										<div id="table-negotiations">
										<table>
											<tr>
												<td>

												<table class="tabla-listados" cellspacing="0" width="300"
													align="left">
													<tbody>
														<tr>
															<td><bean:message key="BzComposer.Customer.Company" /></td>
															<td><html:text property="bscname" name="CustomerDetails" />
															</td>

														</tr>

														<tr>
															<td><bean:message key="BzComposer.Customer.FirstName" />
															</td>
															<td><html:text property="bsfirstName"
																name="CustomerDetails" /></td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.LastName" /></td>
															<td><html:text property="bslastName"
																name="CustomerDetails" /></td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.Address1" /></td>
															<td colspan="3"><html:text property="bsaddress1"
																name="CustomerDetails" /></td>
														<tr>
															<td><bean:message key="BzComposer.Customer.Address2" /></td>
															<td colspan="3"><html:text property="bsaddress2"
																name="CustomerDetails" /></td>
														</tr>

														<tr>
															<td><bean:message key="BzComposer.Customer.City" /></td>
															<td><html:text property="bscity" name="CustomerDetails" />
															</td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.ZipCode" /></td>
															<td><html:text
																onkeypress="return numbersonly(event,this.value)"
																property="bszipCode" name="CustomerDetails" /></td>
														</tr>

														<tr>

															<td id="t_country"><bean:message
																key="BzComposer.Customer.Country" /></td>
															<td><html:select property="bscountry"
																onchange="refreshItemsNow1(this.value);"
																onblur="refreshItemsNow1(this.value);"
																name="CustomerDetails">
																<html:option value="0">
																	<bean:message key="BzComposer.ComboBox.Select" />
																</html:option>
																<html:options collection="cList" property="value"
																	labelProperty="label" />
															</html:select></td>
														</tr>
														<tr>
															<td id="t_state"><bean:message
																key="BzComposer.Customer.State" /></td>
															<td id="t_statedata1"></td>


														</tr>
														<logic:present name="state_bt">
															<script>
    										var scountry=document.VendorForm.bscountry.value;
    										refreshItemsNow22(scountry,'<bean:write name="state_bt" />');
    										
									    </script>
														</logic:present>
														<tr>
															<td><bean:message key="BzComposer.Customer.Province" /></td>
															<td><html:text property="bsprovince"
																name="CustomerDetails" /></td>

														</tr>
														<tr>
															<td colspan="2"><input type="button" class="formbutton"
																name="ClearBillingBtn" value="Clear Billing Address"
																onclick="clearBillingAdd();"
																title="Clear Billing Address"></td>
												</table>
												<td><input type="button" name="CopyBtn" class="formbutton"
													onclick="CopyBilladdToShipAdd();" value="Copy>>"
													title="Copy Address"></td>

												<td>

												<table class="tabla-listados" cellspacing="0" width="300"
													align="left">
													<tbody>
														<tr>
															<td><bean:message key="BzComposer.Customer.Company" /></td>
															<td><html:text property="shcname" name="CustomerDetails" />
															</td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.FirstName" />
															</td>
															<td><html:text property="shfirstName"
																name="CustomerDetails" /></td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.LastName" /></td>
															<td><html:text property="shlastName"
																name="CustomerDetails" /></td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.Address1" /></td>
															<td colspan="3"><html:text property="shaddress1"
																name="CustomerDetails" /></td>
														<tr>
															<td><bean:message key="BzComposer.Customer.Address2" /></td>
															<td colspan="3"><html:text property="shaddress2"
																name="CustomerDetails" /></td>
														</tr>

														<tr>
															<td><bean:message key="BzComposer.Customer.City" /></td>
															<td><html:text property="shcity" name="CustomerDetails" />
															</td>
														</tr>
														<tr>
															<td><bean:message key="BzComposer.Customer.ZipCode" /></td>
															<td><html:text
																onkeypress="return numbersonly(event,this.value)"
																property="shzipCode" name="CustomerDetails" /></td>
														</tr>

														<tr>

															<td id="t_country"><bean:message
																key="BzComposer.Customer.Country" /></td>
															<td><html:select property="shcountry"
																onchange="refreshItemsNow2(this.value);"
																name="CustomerDetails">
															

																<html:option value="0">
																	<bean:message key="BzComposer.ComboBox.Select" />
																</html:option>
																<html:options collection="cList" property="value"
																	labelProperty="label" />
															</html:select></td>
														</tr>
														<tr>
															<td id="t_state"><bean:message
																key="BzComposer.Customer.State" /></td>
															<td id="t_statedata2"></td>
														</tr>
														<logic:present name="state_bt">
															<script>
    										var scountry=document.VendorForm.bscountry.value;
    										refreshItemsNow22(scountry,'<bean:write name="state_bt" />');
    										
									    </script>
														</logic:present>
														<logic:present name="state_st">
															<script>
												
									       				 var scountry=document.VendorForm.shcountry.value;
									       			   refreshItemsNow12(scountry,'<bean:write name="state_st" />');
									       	
									       										
									</script>
														</logic:present>
														<tr>
															<td><bean:message key="BzComposer.Customer.Province" /></td>
															<td><html:text property="shprovince"
																name="CustomerDetails" /></td>

														</tr>
														<tr>
															<td colspan="2"><input type="button" class="formbutton"
																name="ClearShippingBtn" onclick="clearShippingAdd();"
																value="Clear Shipping Address"
																title="Clear Shipping Address"></td>
												</table>
												</td>
											</tr>



										</table>

										</div>
										</div>
										</td>
									</tr>


								


									<tr>
										<td valign=top class="tabPage">
										<div id="content5" class="tabPage">
										<div id="table-negotiations" style="width:700">

										<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th colspan="4"><bean:message
														key="BzComposer.UpdateInvoice.Header" /></th>
												</tr>
											</thead>
											<tr>
												<td colspan="4"><html:radio property="dispay_info"
													value="ShowAll"
													onclick="hide_details(this.value,this.form);" /><bean:message
													key="BzComposer.UpdateCustomer.Services.ShowAll" /> <script
													type="text/javascript">
                                    radio_val = document.VendorForm.dispay_info.value;
                                </script></td>
											</tr>

											<tr>
												<td><html:radio property="dispay_info" value="ByVal"
													onclick="hide_details(this.value,this.form);" /><bean:message
													key="BzComposer.UpdateCustomer.Services.ByVal" /></td>
												<td>From <html:text property="periodFrom" readonly="true"
													size="15" disabled="true" /> <img
													src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
													onclick="displayCalendar(document.VendorForm.periodFrom,'mm-dd-yyyy',this);"
													id="imgfrm"></td>
												<td>To <html:text property="periodTo" readonly="true"
													size="15" disabled="true" /> <img
													src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
													onclick="displayCalendar(document.VendorForm.periodTo,'mm-dd-yyyy',this);"
													id="imgto"></td>
												<td><input type="button" class="formbutton" name="Look up"
													value="Look History" id="lookBtn"
													onclick="lookUpHistory(this.form);" /></td>
											</tr>
										</table>
										<div id="t_history" style="overflow:auto;height:400;width:800">

										</div>
										</div>
										</td>
									</tr>
								<script>
						count=0;
						cnt=0;
																		
						var exist= new Array(10); 
						for (i=0; i<exist.length; i++){
							exist[i]=-1;
						}
//						alert("exist created len="+exist.length);
					</script>
									<tr>
										<td valign=top class="tabPage">
										<div id="content7" class="tabPage">


										<html:hidden property="table_serviceName" value="" /> <html:hidden
											property="table_defaultVal" value="0" /> <html:hidden
											property="table_size" value="0" /> <html:hidden
											property="table_invId" value="" /> <html:hidden
											property="table_bal" value="" /> <html:hidden
											property="table_serID" value="" /> <html:hidden
											property="table_DbDefSer" value="0" /> <bean:size
											name="ServiceList" id="SList" /> <input type="hidden"
											name="ssize" id="sSize" value='<bean:write name="SList"/>'>


										<div id="table-negotiations" style="width:700;"><input
											type="hidden" value="1" id="hidn" name="valhidn" />

										<table class="tabla-listados" cellspacing="0">

											<tr>
												<td><bean:message
													key="BzComposer.UpdateInvoice.Service.Header" /></td>
												<td colspan="2" id="sername"></td>

											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>

											<tr>
												<td><bean:message
													key="BzComposer.UpdateCustomer.ServiceLabel" /></td>
												<td><html:select property="serviceID">
													<html:options collection="ServiceList" property="serviceID"
														labelProperty="serviceName" />
												</html:select></td>
												<td></td>

											</tr>
											<tr>
												<td><bean:message
													key="BzComposer.UpdateInvoice.Service.Service" /></td>
												<td colspan="2"></td>
											</tr>

										</table>

										<div id="table-negotiations"
											style="overflow:auto;height:400;width:700">

										<table class="tabla-listados" cellspacing="0">

											<thead>
												<tr>
													<th><bean:message
														key="BzComposer.UpdateInvoice.Service.ServiceName" /></th>
													<th><bean:message
														key="BzComposer.UpdateInvoice.Service.InvoiceStyle" /></th>
													<th><bean:message
														key="BzComposer.UpdateInvoice.Service.Balance" /></th>
													<th><bean:message
														key="BzComposer.UpdateInvoice.Service.Default" /></th>

												</tr>
											</thead>
											<tr id="tr$$">
												<td align="center"></td>
												<td align="center"></td>
												<td align="center"></td>
												<td align="center"></td>
											</tr>

											<logic:present name="ServiceInfo" scope="request">
												<logic:empty name="ServiceInfo">
													<script type="text/javascript">
										default_sid=0;
										default_sid=<bean:write name="DefaultService"/>;
									</script>
												</logic:empty>
												<logic:present name="DefaultService">
													<script type="text/javascript">
										default_sid=<bean:write name="DefaultService"/>;
								</script>
												</logic:present>
												<logic:notPresent name="DefaultService">
													<script type="text/javascript">
										default_sid=0;
								</script>
												</logic:notPresent>

												<logic:notEmpty name="ServiceInfo" scope="request">

													<bean:size id="ServiceInfoSize" name="ServiceInfo" />

													<input type="hidden" name="serviceSize" id="sIDSize"
														value='<bean:write name="ServiceInfoSize" />' />

													<logic:iterate name="ServiceInfo" id="objList"
														indexId="ndx">
														<input type="hidden" id='<bean:write name="ndx" />_ser'
															value='<bean:write name="objList" property="serviceID" />' />
														<tr
															id='row<bean:write name="objList" property="serviceID" />'>
															
															<td align="left"><bean:write name="objList"
																property="serviceName" /></td>
															<td align="left"><bean:write name="objList"
																property="invoiceStyle" /></td>
															<td align="left"><bean:write name="objList"
																property="serviceBalance" /></td>

															<logic:equal name="objList" property="defaultService"
																value="1">
																<td><input type="radio" name=defaultService id="default"
																	value='<bean:write name="objList" property="defaultService" />'
																	checked="checked" readonly="readonly" /> <script
																	type="text/javascript">
													default_sid=<bean:write name="objList" property="serviceID" />
													document.getElementById("sername").innerHTML = '<bean:write name="objList" property="serviceName" />';
												</script></td>
															</logic:equal>

															<logic:notEqual name="objList" property="defaultService"
																value="1">
																<td><input type="radio" name=defaultService id="default"
																	value='<bean:write name="objList" property="defaultService" />' /></td>

															</logic:notEqual>

															<td align="center"><input type="hidden"
																value='<bean:write name="objList" property="serviceID"/>'
																id='<bean:write name="ndx" />id' /></td>
														</tr>

													</logic:iterate>

												</logic:notEmpty>
											</logic:present>
										</table>
										<div>
										<table>
										</table>
										</div>
										</div>

										</div>
										</div>
										</td>
									</tr><tr>
										<td valign=top class="tabPage">
										<div id="content4" class="tabPage">
										<div id="table-negotiations" style="width:700">

										<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th><bean:message key="BzComposer.Customer.FinanceMsg" /></th>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<logic:equal
														name="CustomerDetails" property="fsUseIndividual"
														value="1">
														<input value="on" type="checkbox"
															name="UseIndividualFinanceCharges" checked="checked"
															onclick="enableDisableFinanceCharges();" id="chbox">
													</logic:equal> <logic:notEqual name="CustomerDetails"
														property="fsUseIndividual" value="1">
														<input value="on" type="checkbox"
															name="UseIndividualFinanceCharges"
															onclick="enableDisableFinanceCharges();" id="chbox">
													</logic:notEqual> <font size="2"><bean:message
														key="BzComposer.Customer.UseIndividualFinanceCharges" /></font></td>
												<tr>
											</thead>
											<tbody>
												<tr align="center">
													<td>
													<div id="table-negotiations" style="width:600">
													<table class="tabla-listados" cellspacing="0">
														<thead>
															<tr>
																<th colspan="4"><bean:message
																	key="BzComposer.Customer.ChargeRate" /></th>
															</tr>
														</thead>
														<tbody>


															<tr>
																<td><bean:message
																	key="BzComposer.Customer.AnnualIntrestRate" /></td>
																<td colspan="3"><html:text
																	onkeypress="return numbersonly(event,this.value)"
																	property="annualIntrestRate" name="CustomerDetails"
																	disabled="true" /></td>
															</tr>
															<tr>
																<td><bean:message
																	key="BzComposer.Customer.MinimumFinanaceCharge" /></td>
																<td colspan="3"><html:text
																	onkeypress="return numbersonly(event,this.value)"
																	property="minFCharges" name="CustomerDetails"
																	disabled="true" /></td>
															</tr>

															<tr>
																<td><bean:message key="BzComposer.Customer.GracePeriod" />
																</td>
																<td colspan="3"><html:text
																	onkeypress="return numbersonly(event,this.value)"
																	property="gracePrd" name="CustomerDetails"
																	disabled="true" /></td>
															</tr>

														</tbody>
													</table>

													</div>

													<div id="table-negotiations" style="width:600">
													<table class="tabla-listados" cellspacing="0">
														<thead>
															<tr>
																<th><bean:message
																	key="BzComposer.Customer.ApplyingCharges" /></th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td colspan="4">&nbsp;</td>
															</tr>


															<tr>
																<td colspan="4"><logic:equal name="CustomerDetails"
																	property="fsAssessFinanceCharge" value="1">
																	<input value="on" type="checkbox"
																		name="AssessFinanceChk" id="chk1"
																		name="CustomerDetails" checked="checked"
																		disabled="disabled" />
																</logic:equal> <logic:notEqual name="CustomerDetails"
																	property="fsAssessFinanceCharge" value="1">
																	<input type="checkbox" name="AssessFinanceChk"
																		id="chk1" name="CustomerDetails" disabled="disabled">
																</logic:notEqual> <bean:message
																	key="BzComposer.Customer.AssessFinance" /></td>

															</tr>
														</tbody>
													</table>
													</div>
													</td>
												</tr>
										</table>
										</td>
									</tr>
									 Csolution End hide unused Section  -->
							</table>
						</div>
					</div>
				</div>
			</div>
			</div>
	</html:form>
	<%@ include file="/include/footer.jsp"%>
</body>
</html>
<!-- dialog box that used in this page -->