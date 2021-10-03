<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.customerinfotitle" /></title>
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
function c(r) 
{
	if (___) 
	{
    	var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    	try 
    	{
      		o = new ActiveXObject(t);
      		o.onreadystatechange = r;
    	} 
    	catch (ex) 
    	{
      		alert("<bean:message key='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
    	}
  	} 
	else 
	{
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
<script>
$(function() 
{
$('#sortBy').change(function(){
	var sortBy = $(this).val();
	//alert("on sortBy change event");
	/* alert("sortBy:"+sortBy); */
	if(sortBy == 1)
	{
		$.ajax({
			type: "POST",
			url:"Customer.do?tabid=sortInvoice&SortBy="+sortBy,
			data:{sortBy : sortBy},
			}).done(function(data){
			$(document).find('div#custDiv table').replaceWith($(data).find('div#custDiv').html());
		});
	}
	else if(sortBy == 2)
	{
		$.ajax({
			type: "POST",
			url:"Customer.do?tabid=sortInvoice&SortBy="+sortBy,
			data:{sortBy : sortBy},
			}).done(function(data){
			$(document).find('div#custDiv table').replaceWith($(data).find('div#custDiv').html());
		});
	}
	else if(sortBy == 3)
	{
		$.ajax({
			type: "POST",
			url:"Customer.do?tabid=sortInvoice&SortBy="+sortBy,
			data:{sortBy : sortBy},
			}).done(function(data){
			$(document).find('div#custDiv table').replaceWith($(data).find('div#custDiv').html());
		});
	}
	});
});
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
	padding: 5px 0px 5px 12px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: #fff;
	vertical-align: top;
}
</style>
</head>
<body onload="initialize();">
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<html:form action="Customer.do?" enctype="MULTIPART/FORM-DATA"  method="post">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<!-- begin Contents -->
<div>
<div style="float: left;">
	<span style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.customerinfo.customerinfotitle" />
	</span>
	<br>
	<table>
		<tr>
			<td>
				<bean:message key="BzComposer.customer.sortby" />
			</td>
			<td>
				<select id="sortBy">
					<option value="1"><bean:message key="BzComposer.customerinfo.companyname"/></option>
					<option value="2"><bean:message key="BzComposer.global.firstname"/></option>
					<option value="3"><bean:message key="BzComposer.global.lastname"/></option>
				</select>
			</td>
			<td colspan="4">&nbsp;</td>
		</tr>
	</table>
</div>
<div style="float: right;">
	<table>
		<tr align="right">
			<td colspan="6">
				<div>
					<input type="button" value="  <bean:message key='BzComposer.global.edit'/>  " class="formbutton" onclick="manageCustomer('EDIT');" /> 
					<input type="button" class="formbutton" value="<bean:message key='BzComposer.global.delete'/>" onclick="manageCustomer('DELETE');" />
				</div>
				<div>
					<html:hidden property="clientVendorID" />
					<html:hidden property="selectedRowID" />
					<input type="hidden" name="cvId" id="vendrId" value="0" /> 
					<input type="hidden" name="SelectedRID" id="setRID" value="">
				</div>
			</td>
		</tr>
	</table>
</div>
</div>
<table style="width: 100%; apdding: 0;">
	<tr>
		<td>
			<table style="padding: 0;width: 100%; margin-top: 30px;" align="center">
				<tr>
					<td valign="top" colspan="1" style="width: 300px; padding: 0; height: 75vh; border: 1px solid #ccc;">
						<table class="tabla-listados" cellspacing="0" style=" border: 0; padding: 0;margin: 0; height: auto;">
							<thead>
								<tr valign="top">
									<th class="emblem" style="font-size:12px;">
										<div align="center">
											<bean:message key="BzComposer.customerinfo.customer" />
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">
										<div id="custDiv" style="overflow: auto; height:auto;">
										<div id="custDiv">
											<table id="custTable">
												<tbody id="custTableBody">
												
												<logic:present name="CustomerDetails">
													<logic:notEmpty name="CustomerDetails">
														<bean:size name="CustomerDetails" id="CustomerDetailsSize" />
														<input type="hidden" name="listSize" id="lSize" value='<bean:write name="CustomerDetailsSize"/>'>
														<logic:iterate name="CustomerDetails" id="objList" indexId="ndx">
														<tr id='<bean:write name="ndx" />$$'
														onclick="setRowId(<bean:write name="objList" property="clientVendorID" />,'<bean:write name="ndx" />$$');"
														name="<bean:write name="objList" property="lastName" />" value="<bean:write name="objList" property="firstName" />">
															<td colspan="2" style="font-size:12px;">
																<bean:write name="objList" property="cname" />
																<%-- <input type="hidden" id="fName" value="<bean:write name="objList" property="firstName" />"/>
																<input type="hidden" id="lName" value="<bean:write name="objList" property="lastName" />"/> --%>
															</td>
														</tr>
														</logic:iterate>
													</logic:notEmpty>
												</logic:present>
												</tbody>
											</table>
										</div>
										</div>
									</td>			<!-- Added on 26-04-2019 -->
								</tr>				<!-- Added on 26-04-2019 -->
							</tbody>
						</table>
					</td>							<!-- Added on 26-04-2019 -->
					<td colspan="10" style="vertical-align: 0;">
						<logic:present name="CustomerDetails"></logic:present>
						<div id="table-negotiations" style="height:auto;">
							<table cellspacing="0" class="tabla-listados" style="margin-top: 0; margin-left: 20px;">
								<thead>
									<tr>
										<th colspan="10" style="font-size:12px;">
											<bean:message key="BzComposer.customerinfo.customerinformation"/>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.firstname" /> 
											<span class="inputHighlighted">*</span>
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="firstName" />
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.lastname" /> 
											<span class="inputHighlighted">*</span>
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="lastName"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.startdate" />:
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="dateAdded" />
										</td>
										<td colspan="4">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.titlename" />:
										</td>
										<td style="font-size:12px;">
											<html:select property="title" name="CustomerDetails1" disabled="true">
												<html:options collection="titleList" property="value" labelProperty="label" />
											</html:select>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.company"/> 
											<span class="inputHighlighted">*</span>
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="cname"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.address1" /> 
											<span class="inputHighlighted">*</span>
										</td>
										<td style="font-size:12px;">
											<%-- <html:text size="20" property="address1" name="CustomerDetails1" readonly="true" /> --%>
											<bean:write property="address1" name="CustomerDetails1"/>
										</td>
										<td colspan="4">&nbsp;</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.address2" />
											<span class="inputHighlighted">:</span>
										</td>
										<td style="font-size:12px;">
											<%-- <html:text size="20" property="address2" name="CustomerDetails1" readonly="true" /> --%>
											<bean:write property="address2" name="CustomerDetails1"/>
										</td>
										<td id="t_country" style="font-size:12px;">
											<bean:message key="BzComposer.global.country" />
										</td>
										<td style="font-size:12px;">
											<html:select property="country" name="CustomerDetails1" disabled="true">
												<html:option value="0">
													<bean:message key="BzComposer.ComboBox.Select" />
												</html:option>
												<html:options collection="cList" property="value" labelProperty="label" />
											</html:select>
										</td>
										<td id="t_state" style="font-size:12px;">
											<bean:message key="BzComposer.global.state" />
										</td>
										<td id="t_statedata" style="font-size:12px;">
										</td>
										<td colspan="4">&nbsp;</td>
									</tr>
									<script>
									<logic:present name="state_gen">
							    	var contry=document.CustomerForm.country.value;
									refreshItemsNow33(contry,'<bean:write name="state_gen" />');
									</logic:present>	    
									<logic:notPresent name="state_gen">
									</logic:notPresent>
									</script>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.city" />
											<span class="inputHighlighted">*</span>
										</td>
										<td style="width: 10%;font-size:12px;">
											<bean:write name="CustomerDetails1" property="city"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.zipcode"/> 
											<span class="inputHighlighted">*</span>
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="zipCode"/>
										</td>
										<td style="font-size: 12px;">
											<bean:message key="BzComposer.global.province" />
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="province" />
										</td>
										<td colspan="4">&nbsp;</td>
									</tr>
									<tr>
										<td style="font-size: 12px;">
											<bean:message key="BzComposer.global.fax" />
										</td>
										<td style="font-size:12px;width: 10%">
											<bean:write name="CustomerDetails1" property="fax" />
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.phone" />
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="phone"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.cellphone" />:
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="cellPhone" />
										</td>
										<td colspan="4">&nbsp;</td>
									</tr>
									<tr>
										<td style="font-size: 12px;">
											<bean:message key="BzComposer.global.homepage" />
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="homePage"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.email" />
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="email"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.type" />
										</td>
										<td style="font-size:12px;">
											<html:select property="type" name="CustomerDetails1" disabled="true">
												<html:option value="0">
													<bean:message key="BzComposer.ComboBox.Select" />
												</html:option>
												<html:options collection="VendorCategoryList" property="value" labelProperty="label" />
											</html:select>
										</td>
										<td colspan="4">&nbsp;</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.taxid" />
										</td>
										<td style="font-size:12px;width: 10%">
											<bean:write name="CustomerDetails1" property="texID"/>
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.oppeningunpaidbalance" />
										</td>
										<td style="font-size:12px;">
											<bean:write name="CustomerDetails1" property="openingUB"/>
										</td>
										<td style="font-size:12px;">
											<logic:equal name="CustomerDetails1" property="taxAble" value="1">
												<input value="on" type="checkbox" name="isTaxable" name="CustomerDetails" checked="checked" disabled="disabled">
											</logic:equal> 
											<logic:notEqual name="CustomerDetails1" property="taxAble" value="1">
												<input value="on" type="checkbox" readonly="true" disabled="disabled" name="isTaxable" name="CustomerDetails1">
											</logic:notEqual>
											<bean:message key="BzComposer.global.istaxable" />
										</td>
										<td style="font-size:12px;">
											<logic:equal name="CustomerDetails1" property="isclient" value="1">
												<input value="on" type="checkbox" disabled="disabled" name="isAlsoClient" name="CustomerDetails"
												checked="checked">
											</logic:equal>
											<logic:notEqual name="CustomerDetails1" property="isclient" value="1">
												<input value="on" type="checkbox" disabled="disabled" name="isAlsoClient" name="CustomerDetails1">
											</logic:notEqual> 
											<bean:message key="BzComposer.global.isalsoclient" />
										</td>
										<td colspan="4">&nbsp;</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.global.existingcredits" />
										</td>
										<td style="font-size:12px;width: 10%">
											<bean:write name="CustomerDetails1" property="extCredit" />
										</td>
										<td colspan="8">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<div>
	<input type="hidden" name="tabid" id="tabid" value="" />
</div>
</div>
</div>
</div>
</div>					
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
</html>
<script>
function initialize()
{
	var rid= "<%= request.getParameter("selectedRID")%>$$";
	var rd=document.getElementById(rid);
	rd.className = "draft";
	<logic:present name="VendorFrm">
		tableValue();
	</logic:present>
}
function setRowId(rowid,rid)
{
	size=document.getElementById("lSize").value;
	//size1=document.getElementById("seSize").value;
	for(i=0;i<size;i++)
	{
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	/*for(j=0;j<size1;j++){
	row1=document.getElementById(j+"*$$");
	row1.className = "";
	}*/
	var rd=document.getElementById(rid);
	rd.className = "draft";
	document.getElementById("setRID").value=rid;
	var rd1=rid.replace("$$", "");
	document.CustomerForm.clientVendorID.value=rowid;
	var custid=document.CustomerForm.clientVendorID.value;
	getVendorInfo(rowid,rd1);
}
function tableValue()
{
	rid=document.CustomerForm.selectedRowID.value;
	var rd=document.getElementById(rid);
	rd.className = "draft";
	var sortId = <%= request.getParameter("sortById")%>;
	//alert("sortBy Id:"+sortId);
	$('select[id="sortBy"]').find('option[value="'+sortId+'"]').attr("selected",true);
	//document.getElementById("setRID").value=rid;
}
/* function setRowId(rowId,rid)
{
	size=document.getElementById("lSize").value;
	rowValue= rid.replace("$$","");
	for(i=0;i<size;i++)
	{
		document.getElementById(i+"$$").classList.remove('draft');		
		if(i%2==0)
		{
			if(size !=(i+1))
			{
				document.getElementById((i+1)+"$$").classList.add('odd');
			}
		}
	}
	if(rowValue%2 !=0)
	{ 
		document.getElementById(rowValue+"$$").classList.remove('odd'); 		
	}
 	var rd = document.getElementById(rid).classList.add('draft');
	document.forms[0].selectedCustomer.value=rowId;	
} */
function resetSelectedCustomer() 
{
	document.getElementById("selCustomer").value="0";
	//alert("value reset");
}
function getVendorInfo(vendorid,rowId)
{
	document.getElementById('vendrId').value=vendorid;
	document.getElementById('vendrId').value=document.CustomerForm.clientVendorID.value;
	var rowID = rowId;
	window.location = "Customer.do?tabid=viewCustomerDetails&&cvId="+vendorid+"&selectedRID="+rowId;
	/* document.getElementById('tabid').value="Customer";
	debugger
	document.forms[0].action="Customer.do?";
	document.forms[0].submit(); */
}
function manageCustomer(cmd)
{
	var cvid= document.CustomerForm.clientVendorID.value; //document.forms[0].selectedCustomer.value;	
	if (cvid==0)
	{	
		//alert('<bean:message key="BzComposer.Customer.cName.Validation"/>');
		return showCustomerValidationDialog();
		//return;
	}
	else 
	{
		if (cmd=="EDIT") 
		{
			showCustomer(cvid);
		//	alert("Edit...Under development");
		}
		else if (cmd=="DELETE") 
		{	
			alert("Delete...Under development");
			if(confirm("This will delete all the information related to this Customer (ID="+cvid+")\nAre you sure to delete ?")==true) 
			{
				/* document.forms[0].action="Customer.do?customerAction=DELETE&cvID="+cvid;
				document.forms[0].submit(); */
				window.location = "Customer.do?customerAction=DELETE&cvID="+cvid;
			}
			/* event.preventDefault();
			$("#deleteCustomer").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		            "<bean:message key='BzComposer.global.ok'/>": function () {
		                $(this).dialog("close");
		                document.forms[0].action="Customer.do?customerAction=DELETE&cvID="+cvid;
						document.forms[0].submit();
						$('form').submit();
		            },
		            <bean:message key='BzComposer.global.cancel'/>: function () {
		                $(this).dialog("close");
		                return false;
		            }
				}
			});*/
			return false;
		}
	}
}
function showCustomer(cust_id)
{
	window.open("EditCustomer.do?tabid=editCustomer&cvId="+cust_id,null,"scrollbars=yes,height=620,"
			+"width=1580,status=yes,toolbar=no,menubar=no,location=no");
	/*window.open("EditCustomer.do?tabid=editCustomer&cvId="+cust_id,null,"scrollbars=yes,height=580,width=1225,status=yes,toolbar=no,menubar=no,location=no"); */
}
</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.customerinfo.selectcustomerfirst"/></p>
</div>
<div id="deleteCustomer" style="display:none;">
	<p><bean:message key="BzComposer.customerinfo.deleteselectedcustomer"/></p>
</div>