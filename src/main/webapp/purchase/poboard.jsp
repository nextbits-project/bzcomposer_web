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
<title><bean:message key="BzComposer.purchaseorderboardtitle"/></title>
<style type="text/css">
.height250 {
height: 250px;

}
.fht-tbody{
height: 180px !important; /*  change table height*/
border-bottom: 1px solid rgb(207, 207, 207);
}
table.tabla-listados {
width: 100%;
border: 1px solid rgb(207, 207, 207);
margin: 0px 0px 0px 0px;
margin: 0px 0px 0px 0px;
}
table.tabla-listados tbody tr.odd td {
background: #e1e5e9;
}
</style>
<script type="text/javascript">
function showNameDialog()
{
	debugger;
	event.preventDefault();
	$("#showNameDialog").dialog({
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
function showErrorTextDialog()
{
	debugger;
	event.preventDefault();
	$("#showErrorTextDialog").dialog({
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
function showSortTypeDialog()
{
	debugger;
	event.preventDefault();
	$("#showSortTypeDialog").dialog({
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
function showpurchaseorderdialog()
{
	debugger;
	event.preventDefault();
	$("#showpurchaseorderdialog").dialog({
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
</head>
<body>
<!-- begin shared/header -->
<html:form action="PurchaseBoard.do?tabid=ShowList" method="post" styleId="frmpoboard">
	<div id="">
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
		<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.purchaseorderboard.poboard" />
		</span>
	</div>
	<div>
		<div id="table-negotiations">
			<table cellspacing="0" align="center" class="section-border" style="width: 100%;">
				<tr>
				<td></td><td></td><td></td>
				<tr align="left">
					<td>
						<logic:present name="IsUpdated">
							<strong>
								<span class="msgstyle">
									<bean:write name="IsUpdated" />
								</span>
							</strong>
						</logic:present>
					</td>
				</tr>
				<tr>
					<td align="left" width="46%" valign="top">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="5" align="left" style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.filteroption" />
								</th>
							</tr>
							<tr>
								<td width="30%" style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.marketplace" />
								</td>
								<td width="70%" colspan="4" style="font-size: 14px;">
									<html:select property="filterMarket">
										<logic:present name="Market"  >						
											<logic:equal name="Market" value="1">
											<option value="1" selected="selected">
												<bean:message key="BzComposer.purchaseorderboard.ebay" />
											</option>
											</logic:equal>
											<logic:notEqual name="Market" value="1">
											<option value="1">
												<bean:message key="BzComposer.purchaseorderboard.ebay" />
											</option>
											</logic:notEqual>
											<logic:equal name="Market" value="2">
											<option value="2" selected="selected">
												<bean:message key="BzComposer.purchaseorderboard.amazonseller" />
											</option>
											</logic:equal>
											<logic:notEqual name="Market" value="2">
											<option value="2">
												<bean:message key="BzComposer.purchaseorderboard.amazonseller" />
											</option>
											</logic:notEqual>
											<logic:equal name="Market" value="3">
											<option value="3" selected="selected">
												<bean:message key="BzComposer.purchaseorderboard.amazonmarket" />
											</option>
											</logic:equal>
											<logic:notEqual name="Market" value="3">
											<option value="3">
												<bean:message key="BzComposer.purchaseorderboard.amazonmarket" />
											</option>
											</logic:notEqual>
											<logic:equal name="Market" value="4">
											<option value="4" selected="selected">
												<bean:message key="BzComposer.purchaseorderboard.halfcom" />
											</option>
											</logic:equal>
											<logic:notEqual name="Market" value="4">
											<option value="4">
												<bean:message key="BzComposer.purchaseorderboard.halfcom" />
											</option>
											</logic:notEqual>
											<logic:equal name="Market" value="5">
											<option value="5" selected="selected">
												<bean:message key="BzComposer.purchaseorderboard.pricegrabber" />
											</option>
											</logic:equal>
											<logic:notEqual name="Market" value="5">
											<option value="5">
												<bean:message key="BzComposer.purchaseorderboard.pricegrabber" />
											</option>
											</logic:notEqual>
										</logic:present>

										<logic:notPresent name="Market">
											<option value="1">
												<bean:message key="BzComposer.purchaseorderboard.ebay" />
											</option>
											<option value="2">
												<bean:message key="BzComposer.purchaseorderboard.amazonseller" />
											</option>
											<option value="3">
												<bean:message key="BzComposer.purchaseorderboard.amazonmarket" />
											</option>
											<option value="4">
												<bean:message key="BzComposer.purchaseorderboard.halfcom" />
											</option>
											<option value="5">
												<bean:message key="BzComposer.purchaseorderboard.pricegrabber" />
											</option>
										</logic:notPresent>
									</html:select>
								</td>
							</tr>
							<tr>
								<td width="30%" style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.purchaseorderdate" />
								</td>
								<td style="font-size: 14px;">
									<logic:present name="BlankValue">
										<html:text property="saleDate1"  size="20" value="" />
									</logic:present> 
									<logic:notPresent name="BlankValue">
										<html:text property="saleDate1"  size="20" />
									</logic:notPresent>
								</td>
								<td align="left">
									<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
									onclick="displayCalendar(document.PurchaseBoardForm.saleDate1,'mm-dd-yyyy',this);" />
								</td>
								<td align="left" style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.to" /> 
									<logic:present name="BlankValue">
										<html:text property="saleDate2" size="20" value="" />
									</logic:present> 
									<logic:notPresent name="BlankValue">
										<html:text property="saleDate2"  size="20" />
									</logic:notPresent>
								</td>
								<td align="left">
									<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
									onclick="displayCalendar(document.PurchaseBoardForm.saleDate2,'mm-dd-yyyy',this);">
								</td>
							</tr>
<!-- 				<tr> -->
<%-- 					<td width="30%"><bean:message key="BzComposer.sales.SaleDate" /></td> --%>
<%-- 					<td><logic:present name="BlankValue"> --%>
<%-- 						<html:text property="saleDate1"  size="25" value="" /> --%>
<%-- 					</logic:present> <logic:notPresent name="BlankValue"> --%>
<%-- 						<html:text property="saleDate1"  size="25" /> --%>
<%-- 					</logic:notPresent></td> --%>
<!-- 					<td align="left"><img -->
<%-- 						src='<bean:write name="path" property="pathvalue"/>/images/cal.gif' --%>
<!-- 						onclick="displayCalendar(document.PurchaseBoardForm.saleDate1,'mm-dd-yyyy',this);"></td> -->
<%-- 					<td align="left"><bean:message key="BzComposer.sales.to" /> <logic:present --%>
<!-- 						name="BlankValue"> -->
<%-- 						<html:text property="saleDate2" size="25" value="" /> --%>
<%-- 					</logic:present> <logic:notPresent name="BlankValue"> --%>
<%-- 						<html:text property="saleDate2" size="25" /> --%>
<%-- 					</logic:notPresent></td> --%>
<!-- 					<td align="left"><img -->
<%-- 						src='<bean:write name="path" property="pathvalue"/>/images/cal.gif' --%>
<!-- 						onclick="displayCalendar(document.PurchaseBoardForm.saleDate2,'mm-dd-yyyy',this);"> -->
<!-- 					</td> -->
<!-- 				</tr> -->

						</table>
					</td>
					<td width="27%" valign="top">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left" style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.sortoption" />
								</th>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									1St
								</td>
								<td style="font-size: 14px;">
									<html:select property="sortType1" styleId="sortType1">
										<option value="0"></option>
										<option value="<bean:message key="BzComposer.purchaseorderboard.sortbylastname" />">
											<bean:message key="BzComposer.purchaseorderboard.sortbylastname" />
										</option>
										<option value="<bean:message key="BzComposer.purchaseorderboard.sortbyzipcode" />">
											<bean:message key="BzComposer.purchaseorderboard.sortbyzipcode" />
										</option>
										<option value="<bean:message key="BzComposer.purchaseorderboard.sortbyproductname" />">
											<bean:message key="BzComposer.purchaseorderboard.sortbyproductname" />
										</option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td style="font-size: 14px;">2nd</td>
								<td style="font-size: 14px;">
									<html:select property="sortType2" styleId="sortType2">
										<option value="0"></option>
										<option value="<bean:message key="BzComposer.purchaseorderboard.sortbylastname"/>">
											<bean:message key="BzComposer.purchaseorderboard.sortbylastname"/>
										</option>
										<option value="<bean:message key="BzComposer.purchaseorderboard.sortbyzipcode" />">
											<bean:message key="BzComposer.purchaseorderboard.sortbyzipcode" />
										</option>
										<option value="<bean:message key="BzComposer.purchaseorderboard.sortbyproductname" />">
											<bean:message key="BzComposer.purchaseorderboard.sortbyproductname" />
										</option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="font-size: 14px;">
									<input type="submit" class="formbutton" name="findBtn" 
									value="<bean:message key='BzComposer.purchaseorderboard.showlist'/>" onclick="showList();">
								</td>
							</tr>
						</table>
					</td>
					<td width="25%" valign="top">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left" style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.search" />
								</th>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.column" />
								</td>
								<td style="font-size: 14px;">
									<select name="searchType" id="sType">
										<option value="1">
											<bean:message key="BzComposer.purchaseorderboard.name" />
										</option>
										<option value="2">
											<bean:message key="BzComposer.purchaseorderboard.order" />
										</option>
										<option value="3">
											<bean:message key="BzComposer.purchaseorderboard.orderid" />
										</option>
										<option value="4">
											<bean:message key="BzComposer.purchaseorderboard.address" />
										</option>
										<option value="5">
											<bean:message key="BzComposer.purchaseorderboard.productname" />
										</option>
										<option value="6">
											<bean:message key="BzComposer.purchaseorderboard.email" />
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									<bean:message key="BzComposer.purchaseorderboard.text" />
								</td>
								<td style="font-size: 14px;">
									<input type="text" name="searchTxt" id="SearchVal">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="font-size: 14px;">
									<input type="button" class="formbutton" name="findBtn" 
									value='<bean:message key="BzComposer.purchaseorderboard.search"/>' onclick="SaleSearch();">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		<div>
			<table align="center">
				<tr>
					<td align="center">
						<logic:notEmpty name="msg">
							<font color="red">
								<b><bean:write name="msg" /></b>
							</font>
						</logic:notEmpty>
					</td>
				</tr>
			</table>
			<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
			border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
				<bean:message key="BzComposer.purchaseorderboard.purchaseorderlist"/>
			</span>	
			<div>	
     			<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
      				<table id="puboardList" class="tabla-listados" cellpadding="0" cellspacing="0">
						<thead style="font-weight: bold;">
							<tr>
							<%--<th><bean:message key="BzComposer.sales.Market" /></th> --%>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.PONum"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.purchaseorderdate" />
								</th>
							<%--<th><bean:message key="BzComposer.sales.OrderID" /></th> --%>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.companyname" />
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.name" />
								</th>
							<th style="font-size:14px;"><bean:message key="BzComposer.purchaseorderboard.address" /></th>				<!-- uncommented on 03-10-2019 -->
							<%--<th><bean:message key="BzComposer.sales.Zipcode" /></th> --%>
							<%-- <th><bean:message key="BzComposer.sales.ProductName" /></th> --%>			
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.poamount" />
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.emailid" />
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.purchaseorderboard.isemailed" />
								</th>
							</tr>
						</thead>
						<tbody>
							<logic:present name="PurchaseBoardDetails" scope="request">
								<logic:notEmpty name="PurchaseBoardDetails" scope="request">
									<bean:size id="SalesListSize" name="PurchaseBoardDetails" />
									<input type="hidden" name="sListSize" id="lSize" value='<bean:write name="SalesListSize" />'>
									<logic:iterate name="PurchaseBoardDetails" id="objList" indexId="ndx">
										<tr id='<bean:write name="ndx" />$$' ondblclick="sendToPurchase()"
										onclick="setRowId(<bean:write name="objList" property="po_no" />,'<bean:write name="objList" property="email" />','<bean:write name="ndx" />$$');">
											<td align="left" style="font-size:14px;">
												<bean:message key="BzComposer.purchase.PONumPrefix" />
												<bean:write name="objList" property="po_no" />
											</td>
											<td align="left" style="font-size:14px;">
												<bean:write name="objList" property="dateAdded" />
											</td>
											<td style="font-size:14px;">
												<bean:write name="objList" property="companyName"/>
											</td>	
											<td align="left" style="font-size:14px;">
												<bean:write name="objList" property="lastName"/>,<bean:write name="objList" property="firstName"/>
											</td>
									<td align="left" style="font-size:14px;"><bean:write name="objList"
									property="address1" />,<bean:write name="objList"
									property="address2" /></td>								<!-- uncommented on 03-10-2019 -->

<%-- 							<td align="center"><bean:write name="objList" --%>
<!-- 								property="zipCode" /></td> -->
								<%-- <td align="left"><bean:write name="objList"
									property="itemName" /></td> --%>
											<td align="left" style="font-size:14px;">
												<bean:write name="objList" 	property="total" />							
											</td>
											<td align="left" style="font-size:14px;">
												<bean:write name="objList" property="email" />
											</td>
											<td align="left" style="font-size:14px;">
												<logic:equal name="objList" property="emailed" value="1">
													<input type="checkbox" value="ON" name="isEmailValCHK" id="isEmailId"
													title="isEmailed" checked="true" disabled="disabled"/>
												</logic:equal> 							
												<logic:equal name="objList" property="emailed" value="0">
													<input type="checkbox" value="ON" name="isEmailValCHK" id="isEmailId"
													title="isEmailed" disabled="disabled"/>
												</logic:equal>
											</td>
										</tr>
									</logic:iterate>
								</logic:notEmpty>
							</logic:present>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<table align="center">
			<tr align="center">
				<td style="font-size:14px;">
					<input type="button" class="formbutton" name="smailbtn" id="smail" value='<bean:message	key="BzComposer.purchaseorderboard.lookup" /> '
					disabled="disabled" title="Please select a record" onclick="sendToPurchase();"> 
					&nbsp;&nbsp;
					<input type="button" class="formbutton" disabled="disabled" id="modi" onclick="makeUpdateInList();" title="Modify shipped"
					name="modifyBtn" value='<bean:message key="BzComposer.global.update" />'> 
					<input type="hidden" name="ONum" id="ONumId"> 
					<input type="hidden" name="sEmail" id="sEmailID"> 
					<input type="hidden" name="rNum" id="rowONum"> 
					<input type="hidden" name="senderEmail" id="EID">
				</td>
			</tr>
		</table>
		<input type="hidden" id="ordId" name="OrderValue" value=""> 
		<input type="hidden" id="statusId" name="StatusValue" value=""> 
		<input type="hidden" id="ordSize" name="Size" value=""> 
		<!-- end Contents -->
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<input type="hidden" id="ord_value" />
		<input type="hidden" id="po_value" />
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
</html>
<script type="text/javascript">
function setIsEmail()
{

	document.getElementById("isEmailChk").value=document.getElementById("EmailId").value;
	document.forms[0].action = "Email.do?tabid=EOSOLO";
	document.forms[0].submit();
}
function checkName()
{
	if(document.RMAForm.fnameTxt.value=="" && document.RMAForm.lnameTxt.value=="")	
	{

		return showNameDialog();
	}
	else
	{
		document.forms[0].action = "RMA.do?tabid=R0S0C0" ;
		document.forms[0].submit();
	}	
}
function setRowId(rowId,email,rid)
{
	document.getElementById("po_value").value=rowId;
	//orderNo=document.getElementById("ord_value").value;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	typeVal=document.getElementById("SearchVal").value
	//for(i=0;i<size;i++){
	//var row1=document.getElementById(i+"$$");
	//row1.className = "";
	//}
	//var rd=document.getElementById(rid);
	//rd.className = "draft";
	rowValue= rid.replace('$$','');
	rowValue++;
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
	if(rowValue%2==0)
	{ 	
		document.getElementById((rowValue-1)+"$$").classList.remove('odd'); 		
	}
	var rd = document.getElementById(rid).classList.add('draft');
	document.getElementById("smail").disabled=false;
	document.getElementById("sEmailID").value=email;
	document.getElementById("rowONum").value=rowId;
}
setRowId(null, null, "0$$");
function sendToPurchase()
{
	debugger;
	po_no=document.getElementById("po_value").value;
	if(po_no == "")
	{

		return showpurchaseorderdialog();
	}
	else
	{
		document.forms['frmpoboard'].action = "PurchaseOrder.do?tabid=PBLU&po_no="+po_no;
		document.forms['frmpoboard'].submit();	
	}
}
var ordarr = new Array();
var statusarr = new Array();
var cnt=0;
var ord="";
var status="";

function makeUpdate(orderno,obj)
{
	var flag=0;
	document.getElementById("modi").disabled=false;
	val=obj.checked;
	for(j=0;j<=cnt;j++){
		if(orderno==ordarr[j]){
			flag=1;
			statusarr[j]=val;
		}
	}
	if(flag==0)
	{
		ordarr[cnt]=orderno;
		statusarr[cnt]=val;
		cnt++;
	}	
}
function makeUpdateInList()
{
	debugger;
	for(j=0;j<cnt;j++)
	{
		ord+=ordarr[j]+";";
		status+=statusarr[j]+";";
	}
	document.getElementById('ordSize').value=cnt;
	document.getElementById('ordId').value=ord;
	document.getElementById("statusId").value=status;
	/* response = window.confirm("Do you want to update record?");
	if(response)
	{
		document.getElementById("modi").disabled=false;
		document.forms[0].action = "PurchaseBoard.do?tabid=UpdateRecord";
		document.forms[0].submit();
	} */
	event.preventDefault();
	$("#updateRecord").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	                $(this).dialog("close");
	            	document.getElementById("modi").disabled=false;
	        		document.forms[0].action = "PurchaseBoard.do?tabid=UpdateRecord";
	        		document.forms[0].submit();
					$('form').submit();
	            },
	            <bean:message key='BzComposer.global.cancel'/>: function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}

function SaleSearch()
{
	debugger;
	Myid="";
	count=0;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	typeVal=document.getElementById("SearchVal").value;
	
	if(typeVal == "")
	{

		return showErrorTextDialog();
		event.preventDefault();
	}
	else
	{
		debugger;
		for(i=0;i<size;i++)
		{
			var row1=document.getElementById(i+"$$");
			row1.className = "";
		}
		debugger;
		for(i=0;i<size;i++)
		{
			var row1=document.getElementById(i+"$$");
			row1.className = "";
			var cells=row1.getElementsByTagName("td");
			var data1=cells[1].innerHTML;	//value in first td
			
			var data2=cells[2].innerHTML;	//value in second td
			var data3=cells[3].innerHTML;	//value in third td
			var data4=cells[4].innerHTML;	//value in forth td
			var data5=cells[5].innerHTML;	//value in fifth td
			var data6=cells[6].innerHTML;	//value in sixth td
			//var data7=cells[7].innerHTML;	//value in seventh td
		
			data1=data1.toLowerCase();
			data2=data2.toLowerCase();
			data3=data3.toLowerCase();
			data4=data4.toLowerCase();
			data5=data5.toLowerCase();	
			data6=data6.toLowerCase();
			//data7=data7.toLowerCase();					
		
			typeVal=typeVal.toLowerCase();	
							
			if(type=="1" && data3.match(typeVal))
			{
				row1.className = "draft"; 
				break;
			}
			else if(type=="2" && data1.match(typeVal))
			{
				row1.className = "draft"; 
				break;
			}
			else if(type=="3" && data2.match(typeVal))
			{
				row1.className = "draft"; 
				break;
			}
			else if(type=="4" && data4.match(typeVal))
			{
				row1.className = "draft"; 
				break;
			}
			else if(type=="5" && data6.match(typeVal))
			{
				row1.className = "draft"; 
				break;
			}
			else if(type=="6" && data7.match(typeVal))
			{ 
				row1.className = "draft";
				break;
			}
		}
	}
}
function showList()
{
	debugger;
	var sortType1 = document.getElementById("sortType1").value;
	var sortType2 = document.getElementById("sortType2").value;
	if(sortType1 == 0 || sortType2 == 0){
		return showSortTypeDialog();
		
	}else {
		document.forms['frmpoboard'].action = "PurchaseBoard.do?tabid=ShowList";
		document.forms['frmpoboard'].submit();
		
	}
}
/* debugger;
var sortType1 = document.getElementById("sortType1").value;
var sortType2 = document.getElementById("sortType2").value;

if(sortType1 == 0 || sortType2 == 0)
{

	
}
else
{

	event.preventDefault();
} */
</script>
<!-- Dialog box used in this page. -->
<div id="showNameDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorderboard.enterfirstorlastname"/></p>
</div>
<div id="updateRecord" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorderboard.updaterecordmessage"/></p>
</div>
<div id="showErrorTextDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorderboard.entertexttosearch"/></p>
</div>
<div id="showSortTypeDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorderboard.selectsorttype"/></p>
</div>
<div id="showpurchaseorderdialog" style="display:none;">
	<p><bean:message key="BzComposer.common.selectpurchaseorderfirst"/></p>
</div>