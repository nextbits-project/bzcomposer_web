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
<title>
	<bean:message key="BzComposer.salesorderboardtitle"/>
</title>
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
function updateSalesOrderBoardDialog() {
	debugger;
    $("#updateSalesOrderBoardDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                document.getElementById("modi").disabled=false;
        		document.forms['SalesBoardForm'].action = "SalesOrderBoard.do?tabid=UpdateRecord";
        		document.forms['SalesBoardForm'].submit();
            },
            <bean:message key='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}
function showFirstNameLastNameDialog() {
	debugger;
    $("#showFirstNameLastNameDialog").dialog({
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
</script>
</head>
<body>
<!-- begin shared/header -->
<html:form styleId="SalesBoardForm" action="SalesOrderBoard.do?tabid=ShowList" method="post">
	<div id="">
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
		<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.salesorderboard.salesorderboard" />
		</span>
	</div>
	<div>
	<div id="table-negotiations">
	<table cellspacing="0" align="center" class="section-border" style="width: 100%;">
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr align="center">
			<td align="left">
				<logic:present name="IsUpdated">
					<strong><span class="msgstyle"> 
						<bean:write name="IsUpdated" /></span></strong>
				</logic:present>
			</td>
		</tr>
		<tr>
			<td align="left" width="46%" valign="top">
				<table class="table-notifications" width="100%">
					<tr>
						<th colspan="5" align="left" style="font-size:14px;">
							<bean:message key="BzComposer.salesorderboard.filteroption" />
						</th>
					</tr>
					<tr>
						<td width="30%" style="font-size:14px;">
							<bean:message key="BzComposer.salesorderboard.marketplace" />
						</td>
						<td width="70%" colspan="4" style="font-size:14px;">
							<html:select property="filterMarket">
								<logic:present name="Market"  >
									<logic:equal name="Market" value="1">
										<option value="1" selected="selected">
											<bean:message key="BzComposer.salesorderboard.ebay" />
										</option>
									</logic:equal>
									<logic:notEqual name="Market" value="1">
										<option value="1">
											<bean:message key="BzComposer.salesorderboard.ebay" />
										</option>
									</logic:notEqual>
									<logic:equal name="Market" value="2">
										<option value="2" selected="selected">
											<bean:message key="BzComposer.salesorderboard.amazonseller" />
										</option>
									</logic:equal>
									<logic:notEqual name="Market" value="2">
										<option value="2">
											<bean:message key="BzComposer.salesorderboard.amazonseller" />
										</option>
									</logic:notEqual>
									<logic:equal name="Market" value="3">
										<option value="3" selected="selected">
											<bean:message key="BzComposer.salesorderboard.amazonmarket" />
										</option>
									</logic:equal>
									<logic:notEqual name="Market" value="3">
										<option value="3">
											<bean:message key="BzComposer.salesorderboard.amazonmarket" />
										</option>
									</logic:notEqual>
									<logic:equal name="Market" value="4">
										<option value="4" selected="selected">
											<bean:message key="BzComposer.salesorderboard.halfcom" />
										</option>
									</logic:equal>
									<logic:notEqual name="Market" value="4">
										<option value="4">
											<bean:message key="BzComposer.salesorderboard.halfcom" />
										</option>
									</logic:notEqual>
									<logic:equal name="Market" value="5">
										<option value="5" selected="selected">
											<bean:message key="BzComposer.salesorderboard.pricegrabber" />
										</option>
									</logic:equal>
									<logic:notEqual name="Market" value="5">
										<option value="5">
											<bean:message key="BzComposer.salesorderboard.pricegrabber" />
										</option>
									</logic:notEqual>
								</logic:present>
								
								<logic:notPresent name="Market">
									<option value="1">
										<bean:message key="BzComposer.salesorderboard.ebay" />
									</option>
									<option value="2">
										<bean:message key="BzComposer.salesorderboard.amazonseller" />
									</option>
									<option value="3">
										<bean:message key="BzComposer.salesorderboard.amazonmarket" />
									</option>
									<option value="4">
										<bean:message key="BzComposer.salesorderboard.halfcom" />
									</option>
									<option value="5">
										<bean:message key="BzComposer.salesorderboard.pricegrabber" />
									</option>
								</logic:notPresent>
							</html:select>
						</td>
					</tr>
					<tr>
						<td width="30%">
							<bean:message key="BzComposer.salesorderboard.orderdate" />
						</td>
						<td>
							<logic:present name="BlankValue">
								<html:text property="orderDate1"  size="25" value="" />
							</logic:present> 
							<logic:notPresent name="BlankValue">
								<html:text property="orderDate1"  size="25" />
							</logic:notPresent>
						</td>
						<td align="left">
							<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
							onclick="displayCalendar(document.salesboardForm.orderDate1,'mm-dd-yyyy',this);" />
						</td>
						<td align="left">
							<bean:message key="BzComposer.salesorderboard.to" /> 
							<logic:present name="BlankValue">
								<html:text property="orderDate2"  size="25" value="" />
							</logic:present> 
							<logic:notPresent name="BlankValue">
								<html:text property="orderDate2"  size="25" />
							</logic:notPresent>
						</td>
						<td align="left">
							<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
							onclick="displayCalendar(document.salesboardForm.orderDate2,'mm-dd-yyyy',this);">
						</td>
					</tr>
					<tr>
						<td width="30%">
							<bean:message key="BzComposer.salesorderboard.saledate" />
						</td>
						<td>
							<logic:present name="BlankValue">
								<html:text property="saleDate1"  size="25" value="" />
							</logic:present> 
							<logic:notPresent name="BlankValue">
								<html:text property="saleDate1" size="25" />
							</logic:notPresent>
						</td>
						<td align="left">
							<img src='<bean:write name="path" property="pathvalue"/>/images/cal.gif'
							onclick="displayCalendar(document.salesboardForm.saleDate1,'mm-dd-yyyy',this);">
						</td>
						<td align="left">
							<bean:message key="BzComposer.salesorderboard.to" /> 
							<logic:present name="BlankValue">
								<html:text property="saleDate2" size="25" value="" />
							</logic:present> 
							<logic:notPresent name="BlankValue">
								<html:text property="saleDate2" size="25" />
							</logic:notPresent>
						</td>
						<td align="left">
							<img src='<bean:write name="path" property="pathvalue"/>/images/cal.gif'
							onclick="displayCalendar(document.salesboardForm.saleDate2,'mm-dd-yyyy',this);">
						</td>
					</tr>
				</table>
			</td>
			<td width="27%" valign="top">
				<table class="table-notifications" width="100%">
					<tr>
						<th colspan="2" align="left" style="font-size:14px;">
							<bean:message key="BzComposer.salesorderboard.sortoption" />
						</th>
					</tr>
					<tr>
						<td style="font-size:14px;">1St</td>
						<td style="font-size:14px;">
							<html:select property="sortType1">
								<option value="0"></option>
								<option value="1">
									<bean:message key="BzComposer.salesorderboard.sortbylastname" />
								</option>
								<option value="2">
									<bean:message key="BzComposer.salesorderboard.sortbyzipcode" />
								</option>
								<option value="3">
									<bean:message key="BzComposer.salesorderboard.sortbyproductname" />
								</option>
							</html:select>
						</td>
					</tr>
					<tr>
						<td style="font-size:14px;">2nd</td>
						<td style="font-size:14px;">
							<html:select property="sortType2">
								<option value="0"></option>
								<option value="1">
									<bean:message key="BzComposer.salesorderboard.sortbylastname" />
								</option>
								<option value="2">
									<bean:message key="BzComposer.salesorderboard.sortbyzipcode" />
								</option>
								<option value="3">
									<bean:message key="BzComposer.salesorderboard.sortbyproductname" />
								</option>
							</html:select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="formbutton" name="findBtn" value="<bean:message key='BzComposer.salesorderboard.showlist'/>">
						</td>
					</tr>
			</table>

			</td>

			<td width="25%" valign="top">
				<table class="table-notifications" width="100%">
					<tr>
						<th colspan="2" align="left" style="font-size:14px;">
							<bean:message key="BzComposer.salesorderboard.search" />
						</th>
					</tr>
					<tr>
						<td style="font-size:14px;">
							<bean:message key="BzComposer.salesorderboard.column" />
						</td>
						<td style="font-size:14px;">
							<select name="searchType" id="sType">
								<option value="1">
									<bean:message key="BzComposer.salesorderboard.name" />
								</option>
								<option value="2">
									<bean:message key="BzComposer.salesorderboard.order" />
								</option>
								<option value="3">
									<bean:message key="BzComposer.salesorderboard.orderid" />
								</option>
								<option value="4">
									<bean:message key="BzComposer.salesorderboard.address" />
								</option>
								<option value="5">
									<bean:message key="BzComposer.salesorderboard.productname" />
								</option>
								<option value="6">
									<bean:message key="BzComposer.salesorderboard.email" />
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="font-size:14px;">
							<bean:message key="BzComposer.salesorderboard.text" />
						</td>
						<td style="font-size:14px;">
							<input type="text" name="searchTxt" id="SearchVal">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" class="formbutton" name="findBtn" value="<bean:message key='BzComposer.salesorderboard.search'/>" onclick="SaleSearch();">
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
						<font color="red"><b><bean:write name="msg" /></b></font>
					</logic:notEmpty>
				</td>
			</tr>
		</table>
		<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.salesorderboard.salesorderlist" />
		</span>
		<div>
   			<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
      			<table  id="salesboardList" class="tabla-listados" cellpadding="0" cellspacing="0">
					<thead style="font-weight: bold;">
						<tr>
							<%--<th><bean:message key="BzComposer.sales.Market" /></th> --%>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.salesordernumber" /></th>
							<%--<th><bean:message key="BzComposer.sales.OrderID" /></th> --%>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.companyname" /></th>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.name" /></th>
							<%--<th><bean:message key="BzComposer.sales.Address" /></th> --%>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.sortbyzipcode" /></th>
							<%--<th><bean:message key="BzComposer.sales.ProductName" /></th> --%>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.emailid" /></th>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.orderdate" /></th>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.saledate" /></th>
							<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.printed" /></th>
							<%--<th><bean:message key="BzComposer.sales.Shipped" /></th> --%>
			    			<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.isinvoice" /></th>
			    			<th style="font-size:14px;"><bean:message key="BzComposer.salesorderboard.isemailed" /></th>
						</tr>
					</thead>
					<tbody>
						<logic:present name="SalesOrderBoardDetails" scope="request">
							<logic:notEmpty name="SalesOrderBoardDetails" scope="request">
								<bean:size id="SalesListSize" name="SalesOrderBoardDetails" />
								<input type="hidden" name="sListSize" id="lSize" value='<bean:write name="SalesListSize" />'>
								<logic:iterate name="SalesOrderBoardDetails" id="objList" indexId="ndx">
									<tr id='<bean:write name="ndx" />$$'  ondblclick="sendToOrder()"
									onclick="setRowId(<bean:write name="objList" property="so_no" />,'<bean:write name="objList" property="email" />','<bean:write name="ndx" />$$');">
									<%--<td align="center"><bean:write name="objList" --%>
									<!--property="marketPlaceName" /></td> -->
										<td style="font-size:14px;">
											<bean:write name="objList" property="so_no" />
										</td>
										<td style="font-size:14px;">
											<bean:write name="objList" property="companyName" />
										</td>	
									<%--<td align="center"><bean:write name="objList" --%>
									<!--property="orderid" /></td> -->
										<td style="font-size:14px;">
											<bean:write name="objList" property="lastName" />,<bean:write name="objList" property="firstName" />
										</td>
									<%--<td align="center"><bean:write name="objList" --%>
									<%--property="address1" />,<bean:write name="objList" --%>
									<!--property="address2" /></td> -->
										<td style="font-size:14px;">
											<bean:write name="objList" property="zipCode" />
										</td>
									<%--<td align="center"><bean:write name="objList" --%>
									<!--property="itemName" /></td> -->
										<td style="font-size:14px;">
											<bean:write name="objList" property="email" />
										</td>
										<td style="font-size:14px;">
											<bean:write name="objList" property="saleDate" />
										</td>
										<td style="font-size:14px;">
											<bean:write name="objList" property="dateAdded" />
										</td>
										<td style="font-size:14px;">
											<logic:equal name="objList" property="printed" value="true">
												<input type="checkbox" name="isPrintedCHK" id="isPrintedId" title="isPrinted" checked="true" disabled="disabled">
											</logic:equal> 
											<logic:equal name="objList" property="printed" value="false">
												<input type="checkbox" name="isPrintedCHK" id="isPrintedId" title="isPrinted" disabled="disabled">
											</logic:equal>
										</td>
										<td>
											<logic:equal name="objList" property="isInvoice" value="1">
												<input type="checkbox"   disabled="disabled" name="isInvoice<bean:write name="ndx" />"
												id="isInvoiceId" title="isInvoice" checked="true" value="ON"
												onclick="makeUpdate(<bean:write name="objList" property="orderNum" />,this);">
											</logic:equal> 
											<logic:equal name="objList" property="isInvoice" value="0">
												<input type="checkbox" name="isInvoice<bean:write name="ndx" />"
												id="isInvoiceId" title="isInvoice" value="ON"  disabled="disabled"
												onclick="makeUpdate(<bean:write name="objList" property="orderNum" />,this);">
											</logic:equal>
										</td>
									<%--<td align="center"><logic:equal name="objList" --%>
									<!--property="isInvoice" value="1"> -->
									<%--<input type="checkbox" name="isInvoice<bean:write name="ndx" />" --%>
									<!--id="isInvoiceId" title="isInvoice" checked="true" value="ON" -->
									<%--onclick="makeUpdate(<bean:write name="objList" property="orderNum" />,this);"> --%>
									<%--</logic:equal> <logic:equal name="objList" property="shipped" value="0"> --%>
									<%--<input type="checkbox" name="isInvoice<bean:write name="ndx" />" --%>
									<!--id="isInvoiceId" title="isInvoice" value="ON" -->
									<%--onclick="makeUpdate(<bean:write name="objList" property="orderNum" />,this);"> --%>
									<%--</logic:equal></td> --%>
										<td style="font-size:14px;">
											<logic:equal name="objList" property="emailed" value="1">
												<input type="checkbox" value="ON" name="isEmailValCHK" id="isEmailId"
												title="isEmailed" checked="true" disabled="disabled"/>
											</logic:equal> 							
											<logic:equal name="objList" property="emailed" value="0">
												<input type="checkbox" value="ON" name="isEmailValCHK" id="isEmailId" title="isEmailed" disabled="disabled"/>
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
			<td>
				<input type="button" class="formbutton" name="smailbtn" id="smail" value='<bean:message	key="BzComposer.salesorderboard.lookup" /> '
				disabled="disabled" title="Please select a record"
				onclick="sendToOrder();"> 
				&nbsp;&nbsp;
				<%-- <input type="button" class="formbutton" id="modi" onclick="makeUpdateInList();" title="Modify shipped"
				name="modifyBtn" value='<bean:message key="BzComposer.global.update" />'>  --%>
				<%-- <input type="button" class="formbutton" disabled="disabled" id="modi" onclick="makeUpdateInList();" title="Modify shipped"
				name="modifyBtn" value='<bean:message key="BzComposer.sales.Update" />'>  --%>
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
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
</html>

<script type="text/javascript">
function setIsEmail(){
	//alert("DFSD");
	document.getElementById("isEmailChk").value=document.getElementById("EmailId").value;
	document.forms[0].action = "Email.do?tabid=EOSOLO";
	document.forms[0].submit();
}
function checkName(){
	if(document.RMAForm.fnameTxt.value=="" && document.RMAForm.lnameTxt.value=="")	{
		//alert("You have to type one of fields in fst name and last name");
		return showFirstNameLastNameDialog();
	}
	else{
		document.forms[0].action = "RMA.do?tabid=R0S0C0" ;
		document.forms[0].submit();
	}	
}

function setRowId(rowId,email,rid){
	document.getElementById("ord_value").value=rowId;
	
	//orderNo=document.getElementById("ord_value").value;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	typeVal=document.getElementById("SearchVal").value
// 	for(i=0;i<size;i++){
// 		var row1=document.getElementById(i+"$$");
// 		row1.className = "";
// 	}
// 	var rd=document.getElementById(rid);
// 	rd.className = "draft";
    rowValue= rid.replace("$$","");
	for(i=0;i<size;i++){
		 document.getElementById(i+"$$").classList.remove('draft');		
		 if(i%2==0){
			 if(size !=(i+1)){
			    document.getElementById((i+1)+"$$").classList.add('odd');
			 }
		 }
	}
	if(rowValue%2 !=0){ ;
		document.getElementById(rowValue+"$$").classList.remove('odd'); 		
	}
	var rd = document.getElementById(rid).classList.add('draft');
	
	document.getElementById("smail").disabled=false;
	document.getElementById("sEmailID").value=email;
	document.getElementById("rowONum").value=rowId;
}

setRowId(null, null, "0$$");

function sendToOrder(){

	order_no=document.getElementById("ord_value").value;
	/* document.forms[0].action = "SalesOrder.do?tabid=SOBLU&order_no="+order_no;
	document.forms[0].submit(); */
	window.location = "SalesOrder.do?tabid=SOBLU&order_no="+order_no;
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
	if(flag==0){
		ordarr[cnt]=orderno;
		statusarr[cnt]=val;
		cnt++;
	}
	
}

function makeUpdateInList()
{
	for(j=0;j<cnt;j++){
		ord+=ordarr[j]+";";
		status+=statusarr[j]+";";
	}
	document.getElementById('ordSize').value=cnt;
	document.getElementById('ordId').value=ord;
	document.getElementById("statusId").value=status;
	debugger;
	return updateSalesOrderBoardDialog();
	/* response = window.confirm("Do you want to update record?");
	if(response){
		document.getElementById("modi").disabled=false;
		document.forms[0].action = "SalesOrderBoard.do?tabid=UpdateRecord";
		document.forms[0].submit();
	} */
}

function SaleSearch(){
	debugger
	Myid="";
	count=0;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	debugger
	typeVal=document.getElementById("SearchVal").value;
	debugger
	for(i=0;i<size;i++){
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	for(i=0;i<size;i++){
		var row1=document.getElementById(i+"$$");
		row1.className = "";
		var cells=row1.getElementsByTagName("td");
		var data1=cells[1].innerHTML;//value in first td
		
		var data2=cells[2].innerHTML;//value in second td
		var data3=cells[3].innerHTML;//value in third td
		var data4=cells[4].innerHTML;//value in forth td
		var data5=cells[5].innerHTML;//value in fifth td
		var data6=cells[6].innerHTML;//value in sixth td
		var data7=cells[7].innerHTML;//value in seventh td
	
		data1=data1.toLowerCase();
		data2=data2.toLowerCase();
		data3=data3.toLowerCase();
		data4=data4.toLowerCase();
		data5=data5.toLowerCase();	
		data6=data6.toLowerCase();
		data7=data7.toLowerCase();					
	
		typeVal=typeVal.toLowerCase();	
						
		if(type=="1" && data3.match(typeVal))
			{row1.className = "draft"; break;}
		else if(type=="2" && data1.match(typeVal))
			{row1.className = "draft"; break;}
		else if(type=="3" && data2.match(typeVal))
			{ row1.className = "draft"; break;}
		else if(type=="4" && data4.match(typeVal))
			{ row1.className = "draft"; break;}
		else if(type=="5" && data6.match(typeVal))
			{ row1.className = "draft"; break;}
		else if(type=="6" && data7.match(typeVal))
			{ row1.className = "draft"; break;}
	}
}
</script>
<!-- Dialog box used in estimation board page -->
<div id="updateSalesOrderBoardDialog" style="display:none;">
	<p><bean:message key="BzComposer.salesorderboard.updaterecordmessage"/></p>
</div>
<div id="showFirstNameLastNameDialog" style="display:none;">
	<p><bean:message key="BzComposer.salesorderboard.enterfirstorlastnamemessage"/></p>
</div>