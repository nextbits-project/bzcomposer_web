
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message key="BizComposer.Email.Title" /></title>
</head>
<body>



<!-- begin shared/header -->
<html:form action="Email.do?tabid=ShowList" method="post">
	<div id="header">
	<div id="header-content">
	<ul id="ulnav">
		<li><a
			href="<bean:write name="path" scope="session" property="pathvalue"/>/Sales.do?tabid=SalesBoard"
			title="Sales" rel="section"><bean:message key="BzComposer.Sales" /></a></li>
		<li><a
			href="<bean:write name="path" property="pathvalue"/>/PurchaseOrder.do?tabid=PurchaseOrder"
			title="Purchase" rel="section"><bean:message
			key="BzComposer.Purchase" /></a></li>
		<li><a href="employee.do" title="Employee" rel="section"><bean:message
			key="BzComposer.Employee" /></a></li>
		<li><a
			href="<bean:write name="path" property="pathvalue"/>/#"
			title="Accounting" rel="section"><bean:message
			key="BzComposer.Accounting" /></a></li>
		<li><a
			href="<bean:write name="path" property="pathvalue"/>/RMA.do?tabid=R0M0A0"
			title="RMA" rel="section"><bean:message key="BzComposer.RMA" /></a></li>
		<li><a
			href="<bean:write name="path" property="pathvalue"/>/#"
			title="Email" rel="section" class="selected"><bean:message
			key="BzComposer.Email" /></a></li>
		<li><a
			href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config"
			title="Confuguration" rel="section"><bean:message
			key="BzComposer.Confuguration" /></a></li>
	</ul>

	<div class="clear"></div>

	</div>


	</div>

	<div id="ddcolortabsline">&nbsp;</div>

	<div id="pointermenu"></div>

	<div id="breadcrumb">

	<div class="clear"></div>

	</div>

	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> <span id="waitMessage"> <img
		src='<bean:write name="path" property="pathvalue"/>/images/spinner.gif'>
	Loading Contents...</span>

	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span></div>
	<div>
	<div id="table-negotiations">
	<table cellspacing="0">
		
		<tr>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<strong><bean:message
				key="BzComposer.Email.FilterOption" /></strong>
		
			<table class="tabla-listados" cellspacing="0" border="0">
				<thead>
				<tr>
					<th colspan="3"><bean:message
							key="BzComposer.Email.FilterOption" />
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><bean:message key="BzComposer.Email.OrderDate" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="orderDate1"
						readonly="true" /> <img
						src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.EmailForm.orderDate1,'mm-dd-yyyy',this);">
						&nbsp;
						<bean:message key="BzComposer.Email.To" />
						&nbsp;				
						<html:text property="orderDate2" readonly="true" /> <img
						src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.EmailForm.orderDate2,'mm-dd-yyyy',this);">
					</td>
				</tr>

				<tr>
					<td><bean:message key="BzComposer.Email.SaleDate" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="saleDate1"
						readonly="true" /> <img
						src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.EmailForm.saleDate1,'mm-dd-yyyy',this);">
						&nbsp;
						<bean:message key="BzComposer.Email.To" />
						&nbsp;
						<html:text property="saleDate2" readonly="true" /> <img
						src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.EmailForm.saleDate2,'mm-dd-yyyy',this);">

					</td>
				</tr>
				</tbody>
			</table>
			<table class="tabla-listados" cellspacing="0" border="0">
				<tbody>
				<tr>
					<td><logic:present name="isEmailChecked">
						<logic:equal name="isEmailChecked" value="1">
							<input type="checkbox" name="isEmailVal" value="on"
								checked="true" id="EmailId" title="Show only emails NOT sent" />
							<bean:message key="BizComposer.Email.EmailNotSent" />
						</logic:equal>
						<logic:equal name="isEmailChecked" value="0">
							<input type="checkbox" name="isEmailVal" value="on" id="EmailId"
								title="Show only emails NOT sent" />
							<bean:message key="BizComposer.Email.EmailNotSent" />
						</logic:equal>
					</logic:present> <logic:notPresent name="isEmailChecked">
						<input type="checkbox" name="isEmailVal" value="on" id="EmailId"
							title="Show only emails NOT sent" />
						<bean:message key="BizComposer.Email.EmailNotSent" />
					</logic:notPresent> <input type="hidden" name="chkVal"
						id="isEmailChk" value="false"></td>

				</tr>
				</tbody>
			</table>
			
			</td>
			<td>
				
			<table class="tabla-listados" cellspacing="0" border="0">
				
				<thead>
				<tr>
					<th colspan="2">
						<bean:message key="BzComposer.Email.Search" />					
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><bean:message key="BzComposer.Email.Column" /></td>
					<td><select name="SearchType" id="sType">
						<option value="1"><bean:message key="BzComposer.Email.Name" /></option>
						<option value="2"><bean:message key="BzComposer.Email.Order" /></option>
						<option value="3"><bean:message key="BzComposer.Email.OrderID" /></option>
						<option value="4"><bean:message key="BzComposer.Email.Address" /></option>
						<option value="5"><bean:message key="BzComposer.Email.ProductName" /></option>
						<option value="6"><bean:message key="BzComposer.Email.Email" /></option>
					</select></td>
				</tr>
				<tr>
					<td><bean:message key="BzComposer.Email.Text" /></td>
					<td><input type="text" name="searchTxt" id="SearchVal"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" name="findBtn"
						value="<bean:message key="BzComposer.Email.Search" />"
						class="formbutton" onclick="EmailSearch();"></td>
				</tr>
				</tbody>
			</table>
			</td>
			<td>
			<table>
				<tr>
					<td><input type="submit" onclick="setIsEmail();" class="formbutton"
						name="findBtn"
						value="<bean:message key="BzComposer.Email.ShowList" />" /></td>
				</tr>
				<tr>
					<td><input type="button" class="formbutton"
						onclick="showBulkMailer();" name="mailer"
						value="<bean:message key="BzComposer.Email.AmazonMailer" />" /></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>

	<div>
	<table align="center">
		<tr>
			<td align="center"><logic:notEmpty name="msg">
				<font color="red"><b><bean:write name="msg" /></b></font>
			</logic:notEmpty></td>
		</tr>
	</table>
	<strong><bean:message key="BzComposer.Email.SalesList" /></strong>
	<div id="table-negotiations" style="overflow:auto;height:250;width:800">
	<table class="tabla-listados" cellspacing="0">

		<thead>
			<tr>
				<th><bean:message key="BzComposer.Email.Market" /></th>
				<th><bean:message key="BzComposer.Email.Order" /></th>
				<th><bean:message key="BzComposer.Email.OrderID" /></th>
				<th><bean:message key="BzComposer.Email.Name" /></th>
				<th><bean:message key="BzComposer.Email.Address" /></th>
				<th><bean:message key="BzComposer.Email.Zipcode" /></th>
				<th><bean:message key="BzComposer.Email.ProductName" /></th>
				<th><bean:message key="BzComposer.Email.EmailID" /></th>
				<th><bean:message key="BzComposer.Email.OrderDate" /></th>
				<th><bean:message key="BzComposer.Email.SaleDate" />&nbsp;&nbsp;</th>
				<th><bean:message key="BzComposer.Email.Printed" /></th>
				<th><bean:message key="BzComposer.Email.Shipped" /></th>
				<th><bean:message key="BzComposer.Email.Email" /></th>

			</tr>
		</thead>
		<tbody>
			<logic:present name="EmailDetails" scope="request">
				<logic:notEmpty name="EmailDetails" scope="request">
					<bean:size id="MailListSize" name="EmailDetails" />
					<input type="hidden" name="mListSize" id="lSize"
						value='<bean:write name="MailListSize" />'>
					<logic:iterate name="EmailDetails" id="objList" scope="request"
						indexId="ndx">
						<tr id='<bean:write name="ndx" />$$'
							onclick="setRowId(<bean:write name="objList" property="orderNum" />,'<bean:write name="objList" property="email" />','<bean:write name="ndx" />$$');">
							<td>&nbsp;</td>
							<td align="center"><bean:write name="objList" property="orderNum" /></td>
							<td align="center"><bean:write name="objList" property="orderid" />
							</td>
							<td align="center"><bean:write name="objList" property="lastName" />,<bean:write
								name="objList" property="firstName" /></td>
							<td align="center"><bean:write name="objList" property="address1" />,<bean:write
								name="objList" property="address2" /></td>

							<td align="center"><bean:write name="objList" property="zipCode" /></td>
							<td align="center"><bean:write name="objList"
								property="inventoryName" /></td>
							<td align="center"><bean:write name="objList" property="email" />
							</td>
							<td nowrap="nowrap" align="center"><bean:write name="objList"
								property="dateConfirmed" /></td>

							<td nowrap="nowrap" align="center"><bean:write name="objList"
								property="dateAdded" /></td>
							<td align="center"><logic:equal name="objList"
								property="isPrinted" value="1">
								<input type="checkbox" name="isPrintedCHK" id="isPrintedId"
									title="isPrinted" checked="true" disabled="disabled">
							</logic:equal> <logic:notEqual name="objList"
								property="isPrinted" value="1">
								<input type="checkbox" name="isPrintedCHK" id="isPrintedId"
									title="isPrinted" disabled="disabled">
							</logic:notEqual></td>
							<td align="center"><logic:equal name="objList" property="shipped"
								value="1">
								<input type="checkbox" name="shipped<bean:write name="ndx" />"
									id="shippedId" title="shipped" checked="true" value="ON"
									onclick="makeUpdate(<bean:write name="objList" property="orderNum" />,this);">
							</logic:equal> <logic:equal name="objList" property="shipped"
								value="0">
								<input type="checkbox" name="shipped<bean:write name="ndx" />"
									id="shippedId" title="shipped" value="ON"
									onclick="makeUpdate(<bean:write name="objList" property="orderNum" />,this);">
							</logic:equal></td>

							<td align="center"><logic:equal name="objList"
								property="isEmailed" value="1">
								<input type="checkbox" name="isEmailValCHK" id="isEmailId"
									title="isEmailed" checked="true" disabled="disabled">
							</logic:equal> <logic:notEqual name="objList"
								property="isEmailed" value="1">
								<input type="checkbox" name="isEmailValCHK" id="isEmailId"
									title="isEmailed" disabled="disabled">
							</logic:notEqual></td>

						</tr>
					</logic:iterate>
				</logic:notEmpty>
			</logic:present>
		</tbody>
	</table>
	</div>
	</div>
	<table align="center">

		<tr>
			<td><input type="button" name="smailbtn" id="smail"
				value="<bean:message key="BzComposer.Email.SendMail"/>"
				disabled="disabled" title="Please select a record"
				class="formbutton" onclick="sendEmail();" /> &nbsp;&nbsp;<input
				type="button" class="formbutton" disabled="disabled" id="modi"
				onclick="makeUpdateInList();" title="Modify shipped"
				name="modifyBtn"
				value="<bean:message key="BzComposer.Email.Modify" />" /> <input
				type="hidden" name="ONum" id="ONumId"> <input type="hidden"
				name="sEmail" id="sEmailID"> <input type="hidden" name="rNum"
				id="rowONum"> <input type="hidden" name="senderEmail" id="EID"></td>
		</tr>
	</table>
	<input type="hidden" id="ordId" name="OrderValue" value=""> <input
		type="hidden" id="statusId" name="StatusValue" value=""> <input
		type="hidden" id="ordSize" name="Size" value=""> <!-- end Contents --></div>
	</div>
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
var orderno=0;
function setIsEmail(){
document.getElementById("isEmailChk").value=document.getElementById("EmailId").value;
document.forms[0].action = "Email.do?tabid=ShowList";
document.forms[0].submit();

}

function setRowId(rowid,email,rid)
{
orderno=rowid;
size=document.getElementById("lSize").value;
type=document.getElementById("sType").value;
typeVal=document.getElementById("SearchVal").value

for(i=0;i<size;i++){
var row1=document.getElementById(i+"$$");
row1.className = "";
}
var rd=document.getElementById(rid);
rd.className = "draft";
document.getElementById("smail").disabled=false;
document.getElementById("sEmailID").value=email;
document.getElementById("rowONum").value=rowid;
}

function sendEmail(){
	document.getElementById("ONumId").value=orderno;
	document.getElementById("EID").value=document.getElementById("sEmailID").value;
	document.forms[0].action = "Email.do?tabid=SendMail";
	document.forms[0].submit();
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
document.getElementById("modi").disabled=false;
document.forms[0].action = "Email.do?tabid=modify";
document.forms[0].submit();
}

function EmailSearch()
{
	Myid="";
	count=0;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	typeVal=document.getElementById("SearchVal").value;

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
function showBulkMailer(){
	window.open("Email.do?tabid=ShowBulkMailer",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
}
</script>
