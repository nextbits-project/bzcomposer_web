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
<script>
window.onload = initShowHideDivs;
</script>
<title>
	<bean:message key="BzComposer.creatermatitle" />
</title>
<script type="text/javascript">
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var oo = null;
var r = null;
var flag1=false;
var flag2=false;
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
function oGET(oo, url) {
  try {
    oo.open("GET", url, true);	
    oo.send(null);
  } catch (ex) {
  }
}

function writeSelect()
{
  
   if (o.readyState != 4 || o.status != 200)
    { 
       
      return;
    }
    document.getElementById("list").innerHTML = '&nbsp;&nbsp;&nbsp;'+trim(o.responseText) ;
     
    
}
function writeSelect1()
{
  
   if (o.readyState != 4 || o.status != 200)
    { 
       
      return;
    }
document.getElementById("Lnamelist").innerHTML = '&nbsp;&nbsp;&nbsp;'+trim(o.responseText) ;    
 
}
function refreshFnameNow(obj)
{
val=obj.value;
 selrow=null;
 mover=null;
 d = new Date();
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue" />/include/FnameList.jsp?val=' + val);
}


function refreshLnameNow(obj)
{
val=obj.value;
 selrow=null;
 mover=null;
 d = new Date();
  o = c(writeSelect1);
  oGET(o,'<bean:write name="path" property="pathvalue" />/include/LnameList.jsp?val=' + val);
}


function trim(inputString) {
   // Removes leading carriage return from the passed string. Also removes
   // consecutive carriage return.
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) { // Check for carriage return at the beginning of the string
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   return retValue; 
}
</script>
<script>
function setTxtval()
{
document.getElementById("nTxt").value=document.getElementById("fNameVal").value;
document.getElementById("list").innerHTML="";
}

function setLTxtval()
{
document.getElementById("nLTxt").value=document.getElementById("lNameVal").value;
document.getElementById("Lnamelist").innerHTML="";
}

function hideListBox(){
	document.getElementById("list").innerHTML="";
	document.getElementById("Lnamelist").innerHTML="";
}

function hideFirstNameList(){
	document.getElementById("list").innerHTML="";
}
function hideLastNameList(){
	document.getElementById("Lnamelist").innerHTML="";
}
</script>
<style type="text/css">
.dhtmlgoodies_answer{
height: 600px !important;
}
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
</head>
<body>
<!-- begin shared/header -->
<html:form styleId="RMAForm" action="RMA.do?tabid=R0S0C0" method="post">

<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> <span id="waitMessage"> </span>
	<div>
		<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.rma.createrma" />
		</span>
	</div>
	<br/>
	<div>
		<table class="table-notifications" width="100%">
			<thead>
				<tr onclick="hideListBox();">
					<th colspan="12" align="left" style="font-size:14px;">
						<bean:message key="BzComposer.rma.findinvoice"/>
					</th>
				</tr>
			</thead>
			<tbody>	
				<tr>
					<td nowrap="nowrap" width="20%" onclick="hideListBox();">
						<bean:message key="BzComposer.rma.firstname" />
					</td>
					<td width="20%">
						<!-- &nbsp;&nbsp;&nbsp; -->
						<logic:present name="FName" >
							<input id="nTxt" name="fnameTxt" type="text" style="width:115px"
							maxlength="40" onkeyup="refreshFnameNow(this);" onkeydown="hideLastNameList();"
							value='<bean:write name="FName"/>' />
						</logic:present> 
						<logic:notPresent name="FName">
							<input id="nTxt" name="fnameTxt" type="text" style="width:122px" maxlength="40" 
							onkeyup="refreshFnameNow(this);" onkeydown="hideLastNameList();" />
						</logic:notPresent> 
						<br>
						<div id="list"> </div>
					</td>
					<td nowrap="nowrap" width="20%" onclick="hideListBox();">
						<!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
						<bean:message key="BzComposer.rma.lastname" />
					</td>
					<td width="20%" nowrap="nowrap">
										<!-- &nbsp;&nbsp;&nbsp; -->
						<logic:present name="LName">
							<input name="lnameTxt" id="nLTxt" type="text" style="width:115px"
							maxlength="40" value='<bean:write name="LName" />'
							onkeyup="refreshLnameNow(this);" onkeydown="hideFirstNameList();" />
						</logic:present> 
						<logic:notPresent name="LName">
							<input name="lnameTxt" id="nLTxt" type="text" style="width:122px"
							maxlength="40" onkeyup="refreshLnameNow(this);"
							onkeydown="hideFirstNameList();" />
						</logic:notPresent>
						<br>
						<div id="Lnamelist"></div>
					</td>
					<td width="10%" nowrap="nowrap">
						<input type="button" class="formButton" onclick="alert(12);" name="findBtn"
						value='<bean:message key="BzComposer.rma.findcustomerinvoice" />' >			
					</td>
				</tr>
				<tr>
					<td width="20%" onclick="hideListBox();">
						<bean:message key="BzComposer.rma.order" />
					</td>
					<td width="20%">
						<!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
						<html:text property="order" maxlength="10" onkeypress="return numbersonly(event,this.value)"
						onkeydown="hideListBox();" />
					</td>
					<td width="20%">
						<!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
						<bean:message key="BzComposer.rma.orderdate" />
					</td>
					<td width="20%">
						<!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
						<html:text property="orderDate" />
					</td>
					<td width="20%">
						<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.RMAForm.orderDate,'mm-dd-yyyy',this);">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
	<div class="grid_8 height250 tabla-listados" id="table-negotiations" onclick="hideListBox();">
		<table id="rmaList" class="tabla-listados" cellpadding="0" cellspacing="0">
		<thead style="font-weight: bold;">
			<tr>
				<th class="emblem">&nbsp;</th>
				<th style="font-size:14px;">
					<bean:message key="BzComposer.rma.order" />
				</th>
				<th style="font-size:14px;">
					<bean:message key="BzComposer.rma.customername" />
				</th>
				<th style="font-size:14px;">
					<bean:message key="BzComposer.rma.orderdate" />
				</th>
				<th style="font-size:14px;">
					<bean:message key="BzComposer.rma.saledate" />
				</th>
			</tr>
		</thead>
		<tbody>
			<logic:present name="RMADetails" scope="request">
				<logic:notEmpty name="RMADetails" scope="request">
					<bean:size id="RMADetailsID" name="RMADetails" />
						<input type="hidden" name="RMADID" id="lSize" value='<bean:write name="RMADetailsID" />'>
						<logic:iterate name="RMADetails" id="objList" scope="request" indexId="indx">
						<tr id="<bean:write name="indx" />"
						onclick="setRMA('<bean:write name="objList" property="rma" />','<bean:write name="objList" property="fname" />','<bean:write name="objList" property="lname" />','<bean:write name="indx" />');">
							<td>&nbsp;</td>
							<td style="font-size:14px;">
								<bean:write name="objList" property="rma" />
							</td>
							<td nowrap="nowrap" style="font-size:14px;">
								<bean:write name="objList" property="fname" />
								&nbsp;&nbsp;
								<bean:write name="objList" property="lname" />
							</td>
							<td nowrap="nowrap" style="font-size:14px;">
								<bean:write name="objList" property="orderDate" />
							</td>
							<td nowrap="nowrap" style="font-size:14px;">
								<bean:write name="objList" property="sentDate" />
							</td>
						</tr>
						</logic:iterate>
				</logic:notEmpty>
			</logic:present>
		</tbody>
		</table>
	</div>
	<div align="center">
		<table onclick="hideListBox();">
			<tr>
				<td>
					<div align="center">
						<input type="button" name="custDetlBtn" value='<bean:message key="BzComposer.rma.customerdetail" />'
						class="formButton"> 
						&nbsp;&nbsp;
						<input type="button" disabled="disabled" id="RMAI" onclick="getRMA();" name="RMABtn"
						value='<bean:message key="BzComposer.rma.rmabuttontext" />'
						Title='<bean:message key="BzComposer.rma.rmabuttontitle" />' class="formButton"> 
						<input type="hidden" name="RMAval" id="RMAnum">
						<input type="hidden" name="Fnameval" id="RMAfname"> 
						<input type="hidden" name="Lnameval" id="RMAlname">
					</div>
				</td>
			</tr>
		</table>
	</div>
	</div>
	<%--
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<script>
window.onload = initShowHideDivs;

</script>
<script type="text/javascript">
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var oo = null;
var r = null;
var flag1=false;
var flag2=false;
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
function oGET(oo, url) {
  try {
    oo.open("GET", url, true);	
    oo.send(null);
  } catch (ex) {
  }
}

function writeSelect()
{
  
   if (o.readyState != 4 || o.status != 200)
    { 
       
      return;
    }
    document.getElementById("list").innerHTML = '&nbsp;&nbsp;&nbsp;'+trim(o.responseText) ;
     
    
}
function writeSelect1()
{
  
   if (o.readyState != 4 || o.status != 200)
    { 
       
      return;
    }
document.getElementById("Lnamelist").innerHTML = '&nbsp;&nbsp;&nbsp;'+trim(o.responseText) ;    
 
}
function refreshFnameNow(obj)
{
val=obj.value;
 selrow=null;
 mover=null;
 d = new Date();
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue" />/include/FnameList.jsp?val=' + val);
}


function refreshLnameNow(obj)
{
val=obj.value;
 selrow=null;
 mover=null;
 d = new Date();
  o = c(writeSelect1);
  oGET(o,'<bean:write name="path" property="pathvalue" />/include/LnameList.jsp?val=' + val);
}


function trim(inputString) {
   // Removes leading carriage return from the passed string. Also removes
   // consecutive carriage return.
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) { // Check for carriage return at the beginning of the string
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   return retValue; 
}
</script>
<script>
function setTxtval()
{
document.getElementById("nTxt").value=document.getElementById("fNameVal").value;
document.getElementById("list").innerHTML="";
}

function setLTxtval()
{
document.getElementById("nLTxt").value=document.getElementById("lNameVal").value;
document.getElementById("Lnamelist").innerHTML="";
}

function hideListBox(){
	document.getElementById("list").innerHTML="";
	document.getElementById("Lnamelist").innerHTML="";
}

function hideFirstNameList(){
	document.getElementById("list").innerHTML="";
}
function hideLastNameList(){
	document.getElementById("Lnamelist").innerHTML="";
}
</script>
<style type="text/css">
.dhtmlgoodies_answer{
height: 600px !important;
}
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
<title><bean:message key="BzComposer.RMA.RMATitle" /></title>
</head>
<body>
<!-- begin shared/header -->
<html:form action="RMA.do?tabid=R0S0C0" method="post">

<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> <span id="waitMessage"> </span>
	<div><span
		style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.RMA.CreateRma" /></span></div>
		<br/>
		<div>
			<div id="table-negotiations" onclick="hideListBox();" >
				<table>		
					<tr>
						<td>
							<table class="table-notifications" border="0" cellspacing="0" width="100%" >
								<tr style="width:90%" onclick="hideListBox();">
									<th width="90%" align="left" colspan="12" style="font-size:14px;">
										<bean:message key="BzComposer.rma.FindInvoice" />
									</th>
								</tr>
								<tr style="width: 90%">
									<td nowrap="nowrap" colspan="3" onclick="hideListBox();">
										<bean:message key="BzComposer.RMA.FirstName" />
									</td>
									<td nowrap="nowrap" colspan="3">
										&nbsp;&nbsp;&nbsp;
										<logic:present name="FName" >
											<input id="nTxt" name="fnameTxt" type="text" style="width:115px"
											maxlength="40" onkeyup="refreshFnameNow(this);" onkeydown="hideLastNameList();"
											value='<bean:write name="FName"/>' />
										</logic:present> 
										<logic:notPresent name="FName">
											<input id="nTxt" name="fnameTxt" type="text" style="width:122px" maxlength="40" 
											onkeyup="refreshFnameNow(this);" onkeydown="hideLastNameList();" />
										</logic:notPresent> 
										<br>
										<div id="list">
										</div>
									</td>
									<td nowrap="nowrap" colspan="3" onclick="hideListBox();">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<bean:message key="BzComposer.RMA.LastName" />
									</td>
									<td colspan="2" nowrap="nowrap">
										&nbsp;&nbsp;&nbsp;
										<logic:present name="LName">
											<input name="lnameTxt" id="nLTxt" type="text" style="width:115px"
											maxlength="40" value='<bean:write name="LName" />'
											onkeyup="refreshLnameNow(this);" onkeydown="hideFirstNameList();" />
										</logic:present> 
										<logic:notPresent name="LName">
											<input name="lnameTxt" id="nLTxt" type="text" style="width:122px"
											maxlength="40" onkeyup="refreshLnameNow(this);"
											onkeydown="hideFirstNameList();" />
										</logic:notPresent>
										<br>
										<div id="Lnamelist">
										</div>
									</td>
								</tr>
								<tr style="width: 90%">
									<td nowrap="nowrap" colspan="3" onclick="hideListBox();">
										<bean:message key="BzComposer.RMA.Order" />
									</td>
									<td nowrap="nowrap"colspan="3">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<html:text property="order" maxlength="10" onkeypress="return numbersonly(event,this.value)"
										onkeydown="hideListBox();" />
									</td>
									<td nowrap="nowrap" colspan="3">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<bean:message key="BzComposer.RMA.OrderDate" />
									</td>
									<td nowrap="nowrap" colspan="3">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<html:text property="orderDate" />
									</td>
									<td>
										<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
										onclick="displayCalendar(document.RMAForm.orderDate,'mm-dd-yyyy',this);">
									</td>
								</tr>
							</table>
						</td>
						<td width="10%" valign="top" onclick="hideListBox();">
							<table class="table-notifications" border="0" cellspacing="0" width="100%" >
								<tr>
									<th align="left" colspan="12" style="font-size:14px;">
										&nbsp;&nbsp;
									</th>
								</tr>
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<input type="button" class="formButton" onclick="checkName();" name="findBtn"
										value='<bean:message key="BzComposer.RMA.RMA.FindCustInvoice" />'>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</table>
					<div>
						<div>
	 						<div class="grid_8 height250 tabla-listados" id="table-negotiations" onclick="hideListBox();">
      							<table id="rmaList" class="tabla-listados" cellpadding="0" cellspacing="0">
									<thead style="font-weight: bold;">
										<tr>
											<th class="emblem">&nbsp;</th>
											<th style="font-size:14px;">
												<bean:message key="BzComposer.RMA.Order" />
											</th>
											<th style="font-size:14px;">
												<bean:message key="BzComposer.RMA.CustomerName" />
											</th>
											<th style="font-size:14px;">
												<bean:message key="BzComposer.RMA.OrderDate" />
											</th>
											<th style="font-size:14px;">
												<bean:message key="BzComposer.RMA.SaleDate" />
											</th>
										</tr>
									</thead>
									<tbody>
										<logic:present name="RMADetails" scope="request">
											<logic:notEmpty name="RMADetails" scope="request">
												<bean:size id="RMADetailsID" name="RMADetails" />
													<input type="hidden" name="RMADID" id="lSize" value='<bean:write name="RMADetailsID" />'>
													<logic:iterate name="RMADetails" id="objList" scope="request" indexId="indx">
													<tr id="<bean:write name="indx" />"
													onclick="setRMA('<bean:write name="objList" property="rma" />','<bean:write name="objList" property="fname" />','<bean:write name="objList" property="lname" />','<bean:write name="indx" />');">
														<td>&nbsp;</td>
														<td style="font-size:14px;">
															<bean:write name="objList" property="rma" />
														</td>
														<td nowrap="nowrap" style="font-size:14px;">
															<bean:write name="objList" property="fname" />
															&nbsp;&nbsp;
															<bean:write name="objList" property="lname" />
														</td>
														<td nowrap="nowrap" style="font-size:14px;">
															<bean:write name="objList" property="orderDate" />
														</td>
														<td nowrap="nowrap" style="font-size:14px;">
															<bean:write name="objList" property="sentDate" />
														</td>
													</tr>
													</logic:iterate>
											</logic:notEmpty>
										</logic:present>
									</tbody>
								</table>
							</div>
						</div>
						<div align="center">
							<table onclick="hideListBox();">
								<tr>
									<td>
										<div align="center">
											<input type="button" name="custDetlBtn" value='<bean:message key="BzComposer.RMA.RMA.CustmerDetails" />'
											class="formButton"> 
											&nbsp;&nbsp;
											<input type="button" disabled="disabled" id="RMAI" onclick="getRMA();" name="RMABtn"
											value='<bean:message key="BzComposer.RMA.RMA.RmaButton" />'
											Title='<bean:message key="BzComposer.RMA.RMA.RmaButtonTitle" />' class="formButton"> 
											<input type="hidden" name="RMAval" id="RMAnum">
											<input type="hidden" name="Fnameval" id="RMAfname"> 
											<input type="hidden" name="Lnameval" id="RMAlname">
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- end Contents -->
				</div>
			</div>
	--%>
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

function checkName()
{
	debugger;
// if(trim(document.RMAForm.fnameTxt.value)=="" && trim(document.RMAForm.lnameTxt.value)==""){

// 	document.RMAForm.fnameTxt.focus();
	
// }
// else if(document.RMAForm.order.value!= "" && !IsNumeric(document.RMAForm.order.value)){

// 	document.RMAForm.order.focus();
// }
// else
// {
	
	
	//private String order;

	//private String orderDate;

	rFnm = document.getElementById('nTxt').value;
	rLnm = document.getElementById('nLTxt').value;
	alert(rFnm);
	alert(rLnm);
	document.forms['RMAForm'].action = "RMA.do?tabid=R0S0C0&fname="rFnm+"&lname="+rLnm ;
	document.forms['RMAForm'].submit();

//}	

}

function IsNumeric(stext){
	   var validchars = "0123456789";
	   var isnumber=true;
	   var ch;
	   for (i = 0; i < stext.length && isnumber == true; i++){ 
	      ch = stext.charAt(i); 
    	  if (validchars.indexOf(ch) == -1){
	         isnumber = false;
    	  }
       }
	   return isnumber;
   }

function setRMA(rno,fnm,lnm,rid)
{
size=document.getElementById("lSize").value;
// for(i=0;i<size;i++){
// var row1=document.getElementById(i);
// row1.className = "";
// }
// var rd=document.getElementById(rid);
// rd.className = "draft";
for(i=0;i<size;i++){
	 document.getElementById(i).classList.remove('draft');		
	 if(i%2==0){	
		 if(size !=(i+1)){
		 document.getElementById(i+1).classList.add('odd');
		 }
	 }
}
if(rid%2 !=0){ 	
	document.getElementById(rid).classList.remove('odd'); 		
}
var rd = document.getElementById(rid).classList.add('draft');

document.getElementById("RMAnum").value=rno;
document.getElementById("RMAfname").value=fnm;
document.getElementById("RMAlname").value=lnm;
document.getElementById("RMAI").disabled=false;
}
function getRMA()
{
	rnum=document.getElementById("RMAnum").value;
	/*rFnm=document.getElementById("RMAfname").value;
	rLnm=document.getElementById("RMAlname").value;*/
	rFnm = document.getElementById('nTxt').value;
	rLnm = document.getElementById('nLTxt').value;
	rmawindow=window.open("RMA.do?tabid=RmaInfo&OrderID="+rnum+"&fname="+rFnm+"&lname="+rLnm,null,"scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no" );
	rmawindow.moveTo(50,50);
	
}

</script>
