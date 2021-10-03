<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href='http://fonts.googleapis.com/css?family=Philosopher:400,700,400italic,700italic&subset=cyrillic,latin' rel='stylesheet' type='text/css'>

<link
	href="<bean:write name="path" property="pathvalue"/>/styles/admin.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/form.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/basic.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/formitems.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/menu.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/textareas.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/lightbox.css"
	media="screen" rel="Stylesheet" type="text/css">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/calendar.css"
	rel="stylesheet"></LINK>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/prototype.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/effects.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/dragdrop.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/controls.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/application.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/message.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/calendar.js"
	type="text/javascript"></script>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/tabs.js"
	type="text/javascript"></script>
	
	<script
	src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.js"
	type="text/javascript"></script>
		
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>

<title><bean:message key="BzComposer.editemployeetitle"/></title>
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
  });
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;

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
function oGET(oo, url) {
  try {
    oo.open("GET", url, true);	
    oo.send(null);
  } catch (ex) {
  }
}

function writeSelect()
{
  
   if (o.readyState != 4 || o.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata").innerHTML = o.responseText ;
}
function refreshItemsNow(val)
{
  o = c(writeSelect);
  oGET(o,"include/GetStates.jsp?Cid=" + val)
}

function getStates(val1,val2)
{
  o = c(writeSelect);
  oGET(o,"include/GetStateselected.jsp?Cid=" + val1+"&sid="+val2)
}

</script>
<style>
input,textarea,select{
	display: inline-block;
/* 	padding: 4px; */
	margin-bottom: 3px;
	line-height: 13px;
/* 	color: #555555; */
	border: 1px solid #cccccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	margin-top: 3px
}
</style>
</head>
<body>

<!-- begin shared/header -->

<!-- end shared/header 
<div id="flashbox-container-id"><script>FlashTimeouts.add()</script><div class="flashBox notice"><h4>You are on project module view of BizComposer</h4></div></div>
-->

<div id="ddcolortabsline">&nbsp;</div>

<html:form action="/editemployee" method="post">

<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div><span
	style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"><bean:message
	key="BzComposer.editemployee.editemployeelist" /></span></div><br/>	
<div id="tabs" style="height:500px;width:auto;">
  <ul>
    <li style="font-size:1em;"><a href="#General-1"><bean:message key="BzComposer.editemployee.tabs.general" /></a></li>
    <li style="font-size:1em;"><a href="#payroll-2"><bean:message key="BzComposer.editemployee.tabs.payrollandtaxinfo" /></a></li>  
  </ul>
	<div id="General-1">
		<div id="content1" class="tabPage" >
			<!-- add here the content of first tab -->
			<div id="table-negotiations">
				<table class="tabla-listados" cellspacing="0" >
					<thead>
						<tr>
							<th colspan="9" style="font-size:1.6em;">
								<bean:message key="BzComposer.editemployee.addnewemployee" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="t_fname" style="font-size:1em;">
								<bean:message key="BzComposer.global.firstname" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="fname" style="font-size:1em;"/>
							</td>
							<td id="t_lname" style="font-size:1em;">
								<bean:message key="BzComposer.global.lastname" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="lname" style="font-size:1em;"/>
							</td>
							<td id="t_nname" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.nickname" />
							</td>
							<td>
								<html:text name="employee" property="nname" style="font-size:1em;"/>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_title" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.title" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:select name="employee" property="title" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="titleList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td id="t_jtitle" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.jobtitle" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:select name="employee" property="jtitle" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="jtitleList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td nowrap id="t_dob" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.dateofbirth" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td nowrap>
								<html:text name="employee" property="dob" size="10" readonly="true" style="font-size:1em;"/> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.dob,'mm-dd-yyyy',this);">
							</td>
							<td nowrap id="t_dos" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.dateofstarted" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td nowrap>
								<html:text name="employee" property="dos" size="10" readonly="true" style="font-size:1em;"/> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.dos,'mm-dd-yyyy',this);">
							</td>
							<td nowrap id="t_doa" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.dateofadded" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="doa" size="10" readonly="true" style="font-size:1em;"/> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.doa,'mm-dd-yyyy',this);">
							</td>
							<td colspan="3">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td id="t_address1" style="font-size:1em;">
								<bean:message key="BzComposer.global.address1" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:textarea name="employee" property="address1" cols="40" style="font-size:1em;"/>
							</td>
							<td id="t_address2" style="font-size:1em;">
								<bean:message key="BzComposer.global.address2" />
							</td>
							<td colspan="2">
								<html:textarea name="employee" property="address2" cols="40" style="font-size:1em;"/>
							</td>
							<td colspan="4">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td id="t_city" style="font-size:1em;">
								<bean:message key="BzComposer.global.city" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="city" style="font-size:1em;"/>
							</td>
							<td id="t_zip" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.zip" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="zip" style="font-size:1em;"/>
							</td>
							<td id="t_province" style="font-size:1em;">
								<bean:message key="BzComposer.global.province" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="province" style="font-size:1em;"/>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_country" style="font-size:1em;">
								<bean:message key="BzComposer.global.country" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:select name="employee" property="country" onchange="refreshItemsNow(this.value);"
								onblur="refreshItemsNow(this.value);" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="cList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td id="t_state" style="font-size:1em;">
								<bean:message key="BzComposer.global.state" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td id="t_statedata" colspan="3"></td>
							<td colspan="3">&nbsp;</td>
							<script>
					     	getStates('<bean:write name="employee" property="country"/>','<bean:write name="employee" property="state"/>');      
                           	</script>
						</tr>
						<tr>
							<td id="t_phone" style="font-size:1em;">
								<bean:message key="BzComposer.global.phone" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="phone" style="font-size:1em;"/>
							</td>
							<td id="t_mobile" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.mobile" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="mobile" style="font-size:1em;"/>
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_email" style="font-size:1em;">
								<bean:message key="BzComposer.global.email" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="email" size="15" style="font-size:1em;"/>
							</td>
							<td colspan="7">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_emptype" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.employeetype" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:select name="employee" property="emptype" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="emptypeList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td id="t_ssn" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.ssn" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="ssn" size="10" style="font-size:1em;"/>
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_terminated" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.terminated" />
							</td>
							<td>
								<html:checkbox name="employee" property="terminated" value="y" style="font-size:1em;"/>
							</td>
							<td id="t_dot" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.terminateddate" />
							</td>
							<td>
								<html:text name="employee" property="dot" size="10" readonly="true" style="font-size:1em;"/> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.dot,'mm-dd-yyyy',this);">
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr bgcolor="#ffffff">
							<td id="t_memo" style="font-size:1em;">
								<bean:message key="BzComposer.global.memo" />
							</td>
							<td colspan="5">
								<html:textarea name="employee" property="memo" cols="40" style="font-size:1em;"></html:textarea>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<div align="center" id="error_registration" style="display: block;"></div>
					</tbody>
				</table>
			</div>
		</div>
  	</div>
	
	<div id="payroll-2">
		<div id="content2" class="tabPage">
			<div id="table-negotiations">
				<table class="tabla-listados" cellspacing="0">
					<thead>
						<tr>
							<th class="emblem" colspan="8" style="font-size:1.6em;">
								<bean:message key="BzComposer.editemployee.payrolltaxinfo" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="8" style="font-size:1.4em;">
								<b><bean:message key="BzComposer.editemployee.payrollinfo" /> </b>
								<span class="inputHighlighted"></span>
							</td>
						</tr>
						<tr>
							<td id="t_filing" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.filingstatus" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td id="t_filling">
								<html:select name="employee" property="filingStatus" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="filingList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td id="t_allowance" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.allowance" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td id="t_allowance" style="font-size:1em;">
								<html:text name="employee" styleClass="ctrl" property="allowance" style="font-size:1em;"/>
							</td>
						<!-- style change -->
						<!--<td width="20%" id="t_lname" align="right">&nbsp;<span -->
						<!--class="inputHighlighted"></span></td> -->
						<!--<td width="20%" id="t_lname" align="right">&nbsp;<span -->
						<!--class="inputHighlighted"></span></td> -->
							<td id="t_stateworked" align="right" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.stateworked" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td id="t_stateworked" style="font-size:1em;">
								<html:select name="employee" property="stateworked" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="statewList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_payrollmethod" style="font-size:1.4em;" colspan="8">
								<b><bean:message key="BzComposer.editemployee.payrollmethod" /></b>
								<span class="inputHighlighted"></span>
							</td>
						</tr>
						<tr>
							<td id="t_period" style="font-size:1em;">
							</td>
							<td id="t_period" style="font-size:1em;">
								<html:radio name="employee" property="payMethod" value="2"/> 
								&nbsp;<bean:message key="BzComposer.editemployee.hourly" /> 
								&nbsp;&nbsp;&nbsp;&nbsp;
								<html:radio name="employee" property="payMethod" value="3" /> 
								&nbsp;<bean:message key="BzComposer.editemployee.daily" />
								&nbsp;&nbsp;&nbsp;&nbsp;
								<html:radio name="employee" property="payMethod" value="1" />
								&nbsp;<bean:message key="BzComposer.editemployee.salary" />
								&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td id="t_period" style="font-size:1em;"></td>
							<td colspan="5">&nbsp;</td>	
						</tr>
						<tr>
							<td id="t_amount" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.amount" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td>
								<html:text name="employee" property="amount" style="font-size:1em;"/>
							</td>
							<td id="t_payperiod" style="font-size:1em;">
								<bean:message key="BzComposer.editemployee.payperiod" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td id="t_lname" width="16%">
								<html:select name="employee" property="payperiod" styleClass="ctrl" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="periodList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td width="20%" id="t_lname" align="right">
								&nbsp;<span class="inputHighlighted"></span>
							</td>
							<td width="20%" id="t_lname" align="right">
								&nbsp;<span class="inputHighlighted"></span>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<html:hidden name="employee" property="status" value="U" /> 
				<html:hidden name="employee" property="employeeID" />
			</div>
		</div>
	</div>
	<!-- add the code for tab here -->	
</div>
<br/>
<table cellpadding="0" cellspacing="0" border="0" width=100% align=center>
	<tr>
		<td colspan="6" align="center">
			<%-- <html:reset value="<bean:message key='BzComposer.editemployee.cleardata'/>" styleClass="formbutton" style="font-size:1em;"/> --%>
			<html:reset value="Clear Data" styleClass="formbutton" style="font-size:1em;"/>
			&nbsp;&nbsp;&nbsp; 
			<%-- <html:submit value="<bean:message key='BzComposer.editemployee.updateemployee'/>" styleClass="formbutton" style="font-size:1em;" /> --%>
			<html:submit value="Update Employee" styleClass="formbutton" style="font-size:1em;" />
		</td>
	</tr>
</table>
</div>
</div>
</div>
</div>
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
</html>
