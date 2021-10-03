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


<title><bean:message key="BzComposer.addnewemployeetitle"/></title>
<script type="text/javascript">
$(function() {
	debugger;
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
//   oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?Cid=' + val)
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val)
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
<body onload="NewEmployee();">
<div id="ddcolortabsline">&nbsp;</div>
<html:form action="/addemployee" method="post">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size:1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<bean:message key="BzComposer.newemployee.addnewemployeetitle" />
	</span>
</div>
<br/>
<div id="tabs" style="height:530px;width: 1600px;">
	<ul>
    	<li style="font-size:1em;">
    		<a href="#General-1"><bean:message key="BzComposer.newemployee.tabs.general" /></a>
   		</li>
    	<li style="font-size:1em;">
    		<a href="#payroll-2"><bean:message key="BzComposer.newemployee.tabs.payrollandtaxinfo" /></a>
   		</li>  
  	</ul>
	<div id="General-1">
		<div id="content1" class="tabPage" >
		<!-- add here the content of first tab -->
			<div id="table-negotiations">
				<table class="tabla-listados" cellspacing="0" >
					<thead>
						<tr>
							<th colspan="9" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.addnewemployee"/>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="t_fname" style="font-size:1em;">
								<bean:message key="BzComposer.global.firstname" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="fname" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="fname" />						
							</td>
							<td id="t_lname" style="font-size:1em;">
								<bean:message key="BzComposer.global.lastname"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span></td>
							<td style="font-size:1em;">
								<html:text property="lname" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="lname" />
							</td>						
							<td id="t_nname" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.nickname" />
							</td>
							<td style="font-size:1em;">
								<html:text property="nname"/>
							</td>	
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_title" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.title"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:select property="title"  errorKey="org.apache.struts.action.ERROR" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="titleList" property="value" labelProperty="label" />
								</html:select>
								<html:errors property="title" />
							</td>
							<td id="t_jtitle" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.jobtitle" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:select property="jtitle"  errorKey="org.apache.struts.action.ERROR" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="jtitleList" property="value" labelProperty="label" />
								</html:select>
								<html:errors property="jtitle" />
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td nowrap id="t_dob" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.dateofbirth"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td nowrap style="font-size:1em;">
								<html:text property="dob"  size="10" readonly="true" errorKey="org.apache.struts.action.ERROR"/>
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.dob,'mm-dd-yyyy',this);">
								<br/>
								<html:errors property="dob" />
							</td>
							<td nowrap id="t_dos" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.dateofstarted" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td nowrap style="font-size:1em;">
								<html:text property="dos"  size="10" readonly="true" errorKey="org.apache.struts.action.ERROR"/>
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.dos,'mm-dd-yyyy',this);">
								<br/>
								<html:errors property="dos" />
							</td>
							<td nowrap id="t_doa" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.dateofadded"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="doa"  size="10" readonly="true" errorKey="org.apache.struts.action.ERROR"/> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.doa,'mm-dd-yyyy',this);">
								<br/>
								<html:errors property="doa" />
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_address1" style="font-size:1em;">
								<bean:message key="BzComposer.global.address1"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td colspan="1" style="font-size:1em;">
								<html:textarea property="address1" errorKey="org.apache.struts.action.ERROR" cols="40"/>
								<html:errors property="address1"/>
							</td>
							<td id="t_address2" style="font-size:1em;">
								<bean:message key="BzComposer.global.address2"/>
							</td>
							<td style="font-size:1em;">
								<html:textarea property="address2"  cols="40"/>
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_city" style="font-size:1em;">
								<bean:message key="BzComposer.global.city" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="city" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="city"/>
							</td>
							<td id="t_zip" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.zip"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="zip" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="zip" />
							</td>
							<td id="t_province" style="font-size:1em;">
								<bean:message key="BzComposer.global.province"/>
								<span class="inputHighlighted"></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="province"  />
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_country" style="font-size:1em;">
								<bean:message key="BzComposer.global.country"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:select property="country" errorKey="org.apache.struts.action.ERROR" onchange="refreshItemsNow(this.value);"
								onblur="refreshItemsNow(this.value);" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="cList" property="value" labelProperty="label" />
								</html:select>
								<html:errors property="country"/>
							</td>
							<td id="t_state" style="font-size:1em;">
								<bean:message key="BzComposer.global.state"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td id="t_statedata" colspan="3" style="font-size:1em;">
								<html:errors property="address1"/>
							</td>
							<td colspan="3">&nbsp;</td>
					<!--<script> -->
<!-- 							           document.AddEmployeeForm.country.value="239"; -->
<!-- 							           refreshItemsNow("239"); -->
<!-- 							</script> -->
						</tr>
						<tr>
							<td id="t_phone" style="font-size:1em;">
								<bean:message key="BzComposer.global.phone"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="phone" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="phone"/>
							</td>
							<td id="t_mobile" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.mobile" />
								<span class="inputHighlighted"></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="mobile"/>
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_email" style="font-size:1em;">
								<bean:message key="BzComposer.global.email"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="email" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="email" />
							</td>
							<td colspan="7">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_emptype" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.employeetype"/>
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:select property="emptype" errorKey="org.apache.struts.action.ERROR" style="font-size:1em;">
									<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
									<html:options collection="emptypeList" property="value" labelProperty="label" />
								</html:select>
								<html:errors property="emptype"/>
							</td>
							<td id="t_ssn" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.ssn" />
								<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
							</td>
							<td style="font-size:1em;">
								<html:text property="ssn" errorKey="org.apache.struts.action.ERROR"/>
								<html:errors property="ssn" />
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td id="t_terminated" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.terminated"/>
							</td>
							<td style="font-size:1em;">
								<html:checkbox property="terminated" value="y" />
							</td>
							<td id="t_dot" style="font-size:1em;">
								<bean:message key="BzComposer.newemployee.terminateddate"/>
							</td>
							<td style="font-size:1em;">
								<html:text property="dot"  size="10" readonly="true" /> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.AddEmployeeForm.dot,'mm-dd-yyyy',this);">
							</td>
							<td colspan="5">&nbsp;</td>
							</tr>
							<tr bgcolor="#ffffff">
								<td id="t_memo" style="font-size:1em;">
									<bean:message key="BzComposer.global.memo" />
								</td>
								<td colspan="5" style="font-size:1em;">
									<html:textarea property="memo" cols="40"></html:textarea>
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
									<bean:message key="BzComposer.newemployee.payrolltaxinfo"/>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="8" style="font-size:1em;">
									<b><bean:message key="BzComposer.newemployee.payrolltaxinfortwo"/></b>
									<span class="inputHighlighted"></span>
								</td>
							</tr>
							<tr>
								<td id="t_filing" style="font-size:1em;">
									<bean:message key="BzComposer.newemployee.filingstatus" />
									<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
								</td>
								<td id="t_filling" style="font-size:1em;">
									<html:select property="filingStatus"  errorKey="org.apache.struts.action.ERROR" style="font-size:1em;">
										<html:option value="" ><bean:message key="BzComposer.ComboBox.Select" /></html:option>
										<html:options collection="filingList" property="value" labelProperty="label" />
									</html:select>
									<html:errors property="filingStatus"/>
								</td>
								<td id="t_allowance" style="font-size:1em;">
									<bean:message key="BzComposer.newemployee.allowance" />
									<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
								</td>
								<td id="t_allowance" style="font-size:1em;">
									<html:text property="allowance" styleClass="ctrl" errorKey="org.apache.struts.action.ERROR"/>
									<html:errors property="allowance" />
								</td>
								<td id="t_stateworked" align="right" style="font-size:1em;">
									<bean:message key="BzComposer.newemployee.stateworked" />
									<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
								</td>
								<td id="t_stateworked" style="font-size:1em;">
									<html:select property="stateworked" errorKey="org.apache.struts.action.ERROR" style="font-size:1em;">
										<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
										<html:options collection="statewList" property="value" labelProperty="label" />
									</html:select>
									<html:errors property="stateworked"/>
								</td>
								<td colspan="2">&nbsp;</td>
							</tr>					
							<tr>
								<td id="t_payrollmethod" style="font-size:1em;">
									<b><bean:message key="BzComposer.newemployee.payrollmethod"/></b>
									<span class="inputHighlighted"></span>
								</td>
								<td colspan="7">&nbsp;</td>
							</tr>
							<tr>
								<td id="t_period" style="font-size:1em;"></td>
								<td id="t_period" style="font-size:1em;">
									<html:radio property="payMethod" value="2"/>
									&nbsp;<bean:message key="BzComposer.newemployee.hourly"/>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<html:radio property="payMethod" value="3"/>
									&nbsp;<bean:message key="BzComposer.newemployee.daily"/>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<html:radio property="payMethod" value="1"/>
									&nbsp;<bean:message key="BzComposer.newemployee.salary"/>
									&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td id="t_period" style="font-size:1em;"></td>
								<td colspan="5">&nbsp;</td>
							</tr>
							<tr>
								<td id="t_amount" style="font-size:1em;">
									<bean:message key="BzComposer.newemployee.amount"/>
									<span class="inputHighlighted">*</span>
								</td>
								<td id="t_fname" style="font-size:1em;">
									<html:text property="amount" errorKey="org.apache.struts.action.ERROR"/>
									<html:errors property="amount"/>
								</td>
								<td id="t_lname" style="font-size:1em;">
									<bean:message key="BzComposer.newemployee.payperiod"/>
									<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
								</td>
								<td id="t_lname" width="16%" style="font-size:1em;">
									<html:select property="payperiod" styleClass="ctrl" errorKey="org.apache.struts.action.ERROR" style="font-size:1em;">
										<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
										<html:options collection="periodList" property="value" labelProperty="label" />
									</html:select>
									<html:errors property="payperiod"/>
								</td>
								<td width="20%" id="t_lname" align="right" style="font-size:1em;">&nbsp;
									<span class="inputHighlighted"></span>
								</td>
								<td width="20%" id="t_lname" align="right" style="font-size:1em;">
									&nbsp;<span class="inputHighlighted"></span>
								</td>
								<td colspan="2">&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<html:hidden property="status" value="N" /> 
					<html:hidden property="employeeID" value="N" />
				</div>
			</div>
  		</div> 
  	</div>
  	<br/>
	<table cellpadding="0" cellspacing="0" border="0" width=100% align=center>
		<tr>
			<td colspan="6" align="center" style="font-size:1em;">
				<html:reset property="Clear" styleClass="formbutton" style="font-size:1em;">
					<bean:message key='BzComposer.newemployee.cleardata'/>
				</html:reset>
				<%-- <html:reset value="Clear Data" styleClass="formbutton" style="font-size:1em;"/> --%> 
				&nbsp;&nbsp;&nbsp; 
				<html:submit property="Submit" styleClass="formbutton" style="font-size:1em;">
					<bean:message key='BzComposer.newemployee.savenewemployee'/>
				</html:submit>
				<%-- <html:submit value="Save New Employee" styleClass="formbutton" style="font-size:1em;"/> --%>
			</td>
		</tr>
	</table>
<!-- 	<input type="hidden" name="eid" action="add" /> -->
 </div>
</div>
</div>
</div>
</div>
</html:form>
<%@ include file="/include/footer.jsp"%>
<script>
document.AddEmployeeForm.payMethod[0].checked=true;
function NewEmployee(){
	document.AddEmployeeForm.fname.value="";
	document.AddEmployeeForm.lname.value="";
	document.AddEmployeeForm.nname.value="";
	document.AddEmployeeForm.title.value="";
	document.AddEmployeeForm.jtitle.value="";
	document.AddEmployeeForm.dob.value="";
	// document.AddEmployeeForm.dos.value="";
	document.AddEmployeeForm.doa.value="";
	document.AddEmployeeForm.address1.value="";
	document.AddEmployeeForm.address2.value="";
	document.AddEmployeeForm.city.value="";
	document.AddEmployeeForm.zip.value="";
	document.AddEmployeeForm.province.value="";
	document.AddEmployeeForm.country.value="";
// 	document.AddEmployeeForm.state.value="";
	document.AddEmployeeForm.phone.value="";
	document.AddEmployeeForm.mobile.value="";
	document.AddEmployeeForm.email.value="";
	document.AddEmployeeForm.emptype.value="";
	document.AddEmployeeForm.ssn.value="";
	document.AddEmployeeForm.terminated.checked = false;
	document.AddEmployeeForm.dot.value="";
	document.AddEmployeeForm.memo.value="";
	document.AddEmployeeForm.filingStatus.value="";
	document.AddEmployeeForm.allowance.value="";
	document.AddEmployeeForm.stateworked.value="";
	document.AddEmployeeForm.payMethod.value="";
	document.AddEmployeeForm.amount.value="";
	document.AddEmployeeForm.payperiod.value="";
}
</script>
</body>
</html>
