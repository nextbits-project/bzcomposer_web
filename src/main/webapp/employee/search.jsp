<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.searchemployeetitle" /></title>
<!-- <script> -->
<!-- window.onload = initShowHideDivs; -->
<!-- </script> -->
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

var r = null;
var type="2";
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
</script>
</head>
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding"><!-- begin Contents --> 
<!-- <span id="waitMessage"><img -->
<%-- 	src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif"> --%>
<!-- Loading Contents...</span> -->
<!-- <div class="dhtmlgoodies_question"> -->
<div>
	<span style="font-size: 1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<bean:message key="BzComposer.searchemployee.searchemployeetitle"/>
	</span>
</div>
<!-- <div class="dhtmlgoodies_answer"> -->
<div>
	<div id="table-negotiations">
		<html:form action="/search" method="post">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th class="emblem" colspan="5" style="font-size:1.6em;">
							<bean:message key="BzComposer.searchemployee.addemployeeinfo" />
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td colspan=2 " align="center" style="font-size: 1.6em;">
							<html:radio property="type" value="1"></html:radio>
							<bean:message key="BzComposer.searchemployee.hiredemployee" /> 
							<html:radio property="type" value="0"></html:radio>
							<bean:message key="BzComposer.searchemployee.terminatedemployee" /> 
							<html:radio property="type" value="2"></html:radio>
							<bean:message key="BzComposer.searchemployee.allemployee" />
						</td>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td id="t_fname" align="right" style="font-size:1em;">
							&nbsp;<bean:message key="BzComposer.global.firstname"/>:
							<span class="inputHighlighted"></span>
						</td>
						<td style="font-size:1em;">
							<html:text property="fname" size="30" value="" />
						</td>
						<td align="left" style="font-size:1em;">
							<bean:message key="BzComposer.global.lastname" />:
						</td>
						<td style="font-size:1em;">
							<html:text property="lname" size="20" value="" />
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="right" style="font-size:1em;">
							&nbsp;<bean:message key="BzComposer.searchemployee.dateofbirth" />:
						</td>
						<td style="font-size:1em;">
							<html:text property="dob" size="12" value="" /> 
							<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
							onclick="displayCalendar(document.SearchForm.dob,'mm-dd-yyyy',this);">
						</td>
						<td align="left" style="font-size:1em;">
							<bean:message key="BzComposer.searchemployee.dateofstarted" />:
						</td>
						<td style="font-size:1em;">
							<html:text property="dos" size="12" value="" /> 
							<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
							onclick="displayCalendar(document.SearchForm.dos,'mm-dd-yyyy',this);">
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td id="t_fname" align="right" style="font-size:1em;">
							&nbsp;<bean:message key="BzComposer.global.city"/>
							<span class="inputHighlighted"></span>
						</td>
						<td width="16%" style="font-size:1em;">
							<html:text property="city" size="20" value="" />
						</td>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr>
						<td id="t_fname" align="right" style="font-size:1em;">
							&nbsp;<bean:message key="BzComposer.global.country" />
							<span class="inputHighlighted"></span>
						</td>
						<td style="font-size:1em;">
							<html:select property="country" onchange="refreshItemsNow(this.value);" onblur="refreshItemsNow(this.value);">
								<html:option value=""><bean:message key="BzComposer.ComboBox.Select" /></html:option>
								<html:options collection="cList" property="value" labelProperty="label" />
							</html:select>
						</td>
						<td id="t_state" align="left" style="font-size:1em;">
							<bean:message key="BzComposer.global.state"/>
							<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
						</td>
						<td id="t_statedata" align="left" style="font-size:1em;">
						</td>
						<td>&nbsp;</td>
						<script>
							document.forms[0].country.value="239";
				     		refreshItemsNow("239");
						</script>
					</tr>
					<tr>
						<td colspan="5" align="center" style="font-size:1em;">
							<input type="submit" name="search" value='<bean:message key="BzComposer.searchemployee.searchbtn"/>' class="formbutton">
							&nbsp;
							<input type="reset" name="clear" value='<bean:message key="BzComposer.searchemployee.clearbtn"/>' class="formbutton">
						</td>
					</tr>
				</tbody>
			</table>
	</html:form>
</div>
</div>
<!-- end Contents --></div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
<script>
document.SearchForm.type[0].checked=true;

</script>
</body>
</html>
