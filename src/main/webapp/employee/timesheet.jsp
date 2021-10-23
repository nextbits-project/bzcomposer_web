<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	version="-//W3C//DTD XHTML 1.1//EN" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>

<title><bean:message key="BzComposer.timesheettitle" /></title>
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
    document.getElementById("list").innerHTML="";
    document.getElementById("list").innerHTML = o.responseText ;
}
function writeSelect1()
{
   if (o.readyState != 4 || o.status != 200)
    {       
      return;
    }
    
    document.getElementById("tsheet").innerHTML="";
    document.getElementById("tsheet").innerHTML = o.responseText ;

}
function refreshItemsNow(val)
{
 selrow=null;
 mover=null;
 d = new Date();
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue" />/include/TimeSheetEmployeeList.jsp?type=' + val + "&rnd="+ d);
}
function drawTimesheet()
{
  var dates=document.getElementById("weekdays").value;
  var id=document.getElementById("empid").value
  if(id!=null||id!="")
  {
  o = c(writeSelect1);

  oGET(o,'<bean:write name="path" property="pathvalue" />/include/EmployeeTimeSheet.jsp?id=' +id+'&dates='+dates);
  var rawdata=document.getElementById("tsdata").value;

  }
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
<!--  <span id="waitMessage"><img -->
<%-- 	src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif"> --%>
<!-- Loading Contents...</span> -->
<!-- <div class="dhtmlgoodies_question"> -->
	<div>
		<span style="font-size:1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
			<bean:message key="BzComposer.timesheet.employeetimesheet"/>
		</span>
	</div>
<!-- <div class="dhtmlgoodies_answer"> -->
<div>
	<div id="table-negotiations">
		<form action="TimeSheet.do" method="post" onsubmit="return saveTimsSheet();">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td width="30%" valign="top">
							<table cellspacing="0" class="tabla-listados">
								<tbody>
									<tr>
										<td valign="top" style="font-size:1em;">
											<input type="radio" name="el" onclick="refreshItemsNow('1');" checked>
											<bean:message key="BzComposer.employeeprintlabels.hiredemployeelist" />
										</td>
									</tr>
									<tr>
										<td style="font-size:1em;">
											<input type="radio" name="el" onclick="refreshItemsNow('0');">
											<bean:message key="BzComposer.employeeprintlabels.terminatedemployeelist" />
										</td>
									</tr>
								</tbody>
							</table>
							<div id="list" style="overflow:auto;width:100%" class="section-border">
							</div>
						</td>
						<td width="70%">
							<table cellspacing="0" width="100%">
								<tbody>
									<tr>
										<td width="100%" align="center">
											<div id="basic_container"></div>
										</td>
									</tr>
									<tr>
										<td width="100%">&nbsp;</td>
									</tr>
									<tr>
										<td align="center" colspan="3" style="font-size:1em;">
											<bean:message key="BzComposer.timesheet.employeename" />:
											<input type="text" name="empname" id="empname">
										</td>
										<td align="left" colspan="4">
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" class="tabla-editables">
												<thead>
													<tr>
														<th class="emblem" style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.weekday"/>
														</th>
														<th style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.date" />
														</th>
														<th style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.startwork" />
														</th>
														<th style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.timeout" />
														</th>
														<th style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.timein" />
														</th>
														<th style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.endwork" />
														</th>
														<th style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.totalhours" />
														</th>
													</tr>
												</thead>
												<tbody>
													<tr id="r1">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.monday" />
														</td>
														<td id="d0"></td>
														<td id="t11" onclick="insertTime('t11');">-</td>
														<td id="t12" onclick="insertTime('t12');">-</td>
														<td id="t13" onclick="insertTime('t13');">-</td>
														<td id="t14" onclick="insertTime('t14');">-</td>
														<td id="h1"></td>
													</tr>
													<tr id="r2">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.tuesday" />
														</td>
														<td id="d1"></td>
														<td id="t21" onclick="insertTime('t21');">-</td>
														<td id="t22" onclick="insertTime('t22');">-</td>
														<td id="t23" onclick="insertTime('t23');">-</td>
														<td id="t24" onclick="insertTime('t24');">-</td>
														<td id="h2"></td>
													</tr>
													<tr id="r3">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.wednesday" />
														</td>
														<td id="d2"></td>
														<td id="t31" onclick="insertTime('t31');">-</td>
														<td id="t32" onclick="insertTime('t32');">-</td>
														<td id="t33" onclick="insertTime('t33');">-</td>
														<td id="t34" onclick="insertTime('t34');">-</td>
														<td id="h3"></td>
													</tr>
													<tr id="r4">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.thursday" />
														</td>
														<td id="d3"></td>
														<td id="t41" onclick="insertTime('t41');">-</td>
														<td id="t42" onclick="insertTime('t42');">-</td>
														<td id="t43" onclick="insertTime('t43');">-</td>
														<td id="t44" onclick="insertTime('t44');">-</td>
														<td id="h4"></td>
													</tr>
													<tr id="r5">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.friday" />
														</td>
														<td id="d4"></td>
														<td id="t51" onclick="insertTime('t51');">-</td>
														<td id="t52" onclick="insertTime('t52');">-</td>
														<td id="t53" onclick="insertTime('t53');">-</td>
														<td id="t54" onclick="insertTime('t54');">-</td>
														<td id="h5"></td>
													</tr>
													<tr id="r6">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.saturday" />
														</td>
														<td id="d5"></td>
														<td id="t61" onclick="insertTime('t61');">-</td>
														<td id="t62" onclick="insertTime('t62');">-</td>
														<td id="t63" onclick="insertTime('t63');">-</td>
														<td id="t64" onclick="insertTime('t64');">-</td>
														<td id="h6"></td>
													</tr>
													<tr id="r7">
														<td style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.sunday" />
														</td>
														<td id="d6"></td>
														<td id="t71" onclick="insertTime('t71');">-</td>
														<td id="t72" onclick="insertTime('t72');">-</td>
														<td id="t73" onclick="insertTime('t73');">-</td>
														<td id="t74" onclick="insertTime('t74');">-</td>
														<td id="h7"></td>
													</tr>
													<tr>
														<td colspan="3" align="right" style="font-size:1em;">
															<B>
																<bean:message key="BzComposer.timesheet.weeklytotal" />
															</B>
														</td>
														<td colspan="4" id="WeeklyTotal" style="font-size:1em;"></td>
													</tr>
													<tr>
														<td align="right" colspan="4" style="font-size:1em;">
															<bean:message key="BzComposer.timesheet.totalhours" />:
															<br>
															<bean:message key="BzComposer.timesheet.regularhours" />:
															<br>
															<bean:message key="BzComposer.timesheet.overtimehours" />:
														</td>
														<td align="left" id="TotalHours" colspan="3" style="font-size:1em;">0.0 
															<br>
															0.0<br>
															0.0
														</td>
													</tr>
												</tbody>
											</table>
											<div id="tsheet">
												<input type="hidden" name="tsdata" id="tsdata" value="">
											</div>
										</td>
									</tr>
									<input type="hidden" name="empid" id="empid" value=""/>
									<input type="hidden" name="weeksdays" id="weekdays" value="">
									<tr>
										<td colspan="2" align="center" style="font-size:1em;">
											<input type="button" value="<bean:message key="BzComposer.timesheet.cleardata"/>" class="formbutton"> 
											<input type="submit" value="<bean:message key="BzComposer.timesheet.savetimesheet"/>" class="formbutton"> 
											<input type="button" value="<bean:message key="BzComposer.timesheet.printtimesheet"/>" class="formbutton">
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="timedata" id="timedata" value=""> 
			<input type="hidden" name="datedata" id="datedata" value="">
		</form>
	</div>
</div>
<!-- end Contents --></div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
<script>
var bas_cal = new Epoch('epoch_basic','flat',document.getElementById('basic_container'));
getDate123();
refreshItemsNow('1');
</script>
</body>
</html>