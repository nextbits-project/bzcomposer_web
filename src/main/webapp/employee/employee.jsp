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
<!-- <script> -->
<!-- window.onload = initShowHideDivs; -->
<!-- </script> -->
<title><bean:message key="BzComposer.Employee.Title.Employee"/></title>
</head>
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<!-- begin Contents --> 
<!-- <span id="waitMessage"> <img -->
<%-- 	src='<bean:write name="path" property="pathvalue"/>/images/spinner.gif'> --%>
<!-- Loading Contents...</span> -->

<!-- <div class="dhtmlgoodies_question"> -->
<div>
	<span style="font-size:1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<%-- <bean:message key="BzComposer.Employee.EmployeeInformationSummary" /> --%>
		<bean:message key="BzComposer.employee.employeeinformationsummary"/>
	</span>
</div>
<div>
<div id="table-negotiations">
<table class="tabla-listados" cellspacing="0">
	<thead>
		<tr>
			<th class="emblem" style="font-size: 1em;">
				<%-- <bean:message key="BzComposer.Employee.EmployeesDetails" /> --%>
				<bean:message key="BzComposer.employee.employeedetails"/>
			</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<logic:present name="Count" scope="request">
			<tr>
				<td class="emblem">
					<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable" width="22" height="22">
				</td>
				<td style="font-size: 1em;">
					<a href="employeelist.do?type=hired">
						<%-- <bean:message key="BzComposer.Employee.TotalHiredEmployee" /> --%>
						<bean:message key="BzComposer.employee.hiredemployeelist"/>
					</a>
				</td>
				<td style="font-size: 1em;">
					<bean:write name="Count" property="hired" />
				</td>
			</tr>
			<tr>
				<td class="emblem">
					<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable">
				</td>
				<td style="font-size: 1em;">
					<a href="employeelist.do?type=terminated">
						<%-- <bean:message key="BzComposer.Employee.TotalTerminatedEmployee" /> --%>
						<bean:message key="BzComposer.employee.terminatedemployeelist"/>
					</a>
				</td>
				<td style="font-size: 1em;">
					<bean:write name="Count" property="terminated" />
				</td>
			</tr>
		</logic:present>
		<logic:notPresent name="Count" scope="request">
			<tr>
				<td class="emblem">
					<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable" width="22" height="22">
				</td>
				<td style="font-size: 1em;">
					<a href="employeelist.htm">
						<bean:message key="BzComposer.Employee.TotalHiredEmployee" />
					</a>
				</td>
				<td>10</td>
			</tr>
			<tr>
				<td class="emblem">
					<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable">
				</td>
				<td style="font-size: 1em;">
					<a href="employeelist.htm">
						<bean:message key="BzComposer.Employee.TotalTerminatedEmployee" />
					</a>
				</td>
				<td>2</td>
			</tr>
		</logic:notPresent>
	</tbody>
</table>
</div>
</div>
<!-- end Contents -->
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
</body>
</html>
