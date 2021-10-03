<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title>BizComposer</title>
<!-- <script> -->
<!-- window.onload = initShowHideDivs; -->
<!-- </script> -->
<script>
function terminateEmployee(Id)
{
	document.getElementById("eid").value=Id;
	document.getElementById("act").value="terminate";
	var res=confirm("Do U want to Terminate Employee?");
	if(res==true)
	{
	document.forms[0].action = "manageemployee.do?act=terminate&eid="+Id;
	document.forms[0].submit();
	}
}
function deleteEmployee(Id)
{
	document.getElementById("eid").value=Id;
	document.getElementById("act").value="delete";
	var res=confirm("Do U want to delete Employee?");
	if(res==true)
	{
	document.forms[0].action = "manageemployee.do?act=delete&eid="+Id;
	document.forms[0].submit();
	}
}
</script>
<style type="text/css">
.height250 {
height: 250px;
}
.fht-tbody{
height: 100% !important; /*  change table height*/
/* border-bottom: 1px solid rgb(207, 207, 207); */
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
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding"><!-- begin Contents --> 
<!-- <span id="waitMessage"><img -->
<%-- 	src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif"> --%>
<!-- Loading Contents...</span> -->
<!-- <div class="dhtmlgoodies_question" -->
<div>
	<span style="font-size: 1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<bean:message key="BzComposer.Employee.EmployeeList" />
	</span>
</div>
<br>
<!-- <div class="dhtmlgoodies_answer"> -->
<div>
	<div>
 		<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
    		<table id="searchresultEmployee" class="tabla-listados" cellpadding="0" cellspacing="0">
				<thead style="font-weight: bold;">
    				<tr>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.Id" />
						</th>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.Name" />
						</th>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.City"/>
						</th>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.State"/>
						</th>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.Zip"/>
						</th>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.Email"/>
						</th>
						<th style="font-size:1em;">
							<bean:message key="BzComposer.Employee.DOA"/>
						</th>
						<th colspan="2" class="unsortable" style="font-size:1em;">
							<bean:message key="BzComposer.Employee.Options"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<logic:present name="empList" scope="request">
						<logic:notEmpty name="empList">
							<bean:size name="empList" id="ItemDetailsSize" />
								<input type="hidden" name="empList" id="lSize" value='<bean:write name="ItemDetailsSize" />'>
								<logic:iterate name="empList" id="empList" indexId="ndx">
									<tr id='<bean:write name="ndx" />$$'
									onclick="setRowId('<bean:write name="empList" property="employeeID" />','<bean:write name="ndx" />$$');"
									ondblclick="showEdit('<bean:write name="empList" property="employeeID" />');">					
										<td style="font-size:1em;">
											<bean:write name="empList" property="employeeID" />
										</td>
										<td style="font-size:1em;">
											<bean:write name="empList" property="fname" />
										<td style="font-size:1em;">
											<bean:write name="empList" property="city"/>
										</td>
										<td style="font-size:1em;">
											<bean:write name="empList" property="state"/>
										</td>
										<td style="font-size:1em;">
											<bean:write name="empList" property="zip"/>
										</td>
										<td style="font-size:1em;">
											<bean:write name="empList" property="email"/>
										</td>
										<td style="font-size:1em;">
											<bean:write name="empList" property="doa" />
										</td>
										<td style="font-size:1em;">
											<a href='manageemployee.do?act=edit&eid=<bean:write name="empList" property="employeeID"/>'>
												<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Edit" title="Edit">
											</a>
										</td>
										<logic:equal name="empList" property="type" value="1">
										<td style="font-size:1em;">
											<a href='javascript:terminateEmployee(<bean:write name="empList" property="employeeID"/>)'>
												<img src="<bean:write name="path" property="pathvalue"/>/images/delete.png" alt="Terminate" title="Terminate">
											</a>
										</td>
										</logic:equal>
										<logic:equal name="empList" property="type" value="0">
										<td style="font-size:1em;">
											<a href='javascript:deleteEmployee(<bean:write name="empList" property="employeeID"/>)'>
												<img src="<bean:write name="path" property="pathvalue"/>/images/delete.png" alt="Delete" title="Delete">
											</a>
										</td>
										</logic:equal>
									</tr>
								</logic:iterate>			
							</logic:notEmpty>
						</logic:present>
					</tbody>
				</table>
			</div>
			<div align="center" style="font-size:1em;">
				<a href="javascript:history.go(-1)">Back</a>
			</div>
</div>
</div>
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
<form><input type="hidden" name="eid" id="eid"> <input type="hidden"
	name="act" id="act"> <input type="hidden" name="type" id="type"></form>
</body>
</html>
<script type="text/javascript">
function setRowId(rowId,rid){
	
	size=document.getElementById("lSize").value;
rowValue= rid.replace('$$','');
rowValue++;
	for(i=0;i<size;i++){
		 document.getElementById(i+"$$").classList.remove('draft');		
		 if(i%2==0){		
			 if(size !=(i+1)){
			 document.getElementById((i+1)+"$$").classList.add('odd');
			 }
		 }
	}
	if(rowValue%2==0){ 	
		document.getElementById((rowValue-1)+"$$").classList.remove('odd'); 		
	}
	var rd = document.getElementById(rid).classList.add('draft');
	
	document.getElementById("rowONum").value=rowId;
}

</script>