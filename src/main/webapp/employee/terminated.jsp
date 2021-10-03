<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="expires" content="-1">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.terminatedemployeelisttitle"/></title>
<!-- <script> -->
<!-- window.onload = initShowHideDivs; -->
<!-- </script> -->
<script>
function deleteEmployee1(Id)
{	
	document.getElementById("eid").value=Id;
	/* var res=confirm("Do you want to Delete Employee?");
	if(res==true)
	{
	document.forms[0].action = "manageemployee.do?act=delete&eid="+Id;
	document.forms[0].submit();
	} */
	debugger;
	//event.preventDefault();
	$("#deleteEmployeeDialog").dialog({
		resizable: false,
	    height: 200,
	    width: 400,
	    modal: true,
	    buttons: {
			"Ok": function () {
	        	$(this).dialog("close");
	        	/* document.forms[0].action = "manageemployee.do?act=delete&eid="+Id;
	        	document.forms[0].submit(); */
	        	window.location =  "manageemployee.do?act=delete&eid="+Id;
			},
            Cancel: function () {
                $(this).dialog("close");
                return false;
			}
		}
	});
	return false;
}
</script>
<style type="text/css">
.height250 {
height: 400px;

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
<div id="padding">
<!-- begin Contents --> 
<div>
	<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.employee.terminatedemployeelist" />
	</span>
</div>
<br>
<div>
	<div>
		<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
    		<table id="terminatedEmployeeList" class="tabla-listados" cellpadding="0" cellspacing="0">
				<thead style="font-weight: bold;">
					<tr>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.employee.id" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.firstname" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.lastname" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.city" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.state" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.zipcode" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.phone" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.employee.mobile" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.global.email" />
						</th>
						<th style="font-size: 1em;">
							<bean:message key="BzComposer.employee.doa" />
						</th>
						<th class="unsortable" colspan="2" style="font-size: 1em;">
							<bean:message key="BzComposer.employee.options"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<logic:present name="empList" scope="request">
						<bean:size name="empList" id="empListSizeSize" />
							<input type="hidden" name="listSize" id="lSize" value='<bean:write name="empListSizeSize" />'>
								<logic:iterate name="empList" id="empList" scope="request" indexId="ndx">
									<tr id='<bean:write name="ndx" />$$'
									ondblclick="showCustomer('<bean:write name="empList" property="employeeID" />')"
									onclick="setRowId(<bean:write name="empList" property="employeeID" />,'<bean:write name="ndx" />$$');">		
										<td style="font-size: 1em;">
											<bean:write name="empList" property="employeeID" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="fname" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="lname" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="city" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="state" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="zip" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="phone" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="mobile" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="email" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="empList" property="doa" />
										</td>
										<td>
											<a href='manageemployee.do?act=edit&eid=<bean:write name="empList" property="employeeID"/>'>
												<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Edit" title="Edit">
											</a>
										</td>
										<td>
											<a href='javascript:deleteEmployee1(<bean:write name="empList" property="employeeID"/>)'>
												<img src="<bean:write name="path" property="pathvalue"/>/images/delete.png" alt="Delete" title="Delete">
											</a>
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
						</tbody>	
					</table>
					<logic:notPresent name="empList" scope="request">
						<div style="minHeight:800;"><bean:message key="BzComposer.employee.norecordsfound"/></div>
					</logic:notPresent>
				</div>
			</div>
		</div>
<!-- end Contents -->
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
<form><input type="hidden" name="eid" id="eid"> <input type="hidden"
	name="act" id="act" value="delete"> <input type="hidden" name="type"
	id="type" value="hired"></form>
</body>
</html>
<script>
function setRowId(rowId,rid)
{
	
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

setRowId(null, "0$$");
</script>
<!-- Dialog box used in sales order page -->
<div id="deleteEmployeeDialog" style="display:none;">
	<p><bean:message key="BzComposer.employee.deleteselectedemployee"/>Do you want to Delete Employee?</p>
</div>