<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> --%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>
	<bean:message key="BzComposer.welcomescreentilte"/>
</title>
<%@include file="/include/headlogo2.jsp"%>

<!-- for opening dialog these files added on 26-09-2019 -->
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

<style type="text/css">
.bca_create
{
	text-align: right;
	margin-top: 12%;
    margin-left: 30px;
    margin-right: 30px;
}
/*formbutton class is added on 17-06-2019*/
.formbutton
{
	background-position: 0px 0px;
background-repeat: no-repeat;
/* width: 70px; */
/* height: 30px; */
border: 0px;
overflow: hidden;
/* text-indent: -9999px; */
background-color: #05A9C5 ;
color: white !important;
cursor: pointer;
padding: 5px;

border-radius: 2px;
}
</style>
<script type="text/javascript">
	function assignRole()
	{
		debugger;
		<%-- var role = '<%= request.getAttribute("Role")%>';
		//alert("Role is:"+role);
		if(role == "Admin" || role =="Super Admin")
		{
			$("#selectedRetailCompanyId").show();
		}
		else
		{
			$("#selectedRetailCompanyId").hide();
		} --%>
	}
</script>
<!-- <meta charset="ISO-8859-1"> -->
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body onload="assignRole();">
<html:form action="Login.do" method="post">
<div class="container">
<div class="bca_welcomescreen">
<!-- <div style="float: left; width: 100%;" class="loginheader">
	<img alt="companyLogo" src="images/bzcomposerweb2.png"/>
</div> -->
<div class="bca_login_body" style="background-image: url('images/welcome_screen.gif'); background-repeat: no-repeat;">
	<!-- <ul class="bca_create"> -->
			<%-- <logic:iterate name="acList" id="objList1" indexId="ndx">
				<li><a href="#"><bean:write name="objList1"
							property="companyName" /></a></li>
			</logic:iterate> --%>
			<!-- Commented on 17-06-2019 --> 
			<%-- <select size="4" id="selectedRetailCompanyId" onclick="readOnlyNonRetailCompanyList()">
			<logic:present name="acList">
			<logic:iterate name="acList" id="objList1" indexId="ndx"><option value='<bean:write name="objList1" property="companyid"/>'><a href="#"><bean:write name="objList1" property="companyName" /></a></option></logic:iterate>
			</logic:present>
			</select> --%>
		<!-- </ul> -->
	<ul>
		<select size="4" id="selectedRetailCompanyId" onclick="readOnlyNonRetailCompanyList()" ondblclick="dblclickcompany()">
			<logic:present name="acList">
				<logic:iterate name="acList" id="objList1" indexId="ndx">
					<option value='<bean:write name="objList1" property="companyid"/>'>
						<a href="#"><bean:write name="objList1" property="companyName" /></a>
					</option>
				</logic:iterate>
			</logic:present>
		</select>
	</ul>
	<!-- This div is for open,delete and create company -->
	<div class="bca_create_view_company_right">
		<ul>
			<li onclick="openCompany()" style="cursor: pointer;">
				<img alt="" src="images/start_company.gif"><p><bean:message key="bca.OpenSelectedCompany" /></p>
			</li>
			<li onclick="createNewCompany()">
				<%-- <a href="<bean:write name="path" property="pathvalue"/>/CompanyNew.do?tabid=createNewCompany"> --%>
					<img alt="" src="images/open_company.gif"><p><bean:message key="bca.CreateNewCompany"/></p>
				<!-- </a> -->
			</li>
			<li onclick="deleteCompany()">
				<!-- <a href=""> -->
					<img alt="" src="images/delete_company.gif"><p><bean:message key="bca.DeleteCompany"/></p>
				<!-- </a> -->
			</li>
			<!-- <li><input type="submit">Crete</li> -->
		</ul>
	</div>
	<!-- Div ends -->
	
	<!-- This div is used to display list of user-dedfined companies -->
	<!-- <div class="bca_create_view_company"> -->
	<div class="bca_create">
		<h3>
			<font color="#0099ff"><bean:message key="bca.Create/ViewCompany" /></font>
		</h3>
		<%-- <ul>
				<logic:iterate name="acList2" id="objList1" indexId="ndx">
					<li><a href="#"><bean:write name="objList1" property="companyName" /></a></li>
				</logic:iterate>
			</ul> --%>
			<select size="10" style="width: 10%;text-align: center;" id="selectedNonRetailCompanyId" onclick="readOnlyRetailCompanyList()" ondblclick="dblclickcompany()">
			<logic:present name="acList2">
				<logic:iterate name="acList2" id="objList1" indexId="ndx">
					<option value='<bean:write name="objList1" property="companyid"/>'>
						<bean:write name="objList1" property="companyName" />
					</option>
				</logic:iterate>
			</logic:present>
			</select>
	</div>
</div>
<!-- Div Ends -->
</div>
</div>
</html:form>
<script type="text/javascript">
function dblclickcompany() {
	openCompany();
}
function readOnlyNonRetailCompanyList()
{
	debugger;
	var companyId= $("#selectedRetailCompanyId").val();
	if(companyId!="")
	{
		//$("#selectedNonRetailCompanyId").attr("disabled", true); 
	}
}
function readOnlyRetailCompanyList()
{
	debugger;
	var companyId= $("#selectedNonRetailCompanyId").val();
	if(companyId!="")
	{
		//$("#selectedRetailCompanyId").attr("disabled", true); 
	}
}
/*login create new company*/
function createNewCompany()
{
	document.forms[0].action = "CompanyNew.do?tabid=createNewCompany";
	document.forms[0].submit();
}
function openCompany()
{
	var selectedRetailCompanyId = $("#selectedRetailCompanyId").val();
	var selectedNonRetailCompanyId = $("#selectedNonRetailCompanyId").val();
	if(selectedRetailCompanyId == null)
	{
		companyId = selectedNonRetailCompanyId; 
		companyName =$("#selectedNonRetailCompanyId").find(":selected").text().replace(/\s/g,'');
	}	
	else
	{
		companyId = selectedRetailCompanyId; 
		companyName = $("#selectedRetailCompanyId").find(":selected").text().replace(/\s/g,'');
	}
	if((companyId && companyName) != null)
	{	
		document.forms[0].action = "Login.do?tabid=selectedCompany&selectedCompanyId="+companyId+"&companyName="+companyName;
		document.forms[0].submit();
	}	
	else
	{
		alert("<bean:message key='BzComposer.welcomescreen.selectcompany'/>");
	}
	selectedRetailCompanyId = null;
	selectedNonRetailCompanyId = null;
	companyId = null;
	companyName = null;
}
function deleteCompany()
{
	//var selectedRetailCompanyId = $("#selectedRetailCompanyId").val();
	var selectedNonRetailCompanyId = $("#selectedNonRetailCompanyId").val();
	/*if(selectedNonRetailCompanyId == null)
	 {
		companyId = selectedNonRetailCompanyId; 
		//companyName =$("#selectedNonRetailCompanyId").find(":selected").text().replace(/\s/g,'');
	}	
	else
	{
		companyId = selectedRetailCompanyId; 
		//companyName = $("#selectedRetailCompanyId").find(":selected").text().replace(/\s/g,'');
	} */
	companyId = selectedNonRetailCompanyId;
	//alert("companyId"+companyId);
	if(companyId  != null)
	{	
		window.location.href= "Login.do?tabid=DeleteCompany&&CompanyID="+companyId;
		//document.forms[0].submit();
	}	
	else
	{
		alert("<bean:message key='BzComposer.welcomescreen.selectcompany'/>");
	}
}
</script>
</body>
</html>