<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<%@include file="/include/header.jsp"%>
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<link href="<bean:write name="path" property="pathvalue"/>/styles/form.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- For dialog -->
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

<title><bean:message key="BzComposer.addnewcompanystep9title" /></title>
</head>
<body>
<html:form action="CompanyNew.do?tabid=finish3" method="post">
<div class="bca_createnewcompanyimgleft">
	<img alt="" src="images/newCompany1.png" height="701px">
</div>
<div class="bca_createnewcompanyright" style="background-color: #fff;">
<div class="bca_createnewcompanyright_title">
	<h3><bean:message key="BzComposer.addnewcompanystep9title" /></h3>
</div>
<!-- dialog box that used in this page -->
<div id="quitMessage" style="display:none;font-size:1em;">
	<p><bean:message key="bca.quitmessage"/></p>	
</div>
<div class="bca_createnewcompanyright_body" style="height: 640px;">
	<h1>
		<b>Completing the Company <br/> Setup Wizard</b>
	</h1>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p>Your new company profile is being created. Please be patience.</p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p>Click Finish to complete wizard.</p>
</div>	
</div>
<div class="bca_createnewcompanyright_bottom">
	<ul>
		<li><a onclick="history.back(-1)" class="formbutton"><bean:message key="BzComposer.global.goback"/></a></li>
		<li><a class="formbutton" onclick="submitform();"><bean:message key="BzComposer.global.finish"/></a></li>
		<li><a class="formbutton" onclick="quit();"><bean:message key="BzComposer.global.close"/></a></li>
	</ul>
</div>
</html:form>	
<script type="text/javascript">
function submitform()
{
	if(confirm("Do You want to save company?"))
	{	
		document.forms[0].action = "CompanyNew.do?tabid=finish3";
		document.forms[0].submit();
	}	 
}
function quit(){
	$("#quitMessage").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
        	"<bean:message key='bca.quitmessage.yes'/>": function () {
                $("#quitMessage").dialog("close");
                window.history.go(-9);
            },
            "<bean:message key='bca.quitmessage.no'/>": function () {
                $("#quitMessage").dialog("close");
                return false;
            }
        }
    });
}
</script>
</body>
</html>