<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%-- <html lang="en"> --%>
<html>
<head>
	<title><bean:message key="BzComposer.logintitle"/></title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	
  	<%@include file="/include/header.jsp"%>
	<%@ include file="templateHeader.jsp"%>
<%-- <%@include file="/include/headlogo1.jsp"%> --%>
<%
    Cookie[] cookies=request.getCookies();
    String userName = "",remember = "",pass="";
    if (cookies != null) 
    {
        for (Cookie cookie : cookies) 
        {
       	 if(cookie.getName().equals("cookieLoginUser"))
         	userName = cookie.getValue();
       	 else if(cookie.getName().equals("cookieLoginPassword1"))
       		 pass = cookie.getValue();
       	 else if(cookie.getName().equals("cookieRememberMe"))
       		 remember = cookie.getValue();
        } 
	}
%>
</head>
<script type="text/javascript">
$(document).ready(function()
{
	$(function() {
	   /*  $("#userName").attr("placeholder", "Enter Email Address");
	    $("#password").attr("placeholder","Enter Password"); */
		$("#userName").attr("placeholder", "<bean:message key='BzComposer.signin.enteremail'/>");
		$("#password").attr("placeholder","<bean:message key='BzComposer.signin.enterpassword'/>");
	});
$("#rememberMe").change(function()
{
	var isChecked = "<%= remember%>";
	if($(this).prop("checked") == true)
	{

        $("#rememberMe").attr('checked', true);
        isChecked = "on"; 
	}
    else if($(this).prop("checked") == false)
    {

        $("#rememberMe").attr('checked', false);
        isChecked = "off";
	}	
    else
    {

        $("#rememberMe").attr('checked', true);
    }	
	document.LoginForm.rememberMe.value = isChecked;
});
$("#forgotPasswordForm").submit(function(event) {

    /* stop form from submitting normally */
    event.preventDefault();
    $('#forgotPassword-form').modal('show');

    /* get the action attribute from the <form action=""> element */
    var $form = $( this ),
        url = $form.attr( 'action' );
   

    /* Send the data using post with element id name and name2*/
    var posting = $.post( url, { loginID: $('#loginID').val() } );

    /*Alerts the results */
    posting.done(function( data ) {

    }); 
  });
  
});
function loadFormValue()
{
	var user = document.forms[0].userName.value;
	var pass = document.forms[0].password.value;
	var rem = "<%= remember%>";
	document.getElementById("rememberMe").checked = true;

	if(rem == "on")
	{
		document.getElementById("rememberMe").checked = true;
		document.forms[0].userName = userName;
		document.forms[0].password = pass;
		document.forms[0].rememberMe = rem;
	}
	else
	{
		document.getElementById("rememberMe").checked = true;		/*changed from false to true on 18-06-2019*/
		document.getElementById("rememberMe").value = "on";
		document.forms[0].userName.value = "";
		document.forms[0].password.value = "";
	}		
}
	
function formValue1()
{

	/* document.forms[0].rememberMe.checked = false;
	debugger */
	var flag = false;
	var user = $.trim(document.forms[0].userName.value);
	var pass = $.trim(document.forms[0].password.value);
	if(user==""||user==" ")
	{
		showUsernameDialog();
		$("#userName").focus();
		flag = true;
	}
	if(pass==""||pass==" ")
	{
		showPasswordDialog();
		$("#userName").focus();
		flag = true;
	}
	/* if(document.forms[0].userName.value == "test" && document.forms[0].password.value == "test")
	{
		debugger
		alert("Redirect to dashboard for standard version...");
		document.forms[0].action = "Login.do?tabid=dashboard";
		debugger
		document.forms[0].submit();
		debugger
	} */
	if(!flag)
	{
		document.LoginForm.rememberMe.value = document.LoginForm.rememberMe.value; 
		document.getElementById('actionType').value = $('#rememberMe').val();
		return true;
	}
	else
	{
		event.preventDefault();
		return false;	
	}
}	
function openRegisterPage()
{
	window.location = "Login.do?tabid=register";
}
function redirectToLogin()
{
	window.location = "Login.do?tabid=loginPage";
}
function showUsernameDialog()
{
	debugger;
	event.preventDefault();
	$("#showUsernameDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showPasswordDialog()
{
	debugger;
	event.preventDefault();
	$("#showPasswordDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
<body onload="loadFormValue()">
<html:form action="Login.do?tabid=chkLoginDetailsEmail" method="post" onsubmit="formValue1();">
<h2 class="text-center"></h2>
	<div class="container">
		<div class="card bg-white" style="max-width:500px; margin: 0px auto; margin-top:110px; border-radius: 65px;">
 			<div class="card-body">
				<h2 class="card-title" align="center">
					<bean:message key="BzComposer.signin.title"/>
					<!-- Sign In -->
				</h2>
				<br>
				<div align="center"><html:errors /></div>
				<hr/>
					<br>
		   			<div class="form-group" align="center">
						<!-- <label for="userName" class="">Email address</label> -->				
 						<html:text property="userName" styleId="userName" style="width:250px;" 
 						styleClass="\" autoComplete=\"off" value="<%= userName %>"/>
			 		</div>
		   			<div class="form-group" align="center">
 						<!-- <label for="password" class="">Password:</label> -->		
						<html:password property="password" styleId="password" style="width:250px;" value="<%= pass %>" />
					</div>
			   		<div class="form-group" align="center">
						<html:checkbox property="rememberMe" styleId="rememberMe" value="<%= remember %>">
							&nbsp;
							<bean:message key="BzComposer.signin.rememberme"/>
							<!-- Remember Me -->
						</html:checkbox>
						<%-- <input type="checkbox" id="remember" name="remember" value="<%= remember %>"/> Remember Me --%>
					</div> 
					<div class="form-group" align="center">
						<!-- <a href="http://216.116.104.10/bzcomposerweb2/recover.jsp">
								<span style="cursor: pointer; font-size:13px;">Forgot Password ?
								</span>
							</a> -->
							 <!-- <a href="http://localhost:8080/bzcomposerweb2/recover.jsp"> -->
							 <a href="${pageContext.request.contextPath}/recover.jsp">
								<span style="cursor: pointer; font-size:13px;">
									<bean:message key="BzComposer.signin.forgotpassword"/>
									<!-- Forgot Password ? -->
								</span>
							</a>
					</div>
			   		<div class="form-group bca_loginbtn" align="center">
						<input type="submit"  class="btn btn-primary imgClass" value="<bean:message key='BzComposer.signin.login'/>"/>			
						<!-- <a href="http://localhost:8080/bzcomposerweb2/register.jsp">
								<span style="cursor: pointer; font-size:13px; text-transform: uppercase;margin-left: 10px;">Sign Up
								</span>
							</a> -->
					</div>	
		   		<hr/>
			  </div>
			  <div>
			<input type="hidden" name="actionType" id="actionType" value=""/>
		</div>
		</div>
	</div>
	</html:form>
	<br>
	<%@ include file="/include/footer.jsp"%> 
</body>
</html>
<!-- dialog box that used in this page -->
<div id="showUsernameDialog" style="display:none;">
	<bean:message key="BzComposer.signin.pleaseenterusername"/>	
</div>
<div id="showPasswordDialog" style="display:none;">
	<bean:message key='BzComposer.signin.pleaseenterpassword'/>	
</div>