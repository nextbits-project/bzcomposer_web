<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>
	<bean:message key="BzComposer.accountverifytitle"/>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@include file="/include/header.jsp"%>
<%@include file="/include/logo.jsp"%>
<%@ include file="templateHeader.jsp"%>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<%@ page import="java.util.*"%>
<style type="text/css">
hr {
border: 0;
width: 100%;
color: #f00;
background-color: #05A9C5;
height: 1px;
}
</style>	
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
function openEmailTab()
{
	var givenOTP = $("#verifyOTP").val();
	debugger
	window.location = "Register.do?tab=openEmailCode";
}

function openMobileTab()
{
	window.location = "Register.do?tab=openMobileCode";
}

function checkOTP()
{
	debugger
	var d1 = $("#code1").val();
	var d2 = $("#code2").val();
	var d3 = $("#code3").val();
	var d4 = $("#code4").val();
	var d5 = $("#code5").val();
	var d6 = $("#code6").val();
	
	var enteredOTP = d1+d2+d3+d4+d5+d6;
	var givenOTP = $("#verifyOTP").val();
	debugger
	
	//alert("Entered OTP is:"+enteredOTP+"\nGiven OTP is:"+givenOTP);
	
	if(enteredOTP == "")
	{
		alert("<bean:message key='BzComposer.verifyaccount.enterotp'/>");
		//<bean:message key="BzComposer.verifyaccount.enterotp"/>	will used in showing dialog box.
	}
	else
	{
		window.location = "Register.do?tab=checkOTP&EnteredOTP="+enteredOTP+"&givenOTP="+givenOTP;
	}	
}

function setOTP()
{
	var otp = <%= request.getAttribute("otp") %> ;
	$("#verifyOTP").val(otp);
}

$(document).ready(function()
{
	$("#code1").keyup(function () 
	{
    	if (this.value.length == this.maxLength) 
    	{
      		$(this).next('#code2').focus();
    	}
	});

	$("#code2").keyup(function(e) 
	{
	    if(e.keyCode == 8) 
	    {
	        $(this).prev('#code1').focus();
    	}
	});
	
	$("#code2").keyup(function () 
	{
    	if (this.value.length == this.maxLength) 
    	{
      		$(this).next('#code3').focus();
    	}
	});
	
	$("#code3").keyup(function(e) 
	{
	    if (e.keyCode == 8) 
	    {
      		$(this).prev('#code2').focus();
    	}
	});
	
	$("#code3").keyup(function () 
	{
    	if (this.value.length == this.maxLength) 
    	{
      		$(this).next('#code4').focus();
    	}
	});
	
	$("#code4").keyup(function () 
	{
    	if (this.value.length == this.maxLength) 
    	{
      		$(this).next('#code5').focus();
    	}	
	});

	$("#code4").keyup(function(e) 
	{
	    if (e.keyCode == 8) 
	    {
      		$(this).prev('#code3').focus();
    	}	
	});

	$("#code5").keyup(function () 
	{
    	if (this.value.length == this.maxLength) 
    	{
			$(this).next('#code6').focus();
	    }
	});

	$("#code5").keyup(function(e) 
	{
	    if (e.keyCode == 8) 
	    {
			$(this).prev('#code4').focus();
    	}
	});

	$("#code6").keyup(function(e)
	{
		if(e.keyCode == 8)
		{
    		$(this).prev('#code5').focus();
    	}
	});
});
</script>
</head>
<body onload="setOTP()">
<html:form action="Register.do" method="post">
	 <div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
		
		<div id="table-negotiations" align="center">
			<div align="center">
				<div class="bg-danger">
					<html:errors />
				</div>
			</div> 
			<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
				<tr>
					<td align="center" colspan="4">
						<div class="form-group">
							<span style="font-size: 1.1em; font-weight: normal; color: #01DFD7; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
								<h2>
									<bean:message key="BzComposer.verifyaccount.title"/>
								</h2>
							</span>
							<input type="text" id="verifyOTP" hidden="true">
						</div>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<div class="form-group"> 
							<table cellpadding="0" cellspacing="0" border="0" width="72%">
								<tr>
									<td colspan="3"><hr></td>
								</tr>
								<tr>
									<td colspan="4">
										<div class="form-group">
											<bean:message key="BzComposer.verifyaccount.content"/>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<div class="form-group">
											<bean:message key="BzComposer.verifyaccount.selectmethod"/>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group">
											<!-- <input type="button" name="emailButton" id="emailButton" style="width: 200px;" class="formButton"> -->
											<input type="button" class="formButton" name="Submit" value="<bean:message key='BzComposer.verifyaccount.verifybyemail'/>" onclick="openEmailTab()"/>
										</div>
									</td>
									<td>
										<div class="form-group">
											<!-- <input type="button" name="phoneButton" id="phoneButton" style="width: 200px;" class="formButton">Verify by phone number -->
											<input type="button" class="formButton" name="Submit" value="<bean:message key='BzComposer.verifyaccount.verifubyphone'/>" onclick="openMobileTab()"/>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group">
											<bean:message key="BzComposer.verifyaccount.enterverificationcode"/>
											<span class="inputHighlighted"><bean:message key="BzComposer.CompulsoryField.Validation" /></span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="width: 60px;">
										<div class="form-group">
											<input type="text" id="code1" name="code1" style="width:40px;height:40px;text-align: center;" maxlength="1">
											<input type="text" id="code2" name="code2" style="width:40px;height:40px;text-align: center;" maxlength="1">
											<input type="text" id="code3" name="code3" style="width:40px;height:40px;text-align: center;" maxlength="1">
											<input type="text" id="code4" name="code4" style="width:40px;height:40px;text-align: center;" maxlength="1">
											<input type="text" id="code5" name="code5" style="width:40px;height:40px;text-align: center;" maxlength="1">
											<input type="text" id="code6" name="code6" style="width:40px;height:40px;text-align: center;" maxlength="1">
										</div>
									</td>
									<td>
										<div class="form-group">
											<input type="button" id=continue" name="continue" value="<bean:message key='BzComposer.verifyaccount.continue'/>" class="formButton" onclick="checkOTP()"/>
										</div>	
									</td>
								</tr>
							</table>
						</div>	
					</td>
				</tr>
			</table>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div> 
</html:form>
</body>
</html>