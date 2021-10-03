<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<%@include file="/include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><bean:message key="BizComposer.Configuration.Networking.addUser"/></title>
</head>
<script type="text/javascript">
	
	function checkValidation()
	{
		debugger;
		var uName = $("#userName").val();
		var password1 = $("#password").val();
		var password1Length = $("#password").val().length;
		var password2 = $("#cpwd").val();
		if(uName == "")
		{
			alert("User Name can not be blank.");	
		}
		else if(password1 == "")
		{
			alert("Password can not be blank.")	
		}
		else if(password2 == "")
		{
			alert("Confirm password can not be blank.")
		}
		else if(password1Length < 6)
		{
			alert("Use 6 to 20 character for the new password.Spaces are not allowed")	
		}
		else if(password1 != password2)
		{
			 alert("Password and confirm password does not match");
			 
    		}
		else
		{
			debugger;
			alert("111111111111");
			document.forms['addnewuser'].action = "Configuration.do?tabid=addNewUser";
        	document.forms['addnewuser'].submit();
        	alert("222222222222");
        	closeMe();
				/* event.preventDefault();
				$("#showsaverecorddialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				        	"<bean:message key='BzComposer.global.ok'/>": function () {
				        	document.forms['addnewuser'].action = "Configuration.do?tabid=addNewUser";
				        	document.forms['addnewuser'].submit();
				        	//closeMe();
				        	 //$(this).dialog("close");
				        	
				        	 
								//$('form').submit();
				            },
				            "<bean:message key='BzComposer.global.cancel'/>": function () {
				                $(this).dialog("close");
				                return false;
				            }
				        }
				    }); */
				    alert("3333333333");
			alert("Add New User");
			//closeMe();
			//window.location.href= "Configuration.do?tabid=addNewUser&uName="+uName+"&password1="+; */
			/* document.forms['addnewuser'].action = "Configuration.do?tabid=addNewUser";
    		document.forms['addnewuser'].submit(); */
			/* document.getElementById("addUserNameAndPassword").style.display = "none";
			document.getElementById("addModuleAccessForUser").style.display = "block";
			document.getElementById("finish").style.display = "block";
			
			document.getElementById("back").style.display = "block";
			$("#next").attr('readnoly',false); */
		}
	}
	function closeMe()
	{
		debugger;
		window.location.href= "Configuration.do?tabid=config04&&tab=tr4";
	    //window.opener = self;
	   // window.close();
	   
	    
	}
	function backToDivFirst()
	{
		document.getElementById("addUserNameAndPassword").style.display = "block";
		document.getElementById("addModuleAccessForUser").style.display = "none";
		document.getElementById("finish").style.display = "none";
		
		$("#next").attr('readonly',true);
		//$("#finish").style('display','none');
	}
	
	function submitForm()
	{
		alert("Inside submitForm function");
	}
	
	function showHelp()
	{
		alert("Not yet supported.It is in working phase.");
	}
	
	function closeWindow()
	{
		window.close();
	}
</script>
<body>
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post" styleId="addnewuser">
<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<div>
							<div id="table-negotiations">
								<table>
									<tr>
										<td style="width:auto; height:auto;">
											<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/bzcomposer logo3.gif' style="display:block" />
										</td>
										<td colspan="3">
											<div id="addUserNameAndPassword" style="display: block; width: 550px;">
												<table>
													<tr height="30px;">
														<th colspan="2" align="left">
															<bean:message key="BizComposer.Configuration.Networking.userNameAndPassword"/>
														</th>
													</tr>
													<tr height="30px;">
														<th colspan="2" align="left">
															<bean:message key="BizComposer.Configuration.Networking.provideUserNameAndPassword"/>
														</th>
													</tr>
													<tr height="30px;">
														<td>
															<bean:message key="Bizcomposer.userName"/>
														</td>
														<td>
															<input type="text" name="userName" id="userName" style="width:200px;">
														</td>
													</tr>
													<tr height="30px;">
														<td>
															<bean:message key="Bizcomposer.password"/>
														</td>
														<td>
															<input type="password" name="userpassword" id="password" style="width:200px;">
														</td>
													</tr>
													<tr height="30px;">
														<td>
															<bean:message key="Bizcomposer.confirmPassword"/>
														</td>
														<td>
															<input type="password" id="cpwd" style="width: 200px;">
														</td>
													</tr>						
												</table>
											</div>
											<div id="addModuleAccessForUser" style="display: none; width: 550px;">
												<table>
													<tr height="30px;">
														<th colspan="2" align="left">
															<bean:message key="BizComposer.Configuration.Networking.moduleAccessForUser"/>
														</th>
													</tr>
													<tr height="30px;">
														<th colspan="2" align="left">
															<bean:message key="BizComposer.Configuration.Networking.selectGroupForAccessPermissions"/>
														</th>
													</tr>
													<tr height="30px;">
														<td width="120px;">
															<bean:message key="Bizcomposer.groupName"/>
														</td>
														<td colspan="2">
															<select id="groupName" style="width:280px;">
																<option></option>
															</select>
														</td>
													</tr>
													<tr>
														<td></td>
														<td>
															<button type="button" id="viewGroupPermissions" class="formButton" value="viewGroupPermissions">
																<bean:message key="BizComposer.Configuration.Networking.viewGroupPermissions"/>
															</button>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
								<table>
									<tr>
										<td style="width:15%;">
											<input type="button" class="formButton" id="back" readonly="readonly" value="Back" onclick="backToDivFirst()">
										</td>
										<td style="width:15%">
											<input type="button" class="formButton" id="next" value="Next" onclick="checkValidation()">
										</td>
										<td style="width: 15%;">
											<input type="button" class="formButton" id="finish" value="Finish" readonly="readonly" style="display:none;" onclick="submitForm()">
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td style="width:20%"></td>
										<td style="width: 15%;">
											<input type="button" class="formButton" id="help" value="Help" onclick="showHelp()">
										</td>
										<td style="width: 15%;">
											<input type="button" class="formButton" id="cancel" value="Cancel" onclick="closeWindow()">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <input type="hidden" name="tabid" id="tabid" value="" /> -->
	</html:form>
</body>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>