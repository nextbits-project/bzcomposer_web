<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.networksecuritytitle" /></title>
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- Remember to include jQuery :) -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>  -->

<!-- jQuery Modal -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->

 <style type="text/css">
 /* * {
  padding: 0;
  margin: 5px;
  text-align: center;
} */
.modal {
  display: none; /* Hidden by default */
}
.fonts
{
	font-size: 1.2em;
}
</style>

<script type="text/javascript">
debugger;
var membershipLevel1 = "<%= request.getAttribute("membershipLevel")%>";
if(membershipLevel1 == "Standard"){
	$("#userlistlable11").hide();
	$("#userandpasswordheading").hide();
	$("#userandpassworddata").hide();
}



debugger;
var Role = "<%= request.getAttribute("Role")%>";
//$("#stateRow").hide();
if(Role=='User'){
	$("#userlistlable").hide();
	/* $("#userandpasswordheading").hide();
	$("#userandpassworddata").hide();
	$("#lastline").hide(); */

}else{
}
function adduser1() {
	debugger;
	var membershipLevel = "<%= request.getAttribute("membershipLevel")%>";
	//var size = $("#selectedUser option").length;
	var size = "<%= request.getAttribute("userSize")%>";
	if(membershipLevel == "Standard"){
		if(size>=1){
			debugger;
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	}else if(membershipLevel == "Professional"){
		if(size>=5){
			debugger;
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	}else if(membershipLevel == "Enterprise"){
		if(size>=10){
			debugger;
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	}
	/* if(size>=4){
		debugger;
		return maxnumberofuserdialog();

	}else{
		$('#AddUser').modal('show');
	} */
}
function Deleteuser() {
	debugger;
	var sel = document.getElementById("selectedUser");
	//var selectValue = sel.options[sel.selectedIndex].text;
	if(sel.options[sel.selectedIndex]==null){
		alert("Please Select User");
	}else{
		var selectValue1 = sel.options[sel.selectedIndex].value;
		
		/* ******************************** */
		var formData = $('form').serialize();
		
		$.ajax({
			type : "POST",
			url : "Configuration.do?tabid=deleteUser&selecteduserid="+selectValue1,
			data : formData,
			success : function(data) {
				debugger
				
				$("#showsuccessdialog").dialog({
						resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				        	"<bean:message key='BzComposer.global.ok'/>": function () {
				        		$(this).dialog("close");
				        		window.location.href= "Configuration.do?tabid=config04&&tab=tr4";
				                return false;
				        	},
				            "<bean:message key='BzComposer.global.cancel'/>": function () {
				                $(this).dialog("close");
				                return false;
				            }
			        	}
				});
			},
			error : function(data) {
				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			}
		});
	}
	
}
	function backToDivFirst()
	{
		document.getElementById("addUserNameAndPassword").style.display = "block";
		document.getElementById("addModuleAccessForUser").style.display = "none";
		document.getElementById("finish").style.display = "none";
		
		$("#next").attr('readonly',true);
		//$("#finish").style('display','none');
	}
	function checkValidation()
	{
		
		debugger;
		var uName = $("#userName").val();
		var password1 = $("#password").val();
		var password1Length = $("#password").val().length;
		var password2 = $("#cpwd").val();
		var inputadminpassword = $("#adminpassword").val();
		var AdminPassword = "<%= request.getAttribute("AdminPassword")%>";
		var checkEmailAddress=(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(uName)); 
		if (checkEmailAddress == false)
		{
			alert("Please Enter Valid Email Address");	
		}
		else if(uName == "")
		{
			alert("<bean:message key='BzComposer.common.emailCantBlank'/>");
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
		else if(inputadminpassword != AdminPassword)
		{
			 alert("Please enter valid administrator Password");
			 
			}
		else
		{
				var formData = $('addnewuser1').serialize();
				$.ajax({
        			type : "POST",
        			url : "Configuration.do?tabid=addNewUser&userName="+uName+"&userpassword="+password1,
        			data : formData,
        			success : function(data) {
        				debugger
        				$("#showsuccessdialog").dialog({
        						resizable: false,
        				        height: 200,
        				        width: 500,
        				        modal: true,
        				        buttons: {
        				        	"<bean:message key='BzComposer.global.ok'/>": function () {
        				        		$(this).dialog("close");
        				        		//window.location.href= "Configuration.do?tabid=config04&&tab=tr4";
        				        		window.location.href= "Configuration.do?tabid=config04&&tab=tr4";
        				                return false;
        				        	},
        				            "<bean:message key='BzComposer.global.cancel'/>": function () {
        				                $(this).dialog("close");
        				                return false;
        				            }
    				        	}
        				});
        			},
        			error : function(data) {
        				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        			}
        		});
			
			//window.location.href= "Configuration.do?tabid=addNewUser&uName="+uName+"&password1="+; */
			/* document.forms['addnewuser'].action = "Configuration.do?tabid=addNewUser";
			document.forms['addnewuser'].submit(); */
			/* document.getElementById("addUserNameAndPassword").style.display = "none";
			document.getElementById("addModuleAccessForUser").style.display = "block";
			document.getElementById("finish").style.display = "block";
			
			document.getElementById("back").style.display = "block";
			$("#next").attr('readnoly',false); */
		}
		window.location.href= "Configuration.do?tabid=config04&&tab=tr4";
	}

function toggleFunction() {
	debugger;
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
  }
} 
$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
    $( "#tabs2" ).tabs();
  });

	var funsequence = 0;
	var _1 = navigator.userAgent.toLowerCase();
	var ___ = (_1.indexOf("msie") != -1);
	var ___5 = (_1.indexOf("msie 5") != -1);
	var _io = (_1.indexOf("opera") != -1);
	var _im = (_1.indexOf("mac") != -1);
	var ____gi = (_1.indexOf("gecko") != -1);
	var i____s = (_1.indexOf("safari") != -1);
	var o = null;
	var o22 = null;
	var o33 = null;
	var oEmail = null;
	var oT = null;
	var nm="";
	var r = null;

	function TestConnection(){
		d = new Date();
		var host = document.configurationForm.mailServer.value;
		oEmail = c(CheckEmailConnection);
		oGET(oEmail,'<bean:write name="path" property="pathvalue"/>/include/testMailServerConnection.jsp?HostName='+host+'&Date='+d);
	}
	
	function getData()
	{
		var modalNewPassword = document.getElementById('modalNewPassword').value;
		var modalConfirmPassword = document.getElementById('modalConfirmPassword').value;
		/* if(modalNewPassword == null){
			alert("<bean:message key='BzComposer.common.bothPwdsNotMatch'/>"+ modalNewPassword);
		}else{
			alert("not null"+modalNewPassword);
		window.location.href= "Configuration.do?tabid=ChangeAdministratorPassword&modalNewPassword="+modalNewPassword;
		} */
		window.location.href= "Configuration.do?tabid=ChangeAdministratorPassword&modalNewPassword="+modalNewPassword;
		//changeUserName&Password
		/* var formData = $('form').serialize();
		$.ajax({
			type : "POST",
			url :   "Configuration.do?tabid=ChangeAdministratorPassword&modalNewPassword="+modalNewPassword,
			data : formData,
			success : function(data) {
				$("#showsuccessdialog").dialog({
						resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				        	"<bean:message key='BzComposer.global.ok'/>": function () {
				        		$(this).dialog("close");
				                return false;
				        	},
				            "<bean:message key='BzComposer.global.cancel'/>": function () {
				                $(this).dialog("close");
				                return false;
				            }
			        	}
				});
			},
			error : function(data) {
				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			}
		}); */
	} 
	
	function checkRecords()
	{
		var size = $("#selectedUser option").length;
		if(size>=4)
		{
			debugger;
			return maxnumberofuserdialog();


		}
		else
		{
			window.open("Configuration.do?tabid=NewUser",null,"scrollbars=yes,height=300,width=700,status=yes,toolbar=no,menubar=no,location=no" );
			
		}
	}
	function showInActive()
	{
		var uId = $("#selectedGroupStatus option:selected").val();
		$('select[id="selectedGroupStatus"]').find('option[id="'+uId+'"]').attr("hidden",false);
	}
	
	function addNewGroup()
	{
		window.open("Configuration.do?tabid=addNewGroup",null,"scrollbars=yes,height=800,width=1200,status=yes,toolbar=no,menubar=no,location=no" );
		/*var left = (screen.width/2)-(w/2);
		var top = (screen.height/2)-(h/2);
		window.open("Configuration.do?tabid=addNewGroup",null, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);*/
	}
	
	function hideInActive()
	{
		var uId = $("#selectedGroupStatus option:selected").val();
		$('select[id="selectedGroupStatus"]').find('option[id="'+uId+'"]').attr("hidden",true);
	}
	
	function selectUserData()
	{
		$('select[id="selectedPassword"]').find('option').attr("selected",false);
		$('select[id="selectedGroup"]').find('option').attr("selected",false);
		$('select[id="selectedStatus"]').find('option').attr("selected",false);
		var user = $.trim($("#selectedUser option:selected").text());
		$('select[id="selectedPassword"]').find('option[id="'+user+'"]').attr("selected",true);
		$('select[id="selectedGroup"]').find('option[id="'+user+'"]').attr("selected",true);
		$('select[id="selectedStatus"]').find('option[id="'+user+'"]').attr("selected",true);

	}
</script>
</head>
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA"
	method="post" styleId="form">

	<div id="ddcolortabsline">&nbsp;</div>

	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding">

							<div>
								<span
									style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<bean:message key="BzComposer.configuration.configurationtitle" />
								</span>
							</div>
							<div>
								<div>
									<logic:present name="Labels">
										<bean:size name="Labels" id="size" />
										<input type="hidden" name="lsize" id="lblsize"
											value='<bean:write name="size" />' />
										<logic:iterate name="Labels" id="lbl" indexId="index">
											<input type="hidden" id='<bean:write name="index" />lid'
												name='<bean:write name="index" />lidname'
												value='<bean:write name="lbl" property="value" />' />
											<input type="hidden" id='<bean:write name="index" />lname'
												name='<bean:write name="index" />lnm'
												value='<bean:write name="lbl" property="label" />' />
										</logic:iterate>
									</logic:present>
								</div>
								<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
									<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
									<table cellspacing="0" style="border: 0;width: 100%; overflow-y: scroll;"
										class="section-border">
										<tr>
											<td id="leftMenu" style="position: relative; width: 180px;">
												<table>
													<tr>
														<td>
															<%-- <%@include file="testMenu.jsp" %> --%> <%@include
																file="menuPage.jsp"%> <%-- <div id="table-negotiations"
						style="width: 185px;height:800px;padding-left: 10px;overflow-y:auto;max-height: 1200px;">
					<%@include file="testMenu.jsp" %>
					</div> --%>
					</td>
				</tr>
				<%-- <tr align="center">
					<td><input type="button" name="Revoke" class="formButton"
						onclick="RevokeValues();"
						value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
					<input type="button" name="Save" class="formButton"
						onclick="SaveValues();"
						value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr> --%>
			</table>
			</td>

			<td valign="top" >
			<div id="uName" class="modal" style="height:auto;">
  				<form name="changeUserName&Password">
 					<table border="2" style="width:80%">
 					<tr>
     					<td colspan="2" align="center" style="font-size: 12px; padding: 5px;">
     					<bean:message key="BzComposer.configuration.configadmin"  /></td>
   					</tr>
   					<tr>
   						<td style="font-size: 14px;">
   							<bean:message key="BzComposer.configuration.username"/>:
   						</td>
   						<td style="font-size: 14px;">
   							<html:text property="emailAddress" styleId="modalUserName"></html:text>
   						</td>
   					</tr>
   					<tr>
   						<td style="font-size: 14px;">
   							<bean:message key="BzComposer.configuration.oldpassword"/>:
   						</td>
   						
   						<td style="font-size: 14px;">
   							<html:password property="password" styleId="modalOldPassword"></html:password>
   						</td>
   					</tr>
   					<tr>
   						<td style="font-size: 14px;">
   							<bean:message key="BzComposer.configuration.newpassword"/>:
   						</td>
   						<td style="font-size: 14px;">
   							<html:password property="newPassword" styleId="modalNewPassword"></html:password>
   						</td>
   					</tr>
   					<tr>
   						<td style="font-size: 14px;">
   							<bean:message key="BzComposer.configuration.confirmpassword"/>:
   						</td>
   						<td style="font-size:14px;">
   							<html:password property="newPassword" styleId="modalConfirmPassword"></html:password>
   						</td>
   					</tr>
   					<tr>
   						<td style="font-size:14px;">
   							<input type="submit" name="Save" id="Save" value='<bean:message key="BzComposer.configuration.configadminbtn"/>' onclick="getData()" style="font-size:1em;"/>
   						</td>
   						<td style="font-size:14px;">
   							<a href="#" rel="modal:close">
   								<input type="reset" name="Cancel" id="Cancel" value='<bean:message key="BzComposer.global.cancel"/>' style="font-size:1em;"/>
							</a>
   						</td>
					</tr>
    				</table>
    				
   				</form>
   				<br>
			</div>
			<div id="AddUser" class="modal" style="height:auto;">
  				<form name="addnewuser1">
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
														<%-- <td style="width:auto; height:auto;">
															<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/bzcomposer logo3.gif' style="display:block" />
														</td> --%>
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
																			<bean:message key="BzComposer.contactus.formemail"/>
																		</td>
																		<td>
																			<input type="email" name="userName" id="userName" style="width:200px;">
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
																	<tr height="30px;">
																		<td>
																			
																		</td>
																		<td>
																			
																		</td>
																	</tr>	
																	<tr height="30px;">
																		<td>
																			<bean:message key="Bizcomposer.adminPassword"/>
																		</td>
																		<td>
																			<input type="password"  name="adminpassword" id="adminpassword" style="width: 200px;">
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
															<!-- <input type="button" class="formButton" id="back" readonly="readonly" 
															value="Back" onclick="backToDivFirst()"> -->
															<a href="#" rel="modal:close">
								   								<input class="formButton" type="reset" name="Cancel" id="Cancel" value='Back' style="font-size:1em;"/>
															</a>
														</td>
														<td style="width:15%">
															<a  class="formButton" id="next" onclick="checkValidation()"> Add</a>
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
															<!-- <input type="button" class="formButton" id="cancel" value="Cancel" onclick="closeWindow()"> -->
														<a href="#" rel="modal:close">
								   								<input class="formButton" type="reset" name="Cancel" id="Cancel" value='Cancel' style="font-size:1em;"/>
															</a>
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
   				</form>
   				<br>
			</div>
			<!--  Networking & Security Starts -->
			<div id="nw" style="display:none;">
			<table class="table-notifications" width="80%">
				<tr>
					<th colspan="5" align="left" style="font-size: 14px; padding: 5px;">
						<bean:message key="BzComposer.configuration.administrator" />
					</th>
				</tr>
				<tr>
					<td style="font-size: 14px;">
						<bean:message key="BzComposer.configuration.username" />:
					</td>
					<td style="font-size: 14px;">
						<%-- <b><html:text property="UserName" styleId="UserName"></html:text></b> --%>
						<html:text property="emailAddress"  styleId="UserName" readonly="true"></html:text>
					</td>
				</tr>
				<tr>
					<td style="font-size: 14px;">
						<bean:message key="BzComposer.configuration.password" />
					</td>
					<td style="font-size: 14px;">
						<html:password property="password" size="20" maxlength="30" readonly="true"></html:password>
					</td>
					<td style="font-size:14px;">
						<!-- <input type="button" id="changePassword" name="changePassword" value="changePassword" onclick="password();"> -->
						<a href="#uName" rel="modal:open">
							<input type="button" name="changePassword" class="formButton" value='<bean:message key="Bizcomposer.changePassword"/>' style="font-size: 1em; width:120px;" />
						</a>
					</td>
				</tr>
				<tr>
					<th colspan="5" align="left" style="font-size: 14px; padding: 5px;">
						<bean:message key="BzComposer.configuration.swithcusermode" />
					</th>
				</tr>
				<tr>
					<td colspan="5" style="font-size: 14px;">
						<html:radio property="multiUserConnection" styleId="multiUserConnection"  value="0">
							<bean:message key="BzComposer.configuration.usermode.singleusermode" />
						</html:radio>
					</td>
				</tr>
				<tr>
					<td colspan="5" style="font-size: 14px;">
						<html:radio property="multiUserConnection" styleId="multiUserConnection" value="1">
							<bean:message key="BzComposer.configuration.usermode.multiusermode" />
						</html:radio>
					</td>
				</tr>
				<tr id="userlistlable11">
					<th colspan="5" align="left" style="font-size: 14px; padding: 5px;">
						<bean:message key="BzComposer.configuration.userlist" />
					</th>
				</tr>
				<tr id="userandpasswordheading">
					<td style="font-size: 14px;">
						<b><bean:message key="BzComposer.configuration.username" /></b>
					</td>
					<td style="font-size: 14px;">
						<b><bean:message key="BzComposer.configuration.password" /></b>
					</td>
					<%-- <td style="font-size: 14px;">
						<b><bean:message key="BzComposer.configuration.group" /></b>
					</td> --%>
					<td style="font-size: 14px;">
						<b><bean:message key="BzComposer.configuration.status" /></b>
					</td>
				</tr>
				<tr id="userandpassworddata">
					<td style="font-size: 14px;">
						<html:select property="userName" styleId="selectedUser" multiple="multiple" style="height:100px;" onclick="selectUserData()">
							<logic:present name="configurationForm" property="listOfExistingUserList"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserList" scope="session">
									<option value="<bean:write name='objList1' property='upsUserId' />" id="<bean:write name='objList1' property='upsUserId' />">
										<bean:write name="objList1" property="emailAddress" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td style="font-size: 14px;">
						<html:select property="password" styleId="selectedPassword" multiple="multiple" style="height:100px;">
							<logic:present name="configurationForm" property="listOfExistingUserList"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserList" scope="session">
									<option id="<bean:write name='objList1' property='userName' />">
										<bean:write name="objList1" property="password" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<%-- <td style="font-size: 14px;">
						<html:select property="groupName" styleId="selectedGroup" multiple="multiple" style="height:100px;">
							<logic:present name="configurationForm" property="listOfExistingUserList"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserList" scope="session">
									<option id="<bean:write name='objList1' property='userName' />">
										<bean:write name="objList1" property="groupName" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td> --%>
					<td style="font-size: 14px;">
						<html:select property="status" styleId="selectedStatus" multiple="multiple" style="height:100px;">
							<logic:present name="configurationForm" property="listOfExistingUserList"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserList" scope="session">
									<option id="<bean:write name='objList1' property='userName' />" >
										<bean:write name="objList1" property="status" />
									</option>
									
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td align="center" style="font-size: 14px;">
						<%-- <input type="button" name="addUser" class="formButton" value="<bean:message key="BzComposer.configuration.adduserbtn"/>" 
						style="width:120px;" onclick="checkRecords()"/> --%>
						<input type="button" name="deleteUser" onclick="adduser1();" class="formButton" value="<bean:message key="BzComposer.configuration.adduserbtn"/>" style="width:120px;"/>
						
						<br>
						<input type="button" name="saveChanges" class="formButton" value="<bean:message key="BzComposer.configuration.savechangesbtn"/>" style="width:120px;"/>
						<br>
						<input type="button" name="deleteUser" onclick="Deleteuser();" class="formButton" value="<bean:message key="BzComposer.global.delete"/>" style="width:120px;"/>
					</td>
				</tr>
				<tr id="lastline">
					<th colspan="5" align="left">
						
					</th>
				</tr>
				<%-- <tr>
					<td style="font-size: 14px;">
						<b><bean:message key="BzComposer.configuration.groupname"/></b>
					</td>
					<td style="font-size: 14px;">
						<b><bean:message key="BzComposer.configuration.status"/></b>
					</td>
				</tr>
				<tr>
					<td style="font-size: 14px;">
						<html:select property="selectedGroupId" styleId="selectedGroup1" multiple="multiple" style="height:100px;weidth:300px;">
							<logic:present name="configurationForm" property="listOfExistingGroup"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingGroup" scope="session">
									<option value="<bean:write name='objList1' property='selectedGroupId' />" id="<bean:write name="objList1" property="groupName" />">
										<bean:write name="objList1" property="groupName" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td style="font-size: 14px;">
						<html:select property="selectedGroupId" styleId="selectedGroupStatus" multiple="multiple" style="height:100px;weidth:300px;">
							<logic:present name="configurationForm" property="listOfExistingGroup"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingGroup" scope="session">
									<option value="<bean:write name='objList1' property='selectedGroupId' />" onclick="showInActive()" ondblclick="hideInActive()">
										<bean:write name="objList1" property="status" />
									</option>
									<option id="<bean:write name='objList1' property='selectedGroupId' />" hidden="true">
										<bean:message key="BzComposer.configuration.status.inactive"/>
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td style="font-size: 14px;">
						<input type="button" name="addGroup" class="formButton" value="<bean:message key="BzComposer.configuration.addgroupbtn"/>" style="width:120px;" onclick="addNewGroup()"/>
						<br>
						<input type="button" name="saveChanges" class="formButton" value="<bean:message key="BzComposer.configuration.savechangesbtn"/>" style="width:120px;"/>
						<br>
						<input type="button" name="deleteUser" class="formButton" value="<bean:message key="BzComposer.global.delete"/>" style="width:120px;"/>
					</td>
					</tr> --%>
			</table>
			</div>
			<!-- nw Ends -->
			</td>
			</tr>
	</table>
	<div>
		<html:hidden property="empStateID" />
		<html:hidden property="labelName" /> <html:hidden property="fileName" />
	 </div>
	<div>
		<input type="hidden" name="tabid" id="tid" value="" />
		
	</div>
	</div>
	<div>
			<div align="center">
		<html:button property="save" onclick="SaveValues()" style="font-size: 1em;"><bean:message key="BzComposer.global.save"/></html:button>
		<%-- <html:cancel style="font-size:12px;"><bean:message key="BzComposer.global.cancel"/></html:cancel> --%>
		<input type="reset" name="Cancel" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
<script type="text/javascript">
function SaveValues(){
	debugger;
	/* if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>')){
		document.configurationForm.annualInterestRate.value = wxToFixed(document.configurationForm.annualInterestRate.value,2);
		document.configurationForm.minCharge.value = wxToFixed(document.configurationForm.minCharge.value,2);
		
		document.configurationForm.startInvoiceNo.value = parseInt(document.configurationForm.startInvoiceNo.value);	
		document.configurationForm.startPONum.value = parseInt(document.configurationForm.startPONum.value);
		document.configurationForm.startRINum.value = parseInt(document.configurationForm.startRINum.value);
		document.configurationForm.timeSheet.value = parseInt(document.configurationForm.timeSheet.value);
		
		document.configurationForm.invoiceMemoDays.value = parseInt(document.configurationForm.invoiceMemoDays.value);
		document.configurationForm.overdueInvoiceDays.value = parseInt(document.configurationForm.overdueInvoiceDays.value);
		document.configurationForm.inventoryOrderDays.value = parseInt(document.configurationForm.inventoryOrderDays.value);
		document.configurationForm.billsToPayDays.value = parseInt(document.configurationForm.billsToPayDays.value);
		document.configurationForm.gracePeriod.value = parseInt(document.configurationForm.gracePeriod.value);
		
		performance_value = document.configurationForm.userDefinePerform.value;
		if(document.configurationForm.timeSheet.value <2){
			document.configurationForm.timeSheet.value = 2;
		}
		if(performance_value == "" || parseInt(performance_value) <= 10000 || (!IsNumeric(performance_value))){
			document.configurationForm.userDefinePerform.value = 10001;
			
		}
		document.getElementById('tid').value="SaveConfiguration";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	} */
	
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	            	/* document.configurationForm.annualInterestRate.value = wxToFixed(document.configurationForm.annualInterestRate.value,2);
	        		document.configurationForm.minCharge.value = wxToFixed(document.configurationForm.minCharge.value,2);
	        		
	        		document.configurationForm.startInvoiceNo.value = parseInt(document.configurationForm.startInvoiceNo.value);	
	        		document.configurationForm.startPONum.value = parseInt(document.configurationForm.startPONum.value);
	        		document.configurationForm.startRINum.value = parseInt(document.configurationForm.startRINum.value);
	        		document.configurationForm.timeSheet.value = parseInt(document.configurationForm.timeSheet.value);
	        		
	        		document.configurationForm.invoiceMemoDays.value = parseInt(document.configurationForm.invoiceMemoDays.value);
	        		document.configurationForm.overdueInvoiceDays.value = parseInt(document.configurationForm.overdueInvoiceDays.value);
	        		document.configurationForm.inventoryOrderDays.value = parseInt(document.configurationForm.inventoryOrderDays.value);
	        		document.configurationForm.billsToPayDays.value = parseInt(document.configurationForm.billsToPayDays.value);
	        		document.configurationForm.gracePeriod.value = parseInt(document.configurationForm.gracePeriod.value);
	        		*/
	        		/* performance_value = document.configurationForm.userDefinePerform.value;
	        		if(document.configurationForm.timeSheet.value <2){
	        			
	        			document.configurationForm.timeSheet.value = 2;
	        		}
	        		if(performance_value == "" || parseInt(performance_value) <= 10000 || (!IsNumeric(performance_value))){
	        			document.configurationForm.userDefinePerform.value = 10001;
	        			
	        		}  */
	        		
	        		/* document.getElementById('tid').value="SaveConfiguration";
	        		document.forms[0].action = "Configuration.do";
	        		document.forms[0].submit();  */
					//$('form').submit();
	        		var multiUserConnection = document.configurationForm.multiUserConnection.value;
	            
					var formData = $('form').serialize();
	        		
	        		$.ajax({
	        			type : "POST",
	        			url :  "Configuration.do?tabid=SaveConfiguration&multiUserConnection="+multiUserConnection,
	        			data : formData,
	        			success : function(data) {
	        				debugger
	        				$("#showsaverecorddialog").dialog("close");
	        				$("#showsuccessdialog").dialog({
	        						resizable: false,
	        				        height: 200,
	        				        width: 500,
	        				        modal: true,
	        				        buttons: {
	        				        	"<bean:message key='BzComposer.global.ok'/>": function () {
	        				        		$(this).dialog("close");
	        				                return false;
	        				        	},
	        				            "<bean:message key='BzComposer.global.cancel'/>": function () {
	        				                $(this).dialog("close");
	        				                return false;
	        				            }
        				        	}
	        				});
	        			},
	        			error : function(data) {
	        				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	        			}
	        		});
	            },
	            <bean:message key='BzComposer.global.cancel'/>: function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}

function RevokeValues(){
	document.getElementById('tid').value="config";
	document.forms[0].action = "Configuration.do";
	document.forms[0].submit();
}

function SetLabelName(lblid){
	size = document.getElementById('lblsize').value;
	for(cnt=0;cnt<size;cnt++){
		lid = document.getElementById(cnt+'lid').value;
		if(lblid == lid){
			document.configurationForm.labelName.value =  document.getElementById(cnt+'lname').value;
			break;
		}
	}
}

/* Commented to prevent general alert on 24-11-2019
function ChangePassword()
{
	alert("Inside password Method");
}  */

function maxnumberofuserdialog()
{
	event.preventDefault();
	$("#maxnumberofuserdialog").dialog({
    	resizable: false,
        height: 250,
        width: 800,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="maxnumberofuserdialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.networksecurity.maxnumberofuser"/></p>
</div>
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<!-- Dialog box used in this page -->
<div id="showsuccessdialog" style="display:none;">
	<p>Record updated</p>
</div>