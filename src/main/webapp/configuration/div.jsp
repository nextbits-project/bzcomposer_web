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
<title><bean:message key="BizComposer.Configuration.Title" /></title>
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
</style>

<script type="text/javascript">
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
		alert("Inside getData")
	}
	
	function checkRecords()
	{
		var size = $("#selectedUser option").length;
		if(size>=4)
		{
			alert("BzComposer has reached the maximum number of register user.\nTo continue using BzComposer you must purchase additional license.");
		}
		else
		{
			window.open("Configuration.do?tabid=addNewUser",null,"scrollbars=yes,height=300,width=700,status=yes,toolbar=no,menubar=no,location=no" );
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
		//alert("Selected User:"+user);
	}
</script>
</head>
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA"
	method="post">

	<div id="ddcolortabsline">&nbsp;</div>

	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding">

	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.Confuguration"/>
		</span>
	</div>
	<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" />
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
		<logic:iterate name="Labels" id="lbl" indexId="index">
			<input type="hidden" id='<bean:write name="index" />lid'
				name='<bean:write name="index" />lidname'
				value='<bean:write name="lbl" property="value" />' />
			<input type="hidden" id='<bean:write name="index" />lname'
				name='<bean:write name="index" />lnm'
				value='<bean:write name="lbl" property="label" />' />
		</logic:iterate>
	</logic:present></div>
	<div id="table-negotiations">
	<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
		<tr>
			<td valign="top"  style="width: 20%;">
			<table>
				<tr>
					<td>

					<div id="table-negotiations"
						style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
					<%@include file="testMenu.jsp" %>
					</div>
					</td>
				</tr>
				<tr align="center">
					<td><input type="button" name="Revoke" class="formButton"
						onclick="RevokeValues();"
						value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
					<input type="button" name="Save" class="formButton"
						onclick="SaveValues();"
						value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
			</td>

			<td valign="top" style="padding-top: 2%;padding-right: 4%;">
			<!-- General -->
			<div id="uName" class="modal" style="height:300px;">
  				<form name="changeUserName&Password">
 					<table border="2" style="width:80%">
 					<tr>
     					<td colspan="2" align="center">
     					<bean:message key="Bizcomposer.configAdmin" /></td>
   					</tr>
   					<tr>
   						<td>
   							<bean:message key="Bizcomposer.userName"/>
   						</td>
   						<td>
   							<html:text property="userName" value="Admin" styleId="modalUserName"></html:text>
   						</td>
   					</tr>
   					<tr>
   						<td>
   							<bean:message key="Bizcomposer.oldPassword"/>
   						</td>
   						<td>
   							<html:password property="password" value="" styleId="modalOldPassword"></html:password>
   						</td>
   					</tr>
   					<tr>
   						<td>
   							<bean:message key="Bizcomposer.newPassword"/>
   						</td>
   						<td>
   							<html:password property="newPassword" styleId="modalNewPassword"></html:password>
   						</td>
   					</tr>
   					<tr>
   						<td>
   							<bean:message key="Bizcomposer.confirmPassword"/>
   						</td>
   						<td>
   							<html:password property="newPassword" styleId="modalConfirmPassword"></html:password>
   						</td>
   					</tr>
   					<tr>
   						<td>
   							<input type="submit" name="Save" id="Save" value='<bean:message key="Bizcomposer.configAdmin"/>' onclick="getData()"/>
   						</td>
   						<td>
   							<a href="#" rel="modal:close">
   								<input type="reset" name="Cancel" id="Cancel" value='<bean:message key="Bizcomposer.cancel"/>'/>
							</a>
   						</td>
					</tr>
    				</table>
   				</form>
   				<br>
			</div>
			<!-- general starts -->
			<div id="general" style="display:none;">
				<div id="tabs" style="height:700px;">
  				<ul>
    				<li><a href="#GeneralSetting"><bean:message key="Bizcomposer.general" /></a></li>
    				<li><a href="#features"><bean:message key="Bzcomposer.features" /></a></li>
    				<li><a href="#orderTemplate"><bean:message key="Bizcomposer.orderTemplate" /></a></li>
  				</ul>
				<div id="GeneralSetting">
					<div id="content1" class="tabPage">
						<table class="table-notifications" width="80%">
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizComposer.Configuration.General" /></th>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.Configuration.Currency" /></td>
								<td><html:select property="currencyID">
									<html:option value="0">Select</html:option>
									<html:option value="1">Baht</html:option>
									<html:option value="2">Bolivar</html:option>
									<html:option value="3">Boliviano</html:option>
									<html:option value="4">Cedi</html:option>
									<html:option value="5">Dihram</html:option>
									<html:option value="6">Dinar</html:option>
									<html:option value="7">Dollar</html:option>
									<html:option value="8">Dong</html:option>
									<html:option value="9">Euro</html:option>
									<html:option value="10">Forint</html:option>
									<html:option value="11">Franc</html:option>
									<html:option value="12">Koruna</html:option>
									<html:option value="13">Krona</html:option>
									<html:option value="14">Krone</html:option>
									<html:option value="15">New Shekal</html:option>
									<html:option value="16">Nuevo Sol</html:option>
									<html:option value="17">Peso</html:option>
									<html:option value="18">Pound</html:option>
									<html:option value="19">Pula</html:option>
									<html:option value="20">Quetzal</html:option>
									<html:option value="21">Rand</html:option>
									<html:option value="22">Real</html:option>
									<html:option value="23">Ringgit</html:option>
									<html:option value="24">Riyal</html:option>
									<html:option value="25">Riyali</html:option>
									<html:option value="26">Rouble</html:option>
									<html:option value="27">Rupee</html:option>
									<html:option value="28">Rupiah</html:option>
									<html:option value="29">Schilling</html:option>
									<html:option value="30">Sucre</html:option>
									<html:option value="31">Won</html:option>
									<html:option value="32">Yen</html:option>
									<html:option value="33">Yuan</html:option>
								</html:select></td>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.Configuration.Weight" /></td>
								<td>
									<html:select property="weightID">
									<html:option value="0">Select</html:option>
									<html:option value="1">Pound</html:option>
									<html:option value="2">Once</html:option>
									<html:option value="3">Kg</html:option>
									<html:option value="4">g</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizComposer.Configuration.AddressLabel" /></th>
							</tr>
							<tr colspan="2">
									<td><bean:message key="BizComposer.Configuration.DefaultLabel" /></td>
									<td><logic:present
										name="Labels">
										<html:select property="defaultLabelID"
											onchange="SetLabelName(this.value);" style="width:200">
											<html:optionsCollection name="Labels" />
										</html:select>
									</logic:present></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="button"
								class="formButton"
								value='<bean:message key="BzComposer.Vendor.PrintLabel.SetupLabel"/>'
								title='<bean:message key="BizComposer.SetupLabelToolTip"/>' />
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizComposer.Configuration.defaultFilter" /></th>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.Configuration.defaultFilter" />:</td>
								<td>
									<html:select property="weightID">
									<html:option value="0">All</html:option>
									<html:option value="1">Custom</html:option>
									<html:option value="2">Today</html:option>
									<html:option value="3">This Month</html:option>
									<html:option value="4">This Quarter</html:option>
									<html:option value="5">This Year</html:option>
									<html:option value="6">1 Year</html:option>
									<html:option value="7">2 Year</html:option>
									<html:option value="8">3 Year</html:option>
									<html:option value="9">This Month-to-Date</html:option>
									<html:option value="10">This Quarter-to-Date</html:option>
									<html:option value="11">This Year-to-Date</html:option>
									<html:option value="12">Last 10 days</html:option>
									<html:option value="13">Last 30 days</html:option>
									<html:option value="14">Last 60 days</html:option>
									<html:option value="15">1 Week</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizCompozer.StartingPageSetting" /></th>
							</tr>
							<tr>
								<td><bean:message key="BizCompozer.StartingPage" />:</td>
								<td>
									<html:select property="weightID">
									<html:option value="0">Customer</html:option>
									<html:option value="1">Inventory</html:option>
									<html:option value="2">Invoice</html:option>
									<html:option value="3">Navifgation Page</html:option>
									<html:option value="4">PO</html:option>
									<html:option value="5">Vendor</html:option>
									</html:select>
								</td>
								</tr>
								<tr>
									<th colspan="2" align="left"><bean:message
									key="Bizcomposer.Dashboard.DefaultSettingText" /></th>
								</tr>
								<tr>
									<td><bean:message key="BizComposer.Configuration.defaultCustomDashboard" />:</td>
									<td align="left">
										<html:checkbox property="productTaxable">
										<bean:message key="BizCompozer.OpenSalesOrder" />
										</html:checkbox>&nbsp;&nbsp;&nbsp;
										<html:checkbox property="productTaxable">
										<bean:message key="BizCompozer.ItemReceived" />
										</html:checkbox>
					<br>
					<html:checkbox property="productTaxable">
						<bean:message
							key="BizCompozer.POBoard" />
						</html:checkbox>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<html:checkbox property="productTaxable">
						<bean:message
							key="BizCompozer.ItemShipped" />
						</html:checkbox>
					</td>
				</tr>
			</table>	
					
					</div>  
				</div>
  				<div id="features">
   					<div id="content2" class="tabPage">	
   					 	<table class="table-notifications" width="80%">
							<tr>
								<th colspan="3" align="left"><bean:message key="bca.Selectthemodulesfromthelist" /></th>
							</tr>
							<tr>
								<td><b><bean:message key="bca.Availablemodules" /></b></td>
								<td>&nbsp;&nbsp;</td>
								<td><b><bean:message key="bca.Selectedmodules" /></b></td>
							</tr>
							<tr>
							<td width="25%">
							<html:select property="selectedModuleId" style="width: 200px; height: 200px;" styleClass="featureName1" multiple="true">
								<logic:present name="configurationForm" property="listOfExistingModules"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingModules" scope="session">
										<option value="<bean:write name='objList1' property='selectedModules' />"><bean:write name="objList1" property="featureName" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>
							</td>
							<td>
								<br><br>
								<a class="addfeature" style="cursor: pointer; border: 1px solid #000; padding: 5px; background-color: #fff ">>></a>
								<br/><br/>
								<a class="removefeature" style="cursor: pointer;border: 1px solid #000; padding: 5px; background-color: #fff "><<</a>
							</td>
							<td>
								<html:select property="selectedModules" style="width: 200px; height: 200px;" multiple="true">
									<%-- <logic:present name="configurationForm" property="listOfExistingselectedModules">
										<logic:iterate name="configuraionForm" id="objList1" property="listOfExistingselectedModules" scope="session">
											<option value="<bean:write name='objList1' property='selectedModules'/>">
												<bean:write name="objList1" property="featureName"/>
											</option>
										</logic:iterate>
									</logic:present> --%>
								</html:select>
							</td>
							</tr>
						</table>
					</div>  
				</div>
   				<div id="orderTemplate">
   					<div id="content3" class="tabPage">
						<table class="table-notifications" width="80%">
							<tr>
								<th colspan="2" align="left">
								<bean:message key="Bizcomposer.importantOrderTemplate" />
								</th>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.templateName" />
								</td>
								<td>
									<html:text property="templateName"></html:text>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.chooseFile"/>
								</td>
								<td>
									<html:file property="fileName" accept=".xls"></html:file>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="2">
									<bean:message key="Bizcomposer.onlyXLS"/>
								</td>
							</tr>
							<tr>
								<td>
									<html:checkbox property="def" >
									</html:checkbox>
									<bean:message key="BizComposer.defChkBox" />
								</td>
							</tr>
								<tr>
									<th colspan="2" align="left">
								<bean:message key="Bizcomposer.fieldsMapping" />
								</th>
								</tr>
								<tr>
									<td><b><bean:message key="Bizcomposer.databaseFieldsName"/> </b></td>
									<td><b><bean:message key="Bizcomposer.mappingFieldsName"/></b></td>
								</tr>
								<tr>
									<td><bean:message key= "Bizcomposer.itemCode"/>*</td>
									<td><html:text property="itemCode"></html:text></td>
								</tr>
								<tr>
									<td><bean:message key = "Bizcomposer.itemName"/></td>
									<td><html:text property="itemName"></html:text></td>
								</tr>
								<tr>
									<td><bean:message key="Bizcomposer.qty"/>*</td>
									<td><html:text property="qty"></html:text></td>
								</tr>
								<tr>
									<td><bean:message key="Bizcomposer.unitPrice"/>*</td>
									<td><html:text property="unitPrice"></html:text></td>
								</tr>
								<tr>
									<td><bean:message key="Bizcomposer.unitWeight"/></td>
									<td><html:text property="weight"></html:text></td>
								</tr>
								<tr>
									<td><bean:message key="Bizcomposer.taxable"/></td>
									<td><html:text property="taxable" value=""></html:text></td>
								</tr>
								<tr>
								<td colspan="2" align="center">
									<input type="button" name="New" value="New"/>&nbsp;&nbsp;
									<input type="button" name="Save" value="Save"/>&nbsp;&nbsp;
									<input type="button" name="Delete" value="Delete"/>
								</td>
								</tr>
						</table>
						<div id="orderTemplateList">
							<table class="table-notifications" width="80%">
								<tr>
									<th colspan="2" align="left">
										<bean:message key="Bizcomposer.orderTemplateList" />
									</th>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</div>	
					</div>  
				</div>	
			</div>

			</div>
			<!-- general ends -->

			<!--  Networking & Security Starts -->
			<div id="nw" style="display:none;">
			<table class="table-notifications" width="80%">
				<tr>
					<th colspan="5" align="left">
						<bean:message key="BizComposer.Configuration.Networking.Administrator" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.Networking.UserName" />
					</td>
					<td>
						<b><bean:message key="BizComposer.Configuration.Networking.UserAdmin"/></b>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.Networking.Password" />
					</td>
					<td>
						<html:password property="password" size="20" maxlength="30" readonly="true"></html:password>
					</td>
					<td>
						<!-- <input type="button" id="changePassword" name="changePassword" value="changePassword" onclick="password();"> -->
						<a href="#uName" rel="modal:open">
							<input type="button" name="changePassword" class="formButton" value='<bean:message key="Bizcomposer.changePassword"/>' />
						</a>
					</td>
				</tr>
				<tr>
					<th colspan="5" align="left">
						<bean:message key="BizComposer.Configuration.swithcUserMode" />
					</th>
				</tr>
				<tr>
					<td colspan="5">
						<html:radio property="multiUserConnection" value="0">
							<bean:message key="BizComposer.Configuration.Networking.SingleUser" />
						</html:radio>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<html:radio property="multiUserConnection" value="1">
							<bean:message key="BizComposer.Configuration.Networking.MultiUser" />
						</html:radio>
					</td>
				</tr>
				<tr>
					<th colspan="5" align="left">
						<bean:message key="BizComposer.Configuration.userList" />
					</th>
				</tr>
				<tr>
					<td >
						<b><bean:message key="BizComposer.Configuration.Networking.UserName" /></b>
					</td>
					<td >
						<b><bean:message key="BizComposer.Configuration.Networking.Password" /></b>
					</td>
					<td >
						<b><bean:message key="BizComposer.Configuration.Networking.Group" /></b>
					</td>
					<td >
						<b><bean:message key="BizComposer.Configuration.Networking.Status" /></b>
					</td>
				</tr>
				<tr>
					<td >
						<html:select property="userName" styleId="selectedUser" multiple="multiple" style="height:100px;" onclick="selectUserData()">
							<logic:present name="configurationForm" property="listOfExistingUserList"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserList" scope="session">
									<option id="<bean:write name='objList1' property='userName' />">
										<bean:write name="objList1" property="userName" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td >
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
					<td >
						<html:select property="groupName" styleId="selectedGroup" multiple="multiple" style="height:100px;">
							<logic:present name="configurationForm" property="listOfExistingUserList"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserList" scope="session">
									<option id="<bean:write name='objList1' property='userName' />">
										<bean:write name="objList1" property="groupName" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td >
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
					<td align="center">
						<input type="button" name="addUser" class="formButton" value="<bean:message key="BizComposer.Configuration.Networking.addUser"/>" style="width:100px;" onclick="checkRecords()"/>
						<br>
						<input type="button" name="saveChanges" class="formButton" value="Save Changes" style="width:100px;"/>
						<br>
						<input type="button" name="deleteUser" class="formButton" value="Delete" style="width:100px;"/>
					</td>
				</tr>
				<tr>
					<th colspan="5" align="left">
						
					</th>
				</tr>
				<tr>
					<td>
						<b><bean:message key="Bizcomposer.groupName"/></b>
					</td>
					<td>
						<b><bean:message key="Bizcomposer.status"/></b>
					</td>
				</tr>
				<tr>
					<td>
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
					<td>
						<html:select property="selectedGroupId" styleId="selectedGroupStatus" multiple="multiple" style="height:100px;weidth:300px;">
							<logic:present name="configurationForm" property="listOfExistingGroup"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingGroup" scope="session">
									<option value="<bean:write name='objList1' property='selectedGroupId' />" onclick="showInActive()" ondblclick="hideInActive()">
										<bean:write name="objList1" property="status" />
									</option>
									<option id="<bean:write name='objList1' property='selectedGroupId' />" hidden="true">
										InActive
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td>
						<input type="button" name="addGroup" class="formButton" value="<bean:message key="BizComposer.Configuration.Networking.addGroup"/>" style="width:100px;" onclick="addNewGroup()"/>
						<br>
						<input type="button" name="saveChanges" class="formButton" value="Save Changes" style="width:100px;"/>
						<br>
						<input type="button" name="deleteUser" class="formButton" value="Delete" style="width:100px;"/>
					</td>
					</tr>
			</table>
			</div>
			<!-- nw Ends -->
			
			<!-- Billing Starts  -->
			
			<div id="billing" style="display:none;">
				<table class="table-notifications" width="80%">
					<tr>
						<th colspan="2" align="left"><bean:message key="Bizcomposer.invoicePrefrence" /></th>
					</tr>
					<tr>
						<td>
							<bean:message key="Bizcomposer.startInvoiceNumber"/>
						</td>
						<td colspan="2" align="center">
							<html:text property="startInvoiceNo" value="1"></html:text>
						</td>
					</tr>
					<tr>
						<th colspan="2" align="left"><bean:message key="Bizcomposer.billingStatementPreference" /></th>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" name="showBillingStatement"><bean:message key="Bizcomposer.showBillingStatement"/>
						</td>
					</tr>
					<tr>
						<td>
							<bean:message key="Bizcomposer.defaultBillingTemplate"/>
						</td>
						<td colspan="2" align="center">
							<html:select property="selectedBillingTypeId" >
					<logic:present name="configurationForm" property="listOfExistingBillingType"> 
						<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBillingType" scope="session">
						<option value="<bean:write name='objList1' property='selectedBillingTypeId' />">
							<bean:write name="objList1" property="billingTypeName" />
						</logic:iterate>
					</logic:present> 
					</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" id="emailToCustomer" name="emailToCustomer"><bean:message key="Bizcomposer.emailToCustomers"/>&nbsp;&nbsp;
							<input type="checkbox" id="printBills" name="printBills"><bean:message key="Bizcomposer.printBills"/>
						</td>
					</tr>
				</table>
			</div>
			<!-- Billing Ends -->

			
			
			<!-- Account&Payment Starts -->
			<div id="accountPayment" style="display:none;" >
			<div id="tabs1" style="height:800px;">
  				<ul>
    				<li><a href="#AccountSetting"><bean:message key="Bizcomposer.accountSetting" /></a></li>
    				<li><a href="#AccountReceivable"><bean:message key="Bizcomposer.accountRecivable" /></a></li>
    				<li><a href="#POPayable"><bean:message key="Bizcomposer.poPayable" /></a></li>
    				<li><a href="#BillingPayable"><bean:message key="Bizcomposer.billingPayable" /></a></li>
  				</ul>
				<div id="AccountSetting">
					<div id="content1" class="tabPage">
   						<!-- add here the content of first tab -->
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left"><bean:message
								key="Bizcomposer.accountSetting" /></th>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.defaultPaymentMethod" /></td>
								<td>
									<html:select property="selectedAccountId" >
										<logic:present name="configurationForm" property="listOfExistingAccounts"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
											<option value="<bean:write name='objList1' property='selectedAccountId' />"><bean:write name="objList1" property="accountName" /></option>
										</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
								<td>
									<bean:message key="Bizcomposer.defaultReceiveType"/>
								</td>
								<td>
									<html:select property="selectedPaymentId" >
										<logic:present name="configurationForm" property="listOfExistingPayment"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
												<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
											</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.defaultCategory" /></td>
								<td>
									<html:select property="selectedCategoryId" >
								<logic:present name="configurationForm" property="listOfExistingCategory"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
										<option value="<bean:write name='objList1' property='selectedCategory' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>
								<td>
									<bean:message key="Bizcomposer.depositTo"/>
								</td>
								<td>
									<html:select property="selectedAccountId" >
										<logic:present name="configurationForm" property="listOfExistingAccounts"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
											<option value="<bean:write name='objList1' property='selectedAccountId' />"><bean:write name="objList1" property="accountName" /></option>
										</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message
								key="Bizcomposer.paymentSchduleSetting" /></th>
							</tr>
							<tr colspan="2">
								<td>
									<html:radio property="needSetUp" value="needSetUp">
									</html:radio>&nbsp;<bean:message key="Bizcomposer.noNeedToSetUp"/>
								</td>
							</tr>
							<tr colspan="2">
								<td>
									<html:radio property="needSetUp" value="needSetUp">
									</html:radio>&nbsp;
									<input type="text" name="days" value="1"/>&nbsp;<bean:message key="Bizcomposer.daysBefore"/>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message
								key="Bizcomposer.reimbursementSettings" />
								</th>
							</tr>
							<tr>
								<td>
									<html:radio property="reimbursementSettings" value="reimbursementSettings">
									</html:radio>&nbsp;<bean:message key="Bizcomposer.timeForPrompt"/>
								</td>
							</tr>
							<tr>
							<td>
								<html:radio property="reimbursementSettings" value="reimbursementSettings">
									</html:radio>&nbsp;<bean:message key="Bizcomposer.dontAddAny"/>
							</td>
							</tr>
							<tr>
								<td>
								<html:radio property="reimbursementSettings" value="reimbursementSettings">
									</html:radio>&nbsp;<bean:message key="Bizcomposer.askWhatToDo"/>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message
								key="Bizcomposer.applyingCharges" /></th>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="financeCharge"/> <bean:message key="Bizcomposer.financeCharge"/>
								</td>
							</tr>
							<tr>
								<td>
								<b><bean:message
								key="BizComposer.chargeRate" /></b></td>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.annualRate"/></td>
								<td>
									<html:text property="annualRate" value=""></html:text>
								</td>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.minimumRate"/></td>
								<td>
									<html:text property="financeCharge" value=""></html:text>
								</td>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.gracePeriod"/></td>
								<td>
									<html:text property="gracePeriodDays" value=""></html:text>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message
								key="Bizcomposer.setBudgetYear" /></th>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.startMonth"/>
								</td>
								<td>
									<html:select property="startMonth">
										<html:option value="January">January</html:option>
										<html:option value="February">February</html:option>
										<html:option value="March">March</html:option>
										<html:option value="April">April</html:option>
										<html:option value="May">May</html:option>
										<html:option value="June">June</html:option>
										<html:option value="July">July</html:option>
										<html:option value="August">August</html:option>
										<html:option value="Septempber">September</html:option>
										<html:option value="October">October</html:option>
										<html:option value="November">November</html:option>
										<html:option value="December">December</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.endMonth"/>
								</td>
								<td>
									<html:select property="endMonth">
										<html:option value="January">January</html:option>
										<html:option value="February">February</html:option>
										<html:option value="March">March</html:option>
										<html:option value="April">April</html:option>
										<html:option value="May">May</html:option>
										<html:option value="June">June</html:option>
										<html:option value="July">July</html:option>
										<html:option value="August">August</html:option>
										<html:option value="Septempber">September</html:option>
										<html:option value="October">October</html:option>
										<html:option value="November">November</html:option>
										<html:option value="December">December</html:option>
									</html:select>
								</td>
							</tr>
					</table>	
				</div>  
		</div>
		
  		<div id="AccountReceivable">
   					<div id="content2" class="tabPage"><!-- add here the content of second tab -->		
   					 	<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left"><bean:message
								key="Bizcomposer.accountSetting" /></th>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.defaultPaymentMethod" /></td>
								<td>
									<html:select property="selectedAccountId" >
										<logic:present name="configurationForm" property="listOfExistingAccounts"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
											<option value="<bean:write name='objList1' property='selectedAccountId' />"><bean:write name="objList1" property="accountName" /></option>
										</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.category" /></td>
								<td>
									<html:select property="selectedCategoryId" >
								<logic:present name="configurationForm" property="listOfExistingCategory"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
										<option value="<bean:write name='objList1' property='selectedCategory' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>
								</td>
								</tr>
								<tr>
								<td>
									<bean:message key="Bizcomposer.defaultReceiveType"/>
								</td>
								<td>
									<html:select property="selectedPaymentId" >
										<logic:present name="configurationForm" property="listOfExistingPayment"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
												<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
											</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
						</table>
					</div>  
				</div>
				<div id="POPayable">
   					<div id="content3" class="tabPage"><!-- add here the content of first tab -->
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left"><bean:message
								key="Bizcomposer.accountSetting" /></th>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.defaultPaymentMethod" /></td>
								<td>
									<html:select property="selectedAccountId" >
										<logic:present name="configurationForm" property="listOfExistingAccounts"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
											<option value="<bean:write name='objList1' property='selectedAccountId' />"><bean:write name="objList1" property="accountName" /></option>
										</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.category" /></td>
								<td>
								<html:select property="selectedCategoryId" >
								<logic:present name="configurationForm" property="listOfExistingCategory"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
										<option value="<bean:write name='objList1' property='selectedCategory' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>
								</td>
								</tr>
								<tr>
								<td>
									<bean:message key="Bizcomposer.defaultReceiveType"/>
								</td>
								<td>
									<html:select property="selectedPaymentId" >
										<logic:present name="configurationForm" property="listOfExistingPayment"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
												<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
											</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
						</table>			
					</div>  
				</div>
				<div id="BillingPayable">
   					<div id="content4" class="tabPage"><!-- add here the content of first tab -->
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left"><bean:message
								key="Bizcomposer.accountSetting" /></th>
							</tr>
							<tr>
								<td><bean:message key="Bizcomposer.category" /></td>
								<td>
									<html:select property="selectedCategoryId" >
								<logic:present name="configurationForm" property="listOfExistingCategory"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
										<option value="<bean:write name='objList1' property='selectedCategory' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>
								</td>
								</tr>
								<tr>
								<td>
									<bean:message key="Bizcomposer.defaultReceiveType"/>
								</td>
								<td>
									<html:select property="selectedPaymentId" styleClass="width:50%" >
										<logic:present name="configurationForm" property="listOfExistingPayment"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
												<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
											</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
								<bean:message key="Bizcomposer.depositTo" />
								</td>
								<td>
									<html:select property="selectedAccountId" >
										<option value=""/>
										<logic:present name="configurationForm" property="listOfExistingAccounts"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
											<option value="<bean:write name='objList1' property='selectedAccountId' />"><bean:write name="objList1" property="accountName" /></option>
										</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
							</tr>
								
						</table>			
					</div>  
				</div>
			</div>	
			</div>
			<!-- Account&Payment Ends -->
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
		<center><html:button property="save" onclick="SaveValues()">Save</html:button>
		<html:cancel>Cancel</html:cancel></center>
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
	if(confirm('<bean:message key="BizComposer.Configuration.SaveConfirm"/>')){
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
	}
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

 
function ChangePassword()
{
	alert("Inside password Method");
} 
</script>
</html>