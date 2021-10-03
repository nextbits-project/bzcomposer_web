<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<title><bean:message key="BzComposer.addnewcompanytitle" /></title>
<%@include file="/include/header.jsp"%>
	<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
	<link href="<bean:write name="path" property="pathvalue"/>/styles/form.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	
	<!-- For dialog -->
	<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />


</head>
<script type="text/javascript">
function init()
		{
		debugger;
		var BusinessTypeId = 1;
		$('select[id="businessTypeId"]').find('option[value="'+BusinessTypeId+'"]').attr("selected",true);
		
		var date = new Date();
		var year = date.getFullYear();
  		document.getElementById("sEnddate1").defaultValue = "12-31-"+year;
		}
		
</script>
<body onload="init();">
<form action="CompanyNew.do?tabid=createNewCompany">
	<div class="bca_createnewcompanyimgleft">
		<img alt="" src="images/newCompany1.png" height="548px">
	</div>
	
	<!-- dialog box that used in this page -->
	<div id="quitMessage" style="display:none;font-size:1em;">
		<p><bean:message key="bca.quitmessage"/></p>	
	</div>
	
	<div class="bca_createnewcompanyright" style="background-color: #fff;">
		<div class="bca_createnewcompanyright_title">
			<h3><bean:message key="bca.CreateNewCompany" /></h3>
		</div>
		<div class="bca_createnewcompanyright_body">
			<h4><bean:message key="bca.PleaseEnterFollowingInformation" /></h4>
			<div class="bca_formControl1">
				<p style="margin-bottom: 0px;"><bean:message key="bca.NewCompanyName" /></p>
				<html:text property="companyName"/>
				<%-- <html:text property="companyName"/> --%>
				<html:errors />
				<%-- <br/>
				<br/>
				<html:checkbox property="connenctasNetworkClient"/>
					<bean:message key="bca.ConnenctasNetworkClient" />
				<br/>
				<br/> --%>
				<%-- <p style="margin-top: 0px;">
					<bean:message key="bca.Thisoptionallowsyoulogcompanyprofileremoteserver" />
				</p> --%>
				<%-- <div class="bca_companyConnectMode">
					<h4><bean:message key="bca.ConnectionMode" /></h4>
				 	<ul>
			 		<li>
			 				<input type="radio" value="Single Mode" name="mode">
			 					<bean:message key="bca.SingleMode" /> 
		 					<br/> 
		 					<bean:message key="bca.ConnectasaSoleuser" />
	 					</li>
			 			<li>
			 				<input type="radio" value="Single Mode" name="mode">
			 					<bean:message key="bca.MultiUserMode" /> 
		 					<br/> 
		 					<bean:message key="bca.Connectasaoneofmanyuser" /> 
	 					</li>
				 		<li>
				 			<html:radio property="multiMode" value="0">
				 				<bean:message key="bca.SingleMode" /> 
				 				<br/> 
				 				<bean:message key="bca.ConnectasaSoleuser" />
			 				</html:radio>
		 				</li>
				 		<li>
				 			<html:radio property="multiMode" value="1">
				 				<bean:message key="bca.MultiUserMode" /> 
				 				<br/> 
				 				<bean:message key="bca.Connectasaoneofmanyuser" />
			 				</html:radio>
		 				</li>
				 	</ul>
				 </div> --%>
			</div>
			<div class="bca_formControl2">
				<p><bean:message key="bca.ThisOptionallowsyoutosetDefaultsettingofExistingCompany" /></p>
				<div class="bca_combos">
					<ul>
						<%-- <li>
							<bean:message key="bca.ExistingCompanies" />
						<html:select property="companyID">
							<html:option value="1">1</html:option>
								<logic:present name="acList">
									<logic:iterate name="acList" id="objList" indexId="ndx">
										<html:option value="<bean:write name='objList' property='companyID'/>">
											<bean:write name="objList" property="companyName" />
										</html:option>
									</logic:iterate>
								</logic:present>
							</html:select>
							<html:select property="companyID">
								<html:option value="1">1</html:option>
								 <logic:present name="CompanyInfoForm" property="listOfExistingCompanies"> 
									<logic:iterate name="CompanyInfoForm" id="objList1" property="listOfExistingCompanies" scope="session">
										<html:option value="<bean:write name='objList1' property='moduleName' />">
												<bean:write name="objList1" property="moduleName" />,
												<bean:write name='objList1' property='moduleID' />
											</html:option>
										<option value="<bean:write name='objList1' property='companyID' />">
											<bean:write name="objList1" property="companyName" />
										</option>
									</logic:iterate>
								 </logic:present> 
							</html:select>
						</li> --%>
						<%-- <li>
							<bean:message key="bca.DefaultSettingPage" />
						<html:select property="startModuleID">
								<logic:iterate name="acList2" id="objList" indexId="ndx">
									<option value="<bean:write name='objList' property='startModuleID' />">
										<bean:write name="objList" property="moduleName" />
									</option>
								</logic:iterate>
							</html:select>
							<html:select property="startModuleID">
								<logic:present name="CompanyInfoForm" property="listOfdefaultmodules"> 
									<logic:iterate name="CompanyInfoForm" id="objList1" property="listOfdefaultmodules" scope="session">
										<html:option value="<bean:write name='objList1' property='moduleName' />">
												<bean:write name="objList1" property="moduleName" />,
												<bean:write name='objList1' property='moduleID' />
											</html:option>
										<option value="<bean:write name='objList1' property='moduleID' />">
											<bean:write name="objList1" property="moduleName" />
										</option>
									</logic:iterate>
							 	</logic:present> 
							</html:select>
						</li> --%>
						<li>
							<bean:message key="bca.BusinessType" />
						<%--<html:select property="businessTypeId">
								<logic:iterate name="acList3" id="objList" indexId="ndx">
									<option value="<bean:write name='objList' property='businessTypeId' />">
										<bean:write name="objList" property="businessName" />
									</option>
								</logic:iterate>
							</html:select> --%>
							<html:select property="businessTypeId" styleId="businessTypeId">
								 <logic:present name="CompanyInfoForm" property="listOfBusinessType"> 
									<logic:iterate name="CompanyInfoForm" id="objList1" property="listOfBusinessType" scope="session">
									<option value="<bean:write name='objList1' property='businessTypeId' />"><bean:write name="objList1" property="businessName" /></option>
									</logic:iterate>
								 </logic:present> 
							</html:select>
						</li>
					</ul>
				</div>
				<div class="bca_companyConnectMode">
					<h4><bean:message key="bca.EnterStrat/EndDate" /></h4>
				 	<p>
				 		<bean:message key="bca.Thestartdateisthedateyouchoosetobegintrackingyourbusiness" />
			 		</p>
				 	<ul>
				 		<%-- <li>
				 			<bean:message key="bca.StartDate" />
			 				<html:text property="sStartDate" size="15"/>
		 					<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
		 					onclick="displayCalendar(document.CompanyInfoForm.sStartDate,'mm-dd-yyyy',this);">
		 				</li> --%>
			 			<li>
			 				<bean:message key="bca.TaxYearEndingDate" />
		 					<html:text property="sEndDate" size="15" styleId="sEnddate1"/>
		 					<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
		 					onclick="displayCalendar(document.CompanyInfoForm.sEndDate,'mm-dd-yyyy',this);">
	 					</li>
				 	</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="bca_createnewcompanyright_bottom">
		<ul>
			<!-- <li><button class="formbutton">Back</button></li> -->
			<li>
				<a class="formbutton" onclick="submitform();">
					<bean:message key="BzComposer.global.next"/>
				</a>
			</li>
			<li>
				<a class="formbutton" onclick="finish()">
					<bean:message key="BzComposer.global.finish"/>
				</a>
			</li>
			<li>
				<a class="formbutton" onclick="quit();">
					<bean:message key="BzComposer.global.close"/>
				</a>
			</li>
		</ul>
	</div>
</html:form>
<script type="text/javascript">
function submitform()
{
	document.forms[0].action = "CompanyNew.do?tabid=createNewCompany3";
	document.forms[0].submit();
}
function finish() {
	document.forms[0].action = "CompanyNew.do?tabid=finish3";
	document.forms[0].submit(); 
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
                history.back(-1);
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