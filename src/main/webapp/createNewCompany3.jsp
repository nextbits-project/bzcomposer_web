<%@ page contentType="text/html;charset=UTF-8" %>
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
<title>
	<bean:message key="BzComposer.addnewcompanystep3title" />
</title>
</head>
<script type="text/javascript">
function init() {
	debugger;
	var  value =  document.getElementById("iCountry").value;
	if(value == 39){
		$("#stateRow").hide();
		$("#ProvinceRow").show();
	}else{
		$("#stateRow").show();
		$("#ProvinceRow").hide();
	}
}
function refreshItemsNow(val){
	debugger;
	var  value =  document.getElementById("iCountry").value;
		if(value == 39){
			$("#stateRow").hide();
			$("#ProvinceRow").show();
		}else{
			$("#stateRow").show();
			$("#ProvinceRow").hide();
		} 
	}
</script>
<body onload="init();">
<html:form action="CompanyNew.do?tabid=createNewCompany4" method="post">
	<div class="bca_createnewcompanyimgleft">
		<img alt="" src="images/newCompany1.png" height="701px">
	</div>
	
	<!-- dialog box that used in this page -->
	<div id="quitMessage" style="display:none;font-size:1em;">
		<p><bean:message key="bca.quitmessage"/></p>	
	</div>
	
	<div class="bca_createnewcompanyright" style="background-color: #fff;">
		<div class="bca_createnewcompanyright_title">
			<h3><bean:message key="BzComposer.addnewcompanystep3title" /></h3>
		</div>
		<div class="bca_createnewcompanyright_body" style="height: 640px;">
			<h4 style="width: 30%; margin-top: 20px;">
				<b><bean:message key="bca.Pleaseprovidethefollowinginformationforyourcompany" /></b>
			</h4>
			<h4 style="width: 50%; margin-top: 20px;">
				<b><bean:message key="bca.Fieldsmarkedwitharecompulsory" /></b>
			</h4>
			<div class="bca_companyInformationForm">
				<table>
					<tbody>
					<%--<div style="color:red;font-size: 18px;">
    						<html:errors/>
    					</div> --%>
						<tr>
							<td><bean:message key="bca.companyname" /></td>
							<%-- <td><input type="text" disabled="disabled" name="companyname" value='<bean:write  name="companyname" />'></td> --%>
							<td>
								<html:text property="companyName" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.CompanyNickName" /></td>
							<!-- <td><input type="text" value="NextBit"></td> -->
							<td>
								<html:text property="sNickName" value="NextBit"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.FirstName" /></td>
							<!-- <td><input type="text" value="jason"></td> -->
							<td>
								<html:text property="sfirstName" value="jason"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.LastName" /></td>
							<!-- <td><input type="text" value="Lee"></td> -->
							<td>
								<html:text property="slastName" value="lee"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.Address1" /></td>
							<!-- <td><input type="text" value="fullerton"></td> -->
							<td>
								<html:text property="sAddress1" errorKey="org.apache.struts.action.ERROR" errorStyleClass="error" value="Fullortone"/>
							</td>
							 <td><html:errors property="sAddress1" /></td>
						</tr>
						<tr>
							<td><bean:message key="bca.Address2" /></td>
							<!-- <td><input type="text"></td> -->
							<td>
								<html:text property="sAddress2"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.City" /></td>
							<!-- <td><input type="text" value="Fullerton"></td> -->
							<td>
								<html:text property="sCity" errorKey="org.apache.struts.action.ERROR" errorStyleClass="error" value="Fullortone"/>
							</td>
							<td><html:errors property="sCity" /></td>
						</tr>
						<tr id="stateRow">
							<td><bean:message key="bca.State" /></td>
							<td>
							<%-- <html:select property="iState">
							<logic:iterate name="acListofStates" id="objList" indexId="ndx">
								<option value="<bean:write name="objList" property="stateId" />"><bean:write name="objList" property="stateName" /></option>
							</logic:iterate>
							</html:select><bean:message key="bca.USOnly" /> --%>
							<html:select property="iState" styleId="iState">
							 <logic:present name="CompanyInfoForm" property="listOfStates"> 
								<logic:iterate name="CompanyInfoForm" id="objList1" property="listOfStates" scope="session">
									<option value="<bean:write name='objList1' property='stateCode' />"><bean:write name="objList1" property="stateCode"/></option>
								</logic:iterate>
							 </logic:present> 
							</html:select>
							</td>
							<!-- <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
							
						</tr>
						<tr id="ProvinceRow">
							<td><bean:message key="bca.Province" /></td>
							<%-- <td><input type="text"><bean:message key="bca.OutsidetheUSOnly" /></td> --%>
							<td>
								<html:text property="sProvince" styleId="sProvince"/>
							</td>
						</tr>
						<tr>
						<td><bean:message key="bca.ZipCode" /></td>
							<td>
								<html:text property="sZip" errorKey="org.apache.struts.action.ERROR" errorStyleClass="error" value="360001"/>
							</td>
							<td><html:errors property="sZip" /></td>
						</tr>
						<tr>
							<td><bean:message key="bca.Country" /></td>
							<td>
							<%-- <html:select property="iCountry">
							<logic:iterate name="acListofCountries" id="objList" indexId="ndx">
								<option value="<bean:write name="objList" property="countryId" />"><bean:write name="objList" property="country" /></option>
							</logic:iterate>
							</html:select> --%>
							<html:select property="iCountry" onchange="refreshItemsNow(this.value);" styleId="iCountry">
							 <logic:present name="CompanyInfoForm" property="listOfCountries"> 
								<logic:iterate name="CompanyInfoForm" id="objList1" property="listOfCountries" scope="session">
									<option value="<bean:write name='objList1' property='countryId' />"><bean:write name="objList1" property="country"/></option>
								</logic:iterate>
							 </logic:present> 
							</html:select>
							</td>
						</tr>
						<%-- <tr>
							<td><bean:message key="bca.Province" /></td>
							<td><input type="text"><bean:message key="bca.OutsidetheUSOnly" /></td>
							<td>
								<html:text property="sProvince" styleId="sProvince"/>
							</td>
						</tr> --%>
						<tr>
							<td><bean:message key="bca.BusinessNumber" /></td>
							<td>
								<html:text property="sPhone1"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.CellPhoneNumber" /></td>
							<td>
								<html:text property="sPhone2"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.Fax" /></td>
							<td>
								<html:text property="sFax1"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.Email" /></td>
							<!-- <td><input type="text" value="nextbits.jason@gmail.com" size="35"></td> -->
							<td>
								<html:text property="sEmail" value="nextbits.jason@gmail.com" size="35" errorKey="org.apache.struts.action.ERROR" errorStyleClass="error"/>
							</td>
							<td><html:errors property="sEmail" /></td>
						</tr>
						<tr>
							<td><bean:message key="bca.Homepage" /></td>
							<td>
								<html:text property="sHomePage"/>
							</td>
						</tr>
						<tr>
							<td><bean:message key="bca.FederalEmployerID" /></td>
							<!-- <td><input type="text"></td> -->
							<td>
								<html:text property="sFID"/>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><bean:message key="bca.StateEmployerID" /></td>
							<!-- <td><input type="text"></td> -->
							<td>
								<html:text property="sSID"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="bca_createnewcompanyright_bottom">
		<ul>
			<li>
				<a onclick="history.back(-1)" class="formbutton">
					<bean:message key="BzComposer.global.goback"/>
				</a>
			</li>
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
				<a class="formbutton" onclick="quit()">
					<bean:message key="BzComposer.global.close"/>
				</a>
			</li>
		</ul>
	</div>
</html:form>
<script type="text/javascript">
function submitform()
{
	document.forms[0].action = "CompanyNew.do?tabid=createNewCompany4";
	document.forms[0].submit();
}
function finish()
{
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
                window.history.go(-3);
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