<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/include/header.jsp"%>
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<link href="<bean:write name="path" property="pathvalue"/>/styles/form.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- For dialog -->
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

<title><bean:message key="BzComposer.addnewcompanystep4title" /></title>
<style type="text/css">
ul, #myUL {
  list-style-type: none;
}
/* Remove margins and padding from the parent ul */
#myUL {
  margin: 0;
  padding: 0;
}
/* Style the caret/arrow */
.caret, .caret2 {
  cursor: pointer; 
  user-select: none; /* Prevent text selection */
}
/* Create the caret/arrow with a unicode, and style it */
.caret::before{
  content: "\25B6";
  color: black;
  display: inline-block;
  margin-right: 6px;
}
/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down::before {
  transform: rotate(90deg); 
}
/* Hide the nested list */
.nested, .nested2 {
  display: none;
  margin-left: 20px;
  padding: 0px;
}

ul.nested li{list-style: circle !important;}
ul.nested li:hover{ background-color: #ccc; color: #000; }
ul.nested2 li:hover{ background-color: #ccc; color: #000; }

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active {
  display: block;
}
</style>
</head>
<body>
<html:form action="CompanyNew.do?tabid=createNewCompany5" method="post">
	<div class="bca_createnewcompanyimgleft">
		<img alt="" src="images/newCompany1.png" height="701px">
	</div>
	
	<!-- dialog box that used in this page -->
	<div id="quitMessage" style="display:none;font-size:1em;">
		<p><bean:message key="bca.quitmessage"/></p>	
	</div>
	
	<div class="bca_createnewcompanyright" style="background-color: #fff;">
		<div class="bca_createnewcompanyright_title">
			<h3><bean:message key="BzComposer.addnewcompanystep4title" /></h3>
		</div>
		<div class="bca_createnewcompanyright_body" style="height: 640px;">
			<div class="bca_creatingchatsofaccounts">
				<div class="bca_bankaccount_left">
					<div class="bca_bankaccounttitle">
						<img src="<bean:write name="path" property="pathvalue"/>/images/folder_open.png" 
						height="20px" width="20px" /> 
						<bean:message key="bca.bankaccounts"/>
					</div>
					<div class="bca_bankaccountlist">
						<%-- <ul id="testul">
						<logic:iterate name="bca_acctcategory" id="objList" indexId="ndx">
							<li id="<bean:write name='objList' property='vAcctCategory_ID' />" 
							onclick="vAcctCategory();"><bean:write name="objList" property="vAcctCategory_Name" />
							</li>
						</logic:iterate>
						</ul> --%>
						<ul id="myUL">
							<logic:iterate name="bca_acctcategory" id="objList" indexId="ndx"> 
								<li class="caret" id="<bean:write name='objList' property='vAcctCategory_ID' />" 
								onclick="vAcctCategory();">
								<bean:write name="objList" property="vAcctCategory_Name" />
									<ul class="nested" id="nested">
							    	</ul>
								</li>
							</logic:iterate>
							  <!-- <li><span class="caret">Beverages</span>
							    <ul class="nested">
							      <li>Water</li>
							      <li>Coffee</li>
							    </ul>
							  </li> -->
							  <!-- <li><span class="caret2">Beverages</span>
							    <ul class="nested2">
							      <li>Water</li>
							      <li>Coffee</li>
							    </ul>
							  </li> -->
						</ul>
					</div>
				</div>	
				<div class="bca_bankaccount_right"> 
					<div class="bca_accountinformationtitle">
						<h2><bean:message key="bca.AccountInformation" /></h2>
					</div>
					<div class="bca_accountinformationbody">
						<table>
							<tbody>
								<tr>
									<td><bean:message key="bca.AccountName" />:</td>
									<td><input type="text" id="accname"></td>
								</tr>
								<tr>
									<td><bean:message key="bca.Category" />:</td>
									<td>
										<select class="selecttest" id="selecttest">
											<logic:iterate name="bca_acctcategory" id="objList" indexId="ndx">
												<option value="<bean:write name='objList' 
												property='vAcctCategory_ID' />" id="combo">
													<bean:write name="objList" property="vAcctCategory_Name" />
												</option>
											</logic:iterate>
										</select>
									</td>
								</tr>
								<tr>
									<td><bean:message key="bca.StartingBalance" />:</td>
									<td><input type="text" value="0"></td>
								</tr>
							</tbody>
						</table>	
						<div class="bca_accountinformationbody_button">
							<a>
								<bean:message key="BzComposer.global.new"/>
							</a>
							<a onclick="add();" id="bca_add">
								<bean:message key="BzComposer.global.add"/>
							</a>
							<a>
								<bean:message key="BzComposer.global.delete"/>
							</a>
						</div>									
					</div>
				</div>
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
				<a class="formbutton" onclick="finish();">
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
	document.forms[0].action = "CompanyNew.do?tabid=createNewCompany5";
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
                $(this).dialog("close");
                window.history.go(-4);
            },
            "<bean:message key='bca.quitmessage.no'/>": function () {
                $(this).dialog("close");
            }
        }
    });
}
</script>	
<script type="text/javascript">
var items = document.querySelectorAll(".bca_bankaccountlist #nested li");
for(var i=0; i< items.length; i++)
{
	items[i].onclick = function(){
		document.getElementById("accname").value = this.innerHTML;
	};
}
</script>
<script>
/* $(".caret").click(function(){
    $(".nested").show();
    this.classList.show("caret-down");
}); */
$('.caret').on('DOMSubtreeModified', function(event) {
    // dos tuff
	 $(".nested").show();
	// this.classList.show("caret-down");
});
/* $(".caret2").click(function(){
    $(".nested2").toggle();
    this.classList.toggle("caret-down");
});
*/
</script>
</body>
</html>