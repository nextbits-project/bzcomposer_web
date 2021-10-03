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

<title><bean:message key="BzComposer.addnewcompanystep5title" /></title>
<style type="text/css">
.active{ background-color: black; color: #fff;}
ul, #myUL {
  list-style-type: none;
}
/* Remove margins and padding from the parent ul */
#myUL {
  margin: 0;
  padding: 0;
}

/* Style the caret/arrow */
.caret, .caret2, .caret3, .caret4, .caret5, .caret6,  .caret7 {
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
.caret2::before, .caret5::before, .caret6::before, .caret7::before {
  content: "\25B6";
  color: black;
  display: inline-block;
  margin-right: 6px;
}
.caret3::before{
  content: "\25B6";
  color: black;
  display: inline-block;
  margin-right: 6px;
}
.caret4::before{
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
.nested, .nested2, .nested3, .nested4, .nested5, .nested6, .nested7  {
  display: none;
  margin-left: 20px;
  padding: 0px;
}

ul.nested li{list-style: circle !important;}
ul.nested2 li{list-style: circle !important;}
ul.nested3 li{list-style: circle !important;}
ul.nested4 li{list-style: circle !important;}
ul.nested5 li{list-style: circle !important;}
ul.nested6 li{list-style: circle !important;}
ul.nested7 li{list-style: circle !important;}

ul.nested li:hover{ background-color: #ccc; color: #000; }
ul.nested2 li:hover{ background-color: #ccc; color: #000; }
ul.nested3 li:hover{ background-color: #ccc; color: #000; }
ul.nested4 li:hover{ background-color: #ccc; color: #000; }
ul.nested5 li:hover{ background-color: #ccc; color: #000; }
ul.nested6 li:hover{ background-color: #ccc; color: #000; }
ul.nested7 li:hover{ background-color: #ccc; color: #000; }

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
	<div class="bca_createnewcompanyright" style="background-color: #fff;">
		<div class="bca_createnewcompanyright_title">
			<h3><bean:message key="BzComposer.addnewcompanystep5title" /></h3>
		</div>
		
		<!-- dialog box that used in this page -->
		<div id="quitMessage" style="display:none;font-size:1em;">
			<p><bean:message key="bca.quitmessage"/></p>	
		</div>
		
		<div class="bca_createnewcompanyright_body" style="height: 640px;">
		<div class="bca_creatingchatsofaccounts">
			<div class="bca_setuppreference_left">
				<div class="bca_bankaccounttitle">
					<img src="<bean:write name="path" property="pathvalue"/>/images/folder_open.png" 
					height="20px" width="20px" /> 
					<bean:message key="bca.preference"/>
				</div>
				<div class="bca_preferencelist">
					<%--<ul id="testul">
							<logic:iterate name="bca_acctcategory" id="objList" indexId="ndx">
								<li id="<bean:write name='objList' property='vAcctCategory_ID' />" 
								onclick="vAcctCategory();">
									<bean:write name="objList" property="vAcctCategory_Name" />
								</li>
							</logic:iterate>
						</ul> --%>
						<ul id="myUL">
							<li class="caret" id="1">
								<bean:message key="bca.terms"/>
								<ul class="nested" id="nested">
									<logic:present name="CompanyInfoForm" scope="session" property="vListTerm_Name">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vListTerm_Name"> 
											<li id='<bean:write name='objList' property="termId"/>'>
												<bean:write name='objList' property="vTerm_Name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
							<li class="caret2" id="2">
								<bean:message key="bca.salesrepresentative"/>
								<ul class="nested2" id="nested">
									<%-- <logic:iterate name="addSalesRep" id="objList" indexId="ndx"> 
									<li id='<bean:write name='objList' property="vSalesRep_ID"/>'><bean:write name='objList' property="vSalesRep_Name"/></li>
									</logic:iterate>  --%>
									<logic:present name="CompanyInfoForm" scope="session" property="vListSalesRepName">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vListSalesRepName"> 
											<li id='<bean:write name='objList' property="vSalesRep_ID"/>'>
												<bean:write name='objList' property="vSalesRep_Name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
							<li class="caret3" id="3">
								<bean:message key="bca.itemcategory"/>
								<ul class="nested3" id="nested">
									<%-- <logic:iterate name="addItemCategory" id="objList" indexId="ndx"> 
									<li id='<bean:write name='objList' property="vItemCategory_Name"/>'><bean:write name='objList' property="vItemCategory_Name"/></li>
									</logic:iterate>  --%>
									<logic:present name="CompanyInfoForm" scope="session" property="vListItemCatName">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vListItemCatName"> 
											<li id='<bean:write name='objList' property="vItemCategory_Name"/>'>
												<bean:write name='objList' property="vItemCategory_Name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
							<li class="caret4" id="4">
								<bean:message key="bca.creditcardtype"/>
								<ul class="nested4" id="nested">
									<%-- <logic:iterate name="initCCType" id="objList" indexId="ndx"> 
									<li id='<bean:write name='objList' property="commonid"/>'><bean:write name='objList' property="name"/></li>
									</logic:iterate>  --%>
									<logic:present name="CompanyInfoForm" scope="session" property="vCCType_Name">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vCCType_Name"> 
											<li id='<bean:write name='objList' property="commonid"/>'>
												<bean:write name='objList' property="name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
							<li class="caret5" id="5">
								<bean:message key="bca.paymenttype"/>
								<ul class="nested5" id="nested">
									<%-- <logic:iterate name="initPaymentType" id="objList" indexId="ndx"> 
									<li id='<bean:write name='objList' property="commonid"/>'><bean:write name='objList' property="name"/></li>
									</logic:iterate>  --%>
									<logic:present name="CompanyInfoForm" scope="session" property="vPaymentType">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vPaymentType"> 
											<li id='<bean:write name='objList' property="commonid"/>'>
												<bean:write name='objList' property="name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
							<li class="caret6" id="6">
								<bean:message key="bca.shipcarrier"/>
								<ul class="nested6" id="nested">
									<%-- <logic:iterate name="shipCarrierType" id="objList" indexId="ndx"> 
									<li id='<bean:write name='objList' property="commonid"/>'><bean:write name='objList' property="name"/></li>
									</logic:iterate>  --%>
									<logic:present name="CompanyInfoForm" scope="session" property="vShipCarrier">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vShipCarrier"> 
											<li id='<bean:write name='objList' property="vShipCarrier_ID"/>'>
												<bean:write name='objList' property="vShipCarrier_Name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
							<li class="caret7" id="7">
								<bean:message key="bca.receivedtypes"/>
								<ul class="nested7" id="nested">
									<%-- <logic:iterate name="masterReceivedTypes" id="objList" indexId="ndx"> 
									<li id='<bean:write name='objList' property="commonid"/>'><bean:write name='objList' property="name"/></li>
									</logic:iterate>  --%>
									<logic:present name="CompanyInfoForm" scope="session" property="vListReceivedType">
										<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vListReceivedType"> 
											<li id='<bean:write name='objList' property="commonid"/>'>
												<bean:write name='objList' property="name"/>
											</li>
										</logic:iterate> 
									</logic:present>
								</ul>
							</li>
						<!--<li><span class="caret">Beverages</span>
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
				<div class="bca_twobutton">
					<ul>
						<li class="bca_setuppreference_add" id="add">
							<bean:message key="bca.addarrows"/>
						</li>
						<li class="bca_setuppreference_remove">
							<bean:message key="bca.removearrows"/>
						</li>
					</ul>
				</div>
				<div class="bca_bankaccount_right" id="bca_initTerm"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.term"/>
						</h2>
					</div>
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td><input type="text" id="caret"></td>
								</tr>
								<tr>
									<td><bean:message key="bca.days"/>:</td>
									<td><input type="text" id="term_day"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- term over -->
				</div>
				<div class="bca_bankaccount_right" id="bca_initSalesRep"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.salesrep"/>
						</h2>
					</div>
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td><input type="text" id="salerep_"></td>
								</tr>				
							</tbody>
						</table>
					</div>
				</div>
				<div class="bca_bankaccount_right" id="bca_initItenCategory"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.itemcategory"/>
						</h2>
					</div>
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td><input type="text" id="itemcate_"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- term over -->
				</div>
				<div class="bca_bankaccount_right" id="bca_initCreditCardType"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.creditcardtype"/>
						</h2>
					</div>
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td><input type="text" id="creditcardtype_"></td>
								</tr>
							</tbody>
						</table>
					</div>	
					<!-- term over -->
				</div>	
				<div class="bca_bankaccount_right" id="bca_initPaymentType"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.paymenttype"/>
						</h2>
					</div>
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td><input type="text" id="initPaymentType_"></td>
								</tr>
								<tr>
									<td><bean:message key="bca.type"/>:</td>
									<td>
										<select id="initPaymentType">
											<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vPaymentType"> 
												<option value="<bean:write name='objList' property="commonid"/>"><bean:write name='objList' property="name"/></option>
											</logic:iterate>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- term over -->
				</div>	
				<div class="bca_bankaccount_right" id="bca_initShipCarrier"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.shipcarrier"/>
						</h2>
					</div>
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td>
										<input type="text" id="initShipCarrier_">
									</td>
								</tr>
							</tbody>				
						</table>				
					</div>
					<!-- term over -->
				</div>	
				<div class="bca_bankaccount_right" id="bca_initReceivedType"> 
					<!-- term -->
					<div class="bca_accountinformationtitle">
						<h2 id="bca_bca_setuppreference_rightbox_title">
							<bean:message key="bca.receivedtypes"/>
						</h2>
					</div>		
					<div class="bca_accountinformationbody">
						<table id="pref_terms">
							<tbody>
								<tr>
									<td><bean:message key="bca.name"/>:</td>
									<td><input type="text" id="initReceivedType_"></td>
								</tr>
								<tr>
									<td><bean:message key="bca.type"/>:</td>
									<td>
										<select id="initReceivedType">
										<%-- <logic:iterate name="masterReceivedTypes" id="objList" indexId="ndx"> 
												<option value="<bean:write name='objList' property="commonid"/>"><bean:write name='objList' property="name"/></option>
											</logic:iterate> --%>
											<logic:present name="CompanyInfoForm" scope="session" property="vListReceivedType">
												<logic:iterate name="CompanyInfoForm" id="objList" indexId="ndx" property="vListReceivedType"> 
													<option value="<bean:write name='objList' property="commonid"/>"><bean:write name='objList' property="name"/></option>
												</logic:iterate> 
											</logic:present>
										</select>
									</td>
								</tr>					
							</tbody>
						</table>
					</div>
					<!-- term over -->
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
	document.forms[0].action = "CompanyNew.do?tabid=createNewCompany6";
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
                window.history.go(-5);
            },
            "<bean:message key='bca.quitmessage.no'/>": function () {
                $("#quitMessage").dialog("close");
                return false;
            }
        }
    });
}
</script>	
<script type="text/javascript">

/* debugger;
var items = document.querySelectorAll(".bca_bankaccountlist #nested li");
for(var i=0; i< items.length; i++)
	{
	debugger;
		items[i].onclick = function(){
			debugger;
			document.getElementById("accname").value = this.innerHTML;
		};
} */

$(document).ready(function(){
	$("#bca_initTerm").show();
	$("#bca_initSalesRep").hide();
	$("#bca_initItenCategory").hide();
	$("#bca_initCreditCardType").hide();
	$("#bca_initPaymentType").hide();
	$("#bca_initShipCarrier").hide();
	$("#bca_initReceivedType").hide();	
});
	
$(document).on('click', '.bca_preferencelist #myUL .caret #nested', function(){
	$("#bca_initTerm").show();
	$("#bca_initSalesRep").hide();
	$("#bca_initItenCategory").hide();
	$("#bca_initCreditCardType").hide();
	$("#bca_initPaymentType").hide();
	$("#bca_initShipCarrier").hide();
	$("#bca_initReceivedType").hide();
});
	
$(document).on('click', '.bca_preferencelist #myUL .caret2 #nested', function(){
	$("#bca_initTerm").hide();
	$("#bca_initSalesRep").show();
	$("#bca_initItenCategory").hide();
	$("#bca_initCreditCardType").hide();
	$("#bca_initPaymentType").hide();
	$("#bca_initShipCarrier").hide();
	$("#bca_initReceivedType").hide();
});
	
$(document).on('click', '.bca_preferencelist #myUL .caret3 #nested', function(){
	$("#bca_initItenCategory").show();
	$("#bca_initTerm").hide();
	$("#bca_initSalesRep").hide();
	$("#bca_initCreditCardType").hide();
	$("#bca_initPaymentType").hide();
	$("#bca_initShipCarrier").hide();
	$("#bca_initReceivedType").hide();		
});
	
	
$(document).on('click', '.bca_preferencelist #myUL .caret4 #nested', function(){
	$("#bca_initCreditCardType").show();
	$("#bca_initTerm").hide();
	$("#bca_initSalesRep").hide();
	$("#bca_initItenCategory").hide();
	$("#bca_initPaymentType").hide();
	$("#bca_initShipCarrier").hide();
	$("#bca_initReceivedType").hide();		
});
	
$(document).on('click', '.bca_preferencelist #myUL .caret5 #nested', function(){
	$("#bca_initPaymentType").show();
	$("#bca_initCreditCardType").hide();
	$("#bca_initTerm").hide();
	$("#bca_initSalesRep").hide();
	$("#bca_initItenCategory").hide();
	$("#bca_initShipCarrier").hide();
	$("#bca_initReceivedType").hide();	
});

$(document).on('click', '.bca_preferencelist #myUL .caret6 #nested', function(){
	$("#bca_initShipCarrier").show();
	$("#bca_initCreditCardType").hide();
	$("#bca_initTerm").hide();
	$("#bca_initSalesRep").hide();
	$("#bca_initItenCategory").hide();
	$("#bca_initPaymentType").hide();
	$("#bca_initReceivedType").hide();	
});
	
$(document).on('click', '.bca_preferencelist #myUL .caret7 #nested', function(){
	$("#bca_initReceivedType").show();
	$("#bca_initShipCarrier").hide();
	$("#bca_initCreditCardType").hide();
	$("#bca_initTerm").hide();
	$("#bca_initSalesRep").hide();
	$("#bca_initItenCategory").hide();
	$("#bca_initPaymentType").hide();
});
</script>
<script>
 $(".caret").click(function(){
    $(".nested").show("2000");
    this.classList.show("caret-down");
});
 
$(".caret2").click(function(){
    $(".nested2").show("2000");
    this.classList.show("caret-down");
});
 
$(".caret3").click(function(){
    $(".nested3").show("2000");
    this.classList.show("caret-down");
});

$(".caret4").click(function(){
    $(".nested4").show("2000");
    this.classList.show("caret-down");
});
 
$(".caret5").click(function(){
    $(".nested5").show("2000");
    this.classList.show("caret-down");
});
 
$(".caret6").click(function(){
    $(".nested6").show("2000");
    this.classList.show("caret-down");
});
 
$(".caret7").click(function(){
    $(".nested7").show("2000");
    this.classList.show("caret-down");
});
</script>
</body>
</html>