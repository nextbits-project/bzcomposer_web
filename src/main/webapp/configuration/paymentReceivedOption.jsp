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
<title><bean:message key="BzComposer.paymentandreceivedtypetitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
	
<!-- jQuery Modal -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style type="text/css">
.modal1 {
    overflow: visible;
    height: auto;
    vertical-align: top;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
		$("#tabs1").tabs();
	});
	/* function showTime()
	{
		var h = document.getElementById("hours").value;
		var m = document.getElementById("minutes").value;
		var t = document.getElementById("selectedTime").value;
		if(h>=0 && h<10)	
		{
			h = "0"+h;
		}
		if(m>=0 && m<10)	
		{
			m = "0"+m;
		}
		var time = h+" : "+ m +" "+ t;
		$("#scheduleTime").append("<option value=" + time + ">"+ time + "</option>");
	} */
	/* function removeTime()
	{
		$('#scheduleTime option:selected').remove();
	} */
	
	/* function setStoreTypeName()
	{
		alert("Please Select eSales Store");	
	} */
	/* function setLeftToRight()
	{
		//alert("inside setLeftToRight function");
		debugger
		var category = $.trim($("#eBayCategorySelect option:selected").text());
		var categoryId = $.trim($("#eBayCategorySelect option:selected").val());
		debugger
		var optionsAvailable = $('#defaultCategorySelect').find("option[value='"+categoryId+"']").val();
		var isActive = $.trim($('select[id="eBayCategorySelect"]').find('option[id="'+category+'"]').val());
		if(categoryId != optionsAvailable && isActive == "1")
		{
			//var o = new Option(categoryId,category);
			//$(o).html(category);
			//$("#defaultCategorySelect").append(o);
			$('#defaultCategorySelect')
	         .append($("<option></option>")
	                    .attr("value",categoryId)
	                    .text(category)); 
		}
	} */
	
	/* function setCategoryRightToLeft()
	{
		var value = $.trim($("#defaultCategorySelect option:selected").text());
		$("#r2l").attr('disabled',false);
	} */
	
	/* function setRightToLeft()
	{
		$("#defaultCategorySelect option:selected").remove();
	} */
	
	/* function setDefaultCategory()
	{
		debugger
		var category = $.trim($("#eBayCategorySelect option:selected").text());
		debugger
		var isActive = $.trim($('select[id="eBayCategorySelect"]').find('option[id="'+category+'"]').val());
		debugger
		//alert("Selected Category:"+category+"\nis Active?:"+isActive);
		if(isActive == 0)
		{
			$("#eBayCategorySelect option:selected").attr('readonly',true);
		}
		else
		{
			$("#eBayCategorySelect option:selected").attr('readonly',false);
			$("#l2r").attr('disabled',false);
		}
	} */
	
	/* function showStore()
	{
		//alert("inside showStore")
		window.open("Configuration.do?tabid=showStore",null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no" );
	} */
	
	function setDiv()
	{
		var value = $("#stores option:selected").val();
		//alert("selected Value:"+value);
		if(value == 39)
		{
			document.getElementById("forOnlineOption").style.display = "block";
			document.getElementById("forCdromusaOption").style.display = "none";
		}
		else
		{
			document.getElementById("forOnlineOption").style.display = "none";
			document.getElementById("forCdromusaOption").style.display = "block";
		}
	}
	function seteSalesStores()
	{
		$('select[id="eSalesChannels"]').find('option').attr("selected",false);
		var eSalesStore = $.trim($("#eSalesStoreId option:selected").text());	//selected select option value
		var selectedeSalesStore = $.trim($("#eSalesStoreId option:selected").val()); //selected select option id
		var ab = $.trim($('select[id="eSalesStoreId"]').find('option[id="'+selectedeSalesStore+'"]').val());	//abbreviation of selected option 
		
		var storeChannel = $.trim($('select[id="eSalesStoreId"]').find('option[id="'+eSalesStore+'"]').val());
		
		//alert("Selected eSales Store Value:"+eSalesStore+"\nId is:"+selectedeSalesStore+"\nAbbreviation is:"+ab+"\nStoreType Id is:"+storeChannel);
		
		$('select[id="eSalesStoreId"]').find('option[id="'+selectedeSalesStore+'"]').attr("selected",true);
		$('select[id="eSalesStoreId"]').find('option[id="'+eSalesStore+'"]').attr("selected",true);
		$('select[id="eSalesChannels"]').find('option[id="'+storeChannel+'"]').attr("selected",true);
		
		$("#storeTypeName").val(eSalesStore);
		$("#eSalesAbbreviation").val(ab);
		
	}
	
	function clearFields()
	{
		$("#storeTypeName").val("");
		$("#eSalesAbbreviation").val("");
		$("#btnAddeBayCategory").attr('disabled',false);
	}
	
	/* function addeBayCategory()
	{
		alert("Inside addeBayCategory")
	} */
</script>
</head>
<!-- <body onload="init3();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<!-- <div id="cos"></div> -->
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.configuration.configurationtitle"/>
	</span>
</div>
<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" />
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
				<logic:iterate name="Labels" id="lbl" indexId="index">
					<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
					<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
				</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations">
		<table cellspacing="0" style="width: 100%; overflow-y: scroll;" class="section-border">
			<tr>
				<td valign="top" style="width: 20%;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu3.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
								<%-- <div id="table-negotiations" style="width: 185px; padding-left: 10px; overflow-y: auto; max-height: 597px;">
									<%@include file="testMenu3.jsp"%>
								</div> --%>
							</td>
						</tr>
						<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();"
									value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();"
									value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%; padding-right: 4%;"> 											
 					<!-- Payment&Received Options Starts -->
					<div id="Payment&Received-Options" style="display: none;">
						<table>
							<tr>
								<th colspan="4" align="left" style="font-size: 1.2em;">
									<bean:message key="BzComposer.configuration.paymentreveivetype" />
								</th>
							</tr>
						</table>
						<div id="tabs" style="height: 950px;">
							<ul>
								<li style="font-size: 1.2em;">
									<a href="#paymentType">
										<b><bean:message key="BzComposer.configuration.tab.paymenttype" /></b>
									</a>
								</li>
								<li style="font-size: 1.2em;">
									<a href="#receivedType">
										<b><bean:message key="BzComposer.configuration.tab.receivedtype"/></b>
									</a>
								</li>
							</ul>
							<div id="paymentType">
								<div id="content1" class="tabPage">
									<table class="table-notifications">
										<tr>
											<th colspan="4" align="left" style="font-size: 1.2em;">
												<bean:message key="BzComposer.configuration.creditcardtype" />
											</th>
										</tr>
										<tr>
											<td rowspan="3">
												<table border="2" width="300px;">
													<tr>
														<td align="center" style="font-size: 1em;">
															<b><bean:message key="BzComposer.configuration.creditcardtype" /></b>
														</td>
														<td align="center" style="font-size: 1em;">
															<b><bean:message key="BzComposer.configuration.active" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingCreditCard">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCard" scope="session">
															<tr>
																<td id="<bean:write name='objList1' property='creditCardTypeId' />"
																onclick="showType(this.val);" align="center" style="font-size: 1em;">
																	<label id="cType" name="cType" value="<bean:write name="objList1" property="creditCardName" />">
																		<bean:write name="objList1" property="creditCardName" />
																	</label>
																</td>
																<td align="center">
																	<html:checkbox property="isActive" value="true">
																	</html:checkbox>
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.creditcardtype" /> :
											</td>
											<td>
												<input type="text" id="creditCardName" style="font-size: 1em;">
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.active" />
											</td>
											<td>
												<input type="checkbox" id="active" checked>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<button type="button" class="formbutton" id="Save" name="Save" style="width:60px;">
													<bean:message key="BzComposer.global.save"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Add" name="Add" style="width:80px;">
													<bean:message key="BzComposer.configuration.addnewbtn"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Delete" name="Delete" 
												style="width:60px;">
													<bean:message key="BzComposer.global.delete"/>
												</button>
											</td>
										</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 1.2em;">
												<bean:message key="BzComposer.configuration.tab.paymenttype" />
											</th>
										</tr>
										<tr>
											<td rowspan="4" style="font-size: 1em;">
												<table border="2" style='height: 100px; width: 300px;'>
													<tr>
														<td align="center">
															<b><bean:message key="BzComposer.configuration.paymenttypename" /></b>
														</td>
														<td align="center">
															<b><bean:message key="BzComposer.configuration.tab.paymenttype" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingPaymentType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPaymentType"
															scope="session">
															<tr>
																<td id="paymentTypeId" value="<bean:write name='objList1' property='paymentTypeId' />"
																onclick="showType();" align="center" style="font-size: 1em;">
																	<label id="pName" name="pName" value="<bean:write name="objList1" property="paymentTypeId" />">
																		<bean:write name="objList1" property="paymentName" />
																	</label>
																</td>
																<td align="center" style="font-size: 1em;">
																	<bean:write name="objList1" property="paymentType" />
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.tab.paymenttype" /> :
											</td>
											<td style="font-size: 1em;">
												<input type="text" id="paymentType1">
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.type" /> :
											</td>
											<td style="font-size: 1em;">
												<html:select property="listOfExistingCreditCardType">
													<logic:present name="configurationForm" property="listOfExistingCreditCardType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCardType" scope="session">
															<option value="<bean:write name='objList1' property='creditCardName' />">
																<bean:write name="objList1" property="creditCardName" />
															</option>
														</logic:iterate>
													</logic:present>
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.accountcategory" /> :
											</td>
											<td style="font-size: 1em;">
												<select>
													<option></option>
													<option>1</option>
													<option>2</option>
												</select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<input type="button" id="Add" name="Add" 
												value="<bean:message key='BzComposer.global.add'/>" class="formbutton" readonly>
												&nbsp;&nbsp;
												<input type="button" id="Update" name="Update" 
												value="<bean:message key='BzComposer.global.update'/>" class="formbutton">
												&nbsp;&nbsp; 
												<input type="button" id="Delete" name="Delete" 
												value="<bean:message key='BzComposer.global.delete'/>" class="formbutton">
												&nbsp;&nbsp; 
												<input type="button" id="Clear" name="Clear" 
												value="<bean:message key='BzComposer.global.clear'/>" class="formbutton">
											</td>
										</tr>
										<tr>
											<td colspan="4" align="center" style="font-size: 1em;">
												<h1>
													<a href="/bzcomposerweb2/Banking.do?tabid=Banking">
														<bean:message key="BzComposer.configuration.gotobank" />
													</a>
												</h1>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div id="receivedType">
								<div id="content1" class="tabPage">
									<table class="table-notifications">
										<tr>
											<th colspan="4" align="left" style="font-size: 1.2em;">
												<bean:message key="BzComposer.configuration.tab.receivedtype" />
											</th>
										</tr>
										<tr>
											<td rowspan="3" style="font-size: 1em;">
												<table border="2" width="300px;">
													<tr>
														<td align="center" style="font-size: 1em;">
															<b><bean:message key="BzComposer.configuration.creditcardtype" /></b>
														</td>
														<td align="center" style="font-size: 1em;">
															<b><bean:message key="BzComposer.configuration.active" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingCreditCard">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCard" scope="session">
															<tr>
																<td id="<bean:write name='objList1' property='creditCardTypeId' />" onclick="showType();" align="center">
																	<label id="cType" name="cTyoe" value="<bean:write name="objList1" property="creditCardTypeId" />">
																		<bean:write name="objList1" property="creditCardName" />
																	</label>
																</td>
																<td align="center">
																	<%-- <html:checkbox property="isActive" value="1" style="checked:false; display=none;">
																		</html:checkbox> --%> 
																		<html:checkbox property="isActive" value="0">
																		</html:checkbox>
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.creditcardtype" /> :
											</td>
											<td style="font-size: 1em;">
												<input type="text" id="creditCardName">
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.active" /> :
											</td>
											<td style="font-size: 1em;">
												<input type="checkbox" id="active" value="true">
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<button type="button" class="formbutton" id="Save" name="Save" readonly style="width:60px;">
													<bean:message key="BzComposer.global.save"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Add" name="Add" style="width:80px;">
													<bean:message key="BzComposer.configuration.addnewbtn"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Delete" name="Delete" style="width:60px;">
													<bean:message key="BzComposer.global.delete"/>
												</button>
											</td>
										</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 1.2em;">
												<bean:message key="BzComposer.configuration.tab.paymenttype" />
											</th>
										</tr>
										<tr>
											<td rowspan="4" style="font-size: 1em;">
												<table border="2" width="300px;">
													<tr>
														<td align="center" style="font-size: 1em;">
															<b><bean:message key="BzComposer.configuration.receivetypename" /></b>
														</td>
														<td align="center" style="font-size: 1em;">
															<b><bean:message key="BzComposer.configuration.tab.receivedtype" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingPaymentType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPaymentType" scope="session">
															<tr>
																<td id="paymentTypeId" value="<bean:write name='objList1' property='paymentTypeId' />" 
																onclick="showType();" align="center">
																	<label id="pName" name="pName" value="<bean:write name="objList1" property="paymentTypeId" />" style="font-size: 1em;">
																		<bean:write name="objList1" property="paymentName" />
																	</label>
																</td>
																<td align="center">
																	<bean:write name="objList1" property="paymentType" />
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.paymenttypename" /> :
											</td>
											<td style="font-size: 1em;">
												<input type="text" id="paymentType1">
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.type" /> :
											</td>
											<td style="font-size: 1em;">
												<html:select property="listOfExistingCreditCardType">
													<logic:present name="configurationForm" property="listOfExistingCreditCardType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCardType" scope="session">
															<option value="<bean:write name='objList1' property='creditCardName' />">
																<bean:write name="objList1" property="creditCardName" />
															</option>
														</logic:iterate>
													</logic:present>
												</html:select>
											</td>
											<tr>
												<td style="font-size: 1em;">
													<bean:message key="BzComposer.configuration.accountcategory" /> :
												</td>
												<td style="font-size: 1em;">
													<select>
														<option></option>
														<option>1</option>
														<option>2</option>
													</select>
												</td>
											</tr>
											<tr>
												<td style="font-size: 1em;">
													<input type="button" id="Add" name="Add" class="formbutton" readonly 
													value="<bean:message key='BzComposer.global.add'/>">
													&nbsp;&nbsp;
													<input type="button" id="Update" name="Update" 
													value="<bean:message key='BzComposer.global.update'/>" class="formbutton"> 
													&nbsp;&nbsp;
													<input type="button" id="Delete" name="Delete" 
													value="<bean:message key='BzComposer.global.delete'/>" class="formbutton">
													&nbsp;&nbsp; 
													<input type="button" id="Clear" name="Clear" 
													value="<bean:message key='BzComposer.global.clear'/>" class="formbutton">
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center" style="font-size: 1em;">
													<h1>
														<a href="/bzcomposerweb2/Banking.do?tabid=Banking">
															<bean:message key="BzComposer.configuration.gotobank" />
														</a>
													</h1>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div> <!-- Payment&Received Options Ends --> 
					</td>
				</tr>
			</table>
			<div>
				<html:hidden property="empStateID" />
				<html:hidden property="labelName" />
				<html:hidden property="fileName" />
			</div>
			<div>
				<input type="hidden" name="tabid" id="tid" value="" />
			</div>
		</div>
		<div align="center">
			<html:button property="save"><bean:message key="BzComposer.global.save"/></html:button>
			<html:cancel><bean:message key="BzComposer.global.cancel"/></html:cancel>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
	</html:form>

	<%@ include file="/include/footer.jsp"%>
</body>
</html>