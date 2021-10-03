<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>

<title><bean:message key="BzComposer.datamanagertitle" /></title>
<style>
table.table-notifications tr td {
	padding: .7em 2em;
}

table.table-notifications th {
	padding-left: 27px;
	text-align: left;
}
</style>
<script type="text/javascript">
	function selectItemDialog() {
		event.preventDefault();
		$("#selectItemDialog").dialog({
			resizable : false,
			height : 200,
			width : 300,
			modal : true,
			buttons : {
				"<bean:message key='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				},
				<bean:message key='BzComposer.global.cancel'/> : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function selectTaxRateDialog() {
		event.preventDefault();
		$("#selectTaxRateDialog").dialog({
			resizable : false,
			height : 200,
			width : 300,
			modal : true,
			buttons : {
				"<bean:message key='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				},
				<bean:message key='BzComposer.global.cancel'/> : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function showBlankDiscriptionDialog() {
		event.preventDefault();
		$("#showBlankDiscriptionDialog").dialog({
			resizable : false,
			height : 200,
			width : 400,
			modal : true,
			buttons : {
				"<bean:message key='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				},
				<bean:message key='BzComposer.global.cancel'/> : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function saveSelectedItemDialog() {
		event.preventDefault();
		$("#saveSelectedItemDialog").dialog({
			resizable : false,
			height : 200,
			width : 400,
			modal : true,
			buttons : {
				"<bean:message key='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
					document.forms['dmForm'].action = "DataManager.do?tabid=DM_Save";
					document.forms['dmForm'].submit();
					
					//window.location = "DataManager.do?tabid=DM_Save";
					
				},
				<bean:message key='BzComposer.global.cancel'/> : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function deleteSelectedItemDialog() {
		event.preventDefault();
		$("#deleteSelectedItemDialog").dialog({
			resizable : false,
			height : 200,
			width : 400,
			modal : true,
			buttons : {
				"<bean:message key='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
					/*  document.forms[0].action = "DataManager.do?tabid=DM_Delete";
					document.forms[0].submit(); */
					
					window.location ="DataManager.do?tabid=DM_Delete&sTitleval="+sType+"&sNewvalID="+sNew;
					

				},
				<bean:message key='BzComposer.global.cancel'/> : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}
</script>
</head>
<body>
	<!-- begin shared/header -->
	<html:form styleId="dmForm" action="DataManager.do?tabid=datamanager" method="post">
		<div id="ddcolortabsline">&nbsp;</div>
		<div class="clear"></div>

		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<!-- begin Contents -->

							<div>
								<span
									style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"><bean:message
										key="BzComposer.datamanager.datamanagerheading" /></span>
							</div>
							<div>
								<div id="table-negotiations" align="center"
									class="section-border" style="width: 100%;">
									<div id="Hidden">
										<div id="CustTitle">
											<logic:present name="customerTitle" scope="request">
												<bean:size id="cSize" name="customerTitle" />
												<input type="hidden" id="ctSize"
													value='<bean:write name="cSize" />'>
												<logic:iterate name="customerTitle" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="titleID" />'
														id='<bean:write name="indx"/>ctitleID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="title" />'
														id='<bean:write name="indx"/>ctitleNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="Rep">

											<logic:present name="SalesRep" scope="request">
												<bean:size id="repSize" name="SalesRep" />
												<input type="hidden" id="rSize"
													value='<bean:write name="repSize" />'>
												<logic:iterate name="SalesRep" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="salesRepID" />'
														id='<bean:write name="indx"/>repID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="salesRepName" />'
														id='<bean:write name="indx"/>repNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="ShipCarrier">
											<logic:present name="Via" scope="request">

												<bean:size id="sSize" name="Via" />
												<input type="hidden" id="shSize"
													value='<bean:write name="sSize" />'>
												<logic:iterate name="Via" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="shipCarrierID" />'
														id='<bean:write name="indx"/>shipID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="shipCarrierName" />'
														id='<bean:write name="indx"/>shipNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="Term">

											<logic:present name="salesTerms" scope="request">

												<bean:size id="trSize" name="salesTerms" />
												<input type="hidden" id="tSize"
													value='<bean:write name="trSize" />'>
												<logic:iterate name="salesTerms" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="termId" />'
														id='<bean:write name="indx"/>termID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="termName" />'
														id='<bean:write name="indx"/>termNm' />
												</logic:iterate>
											</logic:present>
										</div>

										<div id="Type">
											<logic:present name="SalesCatType" scope="request">

												<bean:size id="cvSize" name="SalesCatType" />
												<input type="hidden" id="catSize"
													value='<bean:write name="cvSize" />'>
												<logic:iterate name="SalesCatType" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="cvCategoryID" />'
														id='<bean:write name="indx"/>typeID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="cvCategoryName" />'
														id='<bean:write name="indx"/>typeNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="Location">
											<logic:present name="SalesLocation" scope="request">

												<bean:size id="locSize" name="SalesLocation" />
												<input type="hidden" id="lSize"
													value='<bean:write name="locSize" />'>
												<logic:iterate name="SalesLocation" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="locationId" />'
														id='<bean:write name="indx"/>locID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="locationName" />'
														id='<bean:write name="indx"/>locNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="PaymentMethod">
											<logic:present name="SalesPaymentMethod" scope="request">

												<bean:size id="pmSize" name="SalesPaymentMethod" />
												<input type="hidden" id="pSize"
													value='<bean:write name="pmSize" />'>
												<logic:iterate name="SalesPaymentMethod"
													id="CustomerTitleList" scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="paymentTypeId" />'
														id='<bean:write name="indx"/>pmtID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="paymentTypeName" />'
														id='<bean:write name="indx"/>pmtNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="CreditCard">
											<logic:present name="CreditCardType" scope="request">

												<bean:size id="cctSize" name="CreditCardType" />
												<input type="hidden" id="ccSize"
													value='<bean:write name="cctSize" />'>
												<logic:iterate name="CreditCardType" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="ccTypeID" />'
														id='<bean:write name="indx"/>ccTypeID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="ccTypeName" />'
														id='<bean:write name="indx"/>ccTypeNm' />
												</logic:iterate>
											</logic:present>
										</div>
										<div id="STax">
											<logic:present name="SalesTax" scope="request">

												<bean:size id="stxSize" name="SalesTax" />
												<input type="hidden" id="txSize"
													value='<bean:write name="stxSize" />'>
												<logic:iterate name="SalesTax" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="salesTaxID" />'
														id='<bean:write name="indx"/>txID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="state" />'
														id='<bean:write name="indx"/>txNm' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="salesRate" />'
														id='<bean:write name="indx"/>txRate' />
												</logic:iterate>
											</logic:present>
										</div>

										<div id="MSG">
											<logic:present name="SalesMessage" scope="request">

												<bean:size id="msgSize" name="SalesMessage" />
												<input type="hidden" id="mSize"
													value='<bean:write name="msgSize" />'>
												<logic:iterate name="SalesMessage" id="CustomerTitleList"
													scope="request" indexId="indx">
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="messageID" />'
														id='<bean:write name="indx"/>msgID' />
													<input type="hidden"
														value='<bean:write name="CustomerTitleList" property="messageName" />'
														id='<bean:write name="indx"/>msgNm' />
												</logic:iterate>
											</logic:present>
										</div>

									</div>

									<table cellspacing="0" style="width: 100%;">

										<tr>
											<td align="center"><table class="table-notifications"
													style="background-color: rgb(247, 247, 247);">
													<tr>
														<th colspan="4" align="center" style="font-size: 14px;"><bean:message
																key="BzComposer.datamanager.setvalues" /></th>
													</tr>
													<tr>
														<td colspan="4" align="left"><span id="selectedTitle"
															style="font-size: 1.14px; font-weight: normal; color: #000DDD;"></span></td>
													<tr>
														<td colspan="1" style="font-size: 14px;"><bean:message
																key="BzComposer.datamanager.description" /> <input
															type="text" name="des" id="descriptionId" tabindex="1"></td>
														<td colspan="2" id="taxRate" style="visibility: hidden"><bean:message
																key="BzComposer.datamanager.taxrate" /> <input
															type="text" id="tax_rate" name="taxRateVal"
															onkeydown="return numbersonly(event,this.value)"
															tabindex="2" /> <input type="hidden" name="sTitleval"
															id="sTitleId" value="" /> <input type="hidden"
															name="sOldval" id="sOldId" value="" /> <input
															type="hidden" name="sNewval" id="sNewId" value="" /> <input
															type="hidden" name="sNewvalID" id="newIDD" value="" /></td>

														<td><input type="button" class="formbutton"
															name="save" onclick="callSave();"
															value='<bean:message key="BzComposer.global.save" />'
															tabindex="3"> <input type="button" name="Delete"
															class="formbutton" onclick="callDelete();"
															value='<bean:message key="BzComposer.global.delete" />'
															tabindex="4"> <input type="button" name="Cancel"
															class="formbutton" onclick="callCancel();"
															value='<bean:message key="BzComposer.global.cancel" />'
															tabindex="5"></td>
													</tr>

													<!-- 						<tr> -->
													<!-- 							<td colspan="4"><input type="button" class="formbutton" name="save" -->
													<!-- 								onclick="callSave();" -->
													<%-- 								value='<bean:message key="BzComposer.datamanager.Save" />' --%>
													<!-- 								tabindex="3"> -->
													<!-- 							<input type="button" name="Delete" class="formbutton" -->
													<!-- 								onclick="callDelete();" -->
													<%-- 								value='<bean:message key="BzComposer.datamanager.Delete" />' --%>
													<!-- 								tabindex="4"> -->
													<!-- 							<input type="button" name="Cancel" class="formbutton" -->
													<!-- 								onclick="callCancel();" -->
													<%-- 								value='<bean:message key="BzComposer.datamanager.Cancel" />' --%>
													<!-- 								tabindex="5"></td> -->


													<!-- 								</tr> -->
												</table></td>
										</tr>
										<tr>
											<td align="left">
												<table style="width: 100%;">
													<tr>
														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.customertitle" /></th>
																</tr>
																<tr>
																	<td valign="top" style="font-size: 14px;"><select
																		name="custTitle" size="10" style="width: 140" id="1$$"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.customertitle" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.customertitle" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.customertitle" />');">
																			<logic:present name="customerTitle" scope="request">
																				<logic:notEmpty name="customerTitle" scope="request">
																					<logic:iterate name="customerTitle"
																						id="CustomerTitleList" scope="request"
																						indexId="indx">
																						<option
																							value='<bean:write name="CustomerTitleList" property="titleID" />'><bean:write
												name="CustomerTitleList" property="title" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('1$$','<bean:message key="BzComposer.datamanager.customertitle" />');"
																		name="s_title"
																		value='<bean:message key="BzComposer.datamanager.title" />'></TD>
																</tr>
															</table>
														</td>

														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.shippingvia" /></th>
																</tr>
																<tr>
																	<td valign="top" style="font-size: 14px;"><select
																		name="shippingvia" size="10" style="width: 120"
																		id="2$$"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.shippingvia" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.shippingvia" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.shippingvia" />');">
																			<logic:present name="Via" scope="request">
																				<logic:notEmpty name="Via" scope="request">
																					<logic:iterate name="Via" id="ViaList"
																						scope="request" indexId="indx">
																						<option
																							value='<bean:write name="ViaList" property="shipCarrierID" />'><bean:write
												name="ViaList" property="shipCarrierName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('2$$','<bean:message key="BzComposer.datamanager.shippingvia" />');"
																		name="s_shippVia"
																		value='<bean:message key="BzComposer.datamanager.shippingvia" />'>
																	</TD>
																</tr>
															</table>
														</td>

														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.representative" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select name="sRep"
																		size="10" style="width: 120" id="3$$"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.representative" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.representative" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.representative" />');">
																			<logic:present name="SalesRep" scope="request">
																				<logic:notEmpty name="SalesRep" scope="request">
																					<logic:iterate name="SalesRep" id="SalesRepList"
																						scope="request" indexId="indx">
																						<option
																							value='<bean:write name="SalesRepList" property="salesRepID" />'><bean:write
												name="SalesRepList" property="salesRepName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" name="s_rep" class="formbutton"
																		onclick="buttonClick('3$$','<bean:message key="BzComposer.datamanager.representative" />');"
																		value='<bean:message key="BzComposer.datamanager.representative" />'></TD>
																</tr>
															</table>
														</td>

														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.terms" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select name="sTerms"
																		size="10" style="width: 120" id="4$$"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.terms" />');"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.terms" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.terms" />');">
																			<logic:present name="salesTerms" scope="request">
																				<logic:notEmpty name="salesTerms" scope="request">
																					<logic:iterate name="salesTerms"
																						id="salesTermsList" scope="request" indexId="indx">
																						<option
																							value='<bean:write name="salesTermsList" property="termId" />'><bean:write
												name="salesTermsList" property="termName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" name="s_terms" class="formbutton"
																		onclick="buttonClick('4$$','<bean:message key="BzComposer.datamanager.terms" />');"
																		value='<bean:message key="BzComposer.datamanager.terms" />'></TD>
																</tr>
															</table>
														</td>
														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.type" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select name="sType"
																		size="10" style="width: 120" id="5$$"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.type" />');"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.type" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.type" />');">
																			<logic:present name="SalesCatType" scope="request">
																				<logic:notEmpty name="SalesCatType" scope="request">
																					<logic:iterate name="SalesCatType"
																						id="SalesCatTypeList" scope="request"
																						indexId="indx">
																						<option
																							value='<bean:write name="SalesCatTypeList" property="cvCategoryID" />'><bean:write
												name="SalesCatTypeList" property="cvCategoryName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" name="s_type" class="formbutton"
																		onclick="buttonClick('5$$','<bean:message key="BzComposer.datamanager.type" />');"
																		value='<bean:message key="BzComposer.datamanager.type" />'></TD>
																</tr>
															</table>
														</td>

													</tr>
													<tr>
														<td colspan="6">&nbsp;</td>
													</tr>
													<tr>
														<td>
															<table width="150" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.paymentmethod" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select
																		name="sPayType" size="10" style="width: 140" id="7$$"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.paymentmethod" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.paymentmethod" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.paymentmethod" />');">
																			<logic:present name="SalesPaymentMethod"
																				scope="request">
																				<logic:notEmpty name="SalesPaymentMethod"
																					scope="request">
																					<logic:iterate name="SalesPaymentMethod"
																						id="SalesPaymentMethodList" scope="request"
																						indexId="indx">
																						<option
																							value='<bean:write name="SalesPaymentMethodList" property="paymentTypeId" />'><bean:write
												name="SalesPaymentMethodList" property="paymentTypeName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('7$$','<bean:message key="BzComposer.datamanager.paymentmethod" />');"
																		name="s_payType"
																		value='<bean:message key="BzComposer.datamanager.paymentmethod" />'>
																	</TD>
																</tr>
															</table>
														</td>
														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.creditcard" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select
																		name="sCreditCard" size="10" style="width: 120"
																		id="8$$"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.creditcard" />');"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.creditcard" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.creditcard" />');">
																			<logic:present name="CreditCardType" scope="request">
																				<logic:notEmpty name="CreditCardType"
																					scope="request">
																					<logic:iterate name="CreditCardType"
																						id="CreditCardTypeList" scope="request"
																						indexId="indx">
																						<option
																							value='<bean:write name="CreditCardTypeList" property="ccTypeID" />'><bean:write
												name="CreditCardTypeList" property="ccTypeName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('8$$','<bean:message key="BzComposer.datamanager.creditcard" />');"
																		name="s_creditcard"
																		value='<bean:message key="BzComposer.datamanager.creditcard" />'>
																	</TD>
																</tr>
															</table>
														</td>

														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.message" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select
																		name="sMessage" size="10"
																		style="overflow: auto; width: 120" id="9$$"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.message" />');"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.message" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.message" />');">
																			<logic:present name="SalesMessage" scope="request">
																				<logic:notEmpty name="SalesMessage" scope="request">
																					<logic:iterate name="SalesMessage"
																						id="SalesMessageList" scope="request"
																						indexId="indx">
																						<option
																							value='<bean:write name="SalesMessageList" property="messageID" />'><bean:write
												name="SalesMessageList" property="messageName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('9$$','<bean:message key="BzComposer.datamanager.message" />');"
																		name="s_msg"
																		value='<bean:message key="BzComposer.datamanager.message" />'></TD>
																</tr>
															</table>
														</td>
														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.tax" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select
																		name="sMessage" size="10" style="width: 120" id="10$$"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.tax" />');"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.tax" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.tax" />');">
																			<logic:present name="SalesTax" scope="request">
																				<logic:notEmpty name="SalesTax" scope="request">
																					<logic:iterate name="SalesTax" id="SalesTaxList"
																						scope="request" indexId="indx">
																						<option
																							value='<bean:write name="SalesTaxList" property="salesTaxID" />'><bean:write
												name="SalesTaxList" property="state" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('10$$','<bean:message key="BzComposer.datamanager.tax" />');"
																		name="s_tax"
																		value='<bean:message key="BzComposer.datamanager.tax" />'></TD>
																</tr>
															</table>
														</td>
														<td>
															<table width="130" height="180"
																class="table-notifications">
																<tr>
																	<th style="font-size: 14px;"><bean:message
																			key="BzComposer.datamanager.location" /></th>
																</tr>
																<tr>
																	<td style="font-size: 14px;"><select
																		name="sLocation" size="10" style="width: 120" id="6$$"
																		onkeydown="callClick(this.id,'<bean:message key="BzComposer.datamanager.location" />');"
																		onkeyup="callClick(this.id,'<bean:message key="BzComposer.datamanager.location" />');"
																		onclick="callClick(this.id,'<bean:message key="BzComposer.datamanager.location" />');">
																			<logic:present name="SalesLocation" scope="request">
																				<logic:notEmpty name="SalesLocation" scope="request">
																					<logic:iterate name="SalesLocation"
																						id="SalesLocationList" scope="request"
																						indexId="indx">
																						<option
																							value='<bean:write name="SalesLocationList" property="locationId" />'><bean:write
												name="SalesLocationList" property="locationName" /></option>
																					</logic:iterate>
																				</logic:notEmpty>
																			</logic:present>
																	</select></td>
																</tr>
																<tr>
																	<TD align="center" style="font-size: 14px;"><input
																		type="button" class="formbutton"
																		onclick="buttonClick('6$$','<bean:message key="BzComposer.datamanager.location" />');"
																		name="s_location"
																		value='<bean:message key="BzComposer.datamanager.location" />'>
																	</TD>
																</tr>
															</table>
														</td>
														<!-- 					<td colspan="2" valign="top"> -->
														<!-- 					<table class="table-notifications"> -->
														<!-- 						<tr> -->
														<!-- 							<th colspan="3" align="center">Set the Values</th> -->
														<!-- 						</tr> -->
														<!-- 						<tr> -->
														<!-- 							<td colspan="3" align="center"><span id="selectedTitle" -->
														<!-- 								style="font-size: 1.14px; font-weight: normal; color: #000DDD;"></span></td> -->
														<!-- 						<tr> -->
														<%-- 							<td colspan="3"><bean:message --%>
														<!-- 								key="BzComposer.datamanager.Description" /> <input type="text" -->
														<!-- 								name="des" id="descriptionId" tabindex="1"></td> -->
														<!-- 						</tr> -->
														<!-- 						<tr> -->
														<%-- 							<td colspan="3" id="taxRate" style="visibility:hidden"><bean:message --%>
														<!-- 								key="BzComposer.datamanager.TaxRate" /> <input type="text" -->
														<!-- 								id="tax_rate" name="taxRateVal" -->
														<!-- 								onkeydown="return numbersonly(event,this.value)" tabindex="2" /> -->
														<!-- 							<input type="hidden" name="sTitleval" id="sTitleId" value="" /> -->
														<!-- 							<input type="hidden" name="sOldval" id="sOldId" value="" /> <input -->
														<!-- 								type="hidden" name="sNewval" id="sNewId" value="" /> <input -->
														<!-- 								type="hidden" name="sNewvalID" id="newIDD" value="" /></td> -->
														<!-- 						</tr> -->
														<!-- 						<tr> -->
														<!-- 							<td><input type="button" class="formbutton" name="save" -->
														<!-- 								onclick="callSave();" -->
														<%-- 								value='<bean:message key="BzComposer.datamanager.Save" />' --%>
														<!-- 								tabindex="3"></td> -->
														<!-- 							<td><input type="button" name="Delete" class="formbutton" -->
														<!-- 								onclick="callDelete();" -->
														<%-- 								value='<bean:message key="BzComposer.datamanager.Delete" />' --%>
														<!-- 								tabindex="4"></td> -->
														<!-- 							<td><input type="button" name="Cancel" class="formbutton" -->
														<!-- 								onclick="callCancel();" -->
														<%-- 								value='<bean:message key="BzComposer.datamanager.Cancel" />' --%>
														<!-- 								tabindex="5"></td> -->
														<!-- 					</table> -->
														<!-- 					</td> -->
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</div>
								<table>
									<tr>
										<td align="center" colspan="2">
								</table>
								<!-- end Contents -->
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
<script>
	sOldVal = "";

	function callClick(idVal, ttl) {
		sOldVal = "";
		document.getElementById("selectedTitle").innerHTML = ttl;
		document.getElementById("descriptionId").value = "";
		document.getElementById("tax_rate").value = "";
		if (idVal == "10$$")
			document.getElementById("taxRate").style.visibility = "visible";
		else
			document.getElementById("taxRate").style.visibility = "hidden";

		for (i = 1; i <= 10; i++) {
			document.getElementById(i + "$$").style.background = '#DBEAF5'
			if (idVal != i + "$$")
				document.getElementById(i + "$$").selectedIndex = -1;
		}
		document.getElementById("" + idVal).style.background = '#AAAAAA';
		id = document.getElementById("" + idVal).value;
		var i = 0;
		var sval;
		if (ttl == "CUSTOMER TITLE") {
			size = document.getElementById('ctSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "ctitleID").value;				
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "ctitleNm").value;
					sOldVal = document.getElementById(i + "ctitleNm").value;
					document.getElementById("newIDD").value = id;
					break;
				}
			}
		} else if (ttl == "REP") {
			size = document.getElementById('rSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "repID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "repNm").value;
					sOldVal = document.getElementById(i + "repNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "TERMS") {
			size = document.getElementById('tSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "termID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "termNm").value;
					sOldVal = document.getElementById(i + "termNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "MESSAGE") {
			size = document.getElementById('mSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "msgID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "msgNm").value;
					sOldVal = document.getElementById(i + "msgNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "TYPE") {
			size = document.getElementById('catSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "typeID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "typeNm").value;
					sOldVal = document.getElementById(i + "typeNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "LOCATION") {
			size = document.getElementById('lSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "locID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "locNm").value;
					sOldVal = document.getElementById(i + "locNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "PAYMENT METHOD") {
			size = document.getElementById('pSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "pmtID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "pmtNm").value;
					sOldVal = document.getElementById(i + "pmtNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "CREDIT CARD") {
			size = document.getElementById('ccSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "ccTypeID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "ccTypeNm").value;
					sOldVal = document.getElementById(i + "ccTypeNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "SHIPPING VIA") {
			size = document.getElementById('shSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "shipID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "shipNm").value;
					sOldVal = document.getElementById(i + "shipNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "TAX") {
			size = document.getElementById('txSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "txID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "txNm").value;
					document.getElementById("tax_rate").value = document
							.getElementById(i + "txRate").value;
					sOldVal = document.getElementById(i + "txNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		}

	}
	function buttonClick(idVal, ttl) {
		sOldVal = "";
		//alert("HH");
		document.getElementById("selectedTitle").innerHTML = ttl;
		document.getElementById("descriptionId").value = "";
		document.getElementById("tax_rate").value = "";
		if (idVal == "10$$")
			document.getElementById("taxRate").style.visibility = "visible";
		else
			document.getElementById("taxRate").style.visibility = "hidden";

		for (i = 1; i <= 10; i++) {
			document.getElementById(i + "$$").style.background = '#DBEAF5'
			//if(idVal!=i+"$$")
			document.getElementById(i + "$$").selectedIndex = -1;
		}
		document.getElementById("" + idVal).style.background = '#AAAAAA';
	}
	function callSave() {
		sType = document.getElementById("selectedTitle").innerHTML
		sOld = sOldVal;
		sNew = document.getElementById("descriptionId").value;
		newID = document.getElementById("newIDD").value;
		taxrate = document.getElementById("tax_rate").value;

		document.getElementById("sTitleId").value = sType;
		document.getElementById("sOldId").value = sOld;
		document.getElementById("sNewId").value = sNew;
		document.getElementById("newIDD").value = newID;
		
		if (sType == "") {
			alert("Please choose item");
			/* return selectItemDialog(); */
			window.location = "DataManager.do?tabid=DM_Save";
		} else {
			if (taxrate == "" && sType == "TAX") {
				//alert("Please enter tax rate");
				return selectTaxRateDialog();
				document.getElementById("tax_rate").focus();
			}
			if (sNew == "") {
				//alert("Description field should not be blank");
				return showBlankDiscriptionDialog();
				document.getElementById("descriptionId").focus();
			} else {
				event.preventDefault();
				$("#saveSelectedItemDialog").dialog({
					resizable : false,
					height : 200,
					width : 400,
					modal : true,
					buttons : {
						"<bean:message key='BzComposer.global.ok'/>" : function() {
							$(this).dialog("close");
							document.forms['dmForm'].action = "DataManager.do?tabid=DM_Save";
							document.forms['dmForm'].submit(); 
							//window.location = "DataManager.do?tabid=DM_Save&sTitleval="+sType+"&sNewval="+sNew+"&taxRateVal="+taxrate;
							//need to be tested
						},
						<bean:message key='BzComposer.global.cancel'/> : function() {
							$(this).dialog("close");
							return false;
						}
					}
				}); 
			}
		}
	}

	function callDelete() {
		sType = document.getElementById("selectedTitle").innerHTML
		sOld = sOldVal;
		newID = document.getElementById("newIDD").value;
		sNew = document.getElementById("descriptionId").value;
		document.getElementById("sTitleId").value = sType;
		document.getElementById("sOldId").value = sOld;
		document.getElementById("sNewId").value = sNew;
		document.getElementById("newIDD").value = newID;
		if (sNew == "") {
			//alert("Description field should not be blank");
			return showBlankDiscriptionDialog();
			document.getElementById("descriptionId").focus();
		} else {
			return deleteSelectedItemDialog();
			/* var x=window.confirm("Do you want to delete "+sNew+"?")
			if (x){
				document.forms[0].action = "DataManager.do?tabid=DM_Delete";
				document.forms[0].submit();
			 } */
		}
	}
	function callCancel() {
		document.getElementById("selectedTitle").innerHTML = "";
		document.getElementById("descriptionId").value = "";
		document.getElementById("tax_rate").value = "";
		document.getElementById("newIDD").value = "";
		sOldVal = "";
		for (i = 1; i <= 10; i++) {
			document.getElementById(i + "$$").style.background = '#DBEAF5'
			document.getElementById(i + "$$").selectedIndex = -1;
		}
	}

	function numbersonly(e, val) {
		var temp = val.indexOf(".");
		var key = e.charCode ? e.charCode : e.keyCode;
		if (window.event) {
			if (window.event.ctrlKey)
				isCtrl = true;
			else
				isCtrl = false;
		} else {
			if (e.ctrlKey)
				isCtrl = true;
			else
				isCtrl = false;
		}
		if (isCtrl) {
			if ("v" == String.fromCharCode(key).toLowerCase()) {
				return false;
			}
			if ("x" == String.fromCharCode(key).toLowerCase()) {
				return false;
			}
		} else if (key != 8) {
			var str = String(val);
			var temp = val.indexOf(".");
			index = 0;
			for (i = 0; i < str.length; i++) {
				if (str.charAt(i) == '.') {
					index = 1;
					break;
				}
			}
			if (key == 46 && temp == -1) {
				return true;
			} else if (key == 37 || key == 39) {
				return true;
			} else if (key == 110 && index == 0) {
				return true;
			} else if (key == 190 && index == 0) {
				return true;
			} else if (key >= 96 && key <= 105) {
				return true;
			} else if (key<48||key>57) //if not a number
				return false; //disable key press
		}
	}
</script>
<!-- dialog box that used in data manager page -->
<div id="selectItemDialog" style="display: none;">
	<p>
		<bean:message key="BzComposer.datamanager.selectitemvalidation" />
	</p>
</div>
<div id="selectTaxRateDialog" style="display: none;">
	<p>
		<bean:message key="BzComposer.datamanager.entertaxratevalidation" />
	</p>
</div>
<div id="showBlankDiscriptionDialog" style="display: none;">
	<p>
		<bean:message key="BzComposer.datamanager.enterdescriptionvalidation" />
	</p>
</div>
<div id="saveSelectedItemDialog" style="display: none;">
	<p>
		<bean:message key="BzComposer.datamanager.saveselecteditem" />
	</p>
</div>
<div id="deleteSelectedItemDialog" style="display: none;">
	<p>
		<bean:message key="BzComposer.datamanager.deleteselecteditem" />
	</p>
</div>