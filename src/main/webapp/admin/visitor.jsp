<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu_add.js"></script> -->
<%@include file="/include/adminheadlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/adminmenu.jsp"%>

<title><bean:message key="BzComposer.admin.title.Visitortitle" /></title>
<style type="text/css">
.height250 {
	height: 47%;
	overflow-x: auto;
	overflow-y: auto;
}

.fht-tbody {
	height: 85% !important;
}

table.tabla-listados tbody tr.odd td {
	background: #e1e5e9;
}
</style>
<script type="text/javascript">
	function showItemValidationDialog() {
		event.preventDefault();
		$("#showItemValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 400,
			modal : true,
			buttons : {
				"<bean:message key='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
</script>
</head>
<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div class="clear"></div>
	<html:form action="Item.do" method="post">
		<div id="cos" style="padding: 0px 10px 0px 10px;">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<div>
								<span
									style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<bean:message key="BzComposer.admin.title.Visitor" />
								</span>
							</div>
							<div>
								<div class="grid_8 height250 tabla-listados"
									id="table-negotiations">
									<table id="myTable01" class="tabla-listados" cellpadding="0"
										cellspacing="0">
										<thead style="font-weight: bold;">
											<tr>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.itemtype" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.itemcode" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.title" /></th>
												<th class="emblem" style="font-size: 1em;">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.qty" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.purchaseprice" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.saleprice" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.serialnumber" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.weight" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.location" /></th>
												<th class="emblem" style="font-size: 1em;"><bean:message
														key="BzComposer.item.taxable" /></th>
											</tr>
										</thead>
										<tbody>
											<logic:present name="ItemDetails">
												<logic:notEmpty name="ItemDetails">
													<bean:size name="ItemDetails" id="ItemDetailsSize" />
													<input type="hidden" name="listSize" id="lSize"
														value='<bean:write name="ItemDetailsSize" />'>
													<logic:iterate name="ItemDetails" id="objList1"
														indexId="ndx">
														<tr id='<bean:write name="ndx" />$$'
															onclick="callClick('<bean:write name="ndx" />$$','<bean:write name="objList1" property="inventoryId" />');"
															ondblclick="showEdit('<bean:write name="objList1" property="inventoryId" />');">
															<td style="font-size: 1em;"><logic:equal
																	name="objList1" property="itemType" value="1">
																	<bean:message key="BzComposer.item.inventory" />
																</logic:equal> <logic:equal name="objList1" property="itemType"
																	value="2">
																	<bean:message key="BzComposer.item.discount" />
																</logic:equal> <logic:equal name="objList1" property="itemType"
																	value="3">
																	<bean:message key="BzComposer.item.subtotal" />
																</logic:equal> <logic:equal name="objList1" property="itemType"
																	value="4">
																	<bean:message key="BzComposer.item.service" />
																</logic:equal></td>
															<td colspan="1" style="font-size: 1em;"><bean:write
																	name="objList1" property="itemCode" /></td>
															<td colspan="2" style="font-size: 1em;"><bean:write
																	name="objList1" property="itemName" /></td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="qty" />
															</td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="purchasePrice" />
															</td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="salePrice" />
															</td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="serialNum" />
															</td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="weight" />
															</td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="location" />
															</td>
															<td style="font-size: 1em;">&nbsp;<bean:write
																	name="objList1" property="taxable" />
															</td>
														</tr>
													</logic:iterate>
												</logic:notEmpty>
											</logic:present>
										</tbody>
									</table>
								</div>
							</div>
							
							<input type="hidden" name="ItemType" value="1">
							<!-- end Contents -->
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
	var setInvId = 0;
	function callClick(rid, invId) {
		size = document.getElementById("lSize").value;

		// 	for(i=0;i<size;i++){
		// 		var row1=document.getElementById(i+"$$");
		// 		row1.className ="";
		// 	}
		// 	var rd = document.getElementById(rid);
		// 	rd.className ="draft";

		rowValue = rid.replace("$$", "");
		for (i = 0; i < size; i++) {
			document.getElementById(i + "$$").classList.remove('draft');
			if (i % 2 == 0) {
				if (size != (i + 1)) {
					document.getElementById((i + 1) + "$$").classList
							.add('odd');
				}
			}
		}
		if (rowValue % 2 != 0) {
			;
			document.getElementById(rowValue + "$$").classList.remove('odd');
		}
		var rd = document.getElementById(rid).classList.add('draft');

		setInvId = invId;
	}
	
	callClick("0$$",0);

	function callEdit() {
		showEdit(setInvId);
	}

	function callDelete() {
		if (setInvId == 0) {
			//alert('<bean:message key="BizComposer.Item.Item.Validation"/>');
			return showItemValidationDialog();
		} else {
			/* var res=window.confirm('<bean:message key="BizComposer.Item.Delete.Validation"/>')
			if (res)
			{
			 document.forms[0].action = "Item.do?tabid=DeleteItem&InvId="+setInvId;
			    document.forms[0].submit();
			} */
			debugger;
			event.preventDefault();
			$("#deleteItemValidationDialog")
					.dialog(
							{
								resizable : false,
								height : 200,
								width : 400,
								modal : true,
								buttons : {
									"<bean:message key='BzComposer.global.ok'/>" : function() {
										$(this).dialog("close");
										/* document.forms[0].action = "Item.do?tabid=DeleteItem&InvId="+setInvId;
										document.forms[0].submit(); */
										// Added  by tulsi
										window.location.href= "Item.do?tabid=DeleteItem&InvId="+setInvId;
									},
									"<bean:message key='BzComposer.global.cancel'/>" : function() {
										$(this).dialog("close");
										return false;
									}
								}
							});
			return false;
		}
	}
	function callRefresh() {
		/* document.forms[0].action = "Item.do?tabid=Item";
		document.forms[0].submit(); */
		// Added by tulsi
		window.location.href= "Item.do?tabid=Item";
	}
	function ShowAdd(inventoryId) {
		// Added by tulsi
		
		window.location.href= "Item.do?tabid=ShowAdd&ItemType=1&showHistoryPanel=1";	
	}

	function showEdit(inventoryId) {
		if (inventoryId == 0) {
			//alert('<bean:message key="BizComposer.Item.Item.Validation"/>');
			return showItemValidationDialog();
		} else {
			window
					.open(
							"Item.do?tabid=SearchItem&InvId=" + inventoryId,
							null,
							"scrollbars=yes,height=600,width=900,status=yes,toolbar=no,menubar=no,location=no");
		}
	}
</script>
<!-- Dialog box used in sales order page -->
<div id="showItemValidationDialog" style="display: none;">
	<p>
		<bean:message key="BizComposer.Item.Item.Validation" />
	</p>
</div>
<div id="deleteItemValidationDialog" style="display: none;">
	<p>
		<bean:message key="BizComposer.Item.Delete.Validation" />
	</p>
</div>