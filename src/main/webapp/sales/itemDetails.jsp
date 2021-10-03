<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" language="JavaScript1.2"
	src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2"
	src="tree-menu/apytmenu_add.js"></script>

<%@include file="/include/header.jsp"%>
<title><bean:message key="BizComposer.ItemDetails.Title"/></title>
</head>
<body>
<html:form action="UpdateItem.do" enctype="MULTIPART/FORM-DATA"
	method="post">

	<div id="cos">

	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><html:errors /> <!-- begin Contents -->
	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div>

	<div id="table-negotiations" style="overflow:auto;width:95%">
	<table class="tabla-listados" cellspacing="0">
	<thead>
							<tr>
								<th colspan="2"><bean:message key="BzComposer.Item.Edittem" /></th>
							</tr>
						</thead>
		<logic:present name="ItemDetails">
			<input type="hidden" id="inId"
				value="<%= request.getParameter("InvId")%>" />
			<logic:notEmpty name="ItemDetails">

				<logic:iterate name="ItemDetails" id="objList" indexId="ndx">
					<input type="hidden" id="itmType"
						value='<bean:write name="objList" property="itemType" />' />
					<tr>
						<td width="100" align="left"><html:select property="itemType"
							disabled="true" size="20" name="objList">
							<html:option value="1">
								<bean:message key="BzComposer.Item.Inventory" />
							</html:option>
							<html:option value="2">
								<bean:message key="BzComposer.Item.Discount" />
							</html:option>
							<html:option value="3">
								<bean:message key="BzComposer.Item.Subtotal" />
							</html:option>
							<html:option value="4">
								<bean:message key="BzComposer.Item.Service" />
							</html:option>
						</html:select></td>
						<td>

						<table>
							<tbody>
							<tbody>

								<logic:equal name="objList" property="itemType" value="1">
									<tr>
										<td><input type="hidden" name="InvId" id="inId"
											value='<bean:write name="objList" property="inventoryId" />'>
										<bean:message key="BzComposer.Item.InventryName" /></td>
										<td align="right"><bean:message
											key="BzComposer.Item.Subcategoryof" /></td>

										<td><html:select property="tectcmd" disabled="disabled"
											name="objList">
											<html:option value="0"><bean:message key="BzComposer.ComboBox.Select"/></html:option>
											<html:options collection="fillList" property="value"
												labelProperty="label"></html:options>
										</html:select></td>
	                                 <td></td>
									</tr>
									<tr>
										<td><html:text name="objList" property="itemCode" /></td>
										<td align="right">
											<logic:present name="ISCategory">
												<div style="display:none">
													<bean:message key="BzComposer.Item.AddPicture" />
												</div>
											</logic:present>
											<logic:notPresent name="ISCategory">
												<div style="display:block">
													<bean:message key="BzComposer.Item.AddPicture" />
												</div>
											</logic:notPresent>
										</td>
										<td>
											<logic:present name="ISCategory">
												<div style="display:none">
													<html:file property="photoName" />
												</div>
											</logic:present>
											<logic:notPresent name="ISCategory">
												<div style="display:block">
													<html:file property="photoName" />
												</div>
											</logic:notPresent>
										</td>
											<td></td>
									</tr>

									<tr>
										<td>
										<logic:present name="ISCategory">
											<input type="checkbox" id="chk_cat"
											checked="true" onclick="hide_other(this.value);" disabled="disabled"/> <bean:message
											key="BzComposer.Item.isCategory" />
											<html:hidden property="iscategory" value="on"/>
										</logic:present>
										<logic:notPresent name="ISCategory">
											<input type="checkbox" id="chk_cat"
											onclick="hide_other(this.value);" disabled="disabled"/> <bean:message
											key="BzComposer.Item.isCategory" />
											<html:hidden property="iscategory" value="off"/>
										</logic:notPresent>
										
									
										
										</td>
										<td align="right"><bean:message
											key="BzComposer.Item.Barcode" /></td>
										<td><html:text name="objList" property="barcode"
											onkeydown="return numbersonly(event,this.value)" /></td>
											<td>
											<bean:message key="BzComposer.Item.Discontinued" />
												
											
											<logic:equal name="objList" property="discontinued" value="1">
													<input type="checkbox" name="discontinued" checked="checked">
												</logic:equal> <logic:notEqual name="objList" property="discontinued" value="1">
													<input type="checkbox" name="discontinued">
												</logic:notEqual>
										
										
											</td>
									</tr>

									<tr>
										<td colspan="4">
										<logic:present name="ISCategory">
										<table style="visibility:hidden" >
											<tr>
												<th><bean:message
													key="BzComposer.Item.InventoryInformation" /></th>
											</tr>
											<tr>
												<td>
												<logic:equal name="objList" property="taxable"
													value="1">
													<input type="checkbox" name="taxable" checked="checked">
												</logic:equal> <logic:notEqual name="objList" property="taxable" value="1">
													<input type="checkbox" name="taxable">
												</logic:notEqual> <bean:message key="BzComposer.Item.Taxable" /></td>
											</tr>
											<tr>
												<td colspan="4"><bean:message
													key="BzComposer.Item.InventoryTitle" /></td>
											</tr>
											<tr>
												<td colspan="4"><html:text name="objList"
													property="itemName" /></td>
											</tr>
											<tr>
												<td colspan="4"><bean:message
													key="BzComposer.Item.Description" /></td>
											</tr>
											<tr>
												<td colspan="4"><html:textarea name="objList"
													property="invTitle" /></td>
											</tr>
											<tr>
												<td><bean:message key="BzComposer.Item.SalePrice" /></td>
												<td><bean:message key="BzComposer.Item.PurchasePrice" /></td>
												<td><bean:message key="BzComposer.Item.QtyonHand" /></td>
												<td><bean:message key="BzComposer.Item.Weight" /></td>
											</tr>
											<tr>
												<td><html:text name="objList" property="salePrice"
													onkeydown="return numbersonly(event,this.value)" /></td>
												<td><html:text name="objList" property="purchasePrice"
													onkeydown="return numbersonly(event,this.value)" /></td>
												<td><html:text name="objList" property="qty"
													onkeydown="return numbersonly(event,this.value)" /></td>
												<td><html:text name="objList" property="weight" size="8"
													onkeydown="return numbersonly(event,this.value)" /></td>
											</tr>
											<tr>
												<td><bean:message key="BzComposer.Item.Location" /></td>
												<td><bean:message key="BzComposer.Item.Serial" /></td>
											</tr>
											<tr>
												<td><html:text name="objList" property="location" /></td>
												<td><html:text name="objList" property="serialNum"
													onkeydown="return numbersonly(event,this.value)" /></td>
											</tr>
										</table>
										</logic:present>
										<logic:notPresent name="ISCategory">
										<table style="visibility:visible">
											<tr>
												<th><bean:message
													key="BzComposer.Item.InventoryInformation" /></th>
											</tr>
											<tr>
												<td><logic:equal name="objList" property="taxable"
													value="1">
													<input type="checkbox" name="taxable" checked="checked">
												</logic:equal> <logic:notEqual name="objList" property="taxable" value="1">
													<input type="checkbox" name="taxable">
												</logic:notEqual> <bean:message key="BzComposer.Item.Taxable" /></td>
											</tr>
											<tr>
												<td colspan="4"><bean:message
													key="BzComposer.Item.InventoryTitle" /></td>
											</tr>
											<tr>
												<td colspan="4"><html:text name="objList"
													property="itemName" /></td>
											</tr>
											<tr>
												<td colspan="4"><bean:message
													key="BzComposer.Item.Description" /></td>
											</tr>
											<tr>
												<td colspan="4"><html:textarea name="objList"
													property="invTitle" /></td>
											</tr>
											<tr>
												<td><bean:message key="BzComposer.Item.SalePrice" /></td>
												<td><bean:message key="BzComposer.Item.PurchasePrice" /></td>
												<td><bean:message key="BzComposer.Item.QtyonHand" /></td>
												<td><bean:message key="BzComposer.Item.Weight" /></td>
											</tr>
											<tr>
												<td><html:text name="objList" property="salePrice"
													onkeydown="return numbersonly(event,this.value)" /></td>
												<td><html:text name="objList" property="purchasePrice"
													onkeydown="return numbersonly(event,this.value)" /></td>
												<td><html:text name="objList" property="qty"
													onkeydown="return numbersonly(event,this.value)" /></td>
												<td><html:text name="objList" property="weight" size="8"
													onkeydown="return numbersonly(event,this.value)" /></td>
											</tr>
											<tr>
												<td><bean:message key="BzComposer.Item.Location" /></td>
												<td><bean:message key="BzComposer.Item.Serial" /></td>
											</tr>
											<tr>
												<td><html:text name="objList" property="location" /></td>
												<td><html:text name="objList" property="serialNum"
													onkeydown="return numbersonly(event,this.value)" /></td>
											</tr>
										</table>
										</logic:notPresent>
										</td>
									</tr>
									<tr align="center">
										<td colspan="4">
										<table>
										<tr>
										<td>	<input type="button" class="formbutton" 
											onclick="updateItem();" name="updatBtn"
											value='<bean:message key="BzComposer.global.update" />'></td>
										<td><input
											type="button" name="updatBtn" class="formbutton" 
											value='<bean:message key="BzComposer.Item.Clear" />'
											onclick="ClearMe();"></td>
										<td><input type="button" class="formbutton" 
											name="updatBtn"
											value='<bean:message key="BzComposer.Item.Close"  />'
											onclick="CloseMe();">
											</td>
										</tr>
										
										
										
										</table>
									
											
											
											</td>
								</logic:equal>


							</tbody>

							<logic:equal name="objList" property="itemType" value="2">
								<tr>
									<td><bean:message key="BzComposer.Item.DiscountName" /></td>

								</tr>
								<tr>

									<td><html:text name="objList" property="itemCode" /></td>


								</tr>
								<tr>
									<td><bean:message key="BzComposer.Item.AmountofDiscount" /></td>
								</tr>

								<tr>
									<td><html:text name="objList" property="salePrice"
										onkeydown="return numbersonly(event,this.value)" /></td>


								</tr>
								<tr>
									<td><bean:message key="BzComposer.Item.DiscountTitle" /></td>
								<tr>
									<td><html:text name="objList" property="invTitle" /></td>
								</tr>
								<tr align="center">
									<td colspan="4">
									
									<input type="button"
										onclick="updateItem();" name="updatBtn"
										value='<bean:message key="BzComposer.global.update" />'><input
										type="button" name="updatBtn"
										value='<bean:message key="BzComposer.Item.Clear" />'
										onclick="ClearMe();"><input type="button"
										name="updatBtn"
										value='<bean:message key="BzComposer.Item.Close" />'
										onclick="CloseMe();">
										
										
										</td>
							</logic:equal>

							<logic:equal name="objList" property="itemType" value="3">
								<tr>
									<td><bean:message key="BzComposer.Item.SubtotalName" /></td>
								</tr>
								<tr>
									<td><html:text name="objList" property="itemCode" /></td>
									<td><input type="hidden"
										value='<bean:write name="objList" property="itemCode" />'
										id="$$3" /></td>
								</tr>
								<tr>
									<td><bean:message key="BzComposer.Item.Description" /></td>
								</tr>
								<tr>
									<td><html:text name="objList" property="itemName" /></td>
								</tr>
								<tr align="center">
									<td colspan="4"><input type="button" class="formbutton" 
										onclick="updateItem();" name="updatBtn"
										value='<bean:message key="BzComposer.global.update" />'><input
										type="button" name="updatBtn" class="formbutton" 
										value='<bean:message key="BzComposer.Item.Clear" />'
										onclick="ClearMe();"><input type="button" class="formbutton" 
										name="updatBtn"
										value='<bean:message key="BzComposer.Item.Close" />'
										onclick="CloseMe();"></td>
							</logic:equal>
							<logic:equal name="objList" property="itemType" value="4">
								<tr>
									<td><bean:message key="BzComposer.Item.ServiceName" /></td>
									<td><bean:message key="BzComposer.Item.Subcategoryof" /></td>
									<td><html:select property="tectcmd" disabled="disabled"
										name="objList">
										<html:option value="0"><bean:message key="BzComposer.ComboBox.Select"/></html:option>
										<html:options collection="fillList" property="value"
											labelProperty="label"></html:options>

									</html:select></td>

								</tr>
								<tr>
									<td><html:text name="objList" property="itemCode" /></td>


								</tr>
								<tr>
									<td>
										<logic:present name="ISCategory">
											<input type="checkbox" id="chk_cat"
											checked="true" onclick="hide_other(this.value);" disabled="disabled"/> <bean:message
											key="BzComposer.Item.isCategory" />
											<html:hidden property="iscategory" value="on"/>
										</logic:present>
										<logic:notPresent name="ISCategory">
											<input type="checkbox" id="chk_cat"
											onclick="hide_other(this.value);" disabled="disabled"/> <bean:message
											key="BzComposer.Item.isCategory" />
											<html:hidden property="iscategory" value="off"/>
										</logic:notPresent>
									</td>
								</tr>
								<tr>
									<td>
									<logic:present name="ISCategory">
									<div style="visibility:hidden">
									<table>
										<tr>
											<th><bean:message
												key="BzComposer.Item.InventoryInformation" /></th>
										</tr>
										<tr>
											<td><logic:equal name="objList" property="taxable"
												value="1">
												<input type="checkbox" name="taxable" checked="checked">
											</logic:equal> <logic:notEqual name="objList" property="taxable" value="1">
												<input type="checkbox" name="taxable">
											</logic:notEqual> <bean:message key="BzComposer.Item.Taxable" /></td>
										</tr>
										<tr>
											<td colspan="4">
												
													<bean:message key="BzComposer.Item.ServiceTitle" />
													
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<html:text name="objList" property="itemName" />
																								
											</td>
										</tr>
										<tr>
											<td colspan="4">
												
													<bean:message key="BzComposer.Item.ServiceDescription" />
													
											</td>
										</tr>
										<tr>
											<td colspan="4">
												
													<html:textarea name="objList" property="invTitle" />
												
											</td>
										</tr>
										<tr>
											<td>
												
													<bean:message key="BzComposer.Item.ServiceRate" />
												
											</td>
										</tr>
										<tr>
											<td>
												
													<html:text name="objList" property="salePrice" onkeydown="return numbersonly(event,this.value)"></html:text>
													
											</td>
										</tr>
									</table>
									</div>
									</logic:present>
									<logic:notPresent name="ISCategory">
									<div style="visibility:visible">
									<table>
										<tr>
											<th><bean:message
												key="BzComposer.Item.InventoryInformation" /></th>
										</tr>
										<tr>
											<td><logic:equal name="objList" property="taxable"
												value="1">
												<input type="checkbox" name="taxable" checked="checked">
											</logic:equal> <logic:notEqual name="objList" property="taxable" value="1">
												<input type="checkbox" name="taxable">
											</logic:notEqual> <bean:message key="BzComposer.Item.Taxable" /></td>
										</tr>
										<tr>
											<td colspan="4">
												
													<bean:message key="BzComposer.Item.ServiceTitle" />
													
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<html:text name="objList" property="itemName" />
																								
											</td>
										</tr>
										<tr>
											<td colspan="4">
												
													<bean:message key="BzComposer.Item.ServiceDescription" />
													
											</td>
										</tr>
										<tr>
											<td colspan="4">
												
													<html:textarea name="objList" property="invTitle" />
												
											</td>
										</tr>
										<tr>
											<td>
												
													<bean:message key="BzComposer.Item.ServiceRate" />
												
											</td>
										</tr>
										<tr>
											<td>
												
													<html:text name="objList" property="salePrice" onkeydown="return numbersonly(event,this.value)"></html:text>
													
											</td>
										</tr>
									</table>
									</div>
									</logic:notPresent>
									</td>
								</tr>
								<tr align="center">
									<td colspan="4"><input type="button" class="formbutton" 
										onclick="updateItem(this.form);" name="updatBtn"
										value='<bean:message key="BzComposer.global.update" />'><input
										type="button" name="updatBtn" class="formbutton" 
										value='<bean:message key="BzComposer.Item.Clear" />'
										onclick="ClearMe();"><input type="button" class="formbutton" 
										name="updatBtn"
										value='<bean:message key="BzComposer.Item.Close" />'
										onclick="CloseMe();">
									</td>
							</logic:equal>

						</table>
						</td>
					</tr>
				</logic:iterate>
			</logic:notEmpty>
		</logic:present>

	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- end Contents -->
</html:form>
</body>
</html>
<script>
function DisConValue(form){
	if(form.discontinued.checked==true){
		form.discontinued.value="on";
	}
	else{
		form.discontinued.value="off";
	}
}
function updateItem(form){
	val = document.getElementById('inId').value;
	type= document.getElementById('itmType').value;
	var res=window.confirm('<bean:message key="BizComposer.ItemDetails.Update.Validation" />')
	if (res){
		document.forms[0].action = "UpdateItem.do?tabid=UpdateItem&InvId="+val+"&ItemType="+type;
		document.forms[0].submit();
	}
}


function numbersonly(e,val){
		var temp=val.indexOf(".");
		var key=e.charCode? e.charCode : e.keyCode;
		if(window.event){
               	if(window.event.ctrlKey)
                        isCtrl = true;
                else
                    isCtrl = false;
        }
        else{
                if(e.ctrlKey)
                        isCtrl = true;
                else
                        isCtrl = false;
        }
        if(isCtrl){ 
	        if("v" == String.fromCharCode(key).toLowerCase()) {
	        	return false;
            }
            if("x" == String.fromCharCode(key).toLowerCase()) {
                return false;
            }
        }
		else if (key!=8){
			var str =String(val);
			var temp=val.indexOf(".");
			index=0;		
			for(i=0;i<str.length;i++){
				if(str.charAt(i)=='.'){
					index=1;
					break;
				}
			}
			if(key==46 && temp==-1){
				 return true;
			} 
			else if(key==37 || key==39){
				return true; 	
			}
			else if(key==110 && index==0){
				return true;
			}
			else if(key==190 && index==0){
				return true;
			}
			else if(key>=96 && key<=105){
				return true; 	
			}
			else if (key<48||key>57) //if not a number
				return false; //disable key press
		}
	}


function CloseMe(){
	window.close();
}
function ClearMe(form){
	type=document.getElementById('itmType').value;
	window.open("Item.do?tabid=ShowAdd&ItemType="+type,null,"scrollbars=yes,height=500,width=950,status=yes,toolbar=no,menubar=no,location=no" );
}		
</script>