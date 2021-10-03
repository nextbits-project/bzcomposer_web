<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu_add.js"></script> -->
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.adjustinventorytitle" /></title>
<style type="text/css">
.height250 {
height:47%;

}
.fht-tbody{
height:85% !important; /*  change table height*/
border-bottom: 1px solid rgb(207, 207, 207);
}
table.tabla-listados {
width: 100%;
border: 1px solid rgb(207, 207, 207);
margin: 0px 0px 0px 0px;
margin: 0px 0px 0px 0px;
}
table.tabla-listados tbody tr.odd td {
background: #e1e5e9;
}
</style>
</head>
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<html:form action="Item.do" method="post" styleId="adjustInventory">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<!-- begin Contents -->
<div>
	<span style="font-size:1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<bean:message key="BzComposer.adjustinventory.adjustinventorytitle"/>
	</span>
</div>
<br/>
<div>
	<div>
		<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
      		<table id="adjustInventory" class="tabla-listados" cellpadding="0" cellspacing="0">
				<thead style="font-weight: bold;">
					<tr>
						<th class="emblem" style="font-size: 1em;">
							<bean:message key="BzComposer.additem.itemname" />
						</th>
						<th class="emblem" style="font-size: 1em;">
							<bean:message key="BzComposer.adjustinventory.title"/>
						</th>
						<th class="emblem" style="font-size: 1em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</th>
						<th class="emblem" style="font-size: 1em;">
							<bean:message key="BzComposer.additem.qty" />
						</th>
						<th class="emblem" style="font-size: 1em;">
							<bean:message key="BzComposer.adjustinventory.newqty" />
						</th>
						<th class="emblem" style="font-size: 1em;">
							<bean:message key="BzComposer.adjustinventory.value" />
						</th>
						<th class="emblem" style="font-size: 1em;">
							<bean:message key="BzComposer.adjustinventory.newvalue" />
						</th>
					</tr>
				</thead>
				<tbody>
					<logic:present name="ItemDetails">
						<logic:notEmpty name="ItemDetails">
							<bean:size name="ItemDetails" id="ItemDetailsSize" />
								<input type="hidden" name="listSize" id="lSize" value='<bean:write name="ItemDetailsSize" />'>					
								<logic:iterate name="ItemDetails" id="objList1" indexId="ndx">
									<tr id='<bean:write name="ndx" />$$' onclick="callClick('<bean:write name="ndx" />$$');">
										<td style="font-size: 1em;">
											<logic:equal name="objList1" property="putcharacter" value="***">
												<font size="2">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<bean:write name="objList1" property="itemCode"/>
												</font>
											</logic:equal> 
											<logic:equal name="objList1" property="putcharacter" value="**">
												<font size="3">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*
													<bean:write name="objList1" property="itemCode"/>
												</font>
											</logic:equal>
											<logic:equal name="objList1" property="putcharacter" value="*">
												<font size="3">
													<bean:write name="objList1" property="putcharacter" />
													<bean:write name="objList1" property="itemCode" />
												</font>
											</logic:equal>
										</td>
										<logic:equal name="objList1" property="itemType" value="1">
										<td colspan="2" style="font-size: 1em;">
											<bean:write name="objList1" property="itemName" />
										</td>
										<td style="font-size: 1em;">
											<bean:write name="objList1" property="qty" />
										</td>
										<td style="font-size: 1em;">																
											<logic:equal name="objList1" property="iscategory" value="0">
						                 		
						                 		<input type="text" onkeydown="return numbersonly(event,this.value)" id='qty<bean:write name="ndx" />'
												name='newQty<bean:write name="objList1" property="inventoryId" />'/>
							         		</logic:equal> 									 
									 	</td>
										<td style="font-size: 1em;">
											<bean:write name="objList1" property="salePrice" />
										</td>
										<td style="font-size: 1em;">								
											<logic:equal name="objList1" property="iscategory" value="0">
												
												<input type="text" onkeydown="return numbersonly(event,this.value)" id='value<bean:write name="ndx" />'
												name='newValue<bean:write name="objList1" property="inventoryId" />'/>
									 		</logic:equal> 
										</td>
										</logic:equal>	
																
										<logic:notEqual name="objList1" property="itemType" value="2">
										
										<!-- Subtotal -->

										<logic:equal name="objList1" property="itemType" value="3">
											<td colspan="2" style="font-size: 1em;">
												<bean:write name="objList1" property="itemName" />
											</td>
											<td style="font-size: 1em;">
												<bean:write name="objList1" property="qty" />
											</td>
											<td style="font-size: 1em;">
												<input type="text" onkeydown="return numbersonly(event,this.value)" id='qty<bean:write name="ndx" />'
												name='newQty<bean:write name="objList1" property="inventoryId" />' disabled="disabled" />
											</td>
											<td style="font-size: 1em;">
												<bean:write name="objList1" property="salePrice" />
											</td>
											<td style="font-size: 1em;">
												<input type="text" onkeydown="return numbersonly(event,this.value)" id='value<bean:write name="ndx" />'
												name='newValue<bean:write name="objList1" property="inventoryId" />' disabled="disabled" />
											</td>
										</logic:equal>
										
										<logic:notEqual name="objList1" property="itemType" value="3">
									
										<!-- Services -->

										<logic:equal name="objList1" property="itemType" value="4">
											<logic:equal name="objList1" property="iscategory" value="true">
												<td colspan="2" style="font-size: 1em;">
													<bean:write name="objList1" property="itemName" />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="qty" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" onkeydown="return numbersonly(event,this.value)" id='qty<bean:write name="ndx" />'
													name='newQty<bean:write name="objList1" property="inventoryId" />' disabled="disabled" />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="salePrice" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" disabled="disabled" onkeydown="return numbersonly(event,this.value)"
													id='value<bean:write name="ndx"/>' name='newValue<bean:write name="objList1" property="inventoryId"/>'/>
												</td>
											</logic:equal>
										</logic:equal>
										<logic:equal name="objList1" property="itemType" value="4">
											<logic:equal name="objList1" property="iscategory" value="false">
												<td colspan="2" style="font-size: 1em;">
													<bean:write name="objList1" property="itemName" />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="qty" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" onkeydown="return numbersonly(event,this.value)" id='qty<bean:write name="ndx"/>'
													name='newQty<bean:write name="objList1" property="inventoryId" />'/>
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="salePrice" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" onkeydown="return numbersonly(event,this.value)" id='value<bean:write name="ndx"/>'
													name='newValue<bean:write name="objList1" property="inventoryId" />' />
												</td>
											</logic:equal>
										</logic:equal>
										
										<!--   Inventory  -->

										<logic:equal name="objList1" property="itemType" value="1">
											<logic:equal name="objList1" property="iscategory" value="true">
												<td colspan="2" style="font-size: 1em;">
													<bean:write name="objList1" property="itemName" />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="qty" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" onkeydown="return numbersonly(event,this.value)" id='qty<bean:write name="ndx"/>'
													name='newQty<bean:write name="objList1" property="inventoryId" />' disabled="disabled" />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="salePrice" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" disabled="disabled" onkeydown="return numbersonly(event,this.value)"
													id='value<bean:write name="ndx" />'
													name='newValue<bean:write name="objList1" property="inventoryId"/>'/>
												</td>
											</logic:equal>
										</logic:equal>
										<logic:equal name="objList1" property="itemType" value="1">
											<logic:equal name="objList1" property="iscategory" value="false">
												<td colspan="2" style="font-size: 1em;">
													<bean:write name="objList1" property="itemName" />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="qty" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" onkeydown="return numbersonly(event,this.value)" id='qty<bean:write name="ndx" />'
													name='newQty<bean:write name="objList1" property="inventoryId" />' />
												</td>
												<td style="font-size: 1em;">
													<bean:write name="objList1" property="salePrice" />
												</td>
												<td style="font-size: 1em;">
													<input type="text" onkeydown="return numbersonly(event,this.value)" id='value<bean:write name="ndx"/>'
													name='newValue<bean:write name="objList1" property="inventoryId" />' />
												</td>
											</logic:equal>
										</logic:equal>
										
										</logic:notEqual>

										</logic:notEqual>

									</tr>
								</logic:iterate>
							</logic:notEmpty>
						</logic:present>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- end Contents -->
	<table style="margin-left: 50%;">
		<tr>
			<td style="font-size: 1em;">
				<input type="button" name="AddItemBtn" value="<bean:message key='BzComposer.global.save'/>" class="formbutton" onclick="ApplyInventory();">
			</td>
			<td style="font-size: 1em;">
				<input type="button" name="AddItemBtn" value="<bean:message key='BzComposer.adjustinventory.clear'/>" class="formbutton" onclick="ClearAll();">
			</td>
		</tr>
	</table>
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
function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var key=e.charCode? e.charCode : e.keyCode;
	if(window.event)
	{
		if(window.event.ctrlKey)
        	isCtrl = true;
		else
        	isCtrl = false;
	}
    else
    {
    	if(e.ctrlKey)
        	isCtrl = true;
		else
        	isCtrl = false;
	}
    if(isCtrl)
    { 
		if("v" == String.fromCharCode(key).toLowerCase()) 
		{
	    	return false;
		}
        if("x" == String.fromCharCode(key).toLowerCase()) 
        {
        	return false;
		}
	}
	else if (key!=8)
	{
		var str =String(val);
		var temp=val.indexOf(".");
		index=0;		
		for(i=0;i<str.length;i++)
		{
			if(str.charAt(i)=='.')
			{
				index=1;
				break;
			}
		}
		if(key==46 && temp==-1)
		{
			return true;
		} 
		else if(key==37 || key==39)
		{
			return true; 	
		}
		else if(key==110 && index==0)
		{
			return true;
		}
		else if(key==190 && index==0)
		{
			return true;
		}
		else if(key>=96 && key<=105)
		{
			return true; 	
		}
		else if (key<48||key>57) //if not a number
				return false; //disable key press
	}
}
function SetWriteAble(id)
{
 alert("in");
// document.getElementById(id).disabled =false;
}
function callClick(rid){
	size=document.getElementById("lSize").value;
// 		for(i=0;i<size;i++){
// 			var row1=document.getElementById(i+"$$");
// 			row1.className = "";
// 		}
// 	var rd=document.getElementById(rid);
// 	rd.className = "draft";	
	rowValue= rid.replace("$$","");
 	for(i=0;i<size;i++){
			document.getElementById(i+"$$").classList.remove('draft');		
			if(i%2==0){
			if(size !=(i+1)){
				document.getElementById((i+1)+"$$").classList.add('odd');
			}
		}
	}
	if(rowValue%2 !=0){ ;
		document.getElementById(rowValue+"$$").classList.remove('odd'); 		
	}
	var rd = document.getElementById(rid).classList.add('draft');
}

callClick("0$$");
function ApplyInventory()
{
	/* var resp=window.confirm('<bean:message key="BzComposer.AdjustInventory.Confirm.Validation" />')
	if(resp)
	{
		document.forms[0].action = "Item.do?tabid=ApplyInventory";
		document.forms[0].submit();
	} */
	debugger;
	event.preventDefault();
	$("#applyInventoryDialog").dialog({
		resizable: false,
	    height: 200,
	    width: 400,
	    modal: true,
	    buttons: {
			"<bean:message key='BzComposer.global.ok'/>": function () {
	        	$(this).dialog("close");
	        	document.forms['adjustInventory'].action = "Item.do?tabid=ApplyInventory";
	    		document.forms['adjustInventory'].submit();
			},
            "<bean:message key='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
                return false;
			}
		}
	});
	return false;
}
function ClearAll()
{
	size=document.getElementById("lSize").value;
	for(i=0;i<size;i++)
	{
		document.getElementById("qty"+i).value="";
		document.getElementById("value"+i).value="";		
	}
}
</script>
<!-- Dialog box used in sales order page -->
<div id="applyInventoryDialog" style="display:none;">
	<p><bean:message key="BzComposer.adjustinventory.confirmvalidation" /></p>
</div>