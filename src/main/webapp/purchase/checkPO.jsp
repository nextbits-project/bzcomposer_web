<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.checkpoordertitle"/></title>
<style type="text/css">
.height250 {
height: 47%;
}
.fht-tbody{
height: 85% !important; /*  change table height*/
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
<script type="text/javascript">
function showUpdateDialog()
{
	debugger;
	event.preventDefault();
	$("#showUpdateDialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
					document.getElementById("modi").disabled=false;
					document.forms['checkPO'].action = "CheckPO.do?tabid=UpdateCheckPO";
					document.forms['checkPO'].submit();
				   	//$('checkPO').submit();
				   	
	               	
	            },
	            <bean:message key='BzComposer.global.cancel'/>: function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}
function checkduplicatenamedialog()
{
	debugger;
	event.preventDefault();
	$("#checkduplicatenamedialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
	            }
	        }
	    });
	    return false;
}
</script>
<body>
<!-- begin shared/header -->
<html:form styleId= "checkPO" action="CheckPO.do?tabid=ShowListCheckPO" method="post">
<div id="">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<div style="float: left;">
		<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.checkpurchaseorder.checkpoorders" />
		</span>
	</div>
	<div style="float: right;">
		<table>
			<tr>
				<td colspan="2" align="right" style="font-size:14px;">
					<input type="submit" class="formbutton" name="findBtn" value='<bean:message key="BzComposer.checkpurchaseorder.refresh"/>'>
				</td>			
			</tr>
		</table>
	</div>
</div>
<div>
	<div id="table-negotiations">
		<table cellspacing="0" align="center" style="width: 100%;">
			<tr align="left">
				<td style="font-size:14px;">
					<logic:present name="IsUpdated">
						<strong><span class="msgstyle">
							<bean:write name="IsUpdated" />
						</span></strong>
					</logic:present>
				</td>
			</tr>		
		</table>
		<div>
			<table align="center">
				<tr>
					<td align="center">
						<logic:notEmpty name="msg">
							<font color="red"><b><bean:write name="msg" /></b></font>
						</logic:notEmpty>
					</td>
				</tr>
			</table>	
<!-- 	<span -->
<%-- 		style="font-size: 1.14px; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"><bean:message --%>
<!-- 		key="BzComposer.purchase.PurchaseBoard.PurchaseList" /></span> -->
		
			<div>
				<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
      				<table id="checkPOList" class="tabla-listados" cellpadding="0" cellspacing="0">
						<thead style="font-weight: bold;">
							<tr>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.ponumber"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.itemreceived"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.vendor"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.itemcode"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.itemname"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.orderquantity" />
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.receivedquantity"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.amountdifference"/>
								</th>
								<th style="font-size:14px;">
									<bean:message key="BzComposer.checkpurchaseorder.message"/>
								</th>
							</tr>
						</thead>
						<tbody>
							<logic:present name="PurchaseBoardDetails" scope="request">
								<logic:notEmpty name="PurchaseBoardDetails" scope="request">
									<bean:size id="SalesListSize" name="PurchaseBoardDetails" />
										<input type="hidden" name="sListSize" id="lSize" value='<bean:write name="SalesListSize" />'>
										<logic:iterate name="PurchaseBoardDetails" id="objList" indexId="ndx">
											<tr id='<bean:write name="ndx" />$$' >
												<td align="left" style="font-size:14px;">
													<bean:message key="BzComposer.purchase.PONumPrefix" />
													<bean:write name="objList" property="po_no" />
												</td>
												<td align="left" style="font-size:14px;">
													<logic:equal name="objList" property="isReceived" value="1">
														<input type="checkbox" name="isReceived<bean:write name="ndx" />"
														id="isReceivedId" title="isReceived" checked="true" value="ON"
														onclick="makeUpdate(<bean:write name="objList" property="po_no" />,this);">
													</logic:equal>
							 						<logic:equal name="objList" property="isReceived" value="0">
														<input type="checkbox" name="isReceived<bean:write name="ndx" />"
														id="isReceivedId" title="isReceived" value="ON" 
														onclick="makeUpdate(<bean:write name="objList" property="po_no" />,this);">
													</logic:equal>
												</td>
												<td align="left" style="font-size:14px;">
													<bean:write name="objList" property="lastName" />,<bean:write name="objList"
													property="firstName" />
												</td>
	                       						<td align="left" style="font-size:14px;">
	                       							<bean:write name="objList" property="inventoryCode" />
                       							</td>
												<td align="left" style="font-size:14px;">
													<bean:write name="objList" property="itemName" />
												</td>
												<td align="center" style="font-size:14px;">
													<bean:write name="objList" property="orderQty" />
												</td>
												<td align="center" style="font-size:14px;">
													<bean:write name="objList" property="orderQty" />
												</td>
												<td align="center" style="font-size:14px;">
													<bean:write name="objList" 	property="total" />							
												</td>
												<td align="left" style="font-size:14px;">
					         						<bean:write name="objList" property="messagebody" />		
												</td>
											</tr>
										</logic:iterate>
								</logic:notEmpty>
							</logic:present>
						</tbody>
					</table>
				</div>	
			</div>
		</div>
		<table align="left">
			<tr align="center">
				<td style="font-size:14px;">
					<input type="button" class="formbutton" disabled="disabled" id="modi" onclick="makeUpdateInList();" title="Apply" name="modifyBtn"
					value='<bean:message key="BzComposer.checkpurchaseorder.apply" />'>
				 	<input type="hidden" name="ONum" id="ONumId"> 
				 	<input type="hidden" name="sEmail" id="sEmailID"> 
				 	<input type="hidden" name="rNum" id="rowONum"> 
				 	<input type="hidden" name="senderEmail" id="EID">
				</td>
			</tr>
		</table>
		<input type="hidden" id="ordId" name="OrderValue" value=""> 
		<input type="hidden" id="statusId" name="StatusValue" value=""> 
		<input type="hidden" id="ordSize" name="Size" value=""> 
	<!-- end Contents -->
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<input type="hidden" id="ord_value" />
		<input type="hidden" id="po_value" />
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
</html>

<script type="text/javascript">
function setIsEmail(){

	document.getElementById("isEmailChk").value=document.getElementById("EmailId").value;
	document.forms[0].action = "Email.do?tabid=EOSOLO";
	document.forms[0].submit();
}
function checkName(){
	if(document.RMAForm.fnameTxt.value=="" && document.RMAForm.lnameTxt.value=="")	{


		return checkduplicatenamedialog();
	}
	else{
		document.forms[0].action = "RMA.do?tabid=R0S0C0" ;
		document.forms[0].submit();
	}	
}

function setRowId(rowId,email,rid){
	document.getElementById("po_value").value=rowId;
	
	//orderNo=document.getElementById("ord_value").value;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	typeVal=document.getElementById("SearchVal").value
	for(i=0;i<size;i++){
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	var rd=document.getElementById(rid);
	rd.className = "draft";
	document.getElementById("smail").disabled=false;
	document.getElementById("sEmailID").value=email;
	document.getElementById("rowONum").value=rowId;
}


var ordarr = new Array();
var statusarr = new Array();

var cnt=0;
var ord="";
var status="";
function makeUpdate(orderno,obj)
{
	var flag=0;
	document.getElementById("modi").disabled=false;
	val=obj.checked;
	for(j=0;j<=cnt;j++){
		if(orderno==ordarr[j]){
			flag=1;
			statusarr[j]=val;
		}
	}
	if(flag==0){
		ordarr[cnt]=orderno;
		statusarr[cnt]=val;
		cnt++;
	}
	
}

function makeUpdateInList()
{
	debugger;
	for(j=0;j<cnt;j++){
		ord+=ordarr[j]+";";
		status+=statusarr[j]+";";
	}
	document.getElementById('ordSize').value=cnt;
	document.getElementById('ordId').value=ord;
	document.getElementById("statusId").value=status;
	
	debugger;
	return showUpdateDialog();
	/* response = window.confirm("Do you want to update record?");
	if(response){
		document.getElementById("modi").disabled=false;
		document.forms[0].action = "CheckPO.do?tabid=UpdateCheckPO";
		document.forms[0].submit();
	}  */
}

function SaleSearch(){
	Myid="";
	count=0;
	size=document.getElementById("lSize").value;
	type=document.getElementById("sType").value;
	typeVal=document.getElementById("SearchVal").value;

	for(i=0;i<size;i++){
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	for(i=0;i<size;i++){
		var row1=document.getElementById(i+"$$");
		row1.className = "";
		var cells=row1.getElementsByTagName("td");
		var data1=cells[1].innerHTML;//value in first td
		
		var data2=cells[2].innerHTML;//value in second td
		var data3=cells[3].innerHTML;//value in third td
		var data4=cells[4].innerHTML;//value in forth td
		var data5=cells[5].innerHTML;//value in fifth td
		var data6=cells[6].innerHTML;//value in sixth td
		var data7=cells[7].innerHTML;//value in seventh td
	
		data1=data1.toLowerCase();
		data2=data2.toLowerCase();
		data3=data3.toLowerCase();
		data4=data4.toLowerCase();
		data5=data5.toLowerCase();	
		data6=data6.toLowerCase();
		data7=data7.toLowerCase();					
	
		typeVal=typeVal.toLowerCase();	
						
		if(type=="1" && data3.match(typeVal))
			{row1.className = "draft"; break;}
		else if(type=="2" && data1.match(typeVal))
			{row1.className = "draft"; break;}
		else if(type=="3" && data2.match(typeVal))
			{ row1.className = "draft"; break;}
		else if(type=="4" && data4.match(typeVal))
			{ row1.className = "draft"; break;}
		else if(type=="5" && data6.match(typeVal))
			{ row1.className = "draft"; break;}
		else if(type=="6" && data7.match(typeVal))
			{ row1.className = "draft"; break;}
	}
}
</script>
<!-- Dialog box used in checkPO page -->
<div id="showUpdateDialog" style="display:none;">
	<p><bean:message key="BzComposer.checkpurchaseorder.updaterecordmessage"/></p>
</div>
<div id="checkduplicatenamedialog" style="display:none;">
	<p><bean:message key='BzComposer.checkpurchaseorder.enterfirstorlastname'/></p>
</div>