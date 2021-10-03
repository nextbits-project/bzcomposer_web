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
<script>
window.onload = initShowHideDivs;
</script>
<title><bean:message key="BzComposer.rmalisttitle" /></title>
<style type="text/css">
.dhtmlgoodies_answer{
height: 600px !important;
}
.height250 {
height:47%;

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
<body>
<!-- begin shared/header -->
<html:form action="RMA.do?tabid=R0S0C0" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<!-- begin Contents --> 
<!-- 	<div class="dhtmlgoodies_question"> -->
	<div><span
		style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.rmalist.rmalist" /></span>
		</div>
		
<!-- 	<div class="dhtmlgoodies_answer"> -->
<div>
	<div>
	 <div class="grid_8 height250 tabla-listados" id="table-negotiations" >
   
      <table  id="rmaData" class="tabla-listados" cellpadding="0" cellspacing="0">
	
		<thead style="font-weight: bold;">
			<tr>
				<th class="emblem" align="left" nowrap="nowrap" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.rmanumber" />
				</th>
				<th class="emblem" align="left" nowrap="nowrap" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.lastname" />
				</th>
				<th class="emblem" align="left" nowrap="nowrap" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.firstname" />
				</th>
				<th class="emblem" align="left" nowrap="nowrap" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.itemcode" />
				</th>
				<th class="emblem" align="left" nowrap="nowrap" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.itemdescription" />
				</th>
				<th class="emblem" align="left" nowrap="nowrap" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.reason" />
				</th>
				<th class="emblem" align="left" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.rmaquantity" />
				</th>
				<th class="emblem" align="left" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.unitprice" />
				</th>
				<th class="emblem" align="left" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.unitweight" />
				</th>
				<th class="emblem" align="left" style="font-size: 14px;">
					<bean:message key="BzComposer.rmalist.rmarequest" />
				</th>
			</tr>
		</thead>
		<tbody style="font-size: 14px;">
			<logic:present name="RMAList" scope="request">
				<logic:notEmpty name="RMAList" scope="request">
					<bean:size id="RMAListID" name="RMAList" />
					<input type="hidden" name="RMALID" id="lSize"
						value='<bean:write name="RMAListID" />'>
					<logic:iterate name="RMAList" id="RobjList" scope="request"
						indexId="indx">
						<tr id="<bean:write name="indx" />$$"
							onclick="setRMA('<bean:write name="RobjList" property="order" />','<bean:write name="RobjList" property="fname" />','<bean:write name="RobjList" property="lname" />','<bean:write name="indx" />$$');">

							<td nowrap="nowrap" style="font-size: 14px;"><bean:write name="RobjList"
								property="rma" /></td>
							<td nowrap="nowrap" style="font-size: 14px;" ><bean:write name="RobjList"
								property="lname" /></td>
							<td nowrap="nowrap" style="font-size: 14px;"><bean:write name="RobjList"
								property="fname" /></td>
							<td nowrap="nowrap" style="font-size: 14px;"><bean:write name="RobjList"
								property="itemCode" /></td>
							<td nowrap="nowrap" width="400" style="font-size: 14px;"><bean:write name="RobjList"
								property="itemDesc" /></td>
							<td nowrap="nowrap" style="font-size: 14px;"><bean:write name="RobjList"
								property="reason" /></td>
							<td nowrap="nowrap" align="right" style="font-size: 14px;"><bean:write
								name="RobjList" property="qty" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td nowrap="nowrap" align="right" style="font-size: 14px;"><bean:write
								name="RobjList" property="unitPrice" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td nowrap="nowrap" align="right" style="font-size: 14px;"><bean:write
								name="RobjList" property="unitWeight" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td nowrap="nowrap" style="font-size: 14px;"><bean:write name="RobjList"
								property="sentDate" /></td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
			</logic:present>

			<tr>
				<td><input type="hidden" name="RMAval" id="RMAnum"> <input
					type="hidden" name="Fnameval" id="RMAfname"> <input
					type="hidden" name="Lnameval" id="RMAlname"></td>
			</tr>
		</tbody>
	</table>
	</div>
	<div align="center">
	<table>
		<tr>
			<td><logic:present name="PageValue">
				<logic:notEqual name="PageValue"
					value='<%=(String)session.getAttribute("StartPage") %>'>
									&nbsp;&nbsp;&nbsp;
									<a href="#" onclick="getPreviousRecord();"> <strong>
					<bean:message key="BzComposer.global.previous" /> </strong> </a>
				</logic:notEqual>
			</logic:present> <logic:iterate name="Total" id="tot">
				<logic:equal name="tot"
					value='<%= (String)request.getAttribute("PageValue") %>'>
									&nbsp;&nbsp;&nbsp;<font color="red"><bean:write
						name="tot" /></font>
				</logic:equal>
				<logic:notEqual name="tot"
					value='<%= (String)request.getAttribute("PageValue") %>'>
									&nbsp;&nbsp;&nbsp;<a href="#"
						onclick="getPrintLabelRecord('<bean:write name="tot"/>');"><bean:write
						name="tot" /></a>
				</logic:notEqual>
			</logic:iterate> <logic:present name="PageValue">
				<logic:notEqual name="PageValue"
					value='<%=(String)request.getAttribute("TotalPages") %>'>
									&nbsp;&nbsp;&nbsp;
									<a href="#" onclick="getNextRecord();"> <strong> <bean:message
						key="BzComposer.global.next" /> </strong> </a>
				</logic:notEqual>
			</logic:present></td>
		</tr>
	</table>
	
	</div>
	<div align="center">
	<table>
		<tr>
			<td><input disabled="disabled" type="button" id="modifyRMA"
				class="formButton" onclick="getRMA();" name="RMABtn"
				title='<bean:message key="BzComposer.rmalist.modifyrmatooltip"/>'
				value='<bean:message key="BzComposer.rmalist.modifyrmabutton"/>'></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div><input type="hidden" name="tabid" id="tab"
		value="R0L0S0List" /> <html:hidden property="startPage" /></div>
	<!-- end Contents -->
</html:form>

<%@ include file="/include/footer.jsp"%>
</body>
</html>
<script>
	function getPrintLabelRecord(no){
		document.getElementById('tab').value="R0L0S0List";
		document.RMAForm.startPage.value=no;
		document.forms[0].action = "RMA.do";
		document.forms[0].submit();
	}
	function getPreviousRecord(){
		document.getElementById('tab').value="R0L0S0List";
		document.RMAForm.startPage.value=(parseInt(document.RMAForm.startPage.value) - 1);
		document.forms[0].action = "RMA.do";
		document.forms[0].submit();
	}
	function getNextRecord(){
		document.getElementById('tab').value="R0L0S0List";
		document.RMAForm.startPage.value=(parseInt(document.RMAForm.startPage.value) + 1);
		document.forms[0].action = "RMA.do";
		document.forms[0].submit();
	}
function setRMA(rno,fnm,lnm,rid)
{
size=document.getElementById("lSize").value;
// for(i=0;i<size;i++){
// var row1=document.getElementById(i+"$$");
// row1.className="";
// }
// var rd=document.getElementById(rid);
// rd.className="draft";
for(i=0;i<size;i++){ 
	 document.getElementById(i+"$$").classList.remove('draft');		
	 if(i%2==0){	
		 if(size !=(i+1)){
		 document.getElementById((i+1)+"$$").classList.add('odd');
		 }
	 }
}
 rowValue= rid.replace("$$","");

if((rowValue-1)%2==0){ 		
	document.getElementById((rowValue)+"$$").classList.remove('odd'); 		
}
var rd = document.getElementById(rowValue+"$$").classList.add('draft');

document.getElementById("RMAnum").value=rno;
document.getElementById("RMAfname").value=fnm;
document.getElementById("RMAlname").value=lnm;
document.getElementById("modifyRMA").disabled=false;
}

function getRMA()
{
	rnum=document.getElementById("RMAnum").value;
	rFnm=document.getElementById("RMAfname").value;
	rLnm=document.getElementById("RMAlname").value;
	rmawindow=window.open("RMA.do?tabid=RmaInfo&OrderID="+rnum+"&Fname="+rFnm+"&Lname="+rLnm,null,"scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no" );
	rmawindow.moveTo(50,20);

}
</script>
