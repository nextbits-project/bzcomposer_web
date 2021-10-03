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
<link media="screen" rel="Stylesheet" type="text/css"
	href="<bean:write name="path" property="pathvalue"/>/styles/style-mac.css" />
<script type="text/javascript"
	src="<bean:write name="path" property="pathvalue"/>/scripts/menu.js"></script>
<script type="text/javascript"
	src="<bean:write name="path" property="pathvalue"/>/scripts/dmenu.js"></script>
<%@include file="/include/header.jsp"%>
<title><bean:message key="BizComposer.amazonBulkMailer.Title" /></title>
</head>
<body onload="Initialize();">
<html:form action="Email.do" method="post" enctype="multipart/form-data">
	<div id="cos">

	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<table>
		<tr>
			<td><script type="text/javascript"
				src="<bean:write name="path" property="pathvalue"/>/scripts/data-vista-06.js"></script>
			<hr width="90%" align="left">
			</td>
		</tr>

		<tr>
			<td valign=top class="tabPage">
			<div id="content1" class="tabPage">
			<div id="table-negotiations" style="width:700">
			<table>

				<tr>
					<td>
					<table>
						<tr>
							<td>
							<table>
								<tr>
									<td><bean:message key="BizComposer.amazonBulkMailer.Market" />
									</td>
									<td>&nbsp; <select>
										<option value="1"><bean:message
											key="BizComposer.amazonBulkMailer.MarketName.Amazon" /></option>
									</select></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.amazonBulkMailer.Date" /></td>
									<td>&nbsp; <select name="Date" id="datevalue">
										<option value="1"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.Recent1week" /></option>
										<option value="2"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.Recent2week" /></option>
										<option value="3"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.Recent1Month" /></option>
										<option value="4"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.Recent2Month" /></option>
										<option value="5"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.All" /></option>
										<option value="6"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.ThisMonth" /></option>
										<option value="7"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.ThisWeek" /></option>
										<option value="8"><bean:message
											key="BizComposer.amazonBulkMailer.DateSelect.ThisYear" /></option>
									</select></td>
								</tr>
							</table>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td align="right">
							<table>
								<tr>
									<td><input type="checkbox" name="notSent" id="notSent" /><bean:message
										key="BizComposer.amazonBulkMailer.NotSent" /></td>
									<td>&nbsp; <input type="button" name="showList"
										value="<bean:message key="BizComposer.amazonBulkMailer.ShowList"/>"
										class="formbutton" onclick="ShowList();" /></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td><logic:present name="msg">
						<table align="center">
							<tr>
								<td align="center"><logic:notEmpty name="msg">
									<font color="red"><b><bean:write name="msg" /></b></font>
								</logic:notEmpty></td>
							</tr>
						</table>
					</logic:present></td>
				</tr>
				<tr>
					<td>
					<div id="table-negotiations"
						style="overflow:auto;height:300;width:625">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th><input type="checkbox" id="selectall"
									onclick="setMarkUnMark(this);" /><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.Mail" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.Market" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.Invoice" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.AmazonOrder" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.CustomerName" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.Email" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.OrderDate" /></th>
								<th><bean:message
									key="BizComposer.amazonBulkMailer.TableHeading.Sent" /></th>
							</tr>
						</thead>
						<tbody>
							<logic:present name="AmazonList">
								<bean:size name="AmazonList" id="listsize" />
								<input type="hidden" name="lstsize" id="lsize"
									value='<bean:write name="listsize" />' />
								<logic:iterate name="AmazonList" id="alist" indexId="index">
									<tr id='<bean:write name="index" />$$'
										onclick="setRowId(<bean:write name="alist" property="orderNum" />,'<bean:write name="index" />$$');">
										<td><input type="checkbox"
											name='<bean:write name="index"/>mail'
											id='<bean:write name="index"/>ismail'
											onclick="setValues(<bean:write name="alist" property="orderNum" />,'<bean:write name="index" />ismail');" /></td>
										<td><bean:message
											key="BizComposer.amazonBulkMailer.MarketName.Amazon" /></td>
										<td nowrap="nowrap"><bean:write name="alist"
											property="orderNum" /></td>
										<td nowrap="nowrap"><bean:write name="alist"
											property="orderid" />&nbsp;</td>
										<td nowrap="nowrap"><bean:write name="alist"
											property="lastName" />, <bean:write name="alist"
											property="firstName" /></td>
										<td nowrap="nowrap"><bean:write name="alist" property="email" />
										</td>

										<td nowrap="nowrap"><bean:write name="alist"
											property="orderDate1" /></td>
										<td nowrap="nowrap"><logic:equal name="alist"
											property="isEmailed" value="true">
											<logic:present name="path">
												<img
													src="<bean:write name="path" property="pathvalue"/>/images/check.png" />
											</logic:present>
										</logic:equal> <logic:notEqual name="alist"
											property="isEmailed" value="true">
											&nbsp;&nbsp;&nbsp;
										</logic:notEqual></td>
									</tr>
								</logic:iterate>
							</logic:present>
						</tbody>
					</table>
					</div>

					</td>

				</tr>

				<tr>
					<td align="center">
					<table>
						<tr>
							<td><!-- 	<input type="button" value="<bean:message key="BizComposer.amazonBulkMailer.MarkAll"/>" 
								name="mark" id="markvalue" class="formbutton" onclick="SetMark();" disabled="disabled"/>
							 --></td>
							<td><!-- 
							<input type="button" value="<bean:message key="BizComposer.amazonBulkMailer.UnmarkAll"/>" 
								name="unmark"  id="unmarkvalue" class="formbutton" disabled="disabled" onclick="SetUnmark();"/>
							 --></td>
							<td><input type="button"
								value="<bean:message key="BzComposer.Email.SendMail"/>"
								name="sendMail" id="sndmail" class="formbutton"
								disabled="disabled" onclick="Send();" /></td>
						</tr>
					</table>
					</td>
				</tr>

			</table>
			</div>
			</div>
			</td>
		</tr>
		<tr>
			<td valign=top class="tabPage">
			<div id="content2" class="tabPage">
			<div id="table-negotiations" style="width:700">
			<table>

				<tr>
					<td><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<bean:message
						key="BzComposer.amazonBulkMailer.Subject" />
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" size="30"
						name="subject" />
					<hr>
					</td>
				</tr>

				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <b><bean:message
						key="BzComposer.amazonBulkMailer.DefaultTags" /> <br>

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %<bean:message
						key="BzComposer.amazonBulkMailer.Recepient_Name" />%</b> <bean:message
						key="BzComposer.amazonBulkMailer.RecepientNameLabel" /> <br>
					<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %<bean:message
						key="BzComposer.amazonBulkMailer.Recepient_Email" />%</b> <bean:message
						key="BzComposer.amazonBulkMailer.RecepientEmailLabel" /><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<bean:message
						key="BzComposer.amazonBulkMailer.Note" />
					<hr>
					</td>

				</tr>
				<tr>
					<td><br>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<bean:message
						key="BzComposer.amazonBulkMailer.EmailTemplate" /> &nbsp;&nbsp; <input
						type="file" name="emailTemplate" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;</td>
				</tr>
			</table>
			</div>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<hr width="90%" align="left">
			</td>
		</tr>
		<tr>
			<td valign=top height=21><script type="text/javascript"
				src="<bean:write name="path" property="pathvalue"/>/scripts/amazonTab.js"></script>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	<div><input type="hidden" name="tabid" id="tid" value="" /> <input
		type="hidden" id="ordId" name="OrderValue" value=""> <input
		type="hidden" id="statusId" name="StatusValue" value=""> <input
		type="hidden" id="ordSize" name="Size" value=""></div>
	<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
<script type="text/javascript">
	var ordarr = new Array();
	var statusarr = new Array();
	f = 0;
	count=0;
	var ord="";
	var status="";

	function ShowList(){
		document.getElementById('tid').value="AmazonList";
		document.forms[0].action="Email.do";
		document.forms[0].submit();
	}
	
	function Initialize(){
		<logic:present name="Choice">
			document.getElementById('datevalue').value = '<bean:write name="Choice" />' ;
			document.getElementById('selectall').disabled=false;  
		</logic:present>
		<logic:notPresent name="Choice">
			document.getElementById('datevalue').value = 1;
			document.getElementById('selectall').disabled=true;
		</logic:notPresent>
		<logic:present name="IsSent">
			<logic:equal name="IsSent" value="1">
				document.getElementById('notSent').checked =true;
			</logic:equal>
			<logic:equal name="IsSent" value="0">
				document.getElementById('notSent').checked =false;
			</logic:equal>
		</logic:present>
		<logic:notPresent name="IsSent">
			document.getElementById('notSent').checked =false;
		</logic:notPresent>
		
	}
	
	function setRowId(orderid,rowid){
		size = document.getElementById('lsize').value;
		for(cnt=0;cnt<size;cnt++){
			var rid = document.getElementById(cnt+'$$');
			rid.className = "";
		}
		var rd = document.getElementById(rowid);
		rd.className="draft";
		document.getElementById('sndmail').disabled=false;
		if(f == 0){
			ordarr[count]=orderid;
			statusarr[count]='true';
			count++;
		}
	}
	
	function SetMark(){
		//document.getElementById('unmarkvalue').disabled=false;  
		document.getElementById('sndmail').disabled=false;
		//document.getElementById('markvalue').disabled=true;  
		size = document.getElementById('lsize').value;
		for(cnt=0;cnt<size;cnt++){
			if(document.getElementById(cnt+"ismail").checked==false)
				document.getElementById(cnt+"ismail").checked=true;
		}	
		
		
	}
	
	function SetUnmark(){
		//document.getElementById('unmarkvalue').disabled=true;
		document.getElementById('sndmail').disabled=true;
	//	document.getElementById('markvalue').disabled=false;  
		size = document.getElementById('lsize').value;
		for(cnt=0;cnt<size;cnt++){
			if(document.getElementById(cnt+"ismail").checked==true){
				document.getElementById(cnt+"ismail").checked=false;
			}
		}
	}
	 
	
	function setValues(orderno,box){
		f = 1;
		obj = document.getElementById(box);	
		flag=0;
		val=obj.checked;
		for(j=0;j<count;j++){
			if(orderno == ordarr[j]){
				flag=1;
				statusarr[j]=val;
				break;
			}
		}
		if(flag == 0){
			ordarr[count]=orderno;
			statusarr[count]=val;
			count++;
		}
		
	}
	
	function setMarkUnMark(chbox){
		if(chbox.checked==true){
			SetMark();
			document.getElementById('sndmail').disabled=false;
			<logic:present name="AmazonList">
				<logic:iterate name="AmazonList" id="alist" indexId="index">
					setValues('<bean:write name="alist" property="orderNum"/>','<bean:write name="index"/>ismail');
				</logic:iterate>
			</logic:present>
		}
		else{
			SetUnmark();
			document.getElementById('sndmail').disabled=true;
			ord="";
			status="";
			for(cnt=0;cnt<count;cnt++){
				ordarr[cnt]="";
				statusarr[cnt]="";
			}
			count=0;
			document.getElementById('ordSize').value="0";
			document.getElementById('ordId').value="";
			document.getElementById("statusId").value="";
		}
		
	}
	
	function Send(){
		for(cnt=0;cnt<count;cnt++){
			ord+=ordarr[cnt]+";";
			status+=statusarr[cnt]+";";
		}
		document.getElementById('ordSize').value=count;
		document.getElementById('ordId').value=ord;
		document.getElementById("statusId").value=status;

		document.getElementById('tid').value="BulkMailSend";
		document.forms[0].action="Email.do";
		document.forms[0].submit();
	}
	
	
</script>
</html>

