<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml" version="-//W3C//DTD XHTML 1.1//EN" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<script>
window.onload = initShowHideDivs;
</script>
<script type="text/javascript">
function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;
	if (unicode!=8)
	{
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
 			return true;
		} 
		else 
			if (unicode<48||unicode>57) //if not a number
				return false; //disable key press
	}
}
</script>
<script>
window.onload = initShowHideDivs;
</script>
<title><bean:message key="BzComposer.statetaxinfotitle" /></title>
</head>
<body>
<html:form action="/StateTax" method="post">
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
	border-bottom: 1px #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.statetax.statetaxinformation" />
	</span>
</div>
<div id="table-negotiations">
<table class="tabla-listados" cellspacing="0">
	<tr>
		<td>
			<logic:present name="StTaxlist" scope="request">
				<logic:notEmpty name="StTaxlist" scope="request">
					<logic:iterate name="StTaxlist" id="objList" scope="request">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th class="emblem" colspan="5" style="font-size:1.6em;">
										<bean:message key="BzComposer.statetax.identification"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="right" style="font-size:1em;">
										<bean:message key="BzComposer.statetax.filingstate" />
									</td>
									<td width="20" style="font-size:1em;">
										<div id="StList" style="display: block;">
											<html:select property="flSt" onchange="getTaxInfo(this);" onkeypress="editStateInfo(this);">
												<html:options name="objList" collection="Statelist" property="flSt" />
											</html:select>
										</div>
										<div id="newSt" style="display: none;font-size:1em;">
											<html:text property="fstate" size="6" />
										</div>
									</td>
									<td align="right" style="font-size:1em;">
										<bean:message key="BzComposer.statetax.statetaxid" />:
									</td>
									<td align="left" style="font-size:1em;">
										<html:text name="objList" property="stTaxId" size="12" />
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td rowspan="3" valign="top">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th class="emblem" style="font-size:1.6em;">
										<bean:message key="BzComposer.statetax.fillingstatelist"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center" height="25">
										<select name="flist" size="19" ondblclick="getTaxInfo1()" style="font-size:1em;">
											<logic:present name="Statelist" scope="request">
												<logic:notEmpty name="Statelist" scope="request">
													<logic:iterate name="Statelist" id="objList1" scope="request" offset="1">
														<logic:notEqual name="objList1" property="flSt" value='<%=(String)request.getAttribute("stval") %>'>
															<option value='<bean:write name="objList1" property="flSt" />'>
																<bean:write name="objList1" property="flSt" />
															</option>
														</logic:notEqual>
														<logic:equal name="objList1" property="flSt" value='<%=(String)request.getAttribute("stval") %>'>
															<option selected="selected" value='<bean:write name="objList1" property="flSt" />'>
																<bean:write name="objList1" property="flSt" />
															</option>
														</logic:equal>
													</logic:iterate>
												</logic:notEmpty>
											</logic:present>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th class="emblem" colspan="4" style="font-size:1.6em;">
										<bean:message key="BzComposer.statetax.taxinformationofstate"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="left" colspan="4" style="font-size:1em;">
										<bean:message key="BzComposer.statetax.stateincometax" />:
									</td>
								</tr>
								<tr>
									<td align="right" style="font-size:1em;">
										<logic:equal name="objList" property="sitVal" value="true">
											<input type="checkbox" name="sitVal" checked="true" value="ON" />
										</logic:equal> 
										<logic:equal name="objList" property="sitVal" value="false">
											<input type="checkbox" name="sitVal" />
										</logic:equal>
									</td>
									<td align="left">
										<html:text name="objList" property="sitName" size="12" style="font-size:1em;"/>
									</td>
									<td colspan="2" style="font-size:1em;">
										<bean:message key="BzComposer.statetax.usetable"/>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="4" style="font-size:1em;">
										<bean:message key="BzComposer.statetax.otherstatetax"/>:
									</td>
								</tr>
								<tr>
									<td align="right" style="font-size:1em;">
										<logic:equal name="objList" property="othVal1" value="true">
											<input type="checkbox" name="othVal1" checked="true" value="ON" />
										</logic:equal> 
										<logic:equal name="objList" property="othVal1" value="false">
											<input type="checkbox" name="othVal1" />
										</logic:equal>
									</td>
									<td align="left" style="font-size:1em;">
										<html:text name="objList" property="othName1" size="12" />
									</td>
									<td style="font-size:1em;">
										<bean:message key="BzComposer.statetax.rate"/> 
										<html:text name="objList" property="othRate1" size="12" onkeypress="return numbersonly(event,this.value)" />
									</td>
									<td style="font-size:1em;">
										<bean:message key="BzComposer.statetax.upto"/> 
										<html:text name="objList" property="othUpto" size="12" onkeypress="return numbersonly(event,this.value)"/>
									</td>
								</tr>
								<tr>
									<td align="right" style="font-size:1em;">
										<logic:equal name="objList" property="othVal2" value="true">
											<input type="checkbox" name="othVal2" checked="true" value="ON" />
										</logic:equal> 
										<logic:equal name="objList" property="othVal2" value="false">
											<input type="checkbox" name="othVal2" />
										</logic:equal>
									</td>
									<td align="left" style="font-size:1em;">
										<html:text name="objList" property="othName2" size="12" />
									</td>
									<td colspan="2" style="font-size:1em;">
										<bean:message key="BzComposer.statetax.rate" />
										<html:text name="objList" property="othRate2" size="12"
										onkeypress="return numbersonly(event,this.value)" />
									</td>
								</tr>
							</tbody>
						</table>
					</logic:iterate> 
				</logic:notEmpty> 
			</logic:present>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>
			<table class="tabla-listados" cellspacing="0">
				<tbody>
					<tr>
						<td colspan="4" align="center" style="font-size:1em;">
							<input type="button" value="<bean:message key="BzComposer.statetax.clearbtn"/>" 
							onclick="clearTaxInfo();" class="formbutton">
							&nbsp;&nbsp;&nbsp;
							<input type="button" value="<bean:message key="BzComposer.statetax.savestatetaxbtn"/>" 
							onclick="setTaxInfo();" class="formbutton">
							&nbsp;&nbsp;&nbsp;
							<input type="button" value="<bean:message key="BzComposer.global.delete"/>" 
							onclick="deleteTaxInfo();" class="formbutton">
						</td>
					</tr>
				</tbody>
			</table>
		</td>
		<td></td>
	</tr>
</table>
</div>
</div>
<!-- end Contents -->
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
</html:form>
</body>
</html>
<script>
function setTaxInfo()
{
	document.forms[0].action = "StateTax.do?tabid=s2t2a2";
	document.forms[0].submit();
}
function deleteTaxInfo()
{
	document.forms[0].action = "StateTax.do?tabid=s3t3a3";
	document.forms[0].submit();
}
function clearTaxInfo()
{
	document.forms[0].action = "StateTax.do?tabid=s0t0a0";
	document.forms[0].submit();
}
function getTaxInfo(obj)
{
	if(obj.value=="")
	{   document.forms[0].action = "StateTax.do?tabid=s0t0a0";
		document.forms[0].submit();
	}
	else
	{
		document.forms[0].action = "StateTax.do?tabid=s1t1a1";
		document.forms[0].submit();
	}
}
function getTaxInfo1()
{
	document.StateTaxForm.flSt.value=document.StateTaxForm.flist.value;
	document.forms[0].action = "StateTax.do?tabid=s1t1a1&ckDb=y";
	document.forms[0].submit();
}
function editStateInfo(obj)
{
	function hide_div(div_id) 
	{
		// hide this div
		document.getElementById(div_id).style.display = "none";
	}
	function show_div(div_id) 
	{
		// hide this div
		document.getElementById(div_id).style.display = "block";
	}
	if(obj.value=="")
	{   
		hide_div('StList');show_div('newSt');
	}
	else
	{
		hide_div('newSt');show_div('StList');
	}
}
</script>