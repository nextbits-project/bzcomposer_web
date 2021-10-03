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
<title><bean:message key="BzComposer.federaltaxinfotitle" /></title>
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
function setTaxInfo()
{
	var fid=document.forms[0].fdTaxId.value;
	var fmonth=document.forms[0].fcMonth.value;
	if(fid==null||fid=="")
	{
	   //alert("Fedral Tax Id is required field.");
	   alert("<bean:message key='BzComposer.federaltax.federaltaxidisrequired'/>");
	   return false;
	}
	if(fmonth==null||fmonth=="")
	{
	   //alert("Fiscal Month is Required Field.");
	   alert("<bean:message key='BzComposer.federaltax.fiscalmonthisrequired'/>");
	   return false;
	}
	document.forms[0].action = "fedTax.do?tabid=f1e1d1";
	document.forms[0].submit();
}

function setRate(obj)
{
	var str=obj.value;
	alert(str);
	var len=0;
	len=str.indexOf("%");
	len++;
	var len1=0;
	len1=str.indexOf(".");
	len1++;
	var len2=0;
	len2=str.length-len1;
	alert("len2:"+len2);
	if(len==0)
	{
		if(len1==0)
			obj.value="%"+str+".00";
		else
			obj.value="%"+str;
	}
	alert("len:"+len);
	var st1=substring(len,len2);
	alert("st1"+st1);
	//str2=substring(len);
	//alert(str+" str2:"+str2+" len:"+len);
}
</script>
</head>
<body>
<html:form action="/fedTax" method="post" onsubmit="return v.exec();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
		border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.federaltax.federaltaxinformation" />
		</span>
	</div>
	<div class="table-negotiations">
	<table id="tabla-listados">
		<logic:present name="FedTaxlist" scope="request">
			<logic:notEmpty name="FedTaxlist" scope="request">
				<logic:iterate name="FedTaxlist" id="objList" scope="request">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th class="emblem" colspan="5">
									<bean:message key="BzComposer.federaltax.identification" />
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="right" id="t_fdTaxId">
									<bean:message key="BzComposer.federaltax.federaltaxid" />:
								</td>
								<td>
									<html:text name="objList" property="fdTaxId" size="15" />
								</td>
								<td>
									<bean:message key="BzComposer.federaltax.fiscalmonth" />:
								</td>
								<td align="left" id="t_fcMonth">
									<html:select name="objList" property="fcMonth">
										<html:option value="">Select Month</html:option>
										<html:option value="January">January</html:option>
										<html:option value="February">February</html:option>
										<html:option value="March">March</html:option>
										<html:option value="April">April</html:option>
										<html:option value="May">May</html:option>
										<html:option value="June">June</html:option>
										<html:option value="July">July</html:option>
										<html:option value="August">August</html:option>
										<html:option value="September">September</html:option>
										<html:option value="October">October</html:option>
										<html:option value="November">November</html:option>
										<html:option value="December">December</html:option>
									</html:select>
								</td>
							</tr>
						</tbody>
				</table>
				<table class="tabla-listados" cellspacing="0">
					<thead>
						<tr>
							<th class="emblem" colspan="5">
								<bean:message key="BzComposer.federaltax.federaltax" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="left">
								<logic:equal name="objList" property="ficaVal" value="true">
									<input type="checkbox" name="ficaVal" checked="true" value="ON" />
								</logic:equal> 
								<logic:equal name="objList" property="ficaVal" value="false">
									<input type="checkbox" name="ficaVal" />
								</logic:equal> 
								&nbsp;<bean:message key="BzComposer.federaltax.fica" />
							</td>
							<td align="left">
								<bean:message key="BzComposer.federaltax.rate" />:
								<html:text name="objList" property="ficaRate" size="8"
								onkeypress="return numbersonly(event,this.value)" />
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="right">
								<logic:equal name="objList" property="ssTaxVal" value="true">
									<input type="checkbox" name="ssTaxVal" checked="true" value="ON" />
								</logic:equal> 
								<logic:equal name="objList" property="ssTaxVal" value="false">
									<input type="checkbox" name="ssTaxVal" />
								</logic:equal> 
								&nbsp; <bean:message key="BzComposer.federaltax.socialsecuritytax" />
							</td>
							<td align="left">
								<bean:message key="BzComposer.federaltax.rate" />:
								<html:text name="objList" property="ssTaxRate" size="8" 
								onkeypress="return numbersonly(event,this.value)" />
							</td>
							<td>
								<bean:message key="BzComposer.federaltax.upto" /> 
								<html:text name="objList" property="ssTaxUpto" size="8"
								onkeypress="return numbersonly(event,this.value)" />
							</td>
						</tr>
						<tr>
							<td align="right">
								<logic:equal name="objList" property="medicareVal" value="true">
									<input type="checkbox" name="medicareVal" checked="true" value="ON" />
								</logic:equal> 
								<logic:equal name="objList" property="medicareVal" value="false">
									<input type="checkbox" name="medicareVal" />
								</logic:equal> 
								&nbsp; <bean:message key="BzComposer.federaltax.medicare" />
							</td>
							<td align="left"><bean:message key="BzComposer.federaltax.rate" />:
							<html:text name="objList" property="medicareRate" size="8"
								onkeypress="return numbersonly(event,this.value)" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="left">
								<logic:equal name="objList" property="fitVal" value="true">
									<input type="checkbox" name="fitVal" checked="true" value="ON" />
								</logic:equal> 
								<logic:equal name="objList" property="fitVal" value="false">
									<input type="checkbox" name="fitVal" />
								</logic:equal> 
								&nbsp; <bean:message key="BzComposer.federaltax.fit" />
							</td>
							<td align="left">&nbsp;</td>
							<td>
								<bean:message key="BzComposer.federaltax.usingtables"/>
							</td>
						</tr>
					</tbody>
				</table>
			</logic:iterate>
		</logic:notEmpty>
	</logic:present>
	</table>
	<table class="tabla-listados" cellspacing="0">
		<tbody>
			<tr>
				<td colspan="4" align="center">
					<input type="button" value="<bean:message key="BzComposer.federaltax.savefederaltaxbtn"/>"
					onclick="setTaxInfo();" class="formbutton">
				</td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
<!-- end Contents -->
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%>
</html:form>
</body>
</html>