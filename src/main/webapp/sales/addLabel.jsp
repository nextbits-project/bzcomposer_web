<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<script>
self.moveTo(180,130);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@include file="/include/header.jsp"%>
<title>Set Up</title>
</head>
<script type="text/javascript">
function showLabelNameDialog()
{
	event.preventDefault();
	$("#showLabelNameDialog").dialog({
		resizable: false,
	    height: 200,
	    width: 400,
	    modal: true,
	    buttons: {
			"Ok": function () {
	        	$(this).dialog("close");
			}
		}
	});
	return false;
}
</script>
<body>
<logic:present name="Customer">
<html:form action="Customer.do" method="post">
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> 	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div>
		<table class="tabla-listados" cellspacing="0">
			<tr>
			<td>
			<table>
				<tr>
					<td><logic:present name="Status">
							<strong><font color="blue"><bean:write name="Status"/></font></strong>
						</logic:present>
					</td>
					<td>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
					<table>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.LabelName" /></td>
							<td><html:text property="labelName" size="15"></html:text></td>
						</tr>
					</table>
					</td>
					<td>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td><!-- Margin(inches) -->
					<fieldset>
					<div align="center"><bean:message
						key="BzComposer.customer.CustomerSetUp.Margin" /></div>
					<table>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Top" /></td>
							<td align="right"><html:text property="topMargin" size="10"
								onkeypress="return numbersonly(event,this.value)" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Left" /></td>
							<td align="right"><html:text property="leftMargin" size="10"
								onkeypress="return numbersonly(event,this.value)" /></td>
						</tr>
					</table>
					</fieldset>

					</td>
					<td><!-- Label Size(inches) -->
					<fieldset>
					<div align="center"><bean:message
						key="BzComposer.customer.CustomerSetUp.LabelSize" /></div>
					<table>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Width" /></td>
							<td align="right"><html:text property="labelWidth" size="10"
								onkeypress="return numbersonly(event,this.value)" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Height" /></td>
							<td align="right"><html:text property="labelHeight"
								size="10" onkeypress="return numbersonly(event,this.value)" />
							</td>
						</tr>
					</table>
					</fieldset>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr align="center">
			<td>
			<fieldset>
			<div align="center"><bean:message
				key="BzComposer.customer.CustomerSetUp.Spacing" /></div>
			<table>
				<tr>
					<td><bean:message
						key="BzComposer.customer.CustomerSetUp.Horizon" /></td>
					<td align="right"><html:text property="horizon" size="10"
						onkeypress="return numbersonly(event,this.value)" /></td>

					<td><bean:message
						key="BzComposer.customer.CustomerSetUp.Vertical" /></td>
					<td align="right"><html:text property="vertical" size="10"
						onkeypress="return numbersonly(event,this.value)" /></td>
				</tr>
			</table>
			</fieldset>
			</td>
		</tr>
		<tr align="center">
			<td><input type="button" class="formbutton" value='<bean:message key="BzComposer.customer.AddLabel.Save" />' title="Save label"
				onclick="AddLabel();" /> 
				<input type="button" class="formbutton" value='<bean:message key="BzComposer.customer.AddLabel.Clear" />' title="Clear label values"
				onclick="ClearLabel();" />
				 <input type="button" class="formbutton" 
				value='<bean:message key="BzComposer.customer.AddLabel.Close" />' onclick="window.close();" title="Close window" /></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- end Contents -->
</html:form>
<script>
function AddLabel()
{
	if(document.CustomerForm.labelName.value=="")
	{

		return showLabelNameDialog();
		document.CustomerForm.labelName.focus();
	}
	else
	{
		debugger;
		event.preventDefault();
		$("#saveLabelDialog").dialog({
			resizable: false,
		    height: 200,
		    width: 400,
		    modal: true,
		    buttons: {
				"Ok": function () {
		        	$(this).dialog("close");
		        	top=document.CustomerForm.topMargin.value;
		    		left=document.CustomerForm.leftMargin.value;
		    		width=document.CustomerForm.labelWidth.value;
		    		height=document.CustomerForm.labelHeight.value;
		    		hor=document.CustomerForm.horizon.value;
		    		ver=document.CustomerForm.vertical.value;
		    		if(top=="")
		    			document.CustomerForm.topMargin.value="0.0";
		    		if(left=="")
		    			document.CustomerForm.leftMargin.value="0.0";
		    		if(width=="")
		    			document.CustomerForm.labelWidth.value="0.0";
		    		if(height=="")
		    			document.CustomerForm.labelHeight.value="0.0";
		    		if(hor=="")
		    			document.CustomerForm.horizon.value="0.0";
		    		if(ver=="")
		    			document.CustomerForm.vertical.value="0.0";
		    		document.forms[0].action="Customer.do?tabid=SaveLabel&LabelID=0";
		    		document.forms[0].submit();
				},
	            Cancel: function () {
	                $(this).dialog("close");
	                return false;
				}
			}
		});
		return false;
		//var x=window.confirm("Do you want to save label?");
		/*if (x)
		{
			
		}*/
	}
}
function ClearLabel(){
	document.CustomerForm.labelName.value="";
	document.CustomerForm.topMargin.value="0.0";
	document.CustomerForm.leftMargin.value="0.0";
	document.CustomerForm.labelWidth.value="0.0";
	document.CustomerForm.labelHeight.value="0.0";
	document.CustomerForm.horizon.value="0.0";
	document.CustomerForm.vertical.value="0.0";
	document.CustomerForm.labelName.focus();		
}
</script>
<!-- Dialog box used in sales order page -->
<div id="showLabelNameDialog" style="display:none;">
	<p>Label name should not be blank</p>
</div>
<div id="saveLabelDialog" style="display:none;">
	<p>Do you want to save label?</p>
</div>
</logic:present>
<logic:present name="Vendor">
<html:form action="Vendor.do" method="post">

	<div id="cos">

	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> 	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div>
		<table class="tabla-listados" cellspacing="0">

		<tr>
			<td>
			<table>
				<tr>
					<td><logic:present name="Status">
							<strong><font color="blue"><bean:write name="Status"/></font></strong>
						</logic:present>
					</td>
					<td>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
					<table>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.LabelName" /></td>
							<td><html:text property="labelName" size="15"></html:text></td>
						</tr>
					</table>
					</td>
					<td>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td><!-- Margin(inches) -->
					<fieldset>
					<div align="center"><bean:message
						key="BzComposer.customer.CustomerSetUp.Margin" /></div>
					<table>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Top" /></td>
							<td align="right"><html:text property="topMargin" size="10"
								onkeypress="return numbersonly(event,this.value)" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Left" /></td>
							<td align="right"><html:text property="leftMargin" size="10"
								onkeypress="return numbersonly(event,this.value)" /></td>
						</tr>
					</table>
					</fieldset>

					</td>
					<td><!-- Label Size(inches) -->
					<fieldset>
					<div align="center"><bean:message
						key="BzComposer.customer.CustomerSetUp.LabelSize" /></div>
					<table>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Width" /></td>
							<td align="right"><html:text property="labelWidth" size="10"
								onkeypress="return numbersonly(event,this.value)" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BzComposer.customer.CustomerSetUp.Height" /></td>
							<td align="right"><html:text property="labelHeight"
								size="10" onkeypress="return numbersonly(event,this.value)" />
							</td>
						</tr>
					</table>
					</fieldset>
					</td>
				</tr>
			</table>
			</td>

		</tr>
		<tr align="center">
			<td>
			<fieldset>
			<div align="center"><bean:message
				key="BzComposer.customer.CustomerSetUp.Spacing" /></div>
			<table>
				<tr>
					<td><bean:message
						key="BzComposer.customer.CustomerSetUp.Horizon" /></td>
					<td align="right"><html:text property="horizon" size="10"
						onkeypress="return numbersonly(event,this.value)" /></td>

					<td><bean:message
						key="BzComposer.customer.CustomerSetUp.Vertical" /></td>
					<td align="right"><html:text property="vertical" size="10"
						onkeypress="return numbersonly(event,this.value)" /></td>
				</tr>
			</table>
			</fieldset>
			</td>
		</tr>
		<tr align="center">
			<td><input type="button" class="formbutton" value='<bean:message key="BzComposer.customer.AddLabel.Save" />' title="Save label"
				onclick="AddLabel();" /> 
				<input type="button" class="formbutton" value='<bean:message key="BzComposer.customer.AddLabel.Clear" />' title="Clear label values"
				onclick="ClearLabel();" />
				 <input type="button" class="formbutton" 
				value='<bean:message key="BzComposer.customer.AddLabel.Close" />' onclick="window.close();" title="Close window" /></td>

		</tr>

	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- end Contents -->
</html:form>
<script>
var top="";
function AddLabel()
{
	if(document.VendorForm.labelName.value=="")
	{
		alert("Label name should not be blank");
		document.VendorForm.labelName.focus();
	}
	else
	{
		var x=window.confirm("Do you want to save label?");
		if (x)
		{
			top=document.VendorForm.topMargin.value;
			left=document.VendorForm.leftMargin.value;
			width=document.VendorForm.labelWidth.value;
			height=document.VendorForm.labelHeight.value;
			hor=document.VendorForm.horizon.value;
			ver=document.VendorForm.vertical.value;
			if(top=="")
				document.VendorForm.topMargin.value="0.0";
			if(left=="")
				document.VendorForm.leftMargin.value="0.0";
			if(width=="")
				document.VendorForm.labelWidth.value="0.0";
			if(height=="")
				document.VendorForm.labelHeight.value="0.0";
			if(hor=="")
				document.VendorForm.horizon.value="0.0";
			if(ver=="")
				document.VendorForm.vertical.value="0.0";
			document.forms[0].action="Vendor.do?tabid=SaveLabel&LabelID=0";
			document.forms[0].submit();
		}
	}
}
function ClearLabel(){
	document.VendorForm.labelName.value="";
	document.VendorForm.topMargin.value="0.0";
	document.VendorForm.leftMargin.value="0.0";
	document.VendorForm.labelWidth.value="0.0";
	document.VendorForm.labelHeight.value="0.0";
	document.VendorForm.horizon.value="0.0";
	document.VendorForm.vertical.value="0.0";
	document.VendorForm.labelName.focus();		
}
</script>
</logic:present>
<%@ include file="/include/footer.jsp"%>
</body>
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
</html>