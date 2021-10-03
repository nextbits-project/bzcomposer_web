
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<script>
	self.moveTo(180,130);
</script>
<style type="text/css">
table.tabla-listados tbody tr td {
padding:6px 16px 5px 14px !important;
}


.msgstyle{

font-size:18px;
color: #3D9EAC;

}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@include file="/include/header.jsp"%>
<title><bean:message key="BizComposer.Vendor.PrintLabel.SetUpTitle" /></title>
</head>

<logic:present name="Customer">
	<body>
	<html:form action="Customer.do" enctype="MULTIPART/FORM-DATA"
		method="post">

		<div id="cos">

		<div class="statusquo ok">
		<div id="hoja">
		<div id="blanquito">
		<div id="padding"><!-- begin Contents -->
		<div><span
			style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
		</div>
		<div>
		<div id="LabelDetails"><logic:present name="LabelTypeList">
			<logic:notEmpty name="LabelTypeList">
				<bean:size name="LabelTypeList" id="size" />
				<input type="hidden" value='<bean:write name="size"/>' id="lsize" />
				<logic:iterate name="LabelTypeList" id="List" indexId="indx">
					<input type="hidden"
						value='<bean:write name="List" property="labelType"/>'
						id='<bean:write name="indx" />lbltype' />
					<input type="hidden"
						value='<bean:write name="List" property="labelName"/>'
						id='<bean:write name="indx" />lblName' />
					<input type="hidden"
						value='<bean:write name="List" property="topMargin"/>'
						id='<bean:write name="indx" />tmargin' />
					<input type="hidden"
						value='<bean:write name="List" property="leftMargin"/>'
						id='<bean:write name="indx" />lmargin' />
					<input type="hidden"
						value='<bean:write name="List" property="labelWidth"/>'
						id='<bean:write name="indx" />lwidth' />
					<input type="hidden"
						value='<bean:write name="List" property="labelHeight"/>'
						id='<bean:write name="indx" />lheight' />
					<input type="hidden"
						value='<bean:write name="List" property="horizon"/>'
						id='<bean:write name="indx" />hort' />
					<input type="hidden"
						value='<bean:write name="List" property="vertical"/>'
						id='<bean:write name="indx" />vert' />
				</logic:iterate>
			</logic:notEmpty>
		</logic:present></div>
		<table class="tabla-listados" cellspacing="0">

			<tr>
				<td>
				<table>
					<tr>
						<td><logic:present name="Status">
							<strong>
							<span class="msgstyle">*<bean:write name="Status" /></span>							
							</strong>
						</logic:present></td>
						<td>&nbsp;&nbsp;</td>
					</tr>

					<tr>
						<td>
						<table>
							<tr>
								<td><bean:message
									key="BzComposer.customer.CustomerSetUp.LabelType" /></td>
								<td><html:select property="labelType"
									onchange="LabelChange(this.value,this.form);"
									onkeydown="LabelChange(this.value,this.form);"
									onkeyup="LabelChange(this.value,this.form);">
									<logic:present name="LabelTypeList">
										<html:options collection="LabelTypeList" property="labelType"
											labelProperty="labelName" />
									</logic:present>
								</html:select></td>
							</tr>
						</table>
						</td>
						<td>
						<table>
							<tr>
								<td><bean:message
									key="BzComposer.customer.CustomerSetUp.LabelName" /></td>
								<td><html:text property="labelName" size="15"></html:text></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td><!-- Margin(inches) -->
						<fieldset>
						<div align="center"><bean:message
							key="BzComposer.customer.CustomerSetUp.Margin" /></div>
						<table>
							<tr>
								<td><bean:message key="BzComposer.customer.CustomerSetUp.Top" /></td>
								<td align="right"><html:text property="topMargin" size="10"
									onkeypress="return numbersonly(event,this.value)" /></td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.customer.CustomerSetUp.Left" /></td>
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
								<td><bean:message key="BzComposer.customer.CustomerSetUp.Width" /></td>
								<td align="right"><html:text property="labelWidth" size="10"
									onkeypress="return numbersonly(event,this.value)" /></td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.customer.CustomerSetUp.Height" /></td>
								<td align="right"><html:text property="labelHeight" size="10"
									onkeypress="return numbersonly(event,this.value)" /></td>
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
						<td><bean:message key="BzComposer.customer.CustomerSetUp.Horizon" /></td>
						<td align="right"><html:text property="horizon" size="10"
							onkeypress="return numbersonly(event,this.value)" /></td>

						<td><bean:message key="BzComposer.customer.CustomerSetUp.Vertical" /></td>
						<td align="right"><html:text property="vertical" size="10"
							onkeypress="return numbersonly(event,this.value)" /></td>
					</tr>
				</table>
				</fieldset>
				</td>
			</tr>
			<tr align="center">
				<td><input type="button" class="formbutton"
					value='<bean:message key="BzComposer.customer.SetUpLabel.Update" />'
					title="Update label" onclick="SaveLabel(this.form);" /> <input
					type="button" class="formbutton"
					value='<bean:message key="BzComposer.customer.SetUpLabel.Delete" />'
					title="Delete label" onclick="DeleteLabel();" /> <input
					type="button" class="formbutton"
					value='<bean:message key="BzComposer.customer.AddLabel.Close" />'
					onclick="window.close();" title="Close window" /></td>

			</tr>

		</table>
		</div>
		</div>
		</div>
		</div>
		</div>
		<div id="lblid" style="display:none;"><select name="lblType"
			id="ltype">
			<logic:present name="Labels" scope="request">
				<logic:iterate name="Labels" id="Labels" scope="request">
					<option value=<bean:write name="Labels" property="id"/>><bean:write
						name="Labels" property="labeltype" />
				</logic:iterate>
			</logic:present>
		</select></div>

		<!-- end Contents -->
	</html:form>
	</body>
	<script>
function LabelChange(value,form){
	size = document.getElementById('lsize').value;
	var i =0;
	for(i=0;i<size;i++){
		itype = document.getElementById(i+'lbltype').value;
		if(itype==value){
			form.topMargin.value=document.getElementById(i+'tmargin').value;
			form.leftMargin.value=document.getElementById(i+'lmargin').value;
			form.labelWidth.value=document.getElementById(i+'lwidth').value;
			form.labelHeight.value=document.getElementById(i+'lheight').value;
			form.horizon.value=document.getElementById(i+'hort').value;
			form.vertical.value=document.getElementById(i+'vert').value;
			form.labelName.value= document.getElementById(i+'lblName').value;
			break;
		}
	}
}

var top="";
function SaveLabel(form){
	labelid=form.labelType.value;
	if(form.labelName.value==""){
		alert("Label name should not be blank");
	}
	else{
		var x=window.confirm("Do you want to update label?");
		if (x){
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
			document.forms[0].action="Customer.do?tabid=SaveLabel&LabelID="+labelid;
			document.forms[0].submit();
		}
	}
}
function DeleteLabel(){
	lbltype = document.CustomerForm.labelType.value;
	var x=window.confirm("Do you want to delete this label?");
	if (x){
		document.forms[0].action="Customer.do?tabid=DeleteLabel&LabelID="+lbltype;
		document.forms[0].submit();
	}
}
</script>
</logic:present>


<logic:present name="Vendor">
	<body onunload="getValues();" onload="init();">
	<html:form action="PrintLBL.do" enctype="MULTIPART/FORM-DATA"
		method="post">

		<div id="cos">

		<div class="statusquo ok">
		<div id="hoja">
		<div id="blanquito">
		<div id="padding"><!-- begin Contents -->
		<div><span
			style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
		</div>
		<div>
		<div id="LabelDetails"><logic:present name="LabelTypeList">
			<logic:notEmpty name="LabelTypeList">
				<bean:size name="LabelTypeList" id="size" />
				<input type="hidden" value='<bean:write name="size"/>' id="lsize" />
				<logic:iterate name="LabelTypeList" id="List" indexId="indx">
					<input type="hidden"
						value='<bean:write name="List" property="labelType"/>'
						id='<bean:write name="indx" />lbltype' />
					<input type="hidden"
						value='<bean:write name="List" property="labelName"/>'
						id='<bean:write name="indx" />lblName' />
					<input type="hidden"
						value='<bean:write name="List" property="topMargin"/>'
						id='<bean:write name="indx" />tmargin' />
					<input type="hidden"
						value='<bean:write name="List" property="leftMargin"/>'
						id='<bean:write name="indx" />lmargin' />
					<input type="hidden"
						value='<bean:write name="List" property="labelWidth"/>'
						id='<bean:write name="indx" />lwidth' />
					<input type="hidden"
						value='<bean:write name="List" property="labelHeight"/>'
						id='<bean:write name="indx" />lheight' />
					<input type="hidden"
						value='<bean:write name="List" property="horizon"/>'
						id='<bean:write name="indx" />hort' />
					<input type="hidden"
						value='<bean:write name="List" property="vertical"/>'
						id='<bean:write name="indx" />vert' />
				</logic:iterate>
			</logic:notEmpty>
		</logic:present></div>
		<div align="center">
		<table class="tabla-listados" cellspacing="0" style="width:250;">

			<tr>
				<td>
				<div align="center">
				<table>
					<tr style="display:none;" id="disp">
						<td><logic:present name="Status">
							<div align="center"><strong><span class="msgstyle"><bean:write
								name="Status" /></span></strong></div>
						</logic:present></td>

					</tr>

					<tr>
						<td>
						<div align="center">
						<table>
							<tr>
								<td nowrap="nowrap" onclick="hideList();"><bean:message
									key="BzComposer.customer.CustomerSetUp.LabelType" /></td>
								<td nowrap="nowrap" colspan="3"><input type="text" name="labelName" id="lname"
									style="width:200;" /> <img
									src='<bean:write name="path" scope="session" property="pathvalue"/>/images/downArrow.jpg'
									onclick="getList();" />
									<br>
									<div style="display:none;" id="lbl"><html:select
									property="labelType" style="width:220;"
									onchange="LabelChange(this.value,this.form);" size="4"
									onkeypress="LabelChange(this.value,this.form);"
									onkeyup="LabelChange(this.value,this.form);">
									<logic:present name="LabelTypeList">
										<html:options collection="LabelTypeList" property="labelType"
											labelProperty="labelName" />
									</logic:present>
									</html:select></div>
									
									</td>
							</tr>
							

						</table>
						</div>
						</td>

					</tr>
					<tr onclick="hideList();">
						<td><!-- Margin(inches) -->

						<table>
							<tr>
								<td>
								<table class="tabla-listados" cellspacing="0" border="0" style="padding: 4px;">
									<thead>
									<tr>
										<th colspan="2">
											<div align="center">
												<bean:message key="BzComposer.customer.CustomerSetUp.Margin" />
											</div>
										</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td><bean:message key="BzComposer.customer.CustomerSetUp.Top" /></td>
										<td align="right"><html:text property="topMargin" size="10"
											onkeypress="return numbersonly(event,this.value)" /></td>
									</tr>
									<tr>
										<td><bean:message key="BzComposer.customer.CustomerSetUp.Left" /></td>
										<td align="right"><html:text property="leftMargin" size="10"
											onkeypress="return numbersonly(event,this.value)" /></td>
									</tr>
									</tbody>
								</table>
								
								</td>
								<td><!-- Label Size(inches) -->
								
								<table class="tabla-listados" cellspacing="0" border="0" style="padding: 4px;">
									<thead>
									<tr>
										<th colspan="2">
											<div align="center">
												<bean:message key="BzComposer.customer.CustomerSetUp.LabelSize" />
											</div>
										</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td><bean:message
											key="BzComposer.customer.CustomerSetUp.Width" /></td>
										<td align="right"><html:text property="labelWidth" size="10"
											onkeypress="return numbersonly(event,this.value)" /></td>
									</tr>
									<tr>
										<td><bean:message
											key="BzComposer.customer.CustomerSetUp.Height" /></td>
										<td align="right"><html:text property="labelHeight" size="10"
											onkeypress="return numbersonly(event,this.value)" /></td>
									</tr>
									</tbody>
								</table>
								
								</td>
							</tr>
						</table>

						</td>
					</tr>


				</table>
				</div>
				</td>

			</tr>
			<tr onclick="hideList();">
				<td>
				<div align="center">
				<table>
					<tr>
						<td>
						<table  class="tabla-listados" cellspacing="0" border="0" style="padding: 4px;">
							<thead>
								<tr>
									<th class="emblem" colspan="4">
										<div align="center">
											<bean:message key="BzComposer.customer.CustomerSetUp.Spacing" />
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
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
							</tbody>
						</table>
						</td>
					</tr>
				</table>
				</div>
				</td>
			</tr>
			<tr onclick="hideList();">
				<td>
				<div align="center"><input type="button" class="formbutton"
					value='<bean:message key="BzComposer.Vendor.SetUpLabel.Save" />'
					title="Update label" onclick="SaveLabel(this.form);" /> <input
					type="button" class="formbutton"
					value='<bean:message key="BzComposer.Vendor.SetUpLabel.Delete" />'
					title="Delete label" onclick="DeleteLabel();" /> <input
					type="button" class="formbutton"
					value='<bean:message key="BzComposer.Vendor.AddLabel.Close" />'
					onclick="CloseMe();" title="Close window" /></div>

				</td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		<div id="lblid" style="display:none;"><select name="lblType"
			id="ltype">
			<logic:present name="Labels" scope="request">
				<logic:iterate name="Labels" id="Labels" scope="request">
					<option value=<bean:write name="Labels" property="id"/>><bean:write
						name="Labels" property="labeltype" />
				</logic:iterate>
			</logic:present>
		</select></div>
		<div><html:hidden property="labelName" value="" /></div>
		<!-- end Contents -->
	</html:form>
	</body>
	<script>
function init(){
	lid = document.PrintLabelForm.labelType.value;
	LabelChange(lid,document.PrintLabelForm);
	<logic:present name="Status">
		document.getElementById('disp').style.display='block';
	</logic:present>
	<logic:notPresent name="Status">
		document.getElementById('disp').style.display='none';
	</logic:notPresent>
}

function LabelChange(value,form){
	size = document.getElementById('lsize').value;
	var i =0;
	for(i=0;i<size;i++){
		itype = document.getElementById(i+'lbltype').value;
		if(itype==value){
			form.topMargin.value=document.getElementById(i+'tmargin').value;
			form.leftMargin.value=document.getElementById(i+'lmargin').value;
			form.labelWidth.value=document.getElementById(i+'lwidth').value;
			form.labelHeight.value=document.getElementById(i+'lheight').value;
			form.horizon.value=document.getElementById(i+'hort').value;
			form.vertical.value=document.getElementById(i+'vert').value;
			document.getElementById('lname').value= document.getElementById(i+'lblName').value;
			document.getElementById('lbl').style.display='none';
			break;
		}
	}
}

function IsExist(value){
	flag=0;
	size = document.getElementById('lsize').value;
	var i =0;
	for(i=0;i<size;i++){
		itype = document.getElementById(i+'lbltype').value;
		if(itype==value){
			if(document.getElementById('lname').value == document.getElementById(i+'lblName').value){
				flag=1;
			}
			break;
		}
	}
	return flag;
}
var top="";
function SaveLabel(form){
	hideList();
	form.labelName.value = trim(document.getElementById('lname').value);

	if(form.labelName.value==""){
		alert("Label name should not be blank");
		document.getElementById('lname').focus();
	}
	else{
		labelid=form.labelType.value;
		if(IsExist(labelid)==1){
			var x=window.confirm("Do you want to update label?");
			if (x){
				document.PrintLabelForm.labelName.value = document.getElementById('lname').value;
				top=document.PrintLabelForm.topMargin.value;
				left=document.PrintLabelForm.leftMargin.value;
				width=document.PrintLabelForm.labelWidth.value;
				height=document.PrintLabelForm.labelHeight.value;
				hor=document.PrintLabelForm.horizon.value;
				ver=document.PrintLabelForm.vertical.value;
				if(top=="")
					document.PrintLabelForm.topMargin.value="0.0";
				if(left=="")
					document.PrintLabelForm.leftMargin.value="0.0";
				if(width=="")
					document.PrintLabelForm.labelWidth.value="0.0";
				if(height=="")
					document.PrintLabelForm.labelHeight.value="0.0";
				if(hor=="")
					document.PrintLabelForm.horizon.value="0.0";
				if(ver=="")
					document.PrintLabelForm.vertical.value="0.0";
				document.forms[0].action="PrintLBL.do?tabid=SaveLabel&LabelID="+labelid;
				document.forms[0].submit();
			}
		}
		else{
			var x=window.confirm("Do you want to save label?");
			if (x){
				document.PrintLabelForm.labelName.value = document.getElementById('lname').value;
				top=document.PrintLabelForm.topMargin.value;
				left=document.PrintLabelForm.leftMargin.value;
				width=document.PrintLabelForm.labelWidth.value;
				height=document.PrintLabelForm.labelHeight.value;
				hor=document.PrintLabelForm.horizon.value;
				ver=document.PrintLabelForm.vertical.value;
				if(top=="")
					document.PrintLabelForm.topMargin.value="0.0";
				if(left=="")
					document.PrintLabelForm.leftMargin.value="0.0";
				if(width=="")
					document.PrintLabelForm.labelWidth.value="0.0";
				if(height=="")
					document.PrintLabelForm.labelHeight.value="0.0";
				if(hor=="")
					document.PrintLabelForm.horizon.value="0.0";
				if(ver=="")
					document.PrintLabelForm.vertical.value="0.0";
				document.forms[0].action="PrintLBL.do?tabid=SaveLabel&LabelID=0";
				document.forms[0].submit();
			}
		}
	}
}
function DeleteLabel(){
	hideList();
	if(trim(document.getElementById('lname').value)==""){
		alert("Label name should not be blank");
		document.getElementById('lname').focus();
		
	}
	else{
		lbltype = document.PrintLabelForm.labelType.value;
		var x=window.confirm("Do you want to delete this label?");
		if (x){
			document.forms[0].action="PrintLBL.do?tabid=DeleteLabel&LabelID="+lbltype;
			document.forms[0].submit();
		}
	}
}

function CloseMe(){
	hideList();
	window.opener.document.getElementById('lbltypeid').innerHTML = document.getElementById('lblid').innerHTML;
	window.close();
}
function getValues(){
	window.opener.document.getElementById('lbltypeid').innerHTML = document.getElementById('lblid').innerHTML;
}
function getList(){
	if(document.getElementById('lbl').style.display=='block'){
		document.getElementById('lbl').style.display='none';
	}
	else{
		document.getElementById('lbl').style.display='block';
	}
}

function hideList(){
	document.getElementById('lbl').style.display='none';
}

	function trim(inputString) {
	   // Removes the spaces  return from the passed string. 
	   var retValue = inputString;
	   var ch = retValue.substring(0, 1);
	   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) { 
    	  retValue = retValue.substring(1, retValue.length);
	      ch = retValue.substring(0, 1);
	   }
	   return retValue; 
	}

</script>
</logic:present>



<%@ include file="/include/footer.jsp"%>




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

