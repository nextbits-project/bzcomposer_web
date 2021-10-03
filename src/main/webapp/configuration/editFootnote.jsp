<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.editfootnotetitle"/></title>
<script type="text/javascript">
self.moveTo(100,100);
</script>
<style type="text/css">
table.tabla-listados tbody tr td 
{
	padding:6px 16px 5px 14px !important;
}
</style>
</head>
<body onunload="closeWin();">
<html:form action="Configuration.do?tabid=ShowEditFootnote" method="post">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
	border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
</div>
<div style="width: 100%;">
	<table cellspacing="0">
		<logic:present name="Status">
			<tr>
				<td>
					<font color="blue">
						<strong> <bean:write name="Status" /> </strong>
					</font>
				</td>
			</tr>
		</logic:present>
		<tr>
			<td>
				<table cellspacing="0" border="0" cellpadding="0">
					<tr>
						<td valign="top" onclick="HideList();" style="font-size:1em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<bean:message key="BzComposer.configuration.footnoteselection" />
						</td>
						<td>
							&nbsp;&nbsp; 
							<input type="text" style="width:190;font-size: 1em;" maxlength="40" id="txt" name="FootName" /> 
							<img src='<bean:write name="path" scope="session" property="pathvalue"/>/images/downArrow.jpg' onclick="getList();" />
							<div id="footid" style="display:none;font-size: 1em;">
								&nbsp;&nbsp;
								<logic:present name="FoootNoteDetails">
							 		<html:select property="footnote" style="width:210;" onchange="SelectFootnote(this.value);" size="4" onkeydown="SelectFootnote(this.value);">
										<html:option value="0">
											<bean:message key="BzComposer.ComboBox.Select" />
										</html:option>
										<html:options collection="FoootNoteDetails" property="footnote" labelProperty="footnoteName" />
									</html:select> 
								</logic:present>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table class="tabla-listados" cellspacing="0" border="0">
					<thead>
						<tr>
							<th align="left" style="font-size:1.2em;">
								<bean:message key="BzComposer.configuration.description" /> :
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.configuration.termmessage" />
							</td>
						</tr>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.configuration.enterkeymessage" />
							</td>
						</tr>
						<tr>
							<td style="font-size:1em;">
								<html:textarea property="desc" rows="10" cols="80"></html:textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr onclick="HideList();">
			<td>
				<div align="center" style="font-size:1em;">
					<input type="button" name="clear" class="formButton" onclick="ClearValues();" value='<bean:message key="BzComposer.global.clear"/>' />
					<input type="button" name="Save" class="formButton" onclick="SaveFootnote();" value='<bean:message key="BzComposer.global.save"/>' />
					<input type="button" name="Delete" class="formButton" onclick="DeleteFootnote();" value='<bean:message key="BzComposer.global.delete"/>' />
					<input type="button" name="Close" class="formButton" onclick="CloseWindow();" value='<bean:message key="BzComposer.global.close"/>' />
				</div>
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="FootnoteValues">
	<logic:present name="FoootNoteDetails">
		<logic:notEmpty name="FoootNoteDetails">
			<bean:size name="FoootNoteDetails" id="fsize" />
			<input type="hidden" id="size" value='<bean:write name="fsize" />' name="FootSize" />
			<logic:iterate name="FoootNoteDetails" id="detail" indexId="index">
				<input type="hidden" id='fid<bean:write name="index"/>' name='fidname<bean:write name="index"/>' 
					value='<bean:write name="detail" property="footnote" />' />
				<input type="hidden" id='fname<bean:write name="index"/>' name='fnameName<bean:write name="index"/>'
					value='<bean:write name="detail" property="footnoteName" />' />
				<input type="hidden" id='desc<bean:write name="index"/>' name='fdesc<bean:write name="index"/>'
					value='<bean:write name="detail" property="desc" />' />
			</logic:iterate>
		</logic:notEmpty>
	</logic:present>
</div>
<div id="vfoot" style="display:none;">
	<logic:present name="Footnote">
		<html:select property="vendorDefaultFootnoteID" style="width:100;">
			<html:option value="0">
				<bean:message key="BzComposer.ComboBox.Select" />
			</html:option>
			<html:options collection="Footnote" property="value" labelProperty="label" />
		</html:select>
	</logic:present>
</div>
<div id="foot" style="display:none;">
	<logic:present name="Footnote">
		<html:select property="defaultFootnoteID" style="width:100;">
			<html:option value="0">
				<bean:message key="BzComposer.ComboBox.Select" />
			</html:option>
			<html:options collection="Footnote" property="value" labelProperty="label" />
		</html:select>
	</logic:present>
</div>
<div>
	<input type="hidden" name="tabid" id="tid" value="" />
</div>
<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
<script>	
function CloseWindow()
{
		window.opener.document.getElementById('dfoot').innerHTML=document.getElementById('foot').innerHTML;
		window.opener.document.getElementById('vdfoot').innerHTML=document.getElementById('vfoot').innerHTML;
		window.close();
}
	
function getList()
{
		if(document.getElementById('footid').style.display=='block')
		{
			document.getElementById('footid').style.display='none';
		}
		else
			document.getElementById('footid').style.display='block';
}
function SelectFootnote(fid)
{
		if(fid==0)
		{
			document.configurationForm.desc.value = "";
			document.getElementById('txt').value = '<bean:message key="BzComposer.ComboBox.Select" />';
		}
		else
		{
			fsize = document.getElementById('size').value;
			for(cnt=0;cnt<fsize;cnt++)
			{
				id = document.getElementById('fid'+cnt).value;
				if(id==fid)
				{
					document.configurationForm.desc.value = document.getElementById('desc'+cnt).value;
					document.getElementById('txt').value = document.getElementById('fname'+cnt).value;
					break;
				}
			}
		}
		document.getElementById('footid').style.display='none';
}
	
function ClearValues()
{
		HideList();
		document.configurationForm.footnote.value=0;
		document.getElementById('footid').style.display='none';
		document.getElementById('txt').value = "";
		document.configurationForm.desc.value = "";
		document.getElementById('txt').focus();
}
	
function HideList()
{
		document.getElementById('footid').style.display='none';
}
	
function DeleteFootnote()
{
		HideList();
		id = document.configurationForm.footnote.value;
		if(id==0)
		{
			//alert('<bean:message key="BzComposer.configuration.editfootnote.footnoteemptyvalidation"/>');
			return emptyfootnotevalidationdialog();
			document.getElementById('txt').focus();
		}
		else
		{
			/* if(confirm('<bean:message key="BzComposer.configuration.editfootnote.deleteconfirm"/>'))
			{
				document.getElementById('tid').value="DeleteFootnote";
				document.forms[0].action="Configuration.do";
				document.forms[0].submit();
			} */
			event.preventDefault();
			$("#showdeleterecorddialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			        	"<bean:message key='BzComposer.global.ok'/>": function () {
			            	debugger;
			            	document.getElementById('tid').value="UpdateFootnote";
			        		document.forms[0].action="Configuration.do";
			        		document.forms[0].submit();
							//$('form').submit();
			            },
			            "<bean:message key='BzComposer.global.cancel'/>": function () {
			                $(this).dialog("close");
			                return false;
			            }
			        }
			    });
			    return false;
		}	
}
	
function closeWin()
{
		HideList();
		window.opener.document.getElementById('dfoot').innerHTML=document.getElementById('foot').innerHTML;
		window.opener.document.getElementById('vdfoot').innerHTML=document.getElementById('vfoot').innerHTML;
}
	
function trim(inputString) 
{
	   // Removes leading carriage return from the passed string. Also removes
	   // consecutive carriage return.
	   var retValue = inputString;
	   var ch = retValue.substring(0, 1);
	   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) 
	   { 
		   // Check for carriage return at the beginning of the string
	      	retValue = retValue.substring(1, retValue.length);
	      	ch = retValue.substring(0, 1);
	   }
	   return retValue; 
}

function SaveFootnote()
{
		HideList();
		fid = document.configurationForm.footnote.value;
		txtv = document.getElementById('txt').value.toLowerCase();
		
		if(txtv=='select')
		{
			//alert('<bean:message key="BzComposer.configuration.editfootnote.footnoteemptyvalidation"/>')
			return emptyfootnotevalidationdialog();
			document.getElementById('txt').focus();
		}
		else
		{
			txtval = trim(document.getElementById('txt').value);
			if(txtval=="")
			{
				//alert('<bean:message key="BzComposer.configuration.editfootnote.footnoteemptyvalidation"/>')
				return emptyfootnotevalidationdialog();
				document.getElementById('txt').focus();
			}
			else
			{
				if(fid==0)
				{
					Save();
				}
				else
				{
					var footnm = "";
					fsize = document.getElementById('size').value;
					for(cnt=0;cnt<fsize;cnt++)
					{
						id = document.getElementById('fid'+cnt).value;
						if(id==fid)
						{
							footnm = document.getElementById('fname'+cnt).value;			
							break;
						}
					}
				
					if(footnm==txtval)
					{
						Update();
					}
					else
					{
						Save();
					}
				}
			}
		}
}
	
function Save()
{
	/* if(confirm('<bean:message key="BzComposer.configuration.editfootnote.saveconfirm" />'))
	{
		document.getElementById('tid').value="SaveFootnote";
		document.forms[0].action="Configuration.do";
		document.forms[0].submit();
	} */
	
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	document.getElementById('tid').value="SaveFootnote";
	        		document.forms[0].action="Configuration.do";
	        		document.forms[0].submit();
					//$('form').submit();
	            },
	            "<bean:message key='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
	
}
	
function Update()
{
	/* if(confirm('<bean:message key="BzComposer.configuration.editfootnote.updateconfirm" />'))
	{
		document.getElementById('tid').value="UpdateFootnote";
		document.forms[0].action="Configuration.do";
		document.forms[0].submit();
	} */
	event.preventDefault();
	$("#showupdaterecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	document.getElementById('tid').value="UpdateFootnote";
	        		document.forms[0].action="Configuration.do";
	        		document.forms[0].submit();
					//$('form').submit();
	            },
	            "<bean:message key='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}
function emptyfootnotevalidationdialog()
{
	event.preventDefault();
	$("#emptyfootnotevalidationdialog").dialog({
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
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="showupdaterecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.editfootnote.updateconfirm"/></p>
</div>
<div id="emptyfootnotevalidationdialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.editfootnote.footnoteemptyvalidation"/></p>
</div>
<div id="showdeleterecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.editfootnote.deleteconfirm"/></p>
</div>
<%-- <%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>BzComposer-EditFootNote</title>
<script type="text/javascript">
self.moveTo(100,100);
</script>
<style type="text/css">
table.tabla-listados tbody tr td 
{
	padding:6px 16px 5px 14px !important;
}
</style>
</head>
<body onunload="closeWin();">
<html:form action="Configuration.do?tabid=ShowEditFootnote" method="post">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div style="width: 100%;">
		<table cellspacing="0">
			<logic:present name="Status">
				<tr>
					<td>
						<font color="blue"> <strong> <bean:write name="Status" /> </strong></font>
					</td>
				</tr>
			</logic:present>
			<tr>
				<td>
					<table cellspacing="0" border="0" cellpadding="0">
						<tr>
							<td valign="top">
								<bean:message key="BizComposer.Configuration.EditFootnote.FootnoteSelection" />
							</td>
							<td>
								<div style="width:190;">
									<html:select property="footnote" onchange="SelectFootnote(this.value);">
										<html:option value="0">
											<bean:message key="BzComposer.ComboBox.Select" />
										</html:option>
										<logic:present name="configurationForm" property="footnote"> 
											<html:options collection="FoootNoteDetails" property="footnote" labelProperty="footnoteName" />
										</logic:present> 
									</html:select>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="tabla-listados" cellspacing="0" border="0">
						<thead>
							<tr>
								<th align="left">
									<bean:message key="BizComposer.Configuration.EditFootnote.Description" />
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<bean:message key="BizComposer.Configuration.EditFootnote.TermMsg" />
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="BizComposer.Configuration.EditFootnote.EnterKeyMsg" />
								</td>
							</tr>
							<tr>
								<td>
									<html:textarea property="desc" rows="10" cols="80"></html:textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr onclick="HideList();">
				<td>
					<div align="center">
						<input type="button" name="clear" class="formButton" onclick="ClearValues();" value='<bean:message key="BizComposer.Configuration.EditFootnote.Clear"/>' />
						<input type="button" name="Save" class="formButton" onclick="SaveFootnote();" value='<bean:message key="BizComposer.Configuration.EditFootnote.Save"/>' />
						<input type="button" name="Delete" class="formButton" onclick="DeleteFootnote();" value='<bean:message key="BizComposer.Configuration.EditFootnote.Delete"/>' />
						<input type="button" name="Close" class="formButton" onclick="CloseWindow();" value='<bean:message key="BizComposer.Configuration.EditFootnote.Close"/>' />
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
</div>
</div>
</div>
	<div id="FootnoteValues">
		<logic:present name="FoootNoteDetails">
			<logic:notEmpty name="FoootNoteDetails">
				<bean:size name="FoootNoteDetails" id="fsize" />
					<input type="hidden" id="size" value='<bean:write name="fsize" />' name="FootSize" />
					<logic:iterate name="FoootNoteDetails" id="detail" indexId="index">
						<input type="hidden" id='fid<bean:write name="index"/>' name='fidname
							<bean:write name="index"/>' value='<bean:write name="detail" property="footnote" />' />
						<input type="hidden" id='fname<bean:write name="index"/>' name='fnameName
							<bean:write name="index"/>' value='<bean:write name="detail" property="footnoteName" />' />
						<input type="hidden" id='desc<bean:write name="index"/>' name='fdesc
							<bean:write name="index"/>' value='<bean:write name="detail" property="desc" />' />
					</logic:iterate>
			</logic:notEmpty>
		</logic:present>
	</div>
	<div id="vfoot" style="display:none;">
		<logic:present name="Footnote">
			<html:select property="vendorDefaultFootnoteID" style="width:100;">
				<html:option value="0">
					<bean:message key="BzComposer.ComboBox.Select" />
				</html:option>
				<html:options collection="Footnote" property="value" labelProperty="label" />
			</html:select>
		</logic:present>
	</div>
	<div id="foot" style="display:none;">
		<logic:present name="Footnote">
			<html:select property="defaultFootnoteID" style="width:100;">
				<html:option value="0">
					<bean:message key="BzComposer.ComboBox.Select" />
				</html:option>
				<html:options collection="Footnote" property="value" labelProperty="label" />
			</html:select>
		</logic:present>
	</div>
	<div>
		<input type="hidden" name="tabid" id="tid" value="" />
	</div>
	<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
<script>
	function CloseWindow(){
		window.opener.document.getElementById('dfoot').innerHTML=document.getElementById('foot').innerHTML;
		window.opener.document.getElementById('vdfoot').innerHTML=document.getElementById('vfoot').innerHTML;
		window.close();
	}
	
	function getList(){
		if(document.getElementById('footid').style.display=='block'){
			document.getElementById('footid').style.display='none';
		}
		else
			document.getElementById('footid').style.display='block';
		
	}
	function SelectFootnote(fid){
		if(fid==0){
			document.configurationForm.desc.value = "";
			document.getElementById('txt').value = '<bean:message key="BzComposer.ComboBox.Select" />';
		}
		else{
			fsize = document.getElementById('size').value;
			for(cnt=0;cnt<fsize;cnt++){
				id = document.getElementById('fid'+cnt).value;
				if(id==fid){
					document.configurationForm.desc.value = document.getElementById('desc'+cnt).value;
					document.getElementById('txt').value = document.getElementById('fname'+cnt).value;
					break;
				}
			}
		}
		document.getElementById('footid').style.display='none';
	}
	
	function ClearValues(){
		HideList();
		document.configurationForm.footnote.value=0;
		document.getElementById('footid').style.display='none';
		document.getElementById('txt').value = "";
		document.configurationForm.desc.value = "";
		document.getElementById('txt').focus();
	}
	
	function HideList(){
		document.getElementById('footid').style.display='none';
	}
	
	function DeleteFootnote(){
		HideList();
		id = document.configurationForm.footnote.value;
		if(id==0){
			alert('<bean:message key="BizComposer.Configuration.EditFootnote.Delete.FootnoteEmptyValidation"/>');
			document.getElementById('txt').focus();
		}
		else{
			if(confirm('<bean:message key="BizComposer.Configuration.EditFootnote.DeleteConfirm"/>')){
				document.getElementById('tid').value="DeleteFootnote";
				document.forms[0].action="Configuration.do";
				document.forms[0].submit();
			}
		}
		
	}
	
	function closeWin(){
		HideList();
		window.opener.document.getElementById('dfoot').innerHTML=document.getElementById('foot').innerHTML;
		window.opener.document.getElementById('vdfoot').innerHTML=document.getElementById('vfoot').innerHTML;
	}
	
	function trim(inputString) {
	   // Removes leading carriage return from the passed string. Also removes
	   // consecutive carriage return.
	   var retValue = inputString;
	   var ch = retValue.substring(0, 1);
	   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) { // Check for carriage return at the beginning of the string
	      retValue = retValue.substring(1, retValue.length);
	      ch = retValue.substring(0, 1);
	   }
	   return retValue; 
	}
	
	
	function SaveFootnote(){
		HideList();
		fid = document.configurationForm.footnote.value;
		txtv = document.getElementById('txt').value.toLowerCase();
		
		if(txtv=='select'){
			alert('<bean:message key="BizComposer.Configuration.EditFootnote.Delete.FootnoteEmptyValidation"/>')
			document.getElementById('txt').focus();
		}
		else{
			txtval = trim(document.getElementById('txt').value);
			if(txtval==""){
				alert('<bean:message key="BizComposer.Configuration.EditFootnote.Delete.FootnoteEmptyValidation"/>')
				document.getElementById('txt').focus();
			}
			else{
				if(fid==0){
					Save();
				}
				else{
					var footnm = "";
					fsize = document.getElementById('size').value;
					for(cnt=0;cnt<fsize;cnt++){
						id = document.getElementById('fid'+cnt).value;
						if(id==fid){
							footnm = document.getElementById('fname'+cnt).value;			
							break;
						}
					}
				
					if(footnm==txtval){
						Update();
					}
					else{
						Save();
					}
				}
			}
		}
	}
	
	function Save(){
		if(confirm('<bean:message key="BizComposer.Configuration.EditFootnote.SaveConfirm" />')){
			document.getElementById('tid').value="SaveFootnote";
			document.forms[0].action="Configuration.do";
			document.forms[0].submit();
		}
	}
	
	function Update(){
		if(confirm('<bean:message key="BizComposer.Configuration.EditFootnote.UpdateConfirm" />')){
			document.getElementById('tid').value="UpdateFootnote";
			document.forms[0].action="Configuration.do";
			document.forms[0].submit();
		}
	}
</script>
</html> --%>