<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.formcustomizationtitle" /></title>
<%-- <link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.min.js"></script>  --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/bootstrap.min.js"></script> --%>
<script src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
</head>

<script>
function toggleFunction() {
	debugger;
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
    /* document.getElementById("togglebtn").value = "+"; */
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
    /* document.getElementById("togglebtn").value = "-"; */
  }
} 
</script>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();" style="min-width: 1366px;">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post" styleId="frmcust">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">

	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.configuration.configurationtitle"/>
		</span>
	</div>
	<div>
		<div>
			<logic:present name="Labels">
				<bean:size name="Labels" id="size" />
					<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
					<logic:iterate name="Labels" id="lbl" indexId="index">
						<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname' value='<bean:write name="lbl" property="value" />' />
						<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm' value='<bean:write name="lbl" property="label" />' />
					</logic:iterate>
			</logic:present>
		</div>
		<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
			<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
			<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
				<tr>
					<td id="leftMenu" style="position: relative; width: 180px;">
						<table>
							<tr>
								<td>
									<%-- <%@include file="testMenu1.jsp" %> --%>
									<%@include file="menuPage.jsp" %>
									<%-- <div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
										<%@include file="testMenu1.jsp" %>
									</div> --%>
								</td>
							</tr>
							<%-- <tr align="center">
								<td>
									<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
									<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr> --%>
						</table>
					</td>
					<td valign="top" >
						<!-- formCustomization Starts -->
			<div id="formCustomization" style="display:none;padding: 0; position: relative; left: 0;">
				<table class="table-notifications" width="100%">
				<tr>
					<th colspan="3" align="left" style="font-size:12px; padding:5px;"><bean:message
						key="BzComposer.configuration.templatecustomization" />
					</th>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.selecttype"/>:
					</td>
					<td colspan="2" style="font-size:12px;">
						<select id="templateCust">
							<option value="0"><bean:message key="BzComposer.configuration.defaultstartingpage.invoice"/></option>
							<option value="1"><bean:message key="BzComposer.configuration.salesorder"/></option>
							<option value="2"><bean:message key="BzComposer.configuration.bills"/></option>
							<option value="3"><bean:message key="BzComposer.configuration.packingslips"/></option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.active"/>
					</td>
					<td>&nbsp;&nbsp;
					</td>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.notactive"/>
					</td>
				</tr>
				<tr>
					<td style="width:60px;font-size:12px;">
						<select id="ActiveInvoiceStyleId" name="InvoiceStyleId" style="display:block; width: 200px; height: 200px;" multiple="multiple">
							<logic:present name="configurationForm" property="listOfExistingInvoiceStyle"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingInvoiceStyle" scope="session">
									<option  value="<bean:write name='objList1' property='invoiceStyleId' />" >
										<bean:write name="objList1" property="invoiceStyle" />
									</option>
								</logic:iterate>
							</logic:present> 
						</select>
						<input type="hidden" name="invoiceStyleId" id="invoiceStyleId" value="<bean:write name="objList1" property="invoiceStyle" />"> 
					</td>
					
					<td align="center" style="font-size:12px;">
						<input type="button" id="addL2R" class="formButton" name="addL2R" onclick="setdeactivate()"  value="<bean:message key="BzComposer.configuration.lefttorightbtn"/>" style="width: 40px;">
						<br>
						<br>
						<br>
						<input type="button" id="addR2L" style="width:40px;" class="formButton" name="addR2L" onclick="setactivate()"  value="<bean:message key="BzComposer.configuration.righttoleftbtn"/>">
					</td>
					<td style="font-size:12px;">
					<select id="InvoiceStyleId1" name="InvoiceStyleId1" style="display:block; width: 200px; height: 200px;" multiple="multiple">
							<logic:present name="configurationForm" property="listOfExistingInvoiceStyle1"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingInvoiceStyle1" scope="session">
									<option value="<bean:write name='objList1' property='invoiceStyleId1' />" onclick="setDescription()">
										<bean:write name="objList1" property="invoiceStyle1" />
									</option>
								</logic:iterate>
							</logic:present> 
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td style="width: 50px;">
						<input type="button" id="Add" style="width: 40px;font-size:12px;" name="Add" value="<bean:message key="BzComposer.global.add"/>" class="formButton">
					</td>
					<td></td>
				</tr>
				<tr>
					<table class="table-notifications" >
										<tr>
											<th colspan="3" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.feturesheader" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<b>
													<bean:message key="BzComposer.configuration.features.availablemodules" />
												</b>
											</td>
											<td style="width: 60px;">&nbsp;&nbsp;</td>
											<td style="font-size: 12px;">
												<b>
													<bean:message key="BzComposer.configuration.features.selectedmodules" />
												</b>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px; width: 250px;">
												<html:select property="selectedModuleId" styleId="selectedModuleId" style="width: 200px; height: 200px;font-size: 1em;" styleClass="featureName1" multiple="true">
													<logic:present name="configurationForm" property="listOfExistingModules"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingModules" scope="session">
															<option value="<bean:write name='objList1' property='selectedModuleId' />">
																<bean:write name="objList1" property="featureName" />
															</option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
											<td style="font-size: 12px; width: 100px;">
												<br><br>
												<a class="addfeature" style="font-size: 16px;padding-right: 10px; padding-left: 10px;color: #fff; background-color: #05A9C5; ">
													<bean:message key="BzComposer.configuration.lefttorightbtn"/>
												</a>
												<br/><br/>
												<a class="removefeature" style="font-size: 16px;padding-right: 10px; padding-left: 10px;color: #fff; background-color: #05A9C5; ">
													<bean:message key="BzComposer.configuration.righttoleftbtn"/>
												</a>
											</td>
											<td >
												<html:select property="selectedModules" styleId="selectedModules" style="width: 200px; height: 200px;font-size: 1em;" styleClass="featureName2" multiple="true">
													<logic:present name="configurationForm" property="listOfExistingselectedModules"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingselectedModules" scope="session">
															<option value="<bean:write name='objList1' property='selectedModuleId' />">
																<bean:write name="objList1" property="featureName" />
															</option>
														</logic:iterate>
													</logic:present>  
												</html:select>
											</td>
										</tr>
									</table>
				</tr>
			</div>
			<!-- formCustomization Ends -->
			</td>
		</tr>
	</table>
	
	
	<div><html:hidden property="empStateID" /> <html:hidden
		property="labelName" /> <html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" />
	</div>
	</div>
	<div>
	<div align="center">
	<html:button property="save" onclick="saveValue();"><bean:message key="BzComposer.global.save"/></html:button>
		<%-- <html:cancel><bean:message key="BzComposer.global.cancel"/></html:cancel> --%>
		<input type="reset" name="Cancel" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form>
<script type="text/javascript">
function SaveValuesFeatures()
{
	if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	{
		event.preventDefault();
		$("#showsaverecorddialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		        	"<bean:message key='BzComposer.global.ok'/>": function () {
		            	document.configurationForm.selectedModules.value = document.configurationForm.selectedModules.value;
		        		document.configurationForm.selectedModuleId.value = document.configurationForm.selectedModuleId.value;
		        				        		
		        		var x = document.getElementById("selectedModules");
		        	    var txt = "";
		        	    var i;
		        	    for (i = 0; i < x.length; i++) 
		        	    {
		        	        txt = txt + "\n" + x.options[i].text;
		        	    }
		        	    document.configurationForm.selectedModules.value = txt;
		        	    
		        	    var x = document.getElementById("selectedModuleId");
		        	    var txt1 = "";
		        	    var i;
		        	    for (i = 0; i < x.length; i++) 
		        	    {
		        	        txt1 = txt1 + "\n" + x.options[i].text;
		        	    }
		        		
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
function saveValue(){
	debugger;
	var x = document.getElementById("ActiveInvoiceStyleId");
    var ActiveInvoiceStyle = "";
    var i;
    var ActiveInvoiceStylelist = [];
    for (i = 0; i < x.length; i++) 
    {
    	ActiveInvoiceStyle =x.options[i].value;
    	ActiveInvoiceStylelist.push(ActiveInvoiceStyle);
    }
    
    var x1 = document.getElementById("InvoiceStyleId1");
    var DeActiveInvoiceStyle = "";
    var i1;
    var DeActiveInvoiceStylelist = [];
    for (i1 = 0; i1 < x1.length; i1++) 
    {
    	DeActiveInvoiceStyle =x1.options[i1].value;
    	DeActiveInvoiceStylelist.push(DeActiveInvoiceStyle);
    }
	/* document.getElementById('tabid').value="SaveCustomerInvoiceSettings"; */
	/* document.forms['frmcust'].action = "Configuration.do?tabid=formCustomization&ActiveInvoiceStylelist="+ActiveInvoiceStylelist+"&DeActiveInvoiceStylelist="+DeActiveInvoiceStylelist;
	document.forms['frmcust'].submit(); */
	//alert("save");
	
	var formData = $('frmcust').serialize();
	
	$.ajax({
		type : "POST",
		url : "Configuration.do?tabid=formCustomization&ActiveInvoiceStylelist="+ActiveInvoiceStylelist+"&DeActiveInvoiceStylelist="+DeActiveInvoiceStylelist,
		data : formData,
		success : function(data) {
			debugger
			
			$("#showsuccessdialog").dialog({
					resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			        	"<bean:message key='BzComposer.global.ok'/>": function () {
			        		$(this).dialog("close");
			        		window.location.href= "Configuration.do?tabid=config9&&tab=tr9";
			                return false;
			        	},
			            "<bean:message key='BzComposer.global.cancel'/>": function () {
			                $(this).dialog("close");
			                return false;
			            }
		        	}
			});
		},
		error : function(data) {
			alert("<bean:message key='BzComposer.common.erroroccurred'/>");
		}
	});
}
function setdeactivate() {
	debugger;

	var sel = document.getElementById("ActiveInvoiceStyleId");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;
	// get reference to select element
	var sel1 = document.getElementById('InvoiceStyleId1');
	sel.remove(sel.selectedIndex);
	// create new option element
	var opt = document.createElement('option');

	// create text node to add to option element (opt)
	opt.appendChild( document.createTextNode(selectValue) );
	
	// set value property of opt
	opt.value = selectValue1; 

	// add opt to end of select box (sel)
	sel1.appendChild(opt);	
}
function setactivate() {
	debugger;

	var sel = document.getElementById("InvoiceStyleId1");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;
	// get reference to select element
	var sel1 = document.getElementById('ActiveInvoiceStyleId');
	sel.remove(sel.selectedIndex);
	// create new option element
	var opt = document.createElement('option');

	// create text node to add to option element (opt)
	opt.appendChild( document.createTextNode(selectValue) );
	
	// set value property of opt
	opt.value = selectValue1; 

	// add opt to end of select box (sel)
	sel1.appendChild(opt);	
}
</script>
<%@ include file="/include/footer.jsp"%>
</body>
</html>
<!-- Dialog box used in this page -->
<div id="showsuccessdialog" style="display:none;">
	<p>Record updated</p>
</div>