<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/form.css"
	media="screen" rel="Stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/admin.css" media="screen" rel="Stylesheet" type="text/css">	
	<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/js/jquery.min.js"></script>
	<link href="<bean:write name="path" property="pathvalue"/>/styles/calendar.css" rel="stylesheet" />
	<script src="<bean:write name="path" property="pathvalue"/>/scripts/calendar.js" type="text/javascript"></script>
	<style type="text/css">
	.customfieldset{
		margin-left: 20px;
	}
	.customlegend{
		
	}
	</style>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title><bean:message key="BzComposer.importordertitle"/></title>
</head>
<body>
<html:form action="File.do?tabid=OrderImport" method="post" enctype="MULTIPART/FORM-DATA" styleId="uploadForm">
	<div>
		
		<h4><bean:message key="BzComposer.file.option.orderImport"/></h4>
		<fieldset>
			<legend><bean:message key="BzComposer.file.option.load"/></legend>
			<label>
				<bean:message key="BzComposer.file.option.load"/>
				<select>
					<option>
						<bean:message key="BzComposer.orderimport.selecttemplate"/>
					</option>
					<logic:present name="listOfOrderImportFile">
						<logic:iterate id="objList" name="listOfOrderImportFile">
							<option value="<bean:write name="objList" property="value"/>"><bean:write name="objList" property="label"/></option>
						</logic:iterate>
					</logic:present>
				</select>
			</label>
		</fieldset>
		
		<fieldset>
			<legend><bean:message key="BzComposer.file.option.ImportFrom"/></legend>
			<div><label>
				<bean:message key="BzComposer.file.option.file"/>
				<input type="text">
				<button type="button" class="btn" onclick="document.getElementById('getFile').click()">
					<!-- Select File -->
					<bean:message key="BzComposer.global.selectfile"/>
				</button>
				<input type='file' id="getFile" style="display:none">
				<!-- <input type="file" value="Select File"/> -->
			</label></div>
			
			<div><label>
				<bean:message key="BzComposer.file.option.excel"/>
				<select>
					<option></option>
				</select>
			</label></div>
			
		</fieldset>
		
		<fieldset>
			<legend><bean:message key="BzComposer.file.option.template"/></legend>
			<label><input type="radio" name="temptype" checked="checked"><bean:message key="BzComposer.file.option.invoice"/></label>
			<label><input type="radio" name="temptype"><bean:message key="BzComposer.file.option.purchase"/></label>
		</fieldset>
		
		
		<fieldset>
			<legend><bean:message key="BzComposer.file.option.fields"/></legend>
			
			
			<div id="tabs1" class="mb-3 clear custom-fixed-tabs">
				<ul class="tabs">
					<li><a href="#tabs-1"><bean:message key="BzComposer.file.option.order"/></a></li>
					<li><a href="#tabs-2"><bean:message key="BzComposer.file.option.name"/></a></li>
					<li><a href="#tabs-3"><bean:message key="BzComposer.file.option.items"/></a></li>
				</ul>
				<div class="tab-content"> 
					<div id="tabs-1" class="pl-2 pr-2 pt-3 pb-1">
						<div class="table1">
							<table class="table" border="1">
								<thead>
									<tr>
										<th><bean:message key="BzComposer.file.option.database"/></th>
										<th><bean:message key="BzComposer.file.option.mapping"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.orderid"/>
											<bean:message key="BzComposer.CompulsoryField.Validation" /></td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.orderdate"/>
											<bean:message key="BzComposer.CompulsoryField.Validation" />
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.paymethod"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.shippingmethod"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.producttotal"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.taxtotal"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.taxable"/>
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
					</div>
					<div id="tabs-2" class="pl-2 pr-2 pt-3 pb-1">
						<div class="table1 table2" id="devCategoryTable">
							<table class="table table-bordered table-sm devAcCategoryListTable" border="1">
								<thead class="thead-light">
									<tr>
										<th><bean:message key="BzComposer.file.option.database"/></th>
										<th><bean:message key="BzComposer.file.option.mapping"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.firstname"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.lastname"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.companyname"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.email"/>
											<bean:message key="BzComposer.CompulsoryField.Validation" />
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.city"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.state"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.zipcode"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.country"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.phone"/>
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.billingaddress1"/>
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
					</div>
					<div id="tabs-3" class="pl-2 pr-2 pt-3 pb-1">
						<div class="table1 table2" id="devCategoryTable">
							<table class="table table-bordered table-sm devAcCategoryListTable" border="1">
								<thead class="thead-light">
									<tr>
										<th><bean:message key="BzComposer.file.option.database"/></th>
										<th><bean:message key="BzComposer.file.option.mapping"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.sku"/>
											<bean:message key="BzComposer.CompulsoryField.Validation" />
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.itemname"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.quantity"/>
											<bean:message key="BzComposer.CompulsoryField.Validation" />
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.unitprice"/>
											<bean:message key="BzComposer.CompulsoryField.Validation" />
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.unitweight"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.orderimport.taxable"/>
										</td>
									</tr>	
								</tbody>	
								</tbody>	
								</tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
</html:form>
<script type="text/javascript">
var progress;
function downloadCustomerList(type)
{
	debugger;
	document.forms[0].action = "Item.do?tabid=ExportItem&type="+type;
	document.forms[0].submit();
}
$(document).ready(function(){	
	
});

$(function() {
    debugger;
	  $( "#tabs1" ).tabs();
  } );
</script>
</body>
</html>