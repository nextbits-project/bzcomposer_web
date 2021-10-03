<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><bean:message key="menu.file.MultiPrintInvoice"/></title>
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<%@include file="/include/header.jsp"%>
</head>
<body>
<html:form action="File.do?tabid=MultiPrintInvoice" method="post">
	<!-- Tab links -->
<div class="bca_multiprintwindow">
  	<ul>
  		<li id="mpw_tab1"><bean:message key="BzComposer.multiprintforms.general"/></li>
  		<li id="mpw_tab2"><bean:message key="BzComposer.multiprintforms.paper"/></li>
  	</ul>
</div>
<div class="mpw_tab1_details">
	<div class="mpw_tab1_details_left">	
		<div class="tab1_nuberpofpages">
			<label><b><bean:message key="BzComposer.multiprintforms.numberofpages"/></b></label>
			<br>
			<label><bean:message key="BzComposer.multiprintforms.invoicenumber"/></label>
			<html:text property="invoiceNo"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label><bean:message key="BzComposer.multiprintforms.packingslipnumber"/></label>
			<html:text property="packingSlipNo"/>
		</div>	
		<div class="tab1_print">
			<input type="radio" name="p" id="p1" value="print"> 
				<label><b><bean:message key="BzComposer.multiprintforms.printlabel"/></b></label>
				<br>
				<label><bean:message key="BzComposer.multiprintforms.printfrom"/></label>
				<html:text property="printInvoiceFrom"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label><bean:message key="BzComposer.multiprintforms.printto"/></label>
				<html:text property="printInvoiceTo"/>
		</div>
		<div class="tab1_print">
			<input type="radio" name="p" id="p2" value="print" checked="checked"> 
				<label><b><bean:message key="BzComposer.multiprintforms.printbydatetime"/></b></label>
				<br>
				<label><bean:message key="BzComposer.multiprintforms.datefrom"/></label>
				<html:text property="fromDate" size="15"/>
				<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.CompanyInfoForm.fromDate,'mm-dd-yyyy',this);">
				<label>
					<bean:message key="BzComposer.multiprintforms.dateto"/>
				</label>
				<html:text property="toDate" size="15"/>
				<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.CompanyInfoForm.toDate,'mm-dd-yyyy',this);">
		</div>
	</div>
	<div class="mpw_tab1_details_right">	
		<div class="tab1_sortoption">
			<label>
				<b><bean:message key="BzComposer.multiprintforms.sortoption"/></b>
			</label>
			<br>
			<table>
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th><bean:message key="BzComposer.multiprintforms.priority"/></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="checkbox" value="Shipping Method" checked="checked"><bean:message key="BzComposer.multiprintforms.shippingmethod"/>
						</td>
						<td><input type="text" size="1"></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="Item Title" checked="checked"><bean:message key="BzComposer.multiprintforms.itemtitle"/>
						</td>
						<td><input type="text" size="1"></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="Destination" checked="checked"><bean:message key="BzComposer.multiprintforms.destination"/>
						</td>
						<td><input type="text" size="1"></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="Special Handing" checked="checked"><bean:message key="BzComposer.multiprintforms.specialhandling"/>
						</td>
						<td><input type="text" size="1"></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="Location" checked="checked"><bean:message key="BzComposer.multiprintforms.location"/>
						</td>
						<td><input type="text" size="1"></td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class="tab1_options">
			<label>
				<b><bean:message key="BzComposer.multiprintforms.options"/></b>
			</label>
			<br>
			<table>
				<tbody>
					<tr>
						<td>
							<input type="checkbox" value="Skip if already printed" checked="checked"><bean:message key="BzComposer.multiprintforms.skipifprinted"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="Print test page first." checked="checked"><bean:message key="BzComposer.multiprintforms.printtestpage"/>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
	</div>
</div>
<div class="mpw_tab2_details">
</div>
<div class="mpw_button_bottom">
	<ul>
		<li><button type="submit" class="formbutton"><bean:message key="BzComposer.multiprintforms.print"/></button></li>
		<li><button class="formbutton"><bean:message key="BzComposer.global.close"/></button></li>
	</ul>
</div>
</html:form>
</body>
</html>