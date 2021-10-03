<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="BzComposer.moduleimporttitle"/></title>
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/form.css"
	media="screen" rel="Stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/admin.css" media="screen" rel="Stylesheet" type="text/css">	
	<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/js/jquery.min.js"></script>
	<link href="<bean:write name="path" property="pathvalue"/>/styles/calendar.css" rel="stylesheet" />
	<script src="<bean:write name="path" property="pathvalue"/>/scripts/calendar.js" type="text/javascript"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<div id="tabs1" class="mb-3 clear custom-fixed-tabs">
				<ul class="tabs">
					<li><a href="#tabs-1"><bean:message key="menu.moduleimport"/></a></li>
					<li><a href="#tabs-2"><bean:message key="menu.installed"/></a></li>
				</ul>
				<div class="tab-content"> 
					<div id="tabs-1" class="pl-2 pr-2 pt-3 pb-1">
					
						<div class="sideaccordion">
							<ul>
								
								<li>
									<label><b><bean:message key="menu.paymentgateway"/></b>
										<input type="checkbox">
										<div>
											<ul>
												<li><a href="#">Transact</a></li>
											</ul>
										</div>
									</label>	
								</li>
								<li>
									<label><b><bean:message key="menu.msaccounting"/></b>
										<input type="checkbox">
										<div>
											<ul>
												<li><a href="#">MSQAImport</a></li>
												<li><a href="#">MSQAExport</a></li>
											</ul>
										</div>
									</label>
								</li>
								<li>
									<label><b><bean:message key="menu.shipping"/></b>
										<input type="checkbox">
										<div>
											<ul>
												<li><a href="#">MSQAImport</a></li>
												<li><a href="#">MSQAExport</a></li>
											</ul>
										</div>
									</label>
								</li>
								<li>
									<label><b><bean:message key="menu.quickbook"/></b>
										<input type="checkbox">
										<div>
											<ul>
												<li><a href="#">MSQAImport</a></li>
												<li><a href="#">MSQAExport</a></li>
											</ul>
										</div>
									</label>
								</li>
							</ul>
						</div>
						
						<div class="module-maanger-form">
							<h4>
								<bean:message key="BzComposer.moduleimport.plugininfo"/>
								<!-- Plugin Information -->
							</h4>
							<div class="module-form1">
								<div>
									<label>
										<bean:message key="BzComposer.moduleimport.pluginname"/>
										<!-- Name : -->
									</label>
									<div>iTransact</div>
								</div>
								<div>
									<label>
										<bean:message key="BzComposer.moduleimport.pluginversion"/>
										<!-- Version : -->
									</label>
									<div>v1.0</div>
								</div>
								<div>
									<label>
										<bean:message key="BzComposer.moduleimport.pluginauthor"/>
										<!-- Author : -->
									</label>
									<div>NextBits</div>
								</div>
								<div>
									<label>
										<bean:message key="BzComposer.moduleimport.pluginreleasedate"/>
										<!-- Release Date : -->
									</label>
									<div>05/28/2009</div>
								</div>
							</div>
							<div class="module-form2">
								<div>
									<label>
										<bean:message key="BzComposer.moduleimport.plugindescription"/>
										<!-- Plugin Description : -->
									</label>
									<div><textarea>This Plugin install to manage online payement process.</textarea></div>
								</div>
							</div>
							<div class="module-form-buttons">
								<button>
									<bean:message key="BzComposer.moduleimport.plugininstall"/>
									<!-- Install -->
								</button>
								<button>
									<bean:message key="BzComposer.moduleimport.pluginstop"/>
									<!-- Stop -->
								</button>
								<button><bean:message key="BzComposer.global.close"/></button>
							</div>
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
											<bean:message key="BzComposer.moduleimport.firstname"/>
											<!-- First Name -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.lastname"/>
											<!-- Last Name -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.companyname"/>
											<!-- Company Name -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.email"/>*
											<!-- Email* -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.city"/>
											<!-- City -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.state"/>
											<!-- State -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.zipcode"/>
											<!-- Zip Code -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.country"/>
											<!-- Country -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.phone"/>
											<!-- Phone -->
										</td>
									</tr>	
									<tr>
										<td>
											<bean:message key="BzComposer.moduleimport.billingaddress"/>
											<!-- Billing Address1 -->
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

<script type="text/javascript">
$(function() {
    debugger;
	  $( "#tabs1" ).tabs();
  } );
</script>			
</body>
</html>