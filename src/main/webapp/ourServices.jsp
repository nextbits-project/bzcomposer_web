<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html:html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title><bean:message key="BzComposer.ourservicetitle"/></title>
<%@ include file="templateHeader.jsp"%>
<style>
.highlight {
  background-color: yellow;
}
</style>
<script type="text/javascript">
function redirectToLogin()
{
	window.location = "Login.do?tabid=loginPage";	
}
function openRegisterPage()
{
	//alert("Inside openRecoverPassword")
	window.location = "Login.do?tabid=register";
}

function searchText()
{    
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBox").value;
	var txt1 = $('#ourServices').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{
			//alert("you've called attribute of page content");
			document.getElementById("aboutBzComposer").innerHTML = txt1;
		}
		else
		{
			var txt = $('#ourServices').html().replace(highlightRe,'$1');
			
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#ourServices").html(txt);
			setTimeout(function(){ 
				document.getElementById("ourServices").innerHTML = txt1;
			}, 5000);
		}	
	} 
	else
	{
		alert("<bean:message key='BzComposer.common.emterword'/>");
	}
 }
function searchTextNotResponsive()
{
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBoxNR").value;
	var txt1 = $('#ourServices').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{
			//alert("you've called attribute of page content");
			document.getElementById("ourServices").innerHTML = txt1;
		}
		else
		{
			var txt = $('#ourServices').html().replace(highlightRe,'$1');
			
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#ourServices").html(txt);
			setTimeout(function(){ 
				document.getElementById("ourServices").innerHTML = txt1;
			}, 5000);
		}
	}
	else
	{
		alert("<bean:message key='BzComposer.common.emterword'/>");
	}
}

function openSampleCompany2()
{
	window.location.href="Login.do?tabid=selectedCompanyHome&selectedCompanyId=2&companyName=ABC Retails Company";	
}

function openSampleCompany3()
{
	window.location.href="Login.do?tabid=selectedCompanyHome&selectedCompanyId=3&companyName=ABC Wholesale Company";
}

function openSampleCompany4()
{
	window.location.href="Login.do?tabid=selectedCompanyHome&selectedCompanyId=4&companyName=ABC eSales Company";
}
</script>
<body>
	<header>
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container-fluid">
				<div align="center" style="max-width: 100%">
					<div class="logo" style="max-width: 100%;">
						<a href="${pageContext.request.contextPath}/index.jsp"> 
							<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" style="max-width: 100%"/>
						</a>
					</div>
				</div>
				<div align="center" style="max-width: 100%">
					<input type="text" id="searchBox" name="searchBox" placeholder="<bean:message key="BzComposer.searchtext"/>" style="max-width: 100%;" />
					<button class="btn btn-primary" onclick="searchText()"><bean:message key="BzComposer.searchbuttontext"/></button>
				</div>
				<div align="center" style="max-width: 100%">
					<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><bean:message key="BzComposer.login"/></button>
					<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><bean:message key="BzComposer.register"/></button>
					<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>	
				</div>
			</div>
			<div class="au-navbar-mobile navbar-mobile-1">
				<ul class="au-navbar-menu">
					<li><a href="${pageContext.request.contextPath}/"><bean:message key="BzComposer.home"/></a></li>
					<li><a href="${pageContext.request.contextPath}/bzComposer"><bean:message key="BzComposer.whatisbzcomposer"/></a></li>
					<li><a href="${pageContext.request.contextPath}/company.jsp"><bean:message key="BzComposer.aboutus"/></a></li>
					<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp"><bean:message key="BzComposer.existingcompetitors"/></a></li>
					<li class="drop">
						<a href="#"><bean:message key="BzComposer.samplecompaies"/></a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="#" onclick="openSampleCompany4();"><bean:message key="BzComposer.samplecompaies.eSalecompany"/></a></li>
								<li><a href="#" onclick="openSampleCompany2();"><bean:message key="BzComposer.samplecompaies.retailcompany"/></a></li>
								<li><a href="#" onclick="openSampleCompany3();"><bean:message key="BzComposer.samplecompaies.wholesalecompany"/></a></li>
							</ul>
					</li>
					<li><a href="#"><bean:message key="BzComposer.ourservices"/></a></li>
					<li><a href="${pageContext.request.contextPath}/industries.jsp"><bean:message key="BzComposer.industires"/></a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/features.jsp"><bean:message key="BzComposer.features"/></a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/features.jsp#easySetup"><bean:message key="BzComposer.features.easysetup"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#enhancedFeatures"><bean:message key="BzComposer.features.enshancedfeature"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#customerContactManagement"><bean:message key="BzComposer.features.customercontactmanagement"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#completeOrderManagement"><bean:message key="BzComposer.features.completeordermanagement"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#inventoryWarehouseManagement"><bean:message key="BzComposer.features.inventorywarehousemanagement"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#shippingPaymentIntegration"><bean:message key="BzComposer.features.shippingpaymentintegration"/></a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#fullFeaturedAccountingSystem"><bean:message key="BzComposer.features.accountsystem"/></a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#payRollTax"><bean:message key="BzComposer.features.payrolltax"/></a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#completeRealTimeReports"><bean:message key="BzComposer.features.completerealtimreports"/></a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#eCommerceIntegration"><bean:message key="BzComposer.features.ecommerceintegration"/></a></li>
						</ul>
					</li>
					<li class="drop"><a href="${pageContext.request.contextPath}/products.jsp"><bean:message key="BzComposer.products"/></a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerStandard"><bean:message key="BzComposer.products.bzcomposerstandard"/></a></li>
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerBilling"><bean:message key="BzComposer.products.billing"/></a></li>
                           	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposereSales"><bean:message key="BzComposer.products.esales"/></a></li>
                           	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerProfessional"><bean:message key="BzComposer.products.professional"/></a></li>
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcompserStandardShareware"><bean:message key="BzComposer.products.standardshareware"/></a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/contactUs.jsp"><bean:message key="BzComposer.contact"/></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="hidden-tablet-landscape">
		<div class="header header-1">
			<div class="container">
				<div class="block-left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"> 
							<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" />
						</a>
					</div>
				</div>
				<div class="block-right">
					<div class="contact-widget contact-widget-1">
						<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><bean:message key="BzComposer.login"/></button>
						<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><bean:message key="BzComposer.register"/></button>	
					</div>
				</div>
				<div style="text-align: -webkit-center;">
					<input type="text" id="searchBoxNR" name="searchBoxNR" placeholder="<bean:message key="BzComposer.searchtext"/>" style="width: 241px" />
					<button class="btn btn-primary" onclick="searchTextNotResponsive()"><bean:message key="BzComposer.searchbuttontext"/></button>
				</div>
			</div>
		</div>
	</div>
	<div class="section section-navbar-1 bg-grey hidden-tablet-landscape"
		id="js-navbar-fixed">
		<div class="text-center">
			<div class="text-center">
				<div class="logo-mobile">
					<a href="${pageContext.request.contextPath}/index.jsp"> 
						<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting"/>
					</a>
				</div>
			</div>
				<nav class="text-center">
				<div class="au-navbar navbar-1">
					<ul class="au-navbar-menu">
						<li><a href="${pageContext.request.contextPath}/"><bean:message key="BzComposer.home"/></a></li>
						<li><a href="${pageContext.request.contextPath}/bzComposer"><bean:message key="BzComposer.whatisbzcomposer"/></a></li>
						<li><a href="${pageContext.request.contextPath}/company.jsp"><bean:message key="BzComposer.aboutus"/></a></li>
						<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp"><bean:message key="BzComposer.existingcompetitors"/></a></li>
						<li class="drop">
						<a href="#"><bean:message key="BzComposer.samplecompaies"/></a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="#" onclick="openSampleCompany4();"><bean:message key="BzComposer.samplecompaies.eSalecompany"/></a></li>
								<li><a href="#" onclick="openSampleCompany2();"><bean:message key="BzComposer.samplecompaies.retailcompany"/></a></li>
								<li><a href="#" onclick="openSampleCompany3();"><bean:message key="BzComposer.samplecompaies.wholesalecompany"/></a></li>
							</ul>
						</li>
						<li><a href="#"><bean:message key="BzComposer.ourservices"/></a></li>
						<li><a href="${pageContext.request.contextPath}/industries.jsp"><bean:message key="BzComposer.industires"/></a></li>
						<li class="drop"><a href="${pageContext.request.contextPath}/features.jsp"><bean:message key="BzComposer.features"/></a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="${pageContext.request.contextPath}/features.jsp#easySetup"><bean:message key="BzComposer.features.easysetup"/></a></li>
								<li><a href="${pageContext.request.contextPath}/features.jsp#enhancedFeatures"><bean:message key="BzComposer.features.enshancedfeature"/></a></li>
								<li><a href="${pageContext.request.contextPath}/features.jsp#customerContactManagement"><bean:message key="BzComposer.features.customercontactmanagement"/></a></li>
								<li><a href="${pageContext.request.contextPath}/features.jsp#completeOrderManagement"><bean:message key="BzComposer.features.completeordermanagement"/></a></li>
								<li><a href="${pageContext.request.contextPath}/features.jsp#inventoryWarehouseManagement"><bean:message key="BzComposer.features.inventorywarehousemanagement"/></a></li>
								<li><a href="${pageContext.request.contextPath}/features.jsp#shippingPaymentIntegration"><bean:message key="BzComposer.features.shippingpaymentintegration"/></a></li>
                            	<li><a href="${pageContext.request.contextPath}/features.jsp#fullFeaturedAccountingSystem"><bean:message key="BzComposer.features.accountsystem"/></a></li>
                            	<li><a href="${pageContext.request.contextPath}/features.jsp#payRollTax"><bean:message key="BzComposer.features.payrolltax"/></a></li>
                            	<li><a href="${pageContext.request.contextPath}/features.jsp#completeRealTimeReports"><bean:message key="BzComposer.features.completerealtimreports"/></a></li>
                            	<li><a href="${pageContext.request.contextPath}/features.jsp#eCommerceIntegration"><bean:message key="BzComposer.features.ecommerceintegration"/></a></li>
							</ul>
						</li>
						<li class="drop"><a href="${pageContext.request.contextPath}/products.jsp"><bean:message key="BzComposer.products"/></a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerStandard"><bean:message key="BzComposer.products.bzcomposerstandard"/></a></li>
								<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerBilling"><bean:message key="BzComposer.products.billing"/></a></li>
                            	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposereSales"><bean:message key="BzComposer.products.esales"/></a></li>
                            	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerProfessional"><bean:message key="BzComposer.products.professional"/></a></li>
								<li><a href="${pageContext.request.contextPath}/products.jsp#bzcompserStandardShareware"><bean:message key="BzComposer.products.standardshareware"/></a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/contactUs.jsp"><bean:message key="BzComposer.contact"/></a></li>
					</ul>
				</div>
				</nav>
			</div>
	</div>
	 </header>
	<!-- header / end-->
	
	<div id="ourServices" class="container">
	<h2><bean:message key="BzComposer.service.ourservice"/></h2>
	
	<div class="para-temp">
		<h4 style="float: left; width: 100%;">
			<b><bean:message key="BzComposer.service.customization"/></b></h4>
		<bean:message key="BzComposer.service.customizationcontent"/>
	</div>
	
	<div class="para-temp">
		<h4 style="float: left; width: 100%;">
			<b><bean:message key="BzComposer.service.localization"/>
			</b>
		</h4>
		<bean:message key="BzComposer.service.localizationcontent"/>
	 </div>
	 
	 <div class="para-temp">
	 	<h4 style="float: left; width: 100%;">
	 		<b><bean:message key="BzComposer.service.customerservice"/>
	 	</b>
 		</h4>
 		<bean:message key="BzComposer.service.customerservicecontent"/>
	 </div>
	</div>
     <%@ include file="templateFooter.jsp"%>
     <div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
     <%@ include file="templateScript.jsp"%>
	</body>
</html:html>