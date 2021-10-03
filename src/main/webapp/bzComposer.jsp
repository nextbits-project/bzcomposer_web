<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html>
<title><fmt:message code="BzComposer.bzcomposerpagetitle"/></title>
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
function searchTextMobile()
{
	debugger
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBoxMobile").value;
	var txt1 = $('#aboutBzComposer').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{
			//alert("you've called attribute of page content");
			document.getElementById("aboutBzComposer").innerHTML = txt1;
		}
		else
		{
			debugger
			var txt = $('#aboutBzComposer').html().replace(highlightRe,'$1');
			
			debugger
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#aboutBzComposer").html(txt);
			setTimeout(function(){ 
				document.getElementById("aboutBzComposer").innerHTML = txt1;
			}, 5000);
		}
	}
	else
	{
		alert("<bean:message key='BzComposer.common.emterword'/>");
	}
}
function searchText()
{
	debugger
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBoxPC").value;
	var txt1 = $('#aboutBzComposer').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{
			//alert("you've called attribute of page content");
			document.getElementById("aboutBzComposer").innerHTML = txt1;
		}
		else
		{
			debugger
			var txt = $('#aboutBzComposer').html().replace(highlightRe,'$1');
			
			debugger
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#aboutBzComposer").html(txt);
			setTimeout(function(){ 
				document.getElementById("aboutBzComposer").innerHTML = txt1;
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
function showLocale()
{
	debugger;
	var lang = document.getElementById("locale").value;
	alert("You've selected language:"+lang);
	if(lang == "")
		alert("Select any language to change.");
	else
	window.location="./Locale.do?request_locale="+lang;
}
function showLocaleMobile()
{
	debugger;
	var lang = document.getElementById("localeMobile").value;
	alert("You've selected language:"+lang);
	if(lang == "")
		alert("Select any language to change.");
	else
		window.location="./Locale.do?request_locale="+lang;
}
</script>
<body>
<header>
	<!-- Header for mobile starts -->
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container">
				<div align="center" style="max-width: 100%;">
					<div class="logo" style="max-width: 100%;">
						<a href="${pageContext.request.contextPath}/index.jsp"> 
							<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" 
							alt="Consulting"/>
						</a>
					</div>
				</div>
				<div align="center" style="max-width: 100%">
					<input type="text" id="searchBoxMobile" name="searchBoxMobile" placeholder="<bean:message key="BzComposer.searchtext"/>" style="max-width: 100%;" />
					<button class="btn btn-primary" onclick="searchTextMobile()"><bean:message key="BzComposer.searchbuttontext"/></button>
				</div>
				<div align="center" style="max-width:100%">
					<select name="localeMobile" id="localeMobile" onchange="showLocaleMobile();">
						<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
						<option value="english"><bean:message key="BzComposer.selectlanguage.english"/></option>
						<option value="chinese"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
						<option value="spanish"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
					</select>
				</div>
				<div align="center" style="max-width: 100%">
					<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><bean:message key="BzComposer.login"/></button>
					<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><bean:message key="BzComposer.register"/></button>
					<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
						<span class="hamburger-box"> 
							<span class="hamburger-inner"></span>
						</span>
					</button>	
				</div>
			</div>
			<div class="au-navbar-mobile navbar-mobile-1">
				<ul class="au-navbar-menu">
					<li><a href="${pageContext.request.contextPath}/"><bean:message key="BzComposer.home"/></a></li>
					<li><a href="#"><bean:message key="BzComposer.whatisbzcomposer"/></a></li>
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
					<li><a href="${pageContext.request.contextPath}/ourServices.jsp"><bean:message key="BzComposer.ourservices"/></a></li>
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
					<%-- <li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/contactUs.jsp"><bean:message key="BzComposer.contact"/></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Header for mobile screen ends -->
	<!-- Header for computer starts -->
	<div class="hidden-tablet-landscape">
		<div class="header header-1">
			<div class="container">
				<div class="row">
				<div class="col-md-3" align="left">
				<div class="block-left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}"> <img
							src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
							alt="Consulting" />
						</a>
					</div>
				</div>
				</div>
				<div class="col-md-4" style="text-align: right;">
					<div class="search-wrap" align="right">
						<div class="input-group" align="right">
							<input type="text" id="searchBoxPC" name="searchBoxPC" placeholder="<bean:message key="BzComposer.searchtext"/>" class="form-control" />
					 		<div class="input-group-btn">
								<button class="btn btn-primary" class="form-control" onclick="searchText()"><bean:message key="BzComposer.searchbuttontext"/></button>
							</div>
						</div>
					</div>	
				</div>
				<div class="col-md-2" align="right">
					<div class="input-group" align="center">
						<select name="locale" id="locale" class="form-control" onchange="showLocale();">
							<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
							<option value="en"><bean:message key="BzComposer.selectlanguage.english"/></option>
							<option value="zh"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
							<option value="es"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
						</select>
					</div>
				</div>
				<%-- <div class="block-left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"> 
							<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" />
						</a>
					</div>
				</div> --%>
				<div class="col-md-3" align="right">
					<div align="center">
						<div class="contact-widget contact-widget-1">
							<!-- <button type="button" class="btn btn-primary popup-with-form" href="#test-form" onclick="redirectToLogin()">Login</button> -->
							<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><bean:message key="BzComposer.login"/></button>
							<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><bean:message key="BzComposer.register"/></button>
							<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
								<span class="hamburger-box"> <span class="hamburger-inner"></span>
								</span>
							</button>
						</div>
					</div>
				</div>
				<!-- <div class="block-right">
					<div class="contact-widget contact-widget-1">
						<button type="button" class="btn btn-primary" onclick="redirectToLogin()">Login</button>
						<button type="button" class="btn btn-primary" onclick="openRegisterPage()">Register</button>	
					</div>
				</div> -->
				<!-- <div style="text-align: -webkit-center;">
					<input type="text" id="searchBoxPC" name="searchBoxPC" placeholder="Search for keyword or Items" style="width: 241px" />
					<button class="btn btn-primary" onclick="searchText()">Search</button>
				</div> -->
			</div>
		</div>
		</div>
		<div class="section section-navbar-1 bg-grey hidden-tablet-landscape" id="js-navbar-fixed">
		<div class="text-center">
			<%-- <div class="text-center">
				<div class="logo-mobile">
					<a href="${pageContext.request.contextPath}/index.jsp"> 
						<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting">
					</a>
				</div>
			</div> --%>
			<nav class="text-center">
				<div class="au-navbar navbar-1">
					<ul class="au-navbar-menu">
						<li><a href="${pageContext.request.contextPath}/"><bean:message key="BzComposer.home"/></a></li>
						<li><a href="#"><bean:message key="BzComposer.whatisbzcomposer"/></a></li>
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
						<li><a href="${pageContext.request.contextPath}/ourServices.jsp"><bean:message key="BzComposer.ourservices"/></a></li>
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
	</div>
	<!-- Header for computer ends -->
</header>
<!-- header / end-->
<div id="aboutBzComposer" class="container">

	<h2><bean:message key="BzComposer.bzcomposer.whatisbzcomposer"/></h2>
	<p class="para-temp ">
		<b>
			<bean:message key="BzComposer.bzcomposer.bzcomposercontent"/>
		</b>
	</p>
	
	<div class="para-temp">
	    <h4 style="float: left; width: 100%;">
	    	<b>
	    		<bean:message key="BzComposer.bzcomposer.completebusinesssolution"/>
    		</b>
   		</h4>
	    <!-- BzComposer Accounting is an easy, full-featured complete accounting system for small to medium-sized businesses with fully-functional invoicing, 
	    billing, inventory, and customer database programs. Its features include estimations, purchasing orders, standard invoices, purchasing, 
	    account receivable/payable, payment history, accurate inventory tracking, customer mailing labels, and many more. 
	    An order management can also play an important role in managing any business integrated with complementary technologies. 
	    As retailers receive new inventory, products and supplier data are entered into BzComposer. -->
	    <!-- BzComposer Accounting is an easy to use, full-featured complete accounting system for small to medium-sized businesses 
	    (SMB) with fully-functional invoicing, billing, inventory and customer management programs. 
	    Its features include estimations, purchasing orders, standard invoices,  accounts receivable/payable,  
	    accurate inventory tracking and much more. --> 
	    <bean:message key="BzComposer.bzcomposer.completebusinesssolutioncontent"/>
	</div>
	
	<div class="para-temp">
		<h4 style="float: left; width: 100%;">
			<b>
				<bean:message key="BzComposer.bzcomposer.ecommerce"/>
			</b>
		</h4>
	   <!-- Placing IT support for e-commerce, web stores, order fulfillment, supply main management and merchandising under one roof will 
	   create new opportunities across channels. We provide complete e-commerce solutions for your web store, eBay, or Amazon with payment and 
	   shipping automations, complete order management solutions, all while creating your e-commerce website with virtually unlimited templates 
	   in ten minutes. -->
		<!-- Placing IT support for e-commerce, web stores, order fulfillment, supply chain management and merchandising under one roof will 
		create new opportunities across channels. We provide complete e-commerce solutions for your web store, eBay, or Amazon with payment and 
		shipping automations, providing complete order management solutions. -->
		<bean:message key="BzComposer.bzcomposer.ecommercecontent"/>
	</div>
	
	<div class="para-temp">
	    <!-- <h4 style="float: left; width: 100%;"><b>System based on Java and MS Access, MS SQL, Oracle, and MySQL.</b></h4> -->
	    <h4 style="float: left; width: 100%;">
	    	<b>
	    		<bean:message key="BzComposer.bzcomposer.databasesupport"/>
    		</b>
   		</h4>
	    <!-- It is written in Java, an independent platform, so users are able to choose between system components that best meet their needs. 
	    BzComposer Accounting based on java can be implemented across range of platforms, including Linux, Macintosh, UNIX, and Windows. 
	    Its database supports MS Access, MS SQL, Oracle and MySQL with a varied selection of the customer's database. 
	    This feature allows BzComposer to fit within various corporate environments and even to levy a company's existing IT infrastructure. -->
	    
	    <!-- It is written in Java, an independent platform, so users are able to choose between system components that best meet their needs. 
	    BzComposer Accounting based on java can be implemented across a range of platforms, including Linux, Macintosh, UNIX and Windows. 
	    Its database supports MS Access, MS SQL, Oracle and MySQL,  This feature allows BzComposer to fit within various corporate environments 
	    and even  levy a company's existing IT infrastructure. -->
	    <bean:message key="BzComposer.bzcomposer.databasesupportcontent"/>
	</div>
	   <!--  <ul class="cust-ul">
	         <li>MySQL is an open-source database.</li>
	          <li>MS is a trade mark of Microsoft Corporation.</li>
	           <li>Satisfaction Guaranteed</li>
	            <li>30 days Free Trial!</li>
	             <li>Easy-to-use!</li>
	    </ul>	
	    <div class="para-temp">
	    All of our work carries a 100% customer satisfaction guarantee to ensure that the finished product meets and exceeds all expectations. The start of your successful online company starts here. You can use our functions and watch your newly created e-business reach soaring heights. Let us design, implement and market your web site and create new dimensions for your business. We provide you with 30 days of a free trial period.
	    </div> -->
	
	<div class="para-temp">
		<h4 style="float: left; width: 100%;">
			<b>
				<bean:message key="BzComposer.bzcomposer.internationalization"/>
			</b>
		</h4>
		<bean:message key="BzComposer.bzcomposer.internationalizationcontent"/>
	</div>
	
	<div class="para-temp">
		<h4 style="float: left; width: 100%;">
			<b>
				<bean:message key="BzComposer.bzcomposer.easytouse"/>
			</b>
		</h4>
		<bean:message key="BzComposer.bzcomposer.easytousecontent"/>
	</div>
	
</div>
<%@ include file="templateFooter.jsp"%>
<div id="up-to-top">
	<i class="fa fa-angle-up"></i>
</div>
<%@ include file="templateScript.jsp"%>
</body>
</html>