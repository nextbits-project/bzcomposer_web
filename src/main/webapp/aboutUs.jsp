<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html:html lang="en">
<title>BzComposer-About Us</title>
<%@ include file="templateHeader.jsp"%>
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
</script>
<body>
	<header>
	 <div>
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container">
				<div align="center" style="max-width: 100%">
					<div class="logo" style="max-width: 100%;">
						<a href="index.jsp"> <img
							src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
							alt="Consulting" style="max-width: 100%"/>
						</a>
					</div>
				</div>
				<div align="center" style="max-width: 100%">
					<input type="text" name="searchbox" placeholder="Search for keyword or Items" style="max-width: 100%;" />
					<button class="btn btn-primary">Search</button>
				</div>
				<div align="center" style="max-width: 100%">
					<button type="button" class="btn btn-primary" onclick="redirectToLogin()">Login</button>
					<button type="button" class="btn btn-primary" onclick="openRegisterPage()">Register</button>
					<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>	
				</div>
			</div>
			<div class="au-navbar-mobile navbar-mobile-1">
				<ul class="au-navbar-menu">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/bzComposer">What is BzComposer</a></li>
					<li><a href="#">About us</a></li>
					<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp">Differences with the existing competitors</a></li>
					<li class="drop">
						<a href="#">Sample Companies</a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="#" onclick="openSampleCompany4();">ABC eSales Company</a></li>
								<li><a href="#" onclick="openSampleCompany2();">ABC Retails Company</a></li>
								<li><a href="#" onclick="openSampleCompany3();">ABC Wholesale Company</a></li>
							</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li> --%>
					<li><a href="#">Our Services</a></li>
					<li><a href="${pageContext.request.contextPath}/industries.jsp">Industries</a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/features.jsp">Features</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/features.jsp#easySetup">Easy Setup</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#enhancedFeatures">Enhanced Features</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#customerContactManagement">Customer & Contact Management</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#completeOrderManagement">Complete Order management</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#inventoryWarehouseManagement">Inventory & Warehouse Management</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#shippingPaymentIntegration">Shipping & Payment Integration</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#fullFeaturedAccountingSystem">Full-featured Accounting System</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#payRollTax">Payroll & Tax</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#completeRealTimeReports">Complete Real-time Reports</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#eCommerceIntegration">e-Commerce Integration</a></li>
						</ul>
					</li>
					<li class="drop"><a href="${pageContext.request.contextPath}/products.jsp">Products</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerStandard">BzComposer Standard</a></li>
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerBilling">BzComposer Billing</a></li>
                           	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposereSales">BzComposer eSales</a></li>
                           	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerProfessional">BzComposer Professional</a></li>
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcompserStandardShareware">BzComposer Standard Shareware</a></li>
						</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/contactUs.jsp">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<div class="hidden-tablet-landscape">
		<div class="header header-1">
			<div class="container">
				<div class="block-left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}"> <img
							src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
							alt="Consulting" />
						</a>
					</div>
				</div>
				<div class="block-right">
					<div class="contact-widget contact-widget-1">
						<!-- <button type="button" class="btn btn-primary popup-with-form" href="#test-form" onclick="redirectToLogin()">Login</button> -->
						<button type="button" class="btn btn-primary" onclick="redirectToLogin()">Login</button>
						<button type="button" class="btn btn-primary" onclick="openRegisterPage()">Register</button>	
					</div>
				</div>
				<div style="text-align: -webkit-center;">
					<input type="text" name="searchbox" placeholder="Search for keyword or Items" style="width: 241px" />
					<button class="btn btn-primary">Search</button>
				</div>
			</div>
		</div>
	</div>
	<div class="section section-navbar-1 bg-grey hidden-tablet-landscape"
		id="js-navbar-fixed">
		<div class="container">
			<div class="block-left">
				<div class="logo-mobile">
					<a href="index.jsp"> <img
						src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
						alt="Consulting"></a>
				</div>
				<nav>
				<div class="au-navbar navbar-1">
					<ul class="au-navbar-menu">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/bzComposer">What is BzComposer</a></li>
					<li><a href="#">About us</a></li>
					<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp">Differences with the existing competitors</a></li>
					<li class="drop">
						<a href="#">Sample Companies</a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="#" onclick="openSampleCompany4();">ABC eSales Company</a></li>
								<li><a href="#" onclick="openSampleCompany2();">ABC Retails Company</a></li>
								<li><a href="#" onclick="openSampleCompany3();">ABC Wholesale Company</a></li>
							</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li> --%>
					<li><a href="#">Our Services</a></li>
					<li><a href="${pageContext.request.contextPath}/industries.jsp">Industries</a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/features.jsp">Features</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/features.jsp#easySetup">Easy Setup</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#enhancedFeatures">Enhanced Features</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#customerContactManagement">Customer & Contact Management</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#completeOrderManagement">Complete Order management</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#inventoryWarehouseManagement">Inventory & Warehouse Management</a></li>
							<li><a href="${pageContext.request.contextPath}/features.jsp#shippingPaymentIntegration">Shipping & Payment Integration</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#fullFeaturedAccountingSystem">Full-featured Accounting System</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#payRollTax">Payroll & Tax</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#completeRealTimeReports">Complete Real-time Reports</a></li>
                           	<li><a href="${pageContext.request.contextPath}/features.jsp#eCommerceIntegration">e-Commerce Integration</a></li>
						</ul>
					</li>
					<li class="drop"><a href="${pageContext.request.contextPath}/products.jsp">Products</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerStandard">BzComposer Standard</a></li>
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerBilling">BzComposer Billing</a></li>
                           	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposereSales">BzComposer eSales</a></li>
                           	<li><a href="${pageContext.request.contextPath}/products.jsp#bzcomposerProfessional">BzComposer Professional</a></li>
							<li><a href="${pageContext.request.contextPath}/products.jsp#bzcompserStandardShareware">BzComposer Standard Shareware</a></li>
						</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/contactUs.jsp">Contact Us</a></li>
				</ul>
				</div>
				</nav>
			</div>
	</div>
	</div>
	<!-- header / end--> </header>
	
	<div id="aboutUs" class="container">
		<h2>About Us</h2>
		<div class="para-temp">
	   		<h4 style="float: left; width: 100%;"><b>Full Solution Provider</b></h4>
		Nextbits has been providing businesses with Internet solutions worldwide since 2006. We are located in Fullerton, California. 
		Customer service and e-commerce solutions are a requirement for any business. The Internet allows businesses to effectively market their products and services to potential customers. 
		To run a successful business online or offline, effective store set-up, advertising, and reliable order tracking are needed. 
		Nextbits provides complete accounting, e-Commerce, and business management solutions. 
		We have developed invoicing, billing, inventory control and an accounting system for small and medium-sized businesses. 
		We understand that smaller businesses have special needs. 
		Our program was developed to handle customer order entries, estimation, inventory, purchasing, banking and accounting. 
		Besides being easy-to-use and user-friendly, our accounting systems support a multi-user environment. 
		Our accounting system supports virtually unlimited customers and inventory growth.
		Here at Nextbits, we've completed the development of a multi-channel eBusiness solution for eBay and Amazon with payments and shipping automation. 
		We provide e-Commerce solutions with WebdesignForUs.com (WDU), an easy-to-use online store program. WDU is compatible with our accounting software, making it easier than ever to sell online. 
		Users are able to create their e-Commerce website with a virtually unlimited number of templates in just ten minutes - without any programming knowledge!  Building better features and functions increases your business capabilities, Nextbits's Content Management System (CMS) makes it simple to create and manage the site content and layout without any technical knowledge.
		Nextbits has everything you need in order to set up a website online including web hosting, advertising (web promotion), and order tracking. 
		Through extensive research and partnership, Nextbits can offer an extensive range of products and services to accommodate your online commerce needs. 
		We provide the latest technological services at incredible, reasonable rates and provide a full range of services tailored to each individual client's needs and desires. 
		We strive to become the leading business provider of affordable and effective solutions by providing businesses with complete packages including web site design,  order management system, and software customization.
		The goal of Nextbits is to build a long-term relationship with you and provide solutions that satisfy your needs. We will optimize your business management and e-commerce system.
		
	   </div>
	</div>
     <%@ include file="templateFooter.jsp"%>
     <div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
     <%@ include file="templateScript.jsp"%>
	</body>
</html:html>