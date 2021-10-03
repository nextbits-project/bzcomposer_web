<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
<%@ include file="templateHeader.jsp"%>
</head>
<script type="text/javascript">
function openRegisterPage()
{
	//alert("Inside openRecoverPassword")
	window.location = "Login.do?tabid=register";
}

function redirectToLogin()
{
	window.location = "Login.do?tabid=loginPage";
}
</script>
<body>
<header>
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container-fluid">
				<div align="center" style="max-width: 100%">
					<div class="logo" style="max-width: 100%;">
						<a href="${pageContext.request.contextPath}/index.jsp"> <img
							src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
							alt="Consulting" style="max-width: 100%"/>
						</a>
					</div>
				</div>
				<div align="center" style="max-width: 100%">
					<input type="text" id="searchBox" name="searchBox" placeholder="Search for keyword or Items" style="max-width: 100%;" />
					<button class="btn btn-primary" onclick="searchText()">Search</button>
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
					<li><a href="${pageContext.request.contextPath}/company.jsp">About us</a></li>
					<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp">Differences with the existing competitors</a></li>
					<li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li>
					<li><a href="${pageContext.request.contextPath}/#">Our Services</a></li>
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
					<li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li>
					<li><a href="${pageContext.request.contextPath}/contactUs.jsp">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="hidden-tablet-landscape">
		<div class="header header-1">
			<div class="container">
				<div class="block-left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"> <img
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
					<input type="text" id="searchBoxNR" name="searchBoxNR" placeholder="Search for keyword or Items" style="width: 241px" />
					<button class="btn btn-primary" onclick="searchTextNotResponsive()">Search</button>
				</div>
			</div>
		</div>
	</div>
	<div class="section section-navbar-1 bg-grey hidden-tablet-landscape"
		id="js-navbar-fixed">
		<div class="text-center">
			<div class="text-center">
				<div class="logo-mobile">
					<a href="${pageContext.request.contextPath}/index.jsp"> <img
						src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
						alt="Consulting"></a>
				</div>
			</div>
				<nav class="text-center">
				<div class="au-navbar navbar-1">
					<ul class="au-navbar-menu">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/bzComposer">What is BzComposer</a></li>
						<li><a href="${pageContext.request.contextPath}/company.jsp">About us</a></li>
						<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp">Differences with the existing competitors</a></li>
						<li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li>
						<li class="drop"><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
								<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
								<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
								<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li>
						<li><a href="${pageContext.request.contextPath}/#">Our Services</a></li>
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
						<li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li>
						<li><a href="${pageContext.request.contextPath}/contactUs.jsp">Contact Us</a></li>
					</ul>
				</div>
				</nav>
			</div>
	</div>
	 </header>
	<!-- header / end-->
<div class="container">	
<h1>Error</h1>
<p style="background-color: red;color: black;">Error! Can't send mail now.</p>
</div>
 <%@ include file="templateFooter.jsp"%>
     <div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
     <%@ include file="templateScript.jsp"%>
</body>
</html>