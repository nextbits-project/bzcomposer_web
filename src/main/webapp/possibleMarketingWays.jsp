<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html:html lang="en">
<title>BzComposer-Possible Marketing Ways</title>
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

	window.location = "Login.do?tabid=register";
}
function searchText()
{    
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBox").value;
	var txt1 = $('#possibleMarketingWays').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{

			document.getElementById("possibleMarketingWays").innerHTML = txt1;
		}
		else
		{
			var txt = $('#possibleMarketingWays').html().replace(highlightRe,'$1');
			
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#possibleMarketingWays").html(txt);
			setTimeout(function(){ 
				document.getElementById("possibleMarketingWays").innerHTML = txt1;
			}, 5000);
		}	
	} 
	else
	{
		alert("Please enter word");
	}
 }
function searchTextMobile()
{
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBoxMobile").value;
	var txt1 = $('#possibleMarketingWays').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{

			document.getElementById("possibleMarketingWays").innerHTML = txt1;
		}
		else
		{
			var txt = $('#possibleMarketingWays').html().replace(highlightRe,'$1');
			
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#possibleMarketingWays").html(txt);
			setTimeout(function(){ 
				document.getElementById("possibleMarketingWays").innerHTML = txt1;
			}, 5000);
		}
	}
	else{
		alert("Please enter word");
	}
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
					<input type="text" id="searchBoxMobile" name="searchBoxMobile" placeholder="Search for keyword or Items" style="max-width: 100%;" />
					<button class="btn btn-primary" onclick="searchTextMobile()">Search</button>
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
					<li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
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
					<li><a href="${pageContext.request.contextPath}/ourServices.jsp">Our Services</a></li>
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
					<input type="text" id="searchBox" name="searchBox" placeholder="Search for keyword or Items" style="width: 241px" />
					<button class="btn btn-primary" onclick="searchText()">Search</button>
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
						<li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
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
						<li><a href="${pageContext.request.contextPath}/ourServices.jsp">Our Services</a></li>
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
	
	<div id="possibleMarketingWays" class="container">
		<h2>Possible Marketing Ways</h2>
		<div id="valueAddedReseller" class="para-temp">
	   		<h4 style="float: left; width: 100%;"><b>1.Value Added Reseller</b></h4>
	   		You can design the website for the customer if you're a reseller. You will up to 25% commission for every payment from your customer. We've developed a viable opportunity for web design and hosting to create a consistent stream of revenue by offering free subscriptions of our services to your customer.
	   </div>
	   
		<div id="erp" class="para-temp">
		<h4 style="float: left; width: 100%;"><b>2.Electronic Resource Planning(ERP)</b></h4>
	   		Companies of all types and sizes can benefit from an Electronic Resource Planning(ERP) implementation. Even if the business are relatively smooth across the business, ERP can deliver even greater productivity and cost efficiency. 	
	   </div>
	   
	   <div id="openSourceProject" class="para-temp">
	   	<h4 style="float: left; width: 100%;"><b>3.Open Source Project</b></h4>
		It's an  another way to help users to develop the system for their needs. Customers can seamlessly integrate with third part, industry-specific and legacy software. 
	   </div>
	   
	   <div id="sharewareDownloads" class="para-temp">
	   	<h4 style="float: left; width: 100%;"><b>4.Shareware Downloads</b></h4>
		We allow you to copy the program freely without any expectation of payment for the freeware version. Shareware user is required to pay if the trial version is satisfied.
		<ol>
	        <li>BzComposer Retailer Freeware</li>
			<li>BzComposer Standard Shareware</li>
	        <li>BzComposer Billing Shareware</li>
	    </ol>	  
	   </div>
	</div>
     <%@ include file="templateFooter.jsp"%>
     <div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
     <%@ include file="templateScript.jsp"%>
	</body>
</html:html>