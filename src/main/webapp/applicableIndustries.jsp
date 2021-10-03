<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html:html lang="en">
<title>BzComposer-Applicable Industries</title>
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
	var txt1 = $('#applicableIndustries').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{
			//alert("you've called attribute of page content");
			document.getElementById("applicableIndustries").innerHTML = txt1;
		}
		else
		{
			var txt = $('#applicableIndustries').html().replace(highlightRe,'$1');
			
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#applicableIndustries").html(txt);
			setTimeout(function(){ 
				document.getElementById("applicableIndustries").innerHTML = txt1;
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
	var txt1 = $('#applicableIndustries').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{
			//alert("you've called attribute of page content");
			document.getElementById("applicableIndustries").innerHTML = txt1;
		}
		else
		{
			var txt = $('#applicableIndustries').html().replace(highlightRe,'$1');
			
			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}    
			$("#applicableIndustries").html(txt);
			setTimeout(function(){ 
				document.getElementById("applicableIndustries").innerHTML = txt1;
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
					<li><a href="${pageContext.request.contextPath}/company.jsp">About Us</a></li>
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
	
	<div id="applicableIndustries" class="container">
		<h2>Applicable Industries</h2>
		<div id="retailers" class="para-temp">
	   		<h4 style="float: left; width: 100%;"><b>1.Retailers</b></h4>
	   		<p class="para-temp">Retail trends are evolving every day and if you want to stay competitive, it is necessary to keep up with these trends. Retailers are continuously searching for the most cost-effective way to expand their businesses to compete against larger retailers and maintain their presence in the industry.</p>
			<p class="para-temp">BzComposer is created to help you manage your business more easily and productively. Showing inventory information (location and quantity) will give you better control of the inventory, let you serve customers more efficiently, and mange your warehouse with ease. It offers estimation, standard invoicing, billing, purchasing orders, accurate inventory tracking, customer mailing labels, and much more. It also shows detail of banking and checking, credit card transactions, and accounts receivable and payable with sales reports.</p>
	   		 
	   </div>
	   
		<div id="manufacturerWholesaler" class="para-temp">
		<h4 style="float: left; width: 100%;"><b>2.	Manufacturer & Wholesaler</b></h4>
	   		One fulfillment trend that can ease the strain on a wholesaler's pocketbook is drop-shipping, a process in which a third party, often the manufacturer, owns the items that a retailer sells and ships them to the customer on behalf of the retailer. 
	   		This supports both wholesaler and retailer, offering separate or combined sites. 
	   		Drop-shipping is an important element for retailers that all wholesalers should support. 
	   		Drop-shippers are able to send order confirmations and shipment status reports via email or .txt file transfers into the order management system.	
	   </div>
	   
	   <div id="professionalServiceCompany" class="para-temp">
	   	<h4 style="float: left; width: 100%;"><b>3.	Professional Service company</b></h4>
		BzComposer is an easy billing program to use for service oriented professionals such as accountants, doctors and lawyers, 
		with group billing statements with one user license. BzComposer offers group billing with monthly settings, like a billing date for 
		unlimited customers. With standard industry billing forms, BzComposer handles accurate billing, customer mailing labels, reports, and more. 
		BzComposer Billing was created to help you bill your customers more easily and effectively.
	   </div>
	   
	   <div id="serviceContractor" class="para-temp">
	   	<h4 style="float: left; width: 100%;"><b>4.	Service Contractor</b></h4>
		The contractor company should handle both retailer and professional service company features. 
		It means they need all billing features in addition to the merchandise transactions. 
	   </div>
	   
		<div id="eCommerceCompany" class="para-temp">
	   	<h4 style="float: left; width: 100%;"><b>5.	eCommerce company</b></h4>
		The current focus for these small to mid-size retailers is integrating ecommerce, which produces an expanded client base and increased sales, 
		all the while keeping costs down and workng with a limited number of resources. BzComposer integrates with Amazon and eBay. 
		Through any of these store types, merchants are able to post products from their online store directly onto Amazon and eBay.
		</div>
	</div>
     <%@ include file="templateFooter.jsp"%>
     <div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
     <%@ include file="templateScript.jsp"%>
	</body>
</html:html>