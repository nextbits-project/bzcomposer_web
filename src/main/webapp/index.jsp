<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%-- <html:html locale="true"> --%>
<html:html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<title><bean:message key="BzComposer.homepagetitle"/></title>

<!-- for opening dialog these files added on 26-09-2019 -->
<%-- <script src="<bean:write name="path" property="pathvalue"/>/includeAll/jquery-1.11.1.min.js"></script> --%>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/jquery-ui.css" />

<%@ include file="templateHeader.jsp"%>

<%
    Cookie[] cookies=request.getCookies();
    String userName = "",remember = "",pass="";
    if (cookies != null) 
    {
         for (Cookie cookie : cookies) 
         {
        	 if(cookie.getName().equals("cookieLoginUser"))
          	userName = cookie.getValue();
        	 else if(cookie.getName().equals("cookieLoginPassword1"))
        		 pass = cookie.getValue();
        	 else if(cookie.getName().equals("cookieRememberMe"))
        		 remember = cookie.getValue();
         }   
	}
%>

<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->

<script type="text/javascript">
$(document).ready(function() 
{
	$('#sampleCompanyList li').click(function() 
	{
		//Get the id of list items
		var companyID = $(this).attr('id');
		//alert("selected Sample company Id:"+companyID);
		if(companyID == 2)
		{
			window.location.href="Login.do?tabid=selectedCompany&selectedCompanyId=2&companyName=ABC Retails Company";	
		}
		else if(companyID == 4)
		{
			window.location.href="Login.do?tabid=selectedCompany&selectedCompanyId=4&companyName=ABC eSales Company";
		}
		else
		{
			window.location.href="Login.do?tabid=selectedCompany&selectedCompanyId=3&companyName=ABC Wholesale Company";
		}
	});
	var locale = "<%= request.getAttribute("selectedLocale")%>";
	//alert("selected locale:"+locale);
	$('select[id="locale"]').find('option[value="'+locale+'"]').attr("selected",true);
});  

$("#forgotPasswordForm").submit(function(event) {

    /* stop form from submitting normally */
    event.preventDefault();
    $('#forgotPassword-form').modal('show');
    

    /* get the action attribute from the <form action=""> element */
    var $form = $( this ),
        url = $form.attr( 'action' );
   

    /* Send the data using post with element id name and name2*/
    var posting = $.post( url, { loginID: $('#loginID').val() } );

    /*Alerts the results */
    posting.done(function( data ) {
      //alert('success');
    }); 
  });
function openRegisterPage()
{
	//alert("Inside openRecoverPassword")
	window.location = "Login.do?tabid=register";
}
function redirectToLogin()
{
	window.location = "Login?tabid=loginPage";
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
	//alert("You've selected language:"+lang);
	if(lang == "")
		event.preventDefault();
	else
		window.location="Locale.do?request_locale="+lang;
	//alert("locale is changed...")
	/* window.location="Locale.do?method="+lang; */ 
	/* $.ajax({
		type: "POST",
		url:"Locale.do?request_locale="+lang,
		data:{lang : lang},
		}).done(function(data){
			debugger;
		alert("locale is changed..");
		debugger;
	}); */
}
function showLocaleMobile()
{
	debugger;
	var lang = document.getElementById("localeMobile").value;
	//alert("You've selected language:"+lang);
	if(lang == "")
		//alert("Select any language to change.");
		return showLanguageDialog();
	//else
		window.location="Locale.do?request_locale="+lang;
	//alert("locale is changed...")
	/* window.location="Locale.do?method="+lang; */ 
	/* $.ajax({
		type: "POST",
		url:"Locale.do?request_locale="+lang,
		data:{lang : lang},
		}).done(function(data){
			debugger;
		alert("locale is changed..");
		debugger;
	}); */
}
function showUsernameDialog()
{
	event.preventDefault();
	$("#showUsernameDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showLanguageDialog()
{
	debugger;
	event.preventDefault();
	$("#showLanguageDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
<body>
<div id="pageContent" style="width:100%;height: 100%;">
	<!-- page load-->
	<div class="page-loader">
		<div class="loader"></div>
	</div>
	<header> 
	<!-- header / start-->
      <!-- form itself -->
      <!-- mfp-hide -->
      <div id="test-form" class="mfp-hide white-popup-block">
      
      <!-- SETUP -->
        <%-- <div id="setup">
            <html:form action="Login.do?tabid=welcomescreen" method="post">
            
					<input type="hidden" name="actionType" value="">
	          <div >
			<div class="form-signin">
			<h2 class="form-signin-heading">Please sign in</h2>		
			<div class="tr">
					<div class="bg-danger"><html:errors /></div>
			</div>
			  <div class="form-group">
			
			<label for="userName" class="">Email address</label>				
			 <html:text property="userName" styleId="userName" styleClass="form-control\" autoComplete=\"off" value="<%= userName %>"/>
			 
			 </div>
			 
			   <div class="form-group">
			 
			 <label for="password" class="">Password:</label>		
			<html:password property="password" styleId="password" styleClass="form-control" value="<%= pass %>" />
				</div>
				
				<div class="form-group">
					<html:checkbox property="rememberMe" value="<%= remember %>">Remember Me</html:checkbox>
					<input type="checkbox" id="remember" name="remember"/> Remember Me
				</div> 

			   <div class="form-group">
				<!-- <a href="http://216.116.104.10/bzcomposerweb2/recover.jsp"><span style="cursor: pointer; font-size:13px;">Forgot Password ?</span></a> -->
				<a href="http://localhost:8080/bzcomposerweb2/recover.jsp"><span style="cursor: pointer; font-size:13px;">Forgot Password ?</span></a>
				</div>
				
			   <div class="form-group bca_loginbtn" align="right">
				<input type="submit"  class="btn btn-primary imgClass" value="LOGIN" onclick="formValue1()"/>			
				<!-- <a href="http://localhost:8080/bzcomposerweb2/register.jsp"><span style="cursor: pointer; font-size:13px; text-transform: uppercase;margin-left: 10px;">Sign Up</span></a> -->
				<!-- <button type="button" class="btn btn-primary" onclick="openRegisterPage()" value="Sign Up">Sign Up</button> -->
				</div>				
				
			</div>
			</div>
		</html:form>
        </div>      --%>
      </div>
      
      <!-- forgot password starts -->
      <%-- <div id="forgotPassword-form" class="mfp-hide white-popup-block">
      	<div id="setup">
             <html:form action="Login.do?tabid=forgotPassword" method="post" styleId="forgotForm">
            	<input type="hidden" name="actionType" value="">
	          	<div>
					<div class="form-signin">
						<h2 class="form-signin-heading">Forgot your password?</h2>
						<div class="form-group">
							<b>To reset your password type your loginId.</b>
						</div>
						<div class="tr">
							<div class="bg-danger"><html:errors /></div>
						</div>
						<div class="form-group">
						<!-- <form id="forgotPasswordForm" action="Login.do?tabid=forgotPassword" method="post"> -->
						<html:form action="Login.do?tabid=forgotPassword" method="post" styleId="forgotPasswordForm">
							<input type="hidden" id="action" value=""/>
							<label id="message"></label>
			  			<div class="form-group">
			  				
							<label for="userName" class="">Your Email address</label>				
			 				<html:text property="userName" styleId="userName" styleClass="form-control\" autoComplete=\"off" />
			 				<input type="text" id="loginID" name="loginID" class="form-control" style="autocomplete:off"/>
			 			</div>
			 			<div class="form-group" align="right">
			 				<!-- <button type="button" class="btn btn-primary" value="Check" onclick="checkUser()">Check</button> -->
			 				<button type="submit" class="btn btn-primary" value="Check">Check</button>
			 			</div>
			 			</html:form>
			 			<!-- </form> -->
			 			</div>
			 			<div class="form-group">
			 				<label for="password" class="">Password Hint:</label>		
							<html:password property="password" styleId="password" styleClass="form-control" />
							<select id="passwordHint" class="form-control">
								<option value="0">Select a question</option>
								<option value="1">What is your nick name</option>
								<option value="2">What is your pet's name</option>
								<option value="3">What is your hobby</option>
								<option value="4">What is golden moment in you life</option>
							</select>
						</div>
						<div class="form-group">
							<label for="password" class="">Password Answer:</label>
							<input type="text" id="passwordAnswer" class="form-control" style="autocomplete:off"/>
						</div> 
						<div class="form-group bca_loginbtn">
							<input type="submit"  class="btn btn-primary" value="Next" onclick="showValues()"/>			
							<input type="button" class="btn btn-primary popup-with-form" href="#test-form" value="Cancel"/>
						</div>				
					</div>
				</div>
			 </html:form>
        </div>     
	</div> --%>
    <!-- forgot password ends -->  
    
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container">
				<%-- <%@ include file="headerTabletLandscapeUpDiv.jsp" %> --%>
				<div class="row">
					<div class="col-md-3" align="center">
						<div class="logo" style="max-width: 100%;">
							<a href="index.jsp"> 
								<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" style="max-width: 100%"/>
							</a>
						</div>
					</div>
				<!-- <div class="contact-widget contact-widget-1"> -->
				<div class="col-md-3">
					<div class="search-wrap" align="right">
						<div class="input-group" align="center">
							<input type="text" id="searchBox" name="searchBox" placeholder="<bean:message key="BzComposer.searchtext"/>" style="max-width: 100%;" />
							<div class="input-group-btn">
								<button class="btn btn-primary" onclick="searchText()"><bean:message key="BzComposer.searchbuttontext"/></button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" align="center">
					<div class="input-group">	
						<select name="localeMobile" id="localeMobile" class="form-control" onchange="showLocaleMobile();">
							<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
							<option value="en"><bean:message key="BzComposer.selectlanguage.english"/></option>
							<option value="zh"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
							<option value="es"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
						</select>
					</div>
				</div>
				<div class="col-md-3" align="center">
					<div align="center">
						<div class="contact-widget contact-widget-1">
							<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><bean:message key="BzComposer.login"/></button>
							<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><bean:message key="BzComposer.register"/></button>
							<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
								<span class="hamburger-box"> <span class="hamburger-inner"></span></span>
							</button>	
						</div>
					</div>
				</div>
			</div>
			</div>
		
			<div class="au-navbar-mobile navbar-mobile-1">
				<ul class="au-navbar-menu">
					<li><a href="#"><bean:message key="BzComposer.home"/></a></li>
					<li><a href="${pageContext.request.contextPath}/bzComposer"><bean:message key="BzComposer.whatisbzcomposer"/></a></li>
					<li><a href="${pageContext.request.contextPath}/company.jsp"><bean:message key="BzComposer.aboutus"/></a></li>
					<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp"><bean:message key="BzComposer.existingcompetitors"/></a></li>
					<li class="drop">
						<a href="#"><bean:message key="BzComposer.samplecompaies"/></a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="Login.do?tabid=selectedCompany&selectedCompanyId=4&companyName=ABC eSales Company"><bean:message key="BzComposer.samplecompaies.eSalecompany"/></a></li>
								<li><a href="Login.do?tabid=selectedCompany&selectedCompanyId=2&companyName=ABC Retails Company"><bean:message key="BzComposer.samplecompaies.retailcompany"/></a></li>
								<li><a href="Login.do?tabid=selectedCompany&selectedCompanyId=3&companyName=ABC Wholesale Company"><bean:message key="BzComposer.samplecompaies.wholesalecompany"/></a></li>
							</ul>
							<%-- <ul class="drop-menu bottom-right" id="sampleCompanyList">
								<logic:iterate name="acList" id="objList1" indexId="ndx">
									<li id="<bean:write name="objList1" property="companyid" />"><a href="#"><bean:write name="objList1" property="companyName" /></a></li>
								</logic:iterate>
							</ul> --%>
						</li>
					<%-- <li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li>
					<li class="drop">
						<a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li> --%>
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
					<li class="drop">
						<a href="${pageContext.request.contextPath}/products.jsp"><bean:message key="BzComposer.products"/></a>
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
	<!-- </div> -->
	<!-- When opens without responsive --> 
	<div class="hidden-tablet-landscape">					
		<div class="header header-1">
			<div class="container">
				<div class="row">
				<div class="col-md-3" align="left">
				<div class="block-left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}"> 
						<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" />
						</a>
					</div>
				</div>
				</div>
				<div class="col-md-4">
					<div class="search-wrap" align="right">
						<div class="input-group" align="right">
							<input type="text" id="searchBox" name="searchBox" placeholder="<bean:message key="BzComposer.searchtext"/>" class="form-control" />
					 		<div class="input-group-btn">
								<button class="btn btn-primary" class="form-control" onclick="searchText()"><bean:message key="BzComposer.searchbuttontext"/></button>
							</div>
						</div>
					</div>	
				</div>
				<div class="col-md-2" align="right">
					<div class="input-group">
						<select name="locale" id="locale" class="form-control" onchange="showLocale();">
							<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
							<option value="en"><bean:message key="BzComposer.selectlanguage.english"/></option>
							<option value="zh"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
							<option value="es"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
							<!-- <option value="en">Select Language</option>
							<option value="english">English</option>
							<option value="chinese">Chinese</option>
							<option value="spanish">Spanish</option> -->
						</select>
						<%-- <s:url id="localeEN" namespace="/" action="locale" >
						   <s:param name="request_locale" >en</s:param>
						</s:url>
						<s:url id="localeHN" namespace="/" action="locale" >
						   <s:param name="request_locale" >hn</s:param>
						</s:url>
						<s:url id="localeES" namespace="/" action="locale" >
						   <s:param name="request_locale" >es</s:param>
						</s:url>
						<s:url id="localezhCN" namespace="/" action="locale" >
						   <s:param name="request_locale" >zh_CN</s:param>
						</s:url>
						<s:url id="localeDE" namespace="/" action="locale" >
						   <s:param name="request_locale" >de</s:param>
						</s:url>
						<s:url id="localeFR" namespace="/" action="locale" >
						   <s:param name="request_locale" >fr</s:param>
						</s:url> --%>
						 
						<!-- <a href="/changeLocale?lang=en" >English</a>
						<a href="/changeLocale?lang=hn" >Hindi</a>
						<a href="/changeLocale?lang=es" >Spanish</a>
						<a href="/changeLocale?lang=zh_CN" >Chinese</a>
						<a href="/changeLocale?lang=de" >German</a>
						<a href="/changeLocale?lang=fr" >France</a> -->
					</div>
				</div>
				<!-- dialog box that used in this page -->
				<div id="showLanguageDialog" style="display:none;">
					<p>Select any language to change.</p>
				</div>
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
			</div>
			</div>
		</div>
	</div>
	<div class="section section-navbar-1 bg-grey hidden-tablet-landscape" id="js-navbar-fixed">
		<div class="text-center">
			<div class="text-center">
				<div class="logo-mobile">
					<a href="index.html"> 
						<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting"/>
					</a>
				</div>
			</div>
				<nav class="text-center">
				<div class="au-navbar navbar-1">
					<ul class="au-navbar-menu">
						<li><a href="#"><bean:message key="BzComposer.home"/></a></li>
						<li><a href="${pageContext.request.contextPath}/bzComposer"><bean:message key="BzComposer.whatisbzcomposer"/></a></li>
						<li><a href="${pageContext.request.contextPath}/company.jsp"><bean:message key="BzComposer.aboutus"/></a></li>
						<li><a href="${pageContext.request.contextPath}/existingCompetitors.jsp"><bean:message key="BzComposer.existingcompetitors"/></a></li>
						<%-- <li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li> --%>
						<li class="drop"><a href="#"><bean:message key="BzComposer.samplecompaies"/></a>
							<span class="arrow"><i></i></span>
							<ul class="drop-menu bottom-right">
								<li><a href="#" onclick="openSampleCompany4();"><bean:message key="BzComposer.samplecompaies.eSalecompany"/></a></li>
								<li><a href="#" onclick="openSampleCompany2();"><bean:message key="BzComposer.samplecompaies.retailcompany"/></a></li>
								<li><a href="#" onclick="openSampleCompany3();"><bean:message key="BzComposer.samplecompaies.wholesalecompany"/></a></li>
							</ul>
							<%-- <ul class="drop-menu bottom-right" id="sampleCompanyList">
								<logic:iterate name="acList" id="objList1" indexId="ndx">
									<li id="<bean:write name="objList1" property="companyid" />"><a href="#"><bean:write name="objList1" property="companyName" /></a></li>
								</logic:iterate>
							</ul> --%>
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
				</nav>
			</div>
		</div>
	<!-- header / end--> 
	</header>
	<section> <!-- START REVOLUTION SLIDER 5.0-->
	<div></div>
	<div class="slider-1" style="max-width: 100%">
		<div class="rev_slider" id="js-slider" style="display: none;width: auto;">
			<ul style="widows: auto;">
				<li class="item-1" data-transition="fade" style="width: 100%;height: auto;">
					<!-- MAIN IMAGE--> <img class="rev-slidebg"
					src="${pageContext.request.contextPath}/dist/template/images/carousel-01.jpg"
					alt="#"/>
				</li>
				<li class="item-1" data-transition="fade" style="max-width: 100%">
					<!-- MAIN IMAGE--> <img class="rev-slidebg"
					src="${pageContext.request.contextPath}/dist/template/images/carousel-01.jpg"
					alt="#" />
				</li>
				<li class="item-1" data-transition="fade" style="max-width: 100%">
					<!-- MAIN IMAGE--> <img class="rev-slidebg"
					src="${pageContext.request.contextPath}/dist/template/images/carousel-01.jpg"
					alt="#" />
				</li>
			</ul>
		</div>
	</div>
	</section>
	<!-- section / start-->
	<div class="section bg-white p-t-70 p-b-40">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="icon-box icon-box-2">
						<div class="icon">
							<i class="fa fa-line-chart"></i>
						</div>
						<div class="title">
							<h3><bean:message key="BzComposer.retailerswholesalers"/><!-- Retailers & Wholesalers --></h3>
						</div>
						<div class="content">
							<p><bean:message key="BzComposer.retailerswholesalerstext"/>
							<!-- Helps you manage your retail or wholesale business more easily and productively. --></p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="icon-box icon-box-2">
						<div class="icon">
							<i class="fa fa-rocket"></i>
						</div>
						<div class="title">
							<h3><bean:message key="BzComposer.corporation"/><!-- Corporation --></h3>
						</div>
						<div class="content">
							<p><bean:message key="BzComposer.corporationtext"/>
							<!-- Allows to manage retail and wholesale branches  with full-featured inventory control. --></p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="icon-box icon-box-2">
						<div class="icon">
							<i class="fa fa-black-tie"></i>
						</div>
						<div class="title">
							<h3><bean:message key="BzComposer.servicecompany"/><!-- Service Company --></h3>
						</div>
						<div class="content">
							<p><bean:message key="BzComposer.servicecompanytext"/>
							<!-- An easy billing program to use for service oriented professionals with group billing statements. --></p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="icon-box icon-box-2">
						<div class="icon">
							<i class="fa fa-money"></i>
						</div>
						<div class="title">
							<h3><bean:message key="BzComposer.ecommercecompany"/><!-- eCommerce Company --></h3>
						</div>
						<div class="content">
							<p><bean:message key="BzComposer.ecommercecompanytext"/>
							<!-- Supports both eBay, Amazon store, own eCommerce websites as well as local store. --></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- section / end-->
	<!-- Our Services / start-->
	<section class="section bg-primary p-t-70 p-b-40">
	<div class="container">
		<div class="relative">
			<div class="heading-section heading-section-1 light">
				<h3><bean:message key="BzComposer.partners"/><!-- Partners --></h3>
			</div>
			<div class="owl-carousel nav-style-1" data-carousel-margin="45"
				data-carousel-nav="true" data-carousel-loop="true">
				<div class="image-card image-card-1 light">
					<div class="image">
						<a href="blog-single.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/services-01.jpg"
							alt="Corporate Finance" />
						</a>
					</div>
					<h3 class="title">
						<a href="blog-single.html"><bean:message key="BzComposer.valueaddedresellers"/><!-- Value-Added Resellers --></a>
					</h3>
				</div>
				<div class="image-card image-card-1 light">
					<div class="image">
						<a href="blog-single.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/services-02.jpg"
							alt="Information Technology" />
						</a>
					</div>
					<h3 class="title">
						<a href="blog-single.html"><bean:message key="BzComposer.solutionproviders"/><!-- Solution Providers --></a>
					</h3>
				</div>
				<div class="image-card image-card-1 light">
					<div class="image">
						<a href="blog-single.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/services-03.jpg"
							alt="Insurance Consulting" />
						</a>
					</div>
					<h3 class="title">
						<a href="blog-single.html"><bean:message key="BzComposer.customization"/><!-- Customization --></a>
					</h3>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section class="section bg-grey-light p-t-70 p-b-50">
	<div class="container">
		<div class="relative section-testimonials-wrapper-1">
			<div class="heading-section heading-section-1 dark">
				<h3><bean:message key="BzComposer.testimonals"/><!-- Testimonials --></h3>
			</div>
			<div class="owl-carousel dark nav-style-1" data-carousel-margin="30"
				data-carousel-nav="true" data-carousel-loop="true"
				data-carousel-autoplay="true">
				<div class="image-card image-card-2">
					<div class="card-top">
						<div class="avatar">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/dist/template/images/avatar-01.jpg"
								alt="Ann Gilbert" />
							</a>
						</div>
						<div class="info">
							<span class="name"><bean:message key="BzComposer.testimonalsonename"/><!-- Ann Gilbert --></span> 
							<span class="job-title"><bean:message key="BzComposer.testimonalsonejobtitle"/><!-- Chief
								Executive Officer, Envato --></span>
						</div>
					</div>
					<div class="card-body">
						<div class="content">
							<p><bean:message key="BzComposer.testimonalsonecontent"/>
							<!-- We are lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Proin sapien augue, dictum et gravida et, viverra et est. --></p>
						</div>
					</div>
				</div>
				<div class="image-card image-card-2">
					<div class="card-top">
						<div class="avatar">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/dist/template/images/avatar-02.jpg"
								alt="Kevin Cater" />
							</a>
						</div>
						<div class="info">
							<span class="name"><bean:message key="BzComposer.testimonalstwoname"/><!-- Kevin Cater --></span> 
							<span class="job-title"><bean:message key="BzComposer.testimonalstowjobtitle"/><!-- Chief
								Marketing Officer, Envato --></span>
						</div>
					</div>
					<div class="card-body">
						<div class="content">
							<p><bean:message key="BzComposer.testimonalstwocontent"/>
							<!-- We are lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Proin sapien augue, dictum et gravida et, viverra et est. --></p>
						</div>
					</div>
				</div>
				<div class="image-card image-card-2">
					<div class="card-top">
						<div class="avatar">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/dist/template/images/avatar-03.jpg"
								alt="Jacob Graham" />
							</a>
						</div>
						<div class="info">
							<span class="name"><bean:message key="BzComposer.testimonalsthreename"/><!-- Jacob Graham --></span> 
							<span class="job-title"><bean:message key="BzComposer.testimonalsthreejobtitle"/><!-- Chief
								Executive Officer, Envato --></span>
						</div>
					</div>
					<div class="card-body">
						<div class="content">
							<p><bean:message key="BzComposer.testimonalsthreecontent"/>
							<!-- We are lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Proin sapien augue, dictum et gravida et, viverra et est. --></p>
						</div>
					</div>
				</div>
				<div class="image-card image-card-2">
					<div class="card-top">
						<div class="avatar">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/dist/template/images/avatar-01.jpg"
								alt="Ann Gilbert" />
							</a>
						</div>
						<div class="info">
							<span class="name"><bean:message key="BzComposer.testimonalsonename"/><!-- Ann Gilbert --></span> 
							<span class="job-title"><bean:message key="BzComposer.testimonalsonejobtitle"/><!-- Chief
								Executive Officer, Envato --></span>
						</div>
					</div>
					<div class="card-body">
						<div class="content">
							<p><bean:message key="BzComposer.testimonalsonecontent"/><!-- We are lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Proin sapien augue, dictum et gravida et, viverra et est. --></p>
						</div>
					</div>
				</div>
				<div class="image-card image-card-2">
					<div class="card-top">
						<div class="avatar">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/dist/template/images/avatar-02.jpg"
								alt="Kevin Cater" />
							</a>
						</div>
						<div class="info">
							<span class="name"><bean:message key="BzComposer.testimonalstwoname"/><!-- Kevin Cater --></span> 
							<span class="job-title"><bean:message key="BzComposer.testimonalstowjobtitle"/><!-- Chief
								Marketing Officer, Envato --></span>
						</div>
					</div>
					<div class="card-body">
						<div class="content">
							<p><bean:message key="BzComposer.testimonalstwocontent"/><!-- We are lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Proin sapien augue, dictum et gravida et, viverra et est. --></p>
						</div>
					</div>
				</div>
				<div class="image-card image-card-2">
					<div class="card-top">
						<div class="avatar">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/dist/template/images/avatar-03.jpg"
								alt="Jacob Graham" />
							</a>
						</div>
						<div class="info">
							<span class="name"><bean:message key="BzComposer.testimonalsthreename"/><!-- Jacob Graham --></span> 
							<span class="job-title"><bean:message key="BzComposer.testimonalsthreejobtitle"/><!-- Chief
								Executive Officer, Envato --></span>
						</div>
					</div>
					<div class="card-body">
						<div class="content">
							<p><bean:message key="BzComposer.testimonalsthreecontent"/><!-- We are lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Proin sapien augue, dictum et gravida et, viverra et est. --></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Testimonials / end-->
	<!-- Testimonials / start-->
	<!-- section Contact-->
	<!-- section / end-->
	<!-- Our Projects / start-->
	<section class="section bg-white p-t-60 p-b-50">
	<div class="container">
		<div class="relative">
			<div class="heading-section heading-section-1 dark">
				<h3><bean:message key="BzComposer.ourproducts"/><!-- Our Products --></h3>
			</div>
			<div class="owl-carousel dark nav-style-1" data-carousel-margin="7"
				data-carousel-nav="true" data-carousel-loop="true"
				data-carousel-items="4">
				<div class="image-card image-card-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/dist/template/images/projects-01.jpg"
							alt="Business growth solutions" />
					</div>
					<h3 class="title">
						<a href="portfolio-single.html"> <span><bean:message key="BzComposer.products.freeware"/><!-- BCA Freeware --></span> <i class="fa fa-chevron-right"></i>
						</a>
					</h3>
				</div>
				<div class="image-card image-card-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/dist/template/images/projects-02.jpg"
							alt="Complex consumer behavior" />
					</div>
					<h3 class="title">
						<a href="portfolio-single.html"> <span><bean:message key="BzComposer.products.standard"/><!-- BCA Standard --></span> <i class="fa fa-chevron-right"></i>
						</a>
					</h3>
				</div>
				<div class="image-card image-card-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/dist/template/images/projects-03.jpg"
							alt="Experience in finance" />
					</div>
					<h3 class="title">
						<a href="portfolio-single.html"> <span><bean:message key="BzComposer.products.professional"/><!-- BCA Professional --></span> <i class="fa fa-chevron-right"></i>
						</a>
					</h3>
				</div>
				<div class="image-card image-card-3">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/dist/template/images/projects-04.jpg"
							alt="Global consumer insights" />
					</div>
					<h3 class="title">
						<a href="portfolio-single.html"> <span><bean:message key="BzComposer.products.crm"/><!-- BCA CRM --></span> <i class="fa fa-chevron-right"></i>
						</a>
					</h3>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section class="section bg-grey-light p-t-70 p-b-70">
	<div class="container">
		<div class="relative">
			<div class="p-b-15">
				<div class="heading-section heading-section-1 dark">
					<h3><bean:message key="BzComposer.ourpartner"/><!-- Our Partner --></h3>
				</div>
			</div>
			<div class="owl-carousel dark nav-style-1" data-carousel-margin="30"
				data-carousel-nav="true" data-carousel-loop="true"
				data-carousel-items="5" data-carousel-autoplay="true">
				<div class="icon-box icon-box-3" style="background-color: #fff; padding: 24px; min-height: 116px;">
					<div class="icon">
						<a href="about-partnerships.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/JobberStreeet.png"
							alt="our partner" />
						</a>
					</div>
				</div>
				<div class="icon-box icon-box-3" style="background-color: #fff; padding: 24px;min-height: 116px; vertical-align: middle;">
					<div class="icon">
						<a href="about-partnerships.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/TheSmartster.png"
							alt="our partner" />
						</a>
					</div>
				</div>
				<div class="icon-box icon-box-3" style="background-color: #fff; padding: 24px; min-height: 116px;">
					<div class="icon">
						<a href="about-partnerships.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/Nextbits.png"
							alt="our partner" />
						</a>
					</div>
				</div>
				<div class="icon-box icon-box-3" style="background-color: #fff; padding: 24px; min-height: 116px; vertical-align: middle;">
					<div class="icon">
						<a href="about-partnerships.html"> <img
							src="${pageContext.request.contextPath}/dist/template/images/nextbizz.png"
							alt="our partner" />
						</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</section>
<!-- our services start -->
	<%@ include file="templateFooter.jsp"%>
	<div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
<%@ include file="templateScript.jsp"%>
</div>
</body>
</html:html>