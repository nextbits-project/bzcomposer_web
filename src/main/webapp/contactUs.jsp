<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<style>
.error
{
	color: #f00;
    font-size: 1em;
    font-weight: normal;
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
var a, b;
function getRandom() 
{
    var numbers = new Array();

    for(var i=1;i<100;i++) {
        numbers.push(i);
    }
	a = numbers[Math.floor(Math.random() * numbers.length)];
    b = numbers[Math.floor(Math.random() * numbers.length)];
    document.getElementById("firstNumber").innerHTML = a;
    document.getElementById("secondNumber").innerHTML = b;

}
function ValidCaptcha()
{
	var result = document.getElementById("CaptchaInput").value;

    if(result == (parseInt(a) + parseInt(b))) {
        //alert("Correct");
        return true;
    } else {
        //alert("Wrong");
        return false;
    }
}
function check() 
{
    var result = document.getElementById("CaptchaInput").value;

    if(result == (parseInt(a) + parseInt(b))) {
        //alert("Correct");
        return true;
    } else {
        //alert("Wrong");
        return false;
    }
}
function checkform(theform)
{
	debugger
	var theform = document.getElementById('frmContactUs');
	var why = "";
	if(theform.txtName.value == "" || theform.txtName.value == " ")
	{
		//why+= "Please Enter Name";
		//alert("Please Enter Name");
		debugger
		document.getElementById('errorMessageName').innerHTML="<bean:message key='BzComposer.contactus.formerrormessage'/>";
		debugger
		//event.preventDefault();
	}
	if(theform.txtEmail.value == "" || theform.txtEmail.value == " ")
	{
		//alert("Please Enter Email");
		document.getElementById('errorMessageEmail').innerHTML="<bean:message key='BzComposer.contactus.formerrormessage'/>";
		//event.preventDefault();
	}
	if(theform.comments.value == "" || theform.comments.value == " ")
	{
		//alert("Please Enter Comments");
		document.getElementById('errorMessageComments').innerHTML="<bean:message key='BzComposer.contactus.formerrormessage'/>";
		//event.preventDefault();
	}
	if(theform.CaptchaInput.value == "")
	{
		//why += "- Please Enter CAPTCHA Code.\n";
		debugger
		document.getElementById('errorMessageCaptcha').innerHTML = "<bean:message key='BzComposer.contactus.formcaptchacode'/>";
		debugger
		event.preventDefault();
	}
	else
	{
		if(ValidCaptcha(theform.CaptchaInput.value) == false)
		{
			//why += "- The CAPTCHA Code Does Not Match.\n";
			document.getElementById('errorMessageCaptcha').innerHTML = "<bean:message key='BzComposer.contactus.forminvalidcaptcha'/>";
			event.preventDefault();
		}
		
		else
		{
			alert("Name:"+theform.txtName.value+"\nEmail:"+theform.txtEmail.value+"\nPhone:"+theform.txtPhone.value+"\nSubject:"+theform.subject.value+"\nComments:"+theform.comments.value);
			
			var UserName = theform.txtName.value;
			var email = theform.txtEmail.value;
			var phone = theform.txtPhone.value;
			var subject = theform.subject.value;
			var comments = theform.comments.value;
			
			/* document.getElementById('hiddenName').value = UserName;
			document.getElementById('hiddenEmail').value = email;
			document.getElementById('hiddenPhone').value = phone;
			document.getElementById('hiddenSubject').value = subject;
			document.getElementById('hiddenComments').value = comments; */
			
			document.forms[0].action = "Login.do?tabid=contactUs&hiddenName="+UserName+"&hiddenEmail="+email+"&hiddenPhone="+phone+"&hiddenSubject="+subject+"&hiddenComments="+comments;
			document.forms[0].submit();
		}
	}
	
	if(why != "")
	{
		alert(why);
		return false;
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
<%-- <html:html lang="en"> --%>
<html:html>
<title><bean:message key="BzComposer.contactustitle"/></title>
<%@ include file="templateHeader.jsp"%>
<body onload="getRandom();">
	<header>
	<!-- div for mobile screen starts -->
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container">
				<div class="row">
					<div class="col-md-3" align="center">
						<div class="logo" style="max-width: 100%;">
							<a href="${pageContext.request.contextPath}/index.jsp"> 
								<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" style="max-width: 100%"/>
							</a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="search-wrap" align="right">
							<div class="input-group" align="center">
								<input type="text" id="searchBoxMobile" name="searchBoxMobile" placeholder="<bean:message key="BzComposer.searchtext"/>" style="max-width: 100%;" />
								<div class="input-group-btn">
									<button class="btn btn-primary" onclick="searchTextMobile()"><bean:message key="BzComposer.searchbuttontext"/></button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3" align="center">
						<div class="input-group">	
							<select name="localeMobile" id="localeMobile" class="form-control" onchange="showLocaleMobile();">
								<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
								<option value="english"><bean:message key="BzComposer.selectlanguage.english"/></option>
								<option value="chinese"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
								<option value="spanish"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
							</select>
						</div>
					</div>
					<div class="col-md-3" align="center">
						<div align="center">
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
		</div>
	</div>
	<!-- div for mobile screen ends -->
	<!-- div for bigger screen starts -->
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
					<div class="col-md-3">
						<div class="search-wrap" align="right">
							<div class="input-group" align="right">
								<input type="text" name="searchbox" placeholder="<bean:message key="BzComposer.searchtext"/>" style="width: 241px" />
								<div class="input-group-btn">
									<button class="btn btn-primary"><bean:message key="BzComposer.searchbuttontext"/></button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3" align="right">
						<div class="input-group">
							<select name="locale" id="locale" class="form-control" onchange="showLocale();">
								<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
								<option value="en"><bean:message key="BzComposer.selectlanguage.english"/></option>
								<option value="zh"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
								<option value="es"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
							</select>
						</div>
					</div>
					<div class="col-md-3" align="right">
						<div align="center">
							<div class="contact-widget contact-widget-1">											
								<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><bean:message key="BzComposer.login"/></button>
								<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><bean:message key="BzComposer.register"/></button>
								<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
									<span class="hamburger-box"> 
										<span class="hamburger-inner"></span>
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
	<!-- div for bigger screen ends -->
	</header>
	<!-- header / end--> 
	<div class="section contact-us bg-grey-light p-t-20 p-b-40" id="ContactForm">
		<div class="container">
			<h1 class="entry-title">
				<bean:message key="BzComposer.contactus.title"/>
				<!-- Contact Us -->
			</h1>
			<p class="contact-us-text-block">
				<bean:message key="BzComposer.contactus.contentone"/>
				<!-- If you have any questions regarding our products or services, 
				please contact us and we will get back to you as soon as possible. -->
			</p>
			<p class="contact-us-text-block">
				<bean:message key="BzComposer.contactus.contenttwo"/>
				<!-- We look forward to hearing from you!. -->
			</p>
			<form id="frmContactUs" onsubmit="checkform(this.form)" action="Login.do?" method="post">
				<!-- <input type="hidden" id="hiddenName" value=""/>
				<input type="hidden" id="hiddenEmail" value=""/>
				<input type="hidden" id="hiddenPhone" value=""/>
				<input type="hidden" id="hiddenSubject" value=""/>
				<input type="hidden" id="hiddenComments" value=""/> -->
				<div class="row">
					<div class="col-md-6" align="center">
						<label>
							<bean:message key="BzComposer.contactus.formname"/>
							<!-- Name -->
						</label>
						<span class="red">*</span>
					</div>
					<div class="col-md-6" align="center">
						<input type="text" id="txtName" name="txtName" class="form-control" autocomplete="off"/>
						<label id="errorMessageName" class="error"></label>
					</div>
					<br/>
				</div>
				<div class="row">
					<div class="col-md-6" align="center">
						<label>
							<bean:message key="BzComposer.contactus.formemail"/>
							<!-- Email -->
						</label>
						<span class="red">*</span>
					</div>
					<div class="col-md-6" align="center">
						<input type="text" id="txtEmail" name="txtEmail" class="form-control" autocomplete="off"/>
						<label id="errorMessageEmail" class="error"></label>
					</div>
					<br/>
				</div>
				<div class="row">
					<div class="col-md-6" align="center">
						<label>
							<bean:message key="BzComposer.contactus.formphone"/>
							<!-- Phone -->
						</label>
					</div>
					<div class="col-md-6" align="center">
						<input type="text" id="txtPhone" name="txtPhone" class="form-control" maxlength="10" autocomplete="off"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6" align="center">
						<label>
							<bean:message key="BzComposer.contactus.formsubject"/>
							<!-- Subject -->
						</label>
					</div>
					<div class="col-md-6" align="center">
						<select id="subject" name="subject" class="form-control">
							<option value="About Advertising"><bean:message key="BzComposer.contactus.advertising"/><!-- About Advertising --></option>
							<option value="About Business Listing"><bean:message key="BzComposer.contactus.businesslisting"/><!-- About Business Listing --></option>
							<option value="About Business Information Change"><bean:message key="BzComposer.contactus.businessinfochange"/><!-- About Business Information Change --></option>
							<option value="About Login &amp; Registration Issues"><bean:message key="BzComposer.contactus.loginregisterissues"/><!-- About Login &amp; Registration Issues --></option>
							<option value="About Website Issues"><bean:message key="BzComposer.contactus.websiteissues"/><!-- About Website Issues --></option>
							<option value="About Shopping"><bean:message key="BzComposer.contactus.aboutshopping"/><!-- About Shopping --></option>
							<option value="About Legal Issues"><bean:message key="BzComposer.contactus.legalissues"/><!-- About Legal Issues --></option>
						</select>	
					</div>
				</div>
				<div class="row">
					<div class="col-md-6" align="center">
						<label>
							<bean:message key="BzComposer.contactus.formcomment"/>
							<!-- Comment -->
						</label>
						<span class="red">*</span>
					</div>
					<div class="col-md-6" align="center">
						<textarea id="comments" name="comments" rows="" cols="" class="form-control"
						style="width: 99%;"></textarea>
						<label id="errorMessageComments" class="error"></label>
					</div>
					<br/>
				</div>
				<div class="row">
					<div class="col-md-6">
					</div>
					<div class="col-md-6" align="center">
						<!-- START CAPTCHA -->
						<!-- <div class="capbox">
						<div id="CaptchaDiv"></div>
							<div class="capbox-inner">
							Type the above number:<br> 
							<input type="hidden" id="txtCaptcha"> 
							<input type="text" name="CaptchaInput" id="CaptchaInput" size="15"><br>
						</div>
						</div> -->
						<!-- END CAPTCHA -->
						 <!-- <p> -->
            				<label id="firstNumber"></label>
            				+
            				<label id="secondNumber"></label>
            				=
            				<input type="text" name="CaptchaInput" id="CaptchaInput" autocomplete="off"/>
            				<!-- <input type="button" class="btn btn-primary" value="Check" onclick="check();" /> -->
            				<br/>
            				<label id="errorMessageCaptcha" class="error"></label>
        				<!-- </p> -->
					</div>
		</div>
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
				<input type="submit" class="btn btn-primary b_submitbtn" value="<bean:message key='BzComposer.contactus.submit'/>"/>
			</div>
			<div class="col-md-4">
			</div>
		</div>		
	</form>
</div>
	</div>
     <%@ include file="templateFooter.jsp"%>
     <%@ include file="templateScript.jsp"%>
	</body>
</html:html>