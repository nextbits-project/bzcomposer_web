<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<script type="text/javascript">
function checkformSubscribe(theform)
{
	debugger
	var theform = document.getElementById('frmSubscribe');
	if(theform.txtSubscribe.value == "" || theform.txtSubscribe.value == " ")
	{
		debugger
		/* document.getElementById('errorMessage').innerHTML="The field is required."; */
		event.preventDefault();
	}
	else
	{
		var email = theform.txtSubscribe.value;
		document.forms[0].action = "Login.do?tabid=subscribe";
		document.getElementById('tabid').value ="subscribe";
		document.getElementById('emailId').value = email;
		document.forms[0].submit();
		document.getElementById('errorMessage').innerHTML = "<bean:message key='BzComposer.subscribe.message'/>";
			/* "Your subscription was successful! Kindly check your mailbox and confirm your subscription."+ 
		"If you don't see the email within a few minutes, check the spam/junk folder." */;
	}
}
</script>
</html>
<footer id="footer"> 
<!-- Footer / start-->
<div class="footer footer-1 bg-black">
	<div class="top-footer p-t-50 p-b-50">
		<div class="container">
			<div class="row">
				<div class="col-md-3" align="center">
					<div class="footer-block-3">
						<div class="title" style="text-align: center;">
							<h5 style="color: white;"><bean:message key="BzComposer.footer.contactsocialnetworks"/><!-- Contact Us on Social Networks --></h5>
						</div>
						<div class="social-list">
							<ul class="horizontal-list">
								<li><a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__1.png" alt="" /></a></li>
								<li><a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__2.png" alt="" /></a></li>
								<li><a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__3.png" alt="" /></a></li>
								<li><a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__4.png" alt="" /></a></li>
								<li><a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__5.png" alt="" /></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9" align="center">
					<div class="footer-block-2" style="margin-top: 25px">
					    <div class="input-group">
                        	<form id="frmSubscribe" onsubmit="checkformSubscribe(this.form)" action="Login.do?" method="post">
                        		<input type="hidden" id="tabid" name="tabid" value=""/>
                        		<input type="hidden" id="emailId" name="emailId" value=""/>
	                            <div class="col-md-3" >
	                            	<input type="text" id="txtSubscribe" name="txtSubscribe" class="form-control" 
	                            	placeholder="<bean:message key="BzComposer.footer.subscribeplaceholdertext"/>
	                            	<!-- Enter Your Email Id -->" style="width: 202px;float: right;" required>
	                            </div>
	                            <div class="col-md-1">
	                            	 <span class="input-group-btn">
            	              			<button class="btn btn-primary" type="submit"><bean:message key="BzComposer.footer.subscribe"/><!-- Subscribe --></button>
                	        		</span>
	                            </div>
	                            <div class="col-md-5" align="right">
	                            	<label id="errorMessage" style="color: #f00;font-size: 1em;font-weight: normal;"></label>
	                            </div>
    	                    </form>
                        </div>
					</div>
				</div>
			</div>
					<!-- <div class="col-md-6">
						<div class="footer-block-1">
							
							<div class="quick-link">
								<div class="row">
									  <div class="footer-text">
                    <h2>What Clients are Saying</h2>
                    <p>We have had difficulty in running our online business for a long time despite our heavy investments. BZcomposer created our website in 2 weeks and helped us.</p>
                </div>
								</div>
							</div>
						</div>
					</div> -->
					<!-- <div class="col-md-3">
						<div class="footer-block-2">
							<div class="title">
								<h3>Join Our Mailing List</h3>
							</div>
						<div class="input-group">
                            <input type="text" class="form-control" placeholder="">
                            <span class="input-group-btn">
                          <button class="btn btn-primary" type="button">Subscribe</button>
                        </span>
                        </div>
						</div>
					</div> -->
				
			<div class="row">
				<div>
				</div>
				<div class="col-md-3 b_footerwidgets" style="max-width: 320px;float:left;">
					<div class="textwidget" style="max-width: 320px;float: left;">
						<h4><bean:message key="BzComposer.footer.aboutus"/></h4>
						<ul class="menu">
							<li><a href="bzComposer#aboutBzComposer"><bean:message key="BzComposer.footer.aboutnextbits"/></a></li>
							<li><a href="#"><bean:message key="BzComposer.footer.support"/>Support</a></li>
							<!-- <li><a href="/contact-us/">Contact us</a></li> -->
							<li><a href="https://www.nextbits.com/contact-us/"><bean:message key="BzComposer.footer.contactus"/></a></li>
							<li><a href=" /sitemap/"><bean:message key="BzComposer.footer.sitemap"/></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 b_footerwidgets" style="max-width: 320px;float: left;">
					<div class="textwidget" style="max-width: 320px;float: left;">
						<h4><bean:message key="BzComposer.footer.businesssubmission"/></h4>
						<ul class="menu">
							<!-- <li><a href=" /about-nextbits/">Membership</a></li> -->
							<li><a href="https://www.nextbits.com/membership-plan/"><bean:message key="BzComposer.footer.membership"/></a>
							<!-- <li><a href="#">Submit Your Business</a></li> -->
							<li><a href="https://www.nextbits.com/user-login/"><bean:message key="BzComposer.footer.submitbusiness"/></a></li>
							<!-- <li><a href="/contact-us/">Claim Your Business</a></li> -->
							<li><a href="https://www.nextbits.com/claim-your-business/"><bean:message key="BzComposer.footer.claimbusiness"/></a></li>
 						</ul>
					</div>
				</div>
				<div class="col-md-3 b_footerwidgets" style="max-width: 320px;float: left;">
					<div class="textwidget" style="max-width: 320px;float: left;">
						<h4><bean:message key="BzComposer.footer.sellingonnextbits"/></h4>
						<ul class="menu">
							<li><a href=" /about-nextbits/"><bean:message key="BzComposer.footer.howtosell"/></a></li>
							<li><a href="#"><bean:message key="BzComposer.footer.manageproducts"/></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 b_footerwidgets" style="max-width: 320px;float: left;">
					<div class="textwidget" style="max-width: 320px;float: left;">
						<h4><bean:message key="BzComposer.footer.safetyandsupport"/></h4>
						<ul class="menu">
							<li><a href=" /about-nextbits/"><bean:message key="BzComposer.footer.helpcenter"/></a></li>
							<li><a href="https://www.nextbits.com/blog/"><bean:message key="BzComposer.footer.blog"/></a></li>
							<li><a href="/contact-us/"><bean:message key="BzComposer.footer.privatepolicy"/></a></li>
							<li><a href=" /sitemap/"><bean:message key="BzComposer.footer.disclaimer"/></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bot-footer">
		<div class="container">
			<div class="block-inner p-t-35 p-b-60">
				<div class="block-left">
					<ul>
						<li><a href="https://www.nextbits.com/business-directory/"><bean:message key="BzComposer.footer.yellowpage"/></a></li>
						<li><a href="https://www.nextbits.com/service-contractor/"><bean:message key="BzComposer.footer.servicecontractor"/></a></li>
						<li><a href="https://www.nextbits.com/community/"><bean:message key="BzComposer.footer.community"/></a></li>
						<li><a href="https://www.nextbits.com/real-estate/"><bean:message key="BzComposer.footer.realestate"/></a></li>
						<li><a href="https://www.nextbits.com/lodging/"><bean:message key="BzComposer.footer.lodging"/></a></li>
						<li><a href="https://www.nextbits.com/restaurants/"><bean:message key="BzComposer.footer.resturants"/></a></li>
						<li><a href="https://www.nextbits.com/coupons/"><bean:message key="BzComposer.footer.coupons"/></a></li>
						<li><a href="https://www.nextbits.com/coupons/blog/"><bean:message key="BzComposer.footer.blog"/></a></li>
						<li><a href="https://www.nextbits.com/job-listings/"><bean:message key="BzComposer.footer.jobs"/></a></li>
						<li><a href="https://www.nextbits.com/shop/"><bean:message key="BzComposer.footer.shopping"/></a></li> 					 				</ul>
						
						<!-- <span>© Copyright 2011 BZComposer.com - is a trademark of Nextbits Corporation</span> -->
					</div>
					<!--  <div class="block-right-copyright"> -->
						 
					
					<%-- <div class="block-right-social-links">
					
						<p>Join Social Networks:</p>
						
						<ul class="horizontal-list">
									<li>
									<a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__1.png" alt="" /></a></li>
									<li>
									<a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__2.png" alt="" /></a></li>
									<li>
									<a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__3.png" alt="" /></a></li>
									<li>
									<a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__4.png" alt="" /></a></li>
									<li>
									<a><img src="${pageContext.request.contextPath}/dist/template/images/icons/social__5.png" alt="" /></a></li>
								</ul>
					
					</div> --%>
					
				</div>
				<div align="center">
					<p style="color: white;"> <bean:message key="BzComposer.footer.footertext"/>
					<!-- Notice ©-2013 nextbits.com . All rights reserved. --></p>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer / end--> </footer>