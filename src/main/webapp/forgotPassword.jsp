<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html:html lang="en">
<%@ include file="templateHeader.jsp"%>
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
	function checkUser()
	{
		var id = $.trim($("#loginID").val());
		
		if(id =="" || id == " ")
		{
			alert("Please enter your loginId")
		}
		else
		{
			alert("Entered UserId is:"+id);
			window.location.href = "Login.do?tabid=forgotPassword&loginID="+id;
		}
	} 
</script>
<body>

	<!-- page load-->
	<div class="page-loader">
		<div class="loader"></div>
	</div>
      <!-- forgot password starts -->
      <div id="forgotPassword-form" class="mfp-hide white-popup-block">
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
			 				<%-- <html:text property="userName" styleId="userName" styleClass="form-control\" autoComplete=\"off" /> --%>
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
							<%-- <html:password property="password" styleId="password" styleClass="form-control" /> --%>
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
	</div>
    <!-- forgot password ends -->  
	<%@ include file="templateFooter.jsp"%>
	<div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
<%@ include file="templateScript.jsp"%>
</body>
</html:html>