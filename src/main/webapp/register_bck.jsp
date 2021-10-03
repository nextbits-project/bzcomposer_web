<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:html>
<head>
<title>Register for BzComposer</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin.css" media="screen" rel="Stylesheet"
	type="text/css">
<link href="styles/form.css" media="screen" rel="Stylesheet"
	type="text/css">
<link href="styles/basic.css" media="screen" rel="Stylesheet"
	type="text/css">
<link href="styles/formitems.css" media="screen" rel="Stylesheet"
	type="text/css">
<script src="scripts/prototype.js" type="text/javascript"></script>
<script src="scripts/effects.js" type="text/javascript"></script>
<script src="scripts/dragdrop.js" type="text/javascript"></script>
<script src="scripts/controls.js" type="text/javascript"></script>
<script src="scripts/application.js" type="text/javascript"></script>
<script src="scripts/validator.js" type="text/javascript"></script>
<script src="scripts/message.js" type="text/javascript"></script>
<style type="text/css">
div#header {
	background: #05A9C5;
	border-bottom: 1px solid #05A9C5;
}
#register-bzc{
 background-image: url("images/register.png")  ;
background-position: left;
background-repeat: no-repeat;

/* height: 574px; */
padding: 1em 1.5em 1em 1em;
margin: 5px 6px 5px 5px;



height:85%; 
/* -webkit-box-shadow: 0 10px 80px 0 rgba(0, 0, 0, 0.20); */
/* -moz-box-shadow: 0 10px 80px 0 rgba(0, 0, 0, 0.20); */
/* box-shadow: 0 10px 80px 0 rgba(0, 0, 0, 0.20); */
}
td{


color: #05A9C5;
font-size: .9em;
font-weight: bold;
}
textarea, select, input {
font: 10px Verdana, arial, helvetica, sans-serif;
background-color: white;
padding: 4px;
}
div#pie {
color:#05A9C5;
}
div#header-content ul#ulnav li a.selected:link, div#header-content ul#ulnav li a.selected:visited, div#header-content ul#ulnav li a:hover {
border-bottom: 2px solid white;
padding-top: 2px;
color: white;
}
div#header-content ul#ulnav li a:link, div#header-content ul#ulnav li a:visited {
float: left;
line-height: 20px;
margin: 0 1px 0 1px;
text-decoration: none;
border-bottom: 2px solid #white;
color: white;
padding: 2px 5px;
}
</style>
</head>
<body style="background-color:white ;">

<div id="bubble_tooltip">
<div class="bubble_top"><span></span></div>
<div class="bubble_middle"><span id="bubble_tooltip_content">Content is
comming here as you probably can see.Content is comming here as you
probably can see.</span></div>
<div class="bubble_bottom"></div>
</div>

<!-- begin shared/header -->
<div id="header">
<div id="header-content"><!-- begin shared/nav_public -->
<ul id="ulnav">
	<li><a href="http://bzcomposer.net/" target="_blank"   title="BizComposer" rel="section">Home</a></li>
	<li><a href="http://216.116.104.9/bzcomposerweb/register.jsp" title="Register" rel="section"
		class="selected">Register</a></li>
	<li><a href="http://216.116.104.9/bzcomposerweb/" title="Help" rel="section">Login</a></li>
<!-- 	<li><a href="" title="Contact" rel="section">Contact</a></li> -->
</ul>
<!-- end shared/nav_public -->

<div class="clear"></div>

</div>

</div>

<!-- end shared/header -->




<div id="cos" >

<div id="register-bzc">
<div>
	
<!-- <form action="/Register" method="post" name="login"
	onSubmit="return v.exec()"> -->
	<html:form action="/Register">
	
		
						
<table cellpadding="0" cellspacing="0" border="0" width="60%"
	align="right" >
	
	<tr>
		<td ><img src="images/pixel.gif"
			border="0"></td>
		<td colspan="3"><img src="images/pixel.gif" width="1" height="10"
			border="0"><br>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td >
				<table cellspacing="1" cellpadding="2" border="0" width="100%">
				  <tr><td>
				  <div style="color: red">
	<%
	org.apache.struts.action.ActionErrors ae = (org.apache.struts.action.ActionErrors) request.getAttribute(org.apache.struts.Globals.ERROR_KEY);
		boolean emailError=false;
		boolean requiredError=false;
		boolean MismatchError=false;
		boolean duplicateEmailError=false;
		boolean duplicateUserError=false;
		boolean invalidPassword=false;
		boolean registrationSuccessful=false;
		boolean invalidZipError=false;
		boolean invalidPhoneError=false;
		boolean invalidUSState=false;
 	 if(ae != null){
 		for(int x=0; x<ae.size(); x++){
 			 java.util.Iterator iter=ae.get();
 			 while(iter.hasNext()){
 				org.apache.struts.action.ActionMessage e=(org.apache.struts.action.ActionMessage)iter.next();
 				//out.println(e.getValues()[0]);
 				if(e.getKey().indexOf("email")>1){
 					emailError=true;
 				}
 			/* 	if(e.getKey().indexOf("invalid")>1 && e.getValues()[0].toString().indexOf("Zip")>1 ){
 					invalidUSZipCode=true;
 					out.println(e.getKey());
 				}
 				if(e.getKey().indexOf("invalid")>1 && e.getValues()[0].toString().indexOf("Phone")>1){// && e.getKey().indexOf("invalid")>1 ){
 					invalidUSPhoneNumber=true;
 					out.println(e.getKey());
 				} */
 				if((e.getKey().indexOf("maxlength")>=0 || e.getKey().indexOf("minlength")>=0 )&& e.getValues()[0].toString().indexOf("Password")>=0){// && e.getKey().indexOf("invalid")>1 ){
 					invalidPassword=true;
 					//out.println(e.getKey()+"test");
 				}
 				/* if(e.getValues()[0].toString().indexOf("Zip")>1 ){
 					invalidUSZipCode=true;
 					out.println(e.getKey());
 				}
 				if(e.getValues()[0].toString().indexOf("Phone")>1){// && e.getKey().indexOf("invalid")>1 ){
 					invalidUSPhoneNumber=true;
 					out.println(e.getKey());
 				}
 				if(e.getValues()[0].toString().indexOf("Password")>1){// && e.getKey().indexOf("invalid")>1 ){
 					invalidPassword=true;
 					out.println(e.getKey());
 				} */
 				
 				if(e.getKey().indexOf("required")>=0){
 					requiredError=true;
 				}
 				if(e.getKey().indexOf("err.registration.password.mismatch")>=0){
 					MismatchError=true;
 				}
 				if(e.getKey().indexOf("err.registration.emailaddress.duplicate")>=0){
 					duplicateEmailError=true;
 				}
 				if(e.getKey().indexOf("err.registration.username.duplicate")>=0){
 					duplicateUserError=true;
 				}
 				if(e.getKey().indexOf("err.registration.success")>=0){
 					registrationSuccessful=true;
 				}
 				if(e.getKey().indexOf("err.registration.invalidzip")>=0){
 					invalidZipError=true;
 				}
 				if(e.getKey().indexOf("err.registration.invalidphone")>=0){
 					invalidPhoneError=true;
 				}
 				if(e.getKey().indexOf("err.registration.invalidstate")>=0){
 					invalidUSState=true;
 				}
 				
 				
 			 }
 		}
		 	if(requiredError){
				 out.println("Please enter fields marked with *<br>");
			 }
			 if(emailError){
				 out.println("Invalid email address <br>");
			 }
			 if(MismatchError){
					 out.println("Passwords does not match<br>");
			 }
			 if(duplicateEmailError){
				 out.println("Email already exists<br>");
			 }
			 if(duplicateUserError){
				 out.println("User Name already exists<br>");
			 }
			 if(registrationSuccessful){
				 out.println("Registration successful.Please click <a href='index.jsp'>here</a> to login<br>");
			 }
			 if(invalidZipError){
				 out.println("Invalid US Zip<br>");
			 }
			 if(invalidPhoneError){
				 out.println("Invalid US Phone number<br>");
			 }
			 if(invalidUSState){
				 out.println("Choose state from the drop down<br>");
			 }

 	 }
    %>
   	</div> 
				  
				  </td></tr>
					<tr>
						<td id="t_email">&nbsp;Email Address:<span
							class="inputHighlighted">*</span></td>
						<td><input type="text" name="emailAddress" size="35" class="ctrl"></td>
				
							<td/>
					</tr>
				
					<tr >
						<td id="t_uname" width="40%">&nbsp;Login Name:<span
							class="inputHighlighted">*</span></td>
						<td width="50%"><!-- <input type="text" name="userID" size="10"
							class="ctrl"> -->
							<input type="text" name="userName" size="10"
							class="ctrl">
							</td>
						<td><a href="javascript:" class="tooltip_text"
							onmousemove="showToolTip(event,'Your Login Name is not case sensitive and must be between 4 and 16 characters in length.');return false"
							onmouseout="hideToolTip()"><img src="images/q.gif" border="0"
							width="20" height="20"></a></td>
					</tr>
					<!-- <tr >
						<td id="t_email">&nbsp;Email Address2:<span
							class="inputHighlighted">*</span></td>
						<td><input type="text" name="emailAddress" size="35" class="ctrl"></td>
						<td><a href="javascript:" class="tooltip_text"
							onmousemove="showToolTip(event,'Enter the Email Address.');return false"
							onmouseout="hideToolTip()"><img src="images/q.gif" border="0"
							width="20" height="20"></a></td>
					</tr> -->
					<tr >
						<td id="t_password">&nbsp;Password:<span class="inputHighlighted">*</span></td>
						<td><input type="password" name="password" size="35" class="ctrl"></td>
						<td><a href="javascript:" class="tooltip_text"
							onmousemove="showToolTip(event,'Your password is case sensitive and must be between 6 and 16 characters in length.');return false"
							onmouseout="hideToolTip()"><img src="images/q.gif" border="0"
							width="20" height="20"></a></td>
					</tr>
					<tr >
						<td id="t_password_copy" nowrap>&nbsp;Retype Password:<span
							class="inputHighlighted">*</span>&nbsp;</td>
						<td><input type="password" name="confirmPassword" size="35" class="ctrl"></td>
			
							<td/>
					</tr>
					<tr >
						<td id="t_question">&nbsp;Password Reminder Question:<span
							class="inputHighlighted"></span></td>
						<td><select name="passwordhint">
							<option value="select a question">select a question</option>
							<option value="what is your nickname">what is your nickname</option>
							<option value="what is your pet name">what is your pet name</option>
							<option value="what is your hobby">what is your hobby</option>
							<option value="what is golden moment in your life">"what is golden moment in your life</option>
						</select></td>
						<td><a href="javascript:" class="tooltip_text"
							onmousemove="showToolTip(event,'The Password Reminder Question is the question you will be asked if you forget your password.');return false"
							onmouseout="hideToolTip()"><img src="images/q.gif" border="0"
							width="20" height="20"></a></td>

					</tr>
					<tr >
						<td id="t_answer">&nbsp;Answer:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="passwordAns" size="35" class="ctrl"></td>
						<td><a href="javascript:" class="tooltip_text"
							onmousemove="showToolTip(event,'Answer For Password Reminder Question.');return false"
							onmouseout="hideToolTip()"><img src="images/q.gif" border="0"
							width="20" height="20"></a></td>
					</tr>
					<tr >
						<td id="t_txtFirstName">&nbsp;FirstName:<span class="inputHighlighted">*</span></td>
						<td><input type="text" name="firstName" size="35" class="ctrl"></td>
					
							<td/>
							</tr>
							<tr >
						<td id="t_txtLastName">&nbsp;LastName:<span class="inputHighlighted">*</span></td>
						<td><input type="text" name="lastName" size="35" class="ctrl"></td>
				
							<td/>
					</tr>
					<tr >
						<td id="t_txtCompanyName">&nbsp;CompanyName:<span class="inputHighlighted">*</span></td>
						<td><input type="text" name="companyName" size="35" class="ctrl"></td>
			
							<td/>
					</tr>
					<tr >
						<td id="t_txtCompanyName">&nbsp;CompanyNickName:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="companyName" size="35" class="ctrl"></td>
			
							<td/>
					</tr>
					<tr >
						<td id="t_txtAddress1">&nbsp;Address1:<span class="inputHighlighted">*</span></td>
						<td><input type="text" name="address1" size="35" class="ctrl"></td>
				
							<td/>
					</tr>
					<tr >
						<td id="t_txtAddress2">&nbsp;Address2:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="address2" size="35" class="ctrl"></td>
			
							<td/>
					</tr>
					<tr >
						<td id="t_txtcity">&nbsp;city:<span class="inputHighlighted">*</span></td>
						<td><input type="text" name="city" size="35" class="ctrl"></td>
			
							<td/>
					</tr>
					<tr >
					
					
						<td id="t_lbState">&nbsp;State:<span class="inputHighlighted">*</span></td>
						<td><select name='state'>
								<option>Select US State</option>
							     <%
									for(int i=1;i<com.avibha.common.ConstValue.state_cb.length;i++){
								 %>
									<option value="<%out.println(com.avibha.common.ConstValue.state_cb[i]);%>"><%out.println(com.avibha.common.ConstValue.state_cb[i]);%></option><%}%>
						 	 </select>
						</td>
						
						
				
							<td/>
					</tr>
					<tr >
						<td id="t_lblZip">&nbsp;Zip Code:<span class="inputHighlighted">*</span></td>
						<td><input type="text" name="zip" size="35" class="ctrl"></td>

							<td/>
					</tr>
					<tr >
					
					
						<td id="t_lbCountry">&nbsp;Country:<span class="inputHighlighted">*</span></td>
						<td>
						
						
						
						<select name="country">
							<option>Select Country</option>
							<%
							for(int i=1;i<com.avibha.common.ConstValue.country_cb.length;i++){
							%>
								<option value="<%out.println(com.avibha.common.ConstValue.country_cb[i]);%>"><%out.println(com.avibha.common.ConstValue.country_cb[i]);%></option><%}%>
						</select>
						
						</td>
			
							<td/>
					</tr>
					<tr >
						<td id="t_txtProvince">&nbsp;Province:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="province" size="35" class="ctrl"></td>
						<td><a href="javascript:" class="tooltip_text"
							onmousemove="showToolTip(event,'Enter your province,outside US only');return false"
							onmouseout="hideToolTip()"><img src="images/q.gif" border="0"
							width="20" height="20"></a></td>
					</tr>
					<tr >
						<td id="t_txtPhone">&nbsp;Phone:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="phone" size="35" class="ctrl"></td>
		
							<td/>
					</tr>
					<tr >
						<td id="t_txtFax">&nbsp;Fax:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="Fax" size="35" class="ctrl"></td>
		
					</tr>
				
					<tr >
						<td id="t_txtTaxID">&nbsp;TaxID:<span class="inputHighlighted"></span></td>
						<td><input type="text" name="TaxID" size="35" class="ctrl"></td>
	
							<td/>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<img src="images/pixel.gif" width="1" height="10" border="0"><br>
		<div align="center" id="error_registration" style="display: block;"></div>
		</td>
		<td ><img src="images/pixel.gif"
			border="0"></td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#f1f1f1"><img src="images/pixel.gif"
			width="1" height="1" border="0"></td>
	</tr>
	<tr>
		<td colspan="5" align="right">
		<table cellpadding="0" cellspacing="0" border="0" style="padding-right: 68px;">
			<tr>
				<td class="btn" width="1">
				<input type="image"
					src="images/submitbtn.jpg" alt="" width="70" height="30" border="0"
					name="Submit"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</html:form>

</div>
</div>
</div>

<div class="clear"></div>

<!-- begin shared/footer -->
	<div id="pie">
			<p align="center">
				Copyright 2013 <a href="http://www.bzcomposer.net"
					style="color: #05A9C5; text-decoration: none">BZComposer Web</a>. All
				Rights Reserved. 
			</p>
		</div>
<!-- end shared/footer -->


</div>

</body>
</html:html>

<script>
// form fields description structure
var a_fields = {
	'uname' : {
		'l': 'Login Name',  // label
		'r': true,    // required
		'f': 'alphanum',  // format (see below)
		't': 't_uname',// id of the element to highlight if input not validated
		
		'm': null,     // must match specified form field
		'mn': 4,       // minimum length
		'mx': 16       // maximum length
	},
	'pass' : {'l':'Password','r':true,'f':'alphanum','t':'t_password','m':'pass_con','mn':'6','mx':'16'},
	'pass_con' : {'l':'Password confirm','r':true,'f':'alphanum','t':'t_password_copy','mn':'6','mx':'16'},
	'email' : {'l':'E-mail','r':true,'f':'email','t':'t_email','m':'email_con'},
	'email_con' : {'l':'E-mail confirm','r':true,'f':'email','t':'t_emailcon'},
	'question' : {'l':'Password Reminder Question','r':true,'f':'alphanum','t':'t_question'},
	'answer' : {'l':'Answer','r':true,'f':'alphanum','t':'t_answer'}
},
o_config = {
	'to_disable' : ['Submit'],
	'alert' : 1
}

// validator constructor call
var v = new validator('login', a_fields, o_config);

//'uname' : {
//		'l': 'Name',  // label
//		'r': false,    // required
//		'f': 'alpha',  // format (see below)
//		't': 't_uname',// id of the element to highlight if input not validated
//		
//		'm': null,     // must match specified form field
//		'mn': 2,       // minimum length
//		'mx': null       // maximum length
//	},
</script>
