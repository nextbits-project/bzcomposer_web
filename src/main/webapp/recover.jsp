<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*" %>
<html:html>
<head>
<title><bean:message key="BzComposer.forgotpasswordtitle"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/include/headlogo1.jsp"%>
 <style type="text/css">
input,textarea,select{
	display: inline-block;
	padding: 4px;
	margin-bottom: 9px;
	line-height: 18px;
	color: #555555;
	border: 1px solid #cccccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}
input:focus,textarea:focus,select:focus {
	border-color: rgba(82, 168, 236, 0.8);
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	outline: 0;
	outline: thin dotted \9;
}
img,div,a,input {
	behavior: url(iepngfix.htc)
}
/* FOOTER */
/* #footer {
	background: url("images/footer_bg.png") left top repeat-x;
	float: left;
	width: 100%;
	height: 60px;
}

#footer_inner {
	margin: 0 auto;
	background: url("images/footer_inner_bg.png") 0 0 no-repeat;
	font-size: 11px;
	width: 1007px;
	height: 60px;
	padding: 34px 0 0 0;
}

.copyright {
	float: left;
	width: 250px;
	font-weight: bold;
	color: #333333;
	margin: 14px 0 0 50px;
}

#footer_menu {
	float: right;
	width: 630px;
	height: 44px;
	padding-right: 10px;
}

#footer_menu ul {
	float: right;
	width: 420px;
	display: block;
}

#footer_menu li {
	float: left;
	display: inline;
}

#footer_menu li a {
	padding: 0 40px 0 0;
	color: #333333;
	text-transform: capitalize;
	line-height: 44px;
	font-weight: bold;
}

#footer_menu li a:hover {
	color: #2670aa;
	text-decoration: underline;
} */
h3 {
background: url(images/help.png) left center no-repeat;
float: right;
padding: 10px 10px 0 35px;
font-size: 16px;
font-weight: bold;
color: #333333;
}
.imgClass { 
    background-image: url("images/recover.jpg");
    background-position:  0px 0px;
    background-repeat: no-repeat;
    width: 70px;
    height: 30px;
    border: 0px;
    overflow: hidden;
    text-indent:-9999px;
    background-color:  #f6f6f6;
      cursor: pointer;

}
.imgClass:hover{ 
      background-position:  0px -2px;
      cursor: pointer;
}
#content {
float: left;
background: url(images/content_bg.png) left top repeat-y;
width: 100%;
}
#logo {
background: url(images/logo.png) left top no-repeat;
width: 238px;
height: 64px;
float: left;
margin: 0 0 0 50px;
}
.ctrl {
font-family: Tahoma, Verdana, sans-serif;
font-size: 12px;
width: 90%;
}
h1 {
float: left;
padding: 10px;
width: 50%;
font-size: 20px;
/* font-weight: bold; */
color: rgb(138, 136, 136);

font-family: "Philosopher", "Bitstream Vera Sans", "Lucida Grande", "Trebuchet MS",Arial, Helvetica, sans-serif !important;

}

/* Tooltip Starts */

.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltip_text {
  visibility: hidden;
  /* width: 320px; */
  width: 250px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip .tooltip_text::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltip_text {
  visibility: visible;
  opacity: 1;
}

/* Tooltip Ends */
</style>
</head>
<body>
<html:form action="Recover" method="post">
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
		
		<div id="table-negotiations" align="center">
			
			<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
				<tr><td colspan="3">
						<span style="font-size: 1.1em; font-weight: normal; color: #01DFD7; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
							<center><h2>
							<bean:message key="BzComposer.forgotpassword.title"/>
							<!-- Forgot your password? -->
							</h2></center>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<div style="color: red;" class="bg-danger" align="center">
							<html:errors />
	   					</div>
					</td>
				</tr>
				<tr></tr>
				
				<tr bgcolor="#ffffff">
					<td id="t_email">
						&nbsp;
						<bean:message key="BzComposer.forgotpassword.username"/>
						<!-- Your User Name: -->
						<span class="inputHighlighted">*</span>
					</td>
					<td>
						<input type="text" name="userName" size="10" class="ctrl"/>
						<%-- <html:text property="userName" size="35" maxlength="20"/> --%>
					</td>
					<td>
						<a name="usernameTooltip" href="javascript:" class="tooltip tooltip_text" 
						onmousemove="showToolTip(event,'Enter your User Name.');return false"
						onmouseout="hideToolTip()"><img src="images/q.gif"
						border="0" width="20" height="20"/>
						</a>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td id="t_uname" width="40%">
						&nbsp;
						<bean:message key="BzComposer.forgotpassword.passwordhint"/>
						<!-- Password Hint: -->
						<span class="inputHighlighted">*</span>
					</td>
					<td width="50%">
						<!-- <input type="text" name="userID" size="10" class="ctrl"> -->                  	
						<select name="passwordHint">
							<option value="select a question"><bean:message key="BzComposer.forgotpassword.selectquestion"/>
								<!-- select a question -->
							</option>
							<option value="what is your nickname"><bean:message key="BzComposer.forgotpassword.nickname"/>
								<!-- what is your nickname -->
							</option>
							<option value="what is your pet name"><bean:message key="BzComposer.forgotpassword.petname"/>
								<!-- what is your pet name -->
							</option>
							<option value="what is your hobby"><bean:message key="BzComposer.forgotpassword.hobby"/>
								<!-- what is your hobby -->
							</option>
							<option value="what is golden moment in your life"><bean:message key="BzComposer.forgotpassword.goldenmomentinlife"/>
								<!-- what is golden moment in your life -->
							</option>
						</select>
					</td>
					<!--<input type="text" name="passwordHint" size="10" class="ctrl"></td> -->
					<td>
						<a href="javascript:" class="tooltip tooltip_text"
							onmousemove="showToolTip(event,'enter your password hint.');return false"
							onmouseout="hideToolTip()">
							<img src="images/q.gif" border="0" width="20" height="20"/>
						</a>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td id="t_email">
						&nbsp;
						<bean:message key="BzComposer.forgotpassword.passwordanswer"/>
						<!-- Password Answer: -->
						<span class="inputHighlighted">*</span>
					</td>
					<td>
						<input type="text" name="passwordAnswer" size="35" class="ctrl"/>
					</td>
					<td>
						<a href="javascript:" class="tooltip tooltip_text"
						onmousemove="showToolTip(event,'Enter your password answer.');return false"
						onmouseout="hideToolTip()">
							<img src="images/q.gif" border="0" width="20" height="20"/>
						</a>
					</td>
				</tr>
				<!-- <img src="images/pixel.gif" width="1" height="10" border="0">
				<br>
				<div align="center" id="error_registration" style="display: block;">
				</div>
				</td>
					<td background="images/line_r.gif"><img
						src="images/pixel.gif" border="0">
					</td>
				</tr> -->
				
				<tr>
					<td colspan="3" align="center">
						<!-- <input type="submit" class="imgClass" value="Submit"/> -->
						<input type="submit" value="<bean:message key='BzComposer.global.submit'/>"/>
					</td>
				</tr>
			</table>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</html:form>
<%@ include file="/include/footer.jsp"%>
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
//var v = new validator('login', a_fields, o_config);

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
