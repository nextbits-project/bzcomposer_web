<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="java.util.*" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="styles/basic_login.css" media="screen" rel="Stylesheet"
	type="text/css">
<link href='http://fonts.googleapis.com/css?family=Philosopher:400,700,400italic,700italic&subset=cyrillic,latin' rel='stylesheet' type='text/css'>

<link type="/images/x-icon" href="favicon.ico" rel="shortcut icon" />
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
#footer {
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
}
h3 {
background: url(images/help.png) left center no-repeat;
float: right;
padding: 10px 10px 0 35px;
font-size: 16px;
font-weight: bold;
color: #333333;
}
.imgClass {

    background: #1a4772;
    width: 70px;
    height: 30px;
    border: 0px;
    overflow: hidden;
    cursor: pointer;
    margin: 0 0 10px 3px;
    color: #fff;
    border-radius: 0;
    padding: 0;
    line-height: normal;
    font-size: 15px;

}
.imgClass:hover{ 
      background-position:  0px -2px;
      cursor: pointer;
}
#content {
/* background: url(images/content_bg.png) left top repeat-y; */
background: url(images/welcome_screen.png) left top repeat-y;  
margin-top:0;
margin-bottom:0;
height: 300px;
width: 934px;
margin: auto;
float: none;
clear: both;
background-size: 100% auto;
position: relative;
}
#logo {
background: url(images/logo.png) left top no-repeat;
width: 238px;
height: 64px;
float: left;
margin: 0 0 0 50px;
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
#tableconteian{
  margin-top: 70px;
  left: 50px;
  padding-left: 40px;
}
#content_inner {
width: 865px;

padding: 25px 0px 0 70px;
}
#setup {
	margin-bottom: 0
}
#footer {
margin-top: -17px;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
<div id="maintable">
  <div id="main">
    <!-- HEADER -->
    <div id="header">
       <a href="http://b2bcomposer.com/bzcomposerweb2/"> <div id="logo">&nbsp;</div></a>
      <!-- <div id="top_nav">
        <ul>
         <li><a href="http://bzcomposer.net/"   target="_blank"  title="BzComposer" rel="section"
					class="selected">Home</a></li>
				<li><a href="http://b2bcomposer.com/bzcomposerweb2" title="login" rel="section">Account Login</a></li>
			
        </ul>
      </div> -->
    </div>
    <!-- CONTENT -->
    <div id="content">
      <div id="content_inner">
      	
      <!--   <h1>Welcome to BZComposer</h1> -->
<!-- 		<h3><a href="#">Help & Support</a></h3> -->
        <!-- SETUP -->
        <%-- <div id="setup">
            <html:form action="Login.do?tabid=Invoice">
		<input type="hidden" name="actionType" value="">
		<div style="color: red">
		
	</div>
          <table align="right"  id="tableconteian"  cellspacing="0" cellpadding="5" width="35%">
			<tbody><tr>
				<td>
					<div style="color: red">
						<html:errors />
					</div>
				</td>
			</tr>
						
			<tr>
				<td>
					<table>
						<tbody><tr>
							<td><b> User ID :</b></td>
							<td>	 <html:text property="userName" />
						</td>
						</tr>
						<tr>
							<td><b> Password :</b></td>
							<td> <html:password property="password"/></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<table width="100%">
									<tbody><tr>
										<td>
										 <input type="submit"  class="imgClass" value="LOGIN">
<!-- 											<input type="checkbox" name="rememberMe" value="N" onclick="rememberMeStatus();" onchange="rememberMeStatus();" id="companyRememberId">&nbsp;Remember me. -->
										</td>
										<td>
											   
										</td>
									</tr>
									<tr>
										<td>
											<a href="http://216.116.104.10/bzcomposerweb2/recover.jsp"><span style="cursor: pointer; font-size:13px;">Forgot Password ?</span></a>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<a href="http://216.116.104.10/bzcomposerweb2/register.jsp"><span style="cursor: pointer; font-size:13px;">Sign Up</span></a>
										</td>
										<td></td>
									</tr>
									
								</tbody></table>
							</td>
						</tr>
					</tbody></table>
				</td>
			</tr>
		</tbody></table>  
		</html:form>
        </div>         --%>
      </div>
    </div>
    <!-- FINISH -->
  </div>
   <!-- FOOTER -->
  <!-- <div id="footer">
    <div id="footer_inner">
      <div class="copyright">© 2013 -<a href="http://www.bzcomposer.net"
					style="color:#05A9C5 ; text-decoration: none">BZComposer Web</a>. ®</div>
    
    </div>
  </div> -->
  <!-- FOOTER END -->
</div>

</body>
</html:html>


