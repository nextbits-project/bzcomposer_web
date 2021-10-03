<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="java.util.*" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin.css" media="screen" rel="Stylesheet"
	type="text/css">
<link href="styles/form.css" media="screen" rel="Stylesheet"
	type="text/css">
<link href="styles/basic.css" media="screen" rel="Stylesheet"
	type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Philosopher:400,700,400italic,700italic&subset=cyrillic,latin' rel='stylesheet' type='text/css'>
	
<script src="scripts/prototype.js" type="text/javascript"></script>
<script src="scripts/effects.js" type="text/javascript"></script>
<script src="scripts/dragdrop.js" type="text/javascript"></script>
<script src="scripts/controls.js" type="text/javascript"></script>
<script src="scripts/application.js" type="text/javascript"></script>
<title>BzComposer</title>
<style type="text/css">
<!--
.style1 {
	color: #D4D0C8
}
-->

#login-bzc{
background-image: url("images/slide3.png")  ;
background-position: center;
background-repeat: no-repeat;
width: 1200px;
/* height: 574px; */

height:80%;
/* -webkit-box-shadow: 0 10px 80px 0 rgba(0, 0, 0, 0.20); */
/* -moz-box-shadow: 0 10px 80px 0 rgba(0, 0, 0, 0.20); */
/* box-shadow: 0 10px 80px 0 rgba(0, 0, 0, 0.20); */
}

#logo-bzc{
background-image: url("images/bzcweb.jpg");
background-position: center;
background-repeat: no-repeat;
width: 289px;
height: 97px;
}
div#header {
	background: #05A9C5;
	border-bottom: 1px solid #05A9C5;
}
div#login-box div.padding label {
display: block;
color:  #05A9C5;
font-size: .9em;
font-weight: bold;
}
.imgClass { 
    background-image: url("images/submitbtn.jpg");
    background-position:  0px 0px;
    background-repeat: no-repeat;
    width: 70px;
    height: 30px;
    border: 0px;
    overflow: hidden;
    text-indent:-9999px;
    background-color:  #05A9C5;
      cursor: pointer;

}
.imgClass:hover{ 
      background-position:  0px -2px;
        cursor: pointer;
}
div#login-box div.padding h3 {
font-size: 1.4em;
font-weight: normal;
color: #333;
margin: 0 0 10px 0;
font-family: 'Philosopher',Geneva, Arial, Helvetica, sans-serif;
font-weight: bold;
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
<body style="background-color: white;">
	<!-- begin shared/header -->
	<div id="header">
		<div id="header-content">
			<ul id="ulnav">
				<li><a href="http://bzcomposer.net/"   target="_blank"  title="BzComposer" rel="section"
					class="selected">Home</a></li>
				<li><a href="http://216.116.104.9/bzcomposerweb/register.jsp" title="Register" rel="section">Register</a></li>
<!-- 				<li><a href="help.htm" title="Help" rel="section">FAQ</a></li> -->
<!-- 				<li><a href="" title="Conact us" rel="section">Contact</a></li> -->
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end shared/header -->
	<div id="cos-login">
		<!-- begin promotion login -->
	
	<div id="login-bzc">
	
	<div id="login-box" style="padding-top: 17%;padding-left: 10%;">
	<div style="color: red">
		<html:errors />
	</div>
			<div class="hoja-login">
				<div class="padding">
					<h3>Member Log in</h3>

					<html:form action="Login.do?tabid=PurchaseOrder">
						<!-- <input type="hidden" name="tabid" value="PurchaseOrder"> -->
						<label>Login Name <html:text property="userName" />
						</label>
						<label>Password <html:password property="password" />
						</label>
						<p>
<%-- 							<html:submit />  --%>
                     <input type="submit"  class="imgClass">
						</p>
					</html:form>
					<p>
						Forgot your password?, <a href="recover.jsp">You can recover it easily</a>
					</p>
				</div>
			</div>
			<div class="fondo-sombra"></div>
		</div>
	</div>
	
<%

Calendar cal=Calendar.getInstance();
int year=cal.get(Calendar.YEAR);

%>		
		

		<div class="clear"></div>

		<!-- begin shared/footer -->
		<div id="pie">
			<p align="center">
				Copyright <%=year%> <a href="http://www.bzcomposer.net"
					style="color: #05A9C5; text-decoration: none">BZComposer Web</a>. All
				Rights Reserved. 
			</p>
		</div>
		<!-- end shared/footer -->
	</div>	


</body>
</html:html>
