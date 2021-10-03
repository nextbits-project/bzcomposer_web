<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<html:html>
<head>
<title>Forgot your Password?</title>
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
</head>
<body>

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
	<li><a href="index.jsp" title="BizComposer" rel="section">Home</a></li>
	<li><a href="register.jsp" title="Register" rel="section"
		class="selected">Register</a></li>
	<li><a href="help.htm" title="Help" rel="section">FAQ</a></li>
	<li><a href="" title="Contact" rel="section">Contact</a></li>
</ul>
<!-- end shared/nav_public -->

<div class="clear"></div>

</div>

</div>

<!-- end shared/header -->

<div id="breadcrumb">

<h1>To reset your password type your login id.</h1>

<div class="clear"></div>

</div>


<div id="cos">

<div class="statusquo ok">

<div id="hoja">
<div id="blanquito">
<div id="padding">
	<div style="color: red">
		<html:errors />
	</div>
<!-- <form action="/Register" method="post" name="login"
	onSubmit="return v.exec()"> -->
	
	<html:form action="Recover">

							

								<table cellpadding="0" cellspacing="0" border="0" width="80%"
									align="center" bgcolor="white">
									<tr>
										<td width="8"><img src="images/blue1_l.gif" alt=""
											width="8" height="23" border="0">
										</td>
										<td background="images/blue1_m.gif" nowrap>User
											Registration</td>
										<td width="8"><img src="images/blue1_r.gif" alt=""
											width="8" height="23" border="0">
										</td>
										<td background="images/table_bg.gif" width="100%">&nbsp;</td>
										<td background="images/table_bg.gif"><img
											src="images/pixel.gif" width="10" height="1" border="0">
										</td>
									</tr>
									<tr>
										<td background="images/line_l.gif"><img
											src="images/pixel.gif" border="0">
										</td>
										<td colspan="3"><img src="images/pixel.gif" width="1"
											height="10" border="0"><br>
											<table cellpadding="0" cellspacing="0" border="0"
												width="100%">
												<tr>
													<td bgcolor="#DBEAF5">
														<table cellspacing="1" cellpadding="2" border="0"
															width="100%">

															<tr bgcolor="#ffffff">
																<td id="t_email">&nbsp;Your User Name:<span
																	class="inputHighlighted">*</span>
																</td>
																<td>
																	
																	<html:text property="userName" size="35" maxlength="20"/>
																</td>
																<td><a href="javascript:" class="tooltip_text"
																	onmousemove="showToolTip(event,'Enter your User Name.');return false"
																	onmouseout="hideToolTip()"><img src="images/q.gif"
																		border="0" width="20" height="20">
																</a>
																</td>
															</tr>

															<tr bgcolor="#ffffff">
																<td id="t_uname" width="40%">&nbsp;Password Hint:<span
																	class="inputHighlighted">*</span>
																</td>
																<td width="50%">
																	<!-- <input type="text" name="userID" size="10"
							class="ctrl"> --> <input type="text" name="passwordHint"
																	size="10" class="ctrl"></td>
																<td><a href="javascript:" class="tooltip_text"
																	onmousemove="showToolTip(event,'enter your password hint.');return false"
																	onmouseout="hideToolTip()"><img src="images/q.gif"
																		border="0" width="20" height="20">
																</a>
																</td>
															</tr>
															<tr bgcolor="#ffffff">
																<td id="t_email">&nbsp;Password Answer:<span
																	class="inputHighlighted">*</span>
																</td>
																<td><input type="text" name="passwordAnswer"
																	size="35" class="ctrl">
																</td>
																<td><a href="javascript:" class="tooltip_text"
																	onmousemove="showToolTip(event,'Enter your password answer.');return false"
																	onmouseout="hideToolTip()"><img src="images/q.gif"
																		border="0" width="20" height="20">
																</a>
																</td>
															</tr>
														</table></td>
												</tr>
											</table> <img src="images/pixel.gif" width="1" height="10" border="0"><br>
											<div align="center" id="error_registration"
												style="display: block;"></div></td>
										<td background="images/line_r.gif"><img
											src="images/pixel.gif" border="0">
										</td>
									</tr>
									<tr>
										<td colspan="5" bgcolor="#4682B4"><img
											src="images/pixel.gif" width="1" height="1" border="0">
										</td>
									</tr>
									<tr>
										<td colspan="5" align="right">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="btn" width="1"><input type="image"
														src="images/submit1.gif" alt="" width="79" height="22"
														border="0" name="Submit">
														
														<html:submit>  Submit </html:submit>
              
               
														</td>
													<!-- 					 <input type="submit" value="submit" /> -->
												</tr>
											</table></td>
									</tr>
								</table>
						</html:form>
</div>
</div>
</div>
</div>
</div>

<div class="clear"></div>

<!-- begin shared/footer -->
<div id="pie">
<p align="center">Copyright 2000-2006 <a href="http://www.BizComposer"
	style="color:#fff; text-decoration:none">BizComposer</a>, Inc. All
Rights Reserved.</p>
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
