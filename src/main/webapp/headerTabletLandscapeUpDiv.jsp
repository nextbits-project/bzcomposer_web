<!-- <div class="container-fluid"> -->
<div align="center">
	<div class="logo" style="max-width: 100%;">
		<a href="index.jsp"> 
			<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" style="max-width: 100%"/>
		</a>
	</div>
</div>
<!-- <div class="contact-widget contact-widget-1"> -->
<div align="center">
	<input type="text" name="searchbox" placeholder="Search for keyword or Items" style="max-width: 100%;" />
	<button class="btn btn-primary">Search</button>
</div>
<div align="center">
	<button type="button" class="btn btn-primary" onclick="redirectToLogin()">Login</button>
	<button type="button" class="btn btn-primary" onclick="openRegisterPage()">Register</button>
	<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
		<span class="hamburger-box"> <span class="hamburger-inner"></span></span>
	</button>	
</div>
<!-- </div> -->