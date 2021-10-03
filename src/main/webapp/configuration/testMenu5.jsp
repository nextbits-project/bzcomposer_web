<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;overflow:scroll;max-height: 900px;">
	<table class="tabla-listados" cellspacing="0">
		<tr onclick="SetRow1('tr1');" id="tr1">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config&&tab=tr1">
					<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/general.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config&&tab=tr1">
					<img id="img2" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/generalY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr2');" id="tr2">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config&&tab=tr2">
					<img id="img3" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/general.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config&&tab=tr2">
					<img id="img4" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/generalY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr3');" id="tr3">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config03&&tab=tr3">
					<img id="img5" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Accounting-&-Payment.png' style="display:block" />
				</a> 
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config03&&tab=tr3">
					<img id="img6" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Accounting-&-PaymentY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr4');" id="tr4">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config04&&tab=tr4">
					<img id="img7" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/NetworkSecurity.png' style="display:block" />
				</a> 
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config04&&tab=tr4">
					<img id="img8" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Network-&-SecurityY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr5');" id="tr5">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config05&&tab=tr5">
					<img id="img9" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Billing.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config05&&tab=tr5">
					<img id="img10" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/BillingY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr6');" id="tr6">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config6&&tab=tr6">
					<img id="img11" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/CustomerInvoice.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config6&&tab=tr6">
					<img id="img12" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Customer-&-InvoiceY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr7');" id="tr7">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config7&&tab=tr7">
					<img id="img13" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Estimation.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config7&&tab=tr7">
					<img id="img14" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/EstimationY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr8');" id="tr8">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config8&&tab=tr8">
					<img id="img15" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Inventory-Setting.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config8&&tab=tr8">
					<img id="img16" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Inventory-SettingY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr9');" id="tr9">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config9&&tab=tr9">
					<img id="img17" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/FormCustomization.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config9&&tab=tr9">
					<img id="img18" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Form-CustomizationY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr10');" id="tr10">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config10&&tab=tr10">
					<img id="img19" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/VendorPurchaseOrder.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config10&&tab=tr10">
					 <img id="img20" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Vendor-&-Purchase-OrderY.png' style="display:none" />
				 </a>
			 </td>
		</tr>
		<tr onclick="SetRow1('tr11');" id="tr11">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config11&&tab=tr11">
					<img id="img21"src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Employee.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config11&&tab=tr11">
					<img id="img22" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/EmployeeY.png' style="display:none" />
				</a>
			 </td>
		</tr>
		<tr onclick="SetRow1('tr12');" id="tr12">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config12&&tab=tr12">
					<img id="img23" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Tax.png' style="display:block" />
					</a>
					<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config12&&tab=tr12"> 
					<img id="img24" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/TaxY.png' style="display:none" />
					</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr13');" id="tr13">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config13&&tab=tr13">
					<img id="img25" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/reminder.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config13&&tab=tr13"> 
					<img id="img26" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/reminderY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr14');" id="tr14">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config14&&tab=tr14">
					<img id="img27" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Email-SetUp.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config14&&tab=tr14"> 
					<img id="img28" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Email-SetUpY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr15');" id="tr15">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config15&&tab=tr15">
					<img id="img29" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/shipping.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config15&&tab=tr15">
					<img id="img30" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/shippingY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr16');" id="tr16">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config16&&tab=tr16">
					<img id="img31" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/RMA.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config16&&tab=tr16">
					<img id="img32" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/RMAY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr17');" id="tr17">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config17&&tab=tr17">
				<img id="img33" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/eSales.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config17&&tab=tr17">
					<img id="img34" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/eSalesY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr18');" id="tr18">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config18&&tab=tr18">
					<img id="img35" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Payment-&-Received-Options.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config18&&tab=tr18"> 
					<img id="img36" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Payment-&-Received-OptionsY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr19');" id="tr19">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config19&&tab=tr19">
					<img id="img37" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/MySQL-Configuration.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config19&&tab=tr19">
					<img id="img38" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/MySQL-ConfigurationY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr20');" id="tr20">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config20&&tab=tr20">
					<img id="img39" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/device_manager.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config20&&tab=tr20">
					<img id="img40" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/device_managerY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow('tr21');" id="tr21">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config21&&tab=tr21">
					<img id="img41" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/payment_gateway.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config21&&tab=tr21">
					<img id="img42" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/payment_gatewayY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr22');" id="tr22">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config22&&tab=tr22">
					<img id="img43" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/PrinterSetup.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config22&&tab=tr22"> 
					<img id="img44" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/PrinterSetupY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr23');" id="tr23">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config23&&tab=tr23">
					<img id="img45" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/finance.jpg' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config23&&tab=tr23">
					<img id="img46" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/financeY.jpg' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr24');" id="tr24">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config24&&tab=tr24">
					<img id="img47" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/smtp.jpg' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config24&&tab=tr24">
					<img id="img48" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/smtpY.jpg' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr25');" id="tr25">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config25&&tab=tr25">
					<img id="img49" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/performance.png' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config25&&tab=tr25">
					<img id="img50" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/performanceY.png' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr26');" id="tr26">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config26&&tab=tr26">
					<img id="img51" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/service.jpg' style="display:block" /> 
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config26&&tab=tr26">
					<img id="img52" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/serviceY.jpg' style="display:none" />
				</a>
			</td>
		</tr>
		<tr onclick="SetRow1('tr27');" id="tr27">
			<td>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config27&&tab=tr27">
					<img id="img53" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/dashboard.png' style="display:block" />
				</a>
				<a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config27&&tab=tr27"> 
					<img id="img54" src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/dashboardY.png' style="display:none" />
				</a>
			</td>
		</tr>						
</table>
</div>
<script type="text/javascript">
var tab= <%= request.getParameter("tab") %>
	function EnableDisableFields(){
		if(document.configurationForm.mailAuth.checked==true){
			document.configurationForm.mailUserName.disabled=false;
			document.configurationForm.mailPassword.disabled=false;
		}
		else{
			document.configurationForm.mailUserName.disabled=true;
			document.configurationForm.mailPassword.disabled=true;
		}
	}
	
	function SetLabelName(lblid){
		size = document.getElementById('lblsize').value;
		for(cnt=0;cnt<size;cnt++){
			lid = document.getElementById(cnt+'lid').value;
			if(lblid == lid){
				document.configurationForm.labelName.value =  document.getElementById(cnt+'lname').value;
				break;
			}
		}
	}
	
	function init5()
	{
		if(tab)
		{		
			SetRow1(tab);
			setLogo();
			<logic:present name="EmpState">
				refreshItemsNow(document.configurationForm.empCountryID.value,'<bean:write name="EmpState"/>');
			</logic:present>
			EnableDisableFields();
		}
		else
		{
			SetRow('tr21');
			setLogo();
			<logic:present name="EmpState">
				refreshItemsNow(document.configurationForm.empCountryID.value,'<bean:write name="EmpState"/>');
			</logic:present>
			EnableDisableFields();
		}
	}
	
	function SetRow(rid)
	{
		setTableVisible(rid);
	}
	
	function SetRow1(tab)
	{
		var t1 = '<%= request.getParameter("tab") %>';
		setTableVisible1(t1);
	}
	
	function setTableVisible(rid)
	{
		if(rid=="tr21")
		{
			document.getElementById('paymentGateway').style.display='block';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='none';
			document.getElementById('img42').style.display='block';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
	}
	function setTableVisible1(t1)
	{
		if(t1=="tr21")
		{
			document.getElementById('paymentGateway').style.display='block';

			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='none';
			document.getElementById('img42').style.display='block';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
	}
	
	function SetRowColor(rid){
		for(i=1;i<=12;i++){
			var row1=document.getElementById("tr"+i);
			if(row1.className == "draft")
				row1.className = "draft";
			else
				row1.style.background  = '#FFFFFF';
		}
		var rd=document.getElementById(rid);
		rd.style.background = '#8798DE';
	}
	
	function SetRowColor(tab)
	{
		for(i=1;i<=12;i++)
		{
			var row1=document.getElementById(i);
			if(row1.className == "draft")
				row1.className = "draft";
			else
				row1.style.background  = '#FFFFFF';
		}
		var rd=document.getElementById(tab);
		rd.style.background = '#8798DE';
	}
	
	function setImagePreview(){
		pathv = document.configurationForm.invoiceDefaultLogo.value;
		image = document.getElementById('previewIMG');
		if(window.event){
			path = pathv.replace(/\\/, '/');
		}
		else{
			path = 'File:\/\/' + pathv;
		}
		image.src=path;
		image.style.display = 'block';
		image.style.width = "150px";
		image.style.height = "150px";
	}
	
	function setLogo()
	{
		image = document.getElementById('previewIMG');
		<logic:present name="path">
			<logic:present name="Image">
				<logic:notEmpty name="Image">
					path = '<bean:write name="path" scope="session" property="pathvalue"/>/uploadedImages/'+
						'<bean:write name="Image"/>';
					path = path.replace(/\\/, '/');
					image.src=path;
					image.style.display = 'block';
					image.style.width = "150px";
					image.style.height = "150px";
				</logic:notEmpty>
			</logic:present>
		</logic:present>
	}
</script>
