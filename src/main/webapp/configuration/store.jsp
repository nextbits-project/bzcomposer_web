<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<%@include file="/include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<bean:write name="path" property="pathvalue"/>/styles/form.css" media="screen" rel="Stylesheet" type="text/css" /> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> 
<title><bean:message key="BzComposer.esalesaccountmanagertitle"/></title>
<!-- jQuery Modal -->


<style type="text/css">
.modal1 {
    overflow: visible;
    height: auto;
    vertical-align: top;
}
</style>
<script type="text/javascript">
function Close()
{
	window.close();
}
$(function () 
{
	$("#get_file").change(function () 
	{
	        $("#logoImage").html("");
	        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
	        if (regex.test($(this).val().toLowerCase())) 
	        {
	            if ($.browser.msie && parseFloat(jQuery.browser.version) <= 5.0) 
	            {
	                $("#logoImage").show();
	                $("#logoImage")[0].filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = $(this).val();
	            }
	            else
	            {
	                if (typeof (FileReader) != "undefined") 
	                {
	                    $("#logoImage").show();
	                    $("#logoImage").append("<img />");
	                    var reader = new FileReader();
	                    reader.onload = function (e) 
	                    {
	                        $("#logoImage img").attr("src", e.target.result);
	                        $("#logoImage img").attr("height", "50px;");
	                        $("#logoImage img").attr("width", "50px;");
	                    }
	                    reader.readAsDataURL($(this)[0].files[0]);
	                } else 
	                {
	                    alert("This browser does not support FileReader.");
	                }
	            }
	        } 
	        else 
	        {
	            alert("Please upload a valid image file.");
	        }
	    });
	    
	    $("#removeLogo").click(function()
	    {
	    	var r = confirm("Do you really want to remove the logo?");
	    	if(r)
	    	{
	    		$("#logoImage Img").remove();
	    	}
	    });
});
function showTime()
{
	var h = document.getElementById("hours").value;
	var m = document.getElementById("minutes").value;
	var t = document.getElementById("selectedTime").value;
	if(h>=0 && h<10)	
	{
		h = "0"+h;
	}
	if(m>=0 && m<10)	
	{
		m = "0"+m;
	}
	var time = h+" : "+ m +" "+ t;
	$("#scheduleTime1").append("<option value=" + time + ">"+ time + "</option>");
}
function removeTime()
{
	$('#scheduleTime1 option:selected').remove();
}

function showStore()
{
	var selectedStoreTypeId = $('#selectedStoreTypeId :selected').val();
	window.open("Configuration.do?tabid=showStore1&&selectedStoreTypeId="+selectedStoreTypeId,null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no" );
}

function setRecords()
{
	document.getElementById("storeName").style.display = "block";
	document.getElementById("storeName1").style.display = "none";
	
	//document.getElementById("policy").style.display = "none";
	//document.getElementById("policy1").style.display = "block";
	//document.getElementById("policy1").value="Hello";
}
</script>
<style type="text/css">
.logoImage
{
    filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
   	height: 50px;
    width: 50px;
    display: none;
}
</style>
</head>
<body>
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
<div>
<div id="table-negotiations">
		<table cellspacing="0" style="width: 100%; overflow-y: scroll;" class="section-border">
			<tr>
				<td valign="top" style="width: 20%;">
					<table style="width:auto;">
						<tr>
							<td style="width:auto;">
								<bean:message key="Bizcomposer.Configuration.storeType"/>
							</td>
							<td style="font-size:1em;">
								<select id="selectedStoreTypeId" onchange="showStore()">
									<logic:present name="configurationForm" property="listOfExistingStoreType"> 
										<logic:iterate name="configurationForm" id="objList1" property="listOfExistingStoreType" scope="session">
											<option value="<bean:write name='objList1' property='storeTypeId' />"><bean:write name="objList1" property="storeTypeName" /></option>
										</logic:iterate>
									</logic:present> 
								</select>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="width:auto;">
								<fieldset>
									<div>
										<table>
											<tr>
												<td rowspan="5" style="font-size: 1em;">
													<bean:message key="Bizcomposer.Configuration.store"/>
													<br>
													<!-- <select id="sores" style="height:300px;;width:auto;">
														<option>cdrmousa</option>
													</select> -->
													<html:select property="selectedStoreId" multiple="multiple" style="height: 300px; width:100px;font-size:1em;">
														<logic:present name="configurationForm" property="listOfExistingStores"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingStores" scope="session">
																<option value="<bean:write name='objList1' property='storeId' />" onclick="setRecords()"><bean:write name="objList1" property="storeName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
													<%-- <html:textarea property="storeName">
														<bean:write name="objList1" property="storeName" />
													</html:textarea> --%>
												</td>
												<td align="center" style="font-size:1em;">
													<bean:message key="Bizcomposer.Configuration.storeName"/>
													&nbsp;&nbsp;
													<logic:present name="configurationForm" property="listOfExistingStores" scope="session">
														
													<input type="text" id="storeName" name="storeName" value="<bean:write name="objList1" property="storeName" />" style="display: none;font-size:1em;">
													<%-- <html:text property="storeName">
														
													</html:text> --%>
														
													</logic:present>
													<input type="text" id="storeName1" name="storeName1" style="display: block;font-size:1em;	">
												</td>
												<td align="center" style="font-size:1em;">
													<bean:message key="Bizcomposer.Configuration.abbreviation"/>
													&nbsp;&nbsp;
													<input type="text" id="abbreviation" name="abbreviation" style="font-size:1em;">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<input type="checkbox" id="defaultStore" name="defaultStore" style="font-size:1em;">
													<bean:message key="Bizcomposer.Configuration.defaultStore"/>
													<br>
													&nbsp;&nbsp;&nbsp;<input type="checkbox" id="active" name="active" style="font-size:1em;" checked>
													<bean:message key="Bizcomposer.Configuration.active"/>
												</td>
											</tr>
											<tr>
												<td align="center">
													<p style="font-size:1em;"><bean:message key="Bizcomposer.Configuration.storeInformation"/></p>
														<div style="font-size:1em;">
															<textarea rows="3" cols="3" style="width:250px;"></textarea>
															<br>
																<button type="button" class="formbutton" data-toggle="modal" data-target="#addressModal">
																<bean:message key="Bizcomposer.Configuration.editAddress"/>
																</button>
																
																 <!-- Modal -->
  																<div class="modal fade" id="addressModal" role="dialog">
    																<div class="modal-dialog modal-lg">
    																	<!-- Modal content-->
      																	<div class="modal-content">
        																	<div class="modal-header">
          																		<button type="button" class="close" data-dismiss="modal">&times;</button>
          																		<h4 class="modal-title">Address Confirmation</h4>
        																	</div>
        																	<div class="container" style="width:350px;">
          																		<table border="1" style="width:400px;height:400px;text-align: center;">
          																			<tr>
          																				<td colspan="2" align="center">
          																					<bean:message key="BzComposer.Email.Address"/>
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Companyinformation.CompanyName"/>
          																				</td>
          																				<td>
          																					<input type="text" id="companyName" name="companyName">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.FirstName"/>
          																				</td>
          																				<td>
          																					<input type="text" id="firstName" name="firstName">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.LastName"/>
          																				</td>
          																				<td>
          																					<input type="text" id="lastName" name="lastName">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.Address1"/>
          																				</td>
          																				<td>
          																					<input type="text" id="Address1" name="Address1">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.Address2"/>
          																				</td>
          																				<td>
          																					<input type="text" id="Address2" name="Address2">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<!-- City -->
          																					<bean:message key="MultiUserForm.city"/>
          																				</td>
          																				<td>
          																					<input type="text" id="city" name="city">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<!-- State -->
          																					<bean:message key="MultiUserForm.state"/>
          																				</td>
          																				<td>
          																					<select id="state">
          																					<%-- <logic:iterate id="state" collection="state">
          																					</logic:iterate> --%>
          																					<option></option>
          																					<option>AK</option>
          																					<option>Al</option>
          																					</select>
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<!-- ZipCode -->
          																					<bean:message key="BzComposer.Vendor.ZipCode"/>
          																				</td>
          																				<td>
          																					<input type="text" id="zipcode" name="zipcode">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Companyinformation.Province"/>
          																				</td>
          																				<td>
          																					<input type="text" id="province" name="province">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Companyinformation.Country"/>
          																				</td>
          																				<td>
          																					<html:select property="selectedCountryId" onchange="disable()">
																								<option value="0"></option>
																								<logic:present name="configurationForm" property="listOfExistingCountry"> 
																									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCountry" scope="session">
																										<option value="<bean:write name='objList1' property='countryId' />"><bean:write name="objList1" property="countryName" /></option>
																									</logic:iterate>
																								</logic:present> 
																							</html:select>
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Configuration.telephone"/>
          																				</td>
          																				<td>
          																					<input type="text" id="telephone" name="telephone">
          																				</td>
          																			</tr>
          																			<tr>
          																				<td>
          																					<bean:message key="BzComposer.Vendor.Fax"/>
          																				</td>
          																				<td>
          																					<input type="text" id="fax" name="fax">
          																				</td>
          																			</tr>
          																		</table>
       																		</div>
        																	<div class="modal-footer">
        																		<button type="button" class="formbutton">Confirm</button>
          																		<button type="button" class="formbutton" data-dismiss="modal">Close</button>
        																	</div>
      																	</div>
      																</div>
  																</div>
														</div>
												</td>
												<td>
													<p style="font-size:1em;">
														<bean:message key="Bizcomposer.Configuration.storeLogoImage"/>
													</p>
														<div>
															<div id="logoImage" class="logoImage" style="height: 50px; width: 50px;"></div>
															<!-- <textarea id="logoImage" rows="3" cols="3" ></textarea> -->
															<br>
															<%-- <input type="button" class="file" name="attachement" onclick="(this.type='file')" class="formbutton" onmouseout="(this.type='button')" accept="image/*" value="<bean:message key="Bizcomposer.Configuration.addLogo"/>"> --%>
															<input type="file" id="get_file" onclick="(this.type='file')" onmouseout="(this.type='button')" class="formbutton" value="<bean:message key="Bizcomposer.Configuration.addLogo"/>" accept="image/*"> 
															&nbsp;&nbsp;
															<input type="button" id="removeLogo" name="removeLogo" class="formbutton" value="<bean:message key="Bizcomposer.Configuration.removeLogo"/>">
														</div>
												</td>
												<td>
													<p style="font-size:1em;">
														<bean:message key="Bizcomposer.Configuration.scheduleTimeForItemUploading"/>
													</p>
														<div style="font-size:1em;">
															<bean:message key="Bizcomposer.Configuration.scheduleTimeForItemUploadingEamples"/>
															<br>
															<select id="scheduleTime1" name="scheduleTime1" multiple="multiple" style="width: 180px;font-size:1em;">
															</select>
															<br>
															<%-- <a href="#myModal1" rel="modal:open">
															<input type="button" id="Add" name="Add" class="formbutton" 
															value="<bean:message key="BizComposer.Configuration.ManageServiceType.Add"/>" data-toggle="modal" data-target="#modal">
															</a> --%>
															<a href="#m1" rel="modal:open">
																<button type="button" class="formbutton" style="font-size: 1em;width:60px;" data-toggle="modal" data-target="#modal">
																	Add
																</button>
															</a>
															&nbsp;&nbsp;
															<input type="button" id="Remove" name="Remove" class="formbutton" value="<bean:message key="BzComposer.Vendor.Service.Delete"/>" onclick="removeTime()">
														</div>
														<!-- Modal -->
  														<div id="m1" class="modal modal1">
  													<div id="container">
  														<div id="title" style="text-align: center;font-size:1.2em;">
  														<h3><bean:message key="BizComposer.Configuration.selectTime"/></h3>
  														</div>
  														<div id="container">
  															<div class="row" align="center">
  																<table style="text-align: center; width: 600px;">
  																	<tr>
  																		<td style="font-size: 1em;">
  																			<b><bean:message key="BizComposer.Configuration.time"/></b>
  																		</td>
  																		<td style="font-size: 1em;">
  																			<select id="hours">
  																				<option value="1">1</option>
  																				<option value="2">2</option>
  																				<option value="3">3</option>
  																				<option value="4">4</option>
  																				<option value="5">5</option>
  																				<option value="6">6</option>
  																				<option value="7">7</option>
  																				<option value="8">8</option>
  																				<option value="9">9</option>
  																				<option value="10">10</option>
  																				<option value="11">11</option>
  																				<option value="12">12</option>
  																			</select>	
  																		</td>
  																		<td style="font-size: 1em;">
  																			<select id="minutes"> 
  																				<option value="0">0</option>
  																				<option value="1">1</option>
  																				<option value="2">2</option>
  																				<option value="3">3</option>
  																				<option value="4">4</option>
  																				<option value="5">5</option>
  																				<option value="6">6</option>
  																				<option value="7">7</option>
  																				<option value="8">8</option>
  																				<option value="9">9</option>
  																				<option value="10">10</option>
  																				<option value="11">11</option>
  																				<option value="12">12</option>
  																				<option value="13">13</option>
  																				<option value="14">14</option>
  																				<option value="15">15</option>
  																				<option value="16">16</option>
  																				<option value="17">17</option>
  																				<option value="18">18</option>
  																				<option value="19">19</option>
  																				<option value="20">20</option>
  																				<option value="21">21</option>
  																				<option value="22">22</option>
  																				<option value="23">23</option>
  																				<option value="24">24</option>
  																				<option value="25">25</option>
  																				<option value="26">26</option>
  																				<option value="27">27</option>
  																				<option value="28">28</option>
  																				<option value="29">29</option>
  																				<option value="30">30</option>
  																				<option value="31">31</option>
  																				<option value="32">32</option>
  																				<option value="33">33</option>
  																				<option value="34">34</option>
  																				<option value="35">35</option>
  																				<option value="36">36</option>
  																				<option value="37">37</option>
  																				<option value="38">38</option>
  																				<option value="39">39</option>
  																				<option value="40">40</option>
  																				<option value="41">41</option>
  																				<option value="42">42</option>
  																				<option value="43">43</option>
  																				<option value="44">44</option>
  																				<option value="45">45</option>
  																				<option value="46">46</option>
  																				<option value="47">47</option>
  																				<option value="48">48</option>
  																				<option value="49">49</option>
  																				<option value="50">50</option>
  																				<option value="51">51</option>
  																				<option value="52">52</option>
  																				<option value="53">53</option>
  																				<option value="54">54</option>
  																				<option value="55">55</option>
  																				<option value="56">56</option>
  																				<option value="57">57</option>
  																				<option value="58">58</option>
  																				<option value="59">59</option>
  																			</select>
  																		</td>
  																		<td style="font-size: 1em;">
  																			<select id="selectedTime">
  																				<option value="AM">AM</option>
  																				<option value="PM">PM</option>
  																			</select>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td>
  																		</td>
  																		<td style="font-size: 1em;">
  																			<b>[Hours]</b>
  																		</td>
  																		<td style="font-size: 1em;">
  																			<b>[Min]</b>
  																		</td>
  																		<td>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td colspan="2" style="font-size: 1em;">
  																			<input type="submit" id="ok" style="width:90px;"  name="ok" class="formbutton" value="Ok" onclick="showTime()">
  																		</td>
  																		<td colspan="2" style="font-size: 1em;">
  																			<a href="#m2" rel="modal:close"><input type="reset" id="cancel" style="width:90px;" name="cancel" class="formbutton" value="Cancel"></a>
  																		</td>
  																	</tr>
  																</table>
  															</div>
  														</div>
  													</div> 
												</div>	
														<!-- Modal Ends -->
													
												</td>
											</tr>
											<tr>
												<td align="center" style="font-size:1em;">
													<bean:message key="Bizcomposer.Configuration.storeEmail"/>
													&nbsp;&nbsp;
													<input type="text" id="storeEmail" name="storeEmail" style="font-size:1em;">
												</td>
											</tr>
											<tr>
												<td align="center" style="font-size:1em;">
													<bean:message key="Bizcomposer.Configuration.returnPolicy"/>
													<br>
													<logic:present name="configurationForm" property="listOfExistingStores" scope="session">
													<input type="text" id="policy1" rows="3" cols="3" style="display:none;font-size: 1em;" value="<bean:write name="objList1" property="returnPolicy"/>">
														<%-- <html:textarea property="returnPolicy"></html:textarea> --%>
													</logic:present>
													
													<textarea id="policy" style="width:500px;display: block;font-size:1em;"></textarea>
												</td>
											</tr>
											<tr>
												<td align="center">
													<p style="font-size:1em;">
														<bean:message key="Bizcomposer.Configuration.filePath"/>
													</p>
													<div align="center" style="font-size:1em;">
														<bean:message key="Bizcomposer.Configuration.chooseDataStoreFormat"/>
														&nbsp;&nbsp;
														<select id="dataSourceFormat">
															<option>CSV Comma Separated(*.csv)</option>
															<option>Text File(*.txt)</option>
														</select>
														<br>
															<input type="file" id="dataSource" name="dataSource">
														</div>
												</td>
											</tr>
										</table>
									</div>
								</fieldset>
							</td>
						</tr>
						<tr>
							<td align="right">
								<button id="submit" class="formbutton"><bean:message key="BzComposer.global.save"/></button>
								<button id="reset" class="formbutton"><bean:message key="BzComposer.configuration.remove"/></button>
								<button id="clear" class="formbutton"><bean:message key="BzComposer.global.clear"/></button>
								<button id="close" onclick="Close()" class="formbutton"><bean:message key="BzComposer.global.close"/></button>
								<br>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>	
						</tr>
					</table>
				</td>
			</tr>
		</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</html:form>
</body>
</html>