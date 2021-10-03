<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.esalestitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
	
<!-- jQuery Modal -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style type="text/css">
.modal1 {
    overflow: visible;
    height: auto;
    vertical-align: top;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
		$("#tabs1").tabs();
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
		$("#scheduleTime").append("<option value=" + time + ">"+ time + "</option>");
	}
	function removeTime()
	{
		$('#scheduleTime option:selected').remove();
	}
	
	function setStoreTypeName()
	{
		//alert("<bean:message key='BzComposer.configuration.esales.selectesalesstore'/>");
		return selectstoredialog();
	}
	function setLeftToRight()
	{
		//alert("inside setLeftToRight function");
		debugger
		var category = $.trim($("#eBayCategorySelect option:selected").text());
		var categoryId = $.trim($("#eBayCategorySelect option:selected").val());
		debugger
		var optionsAvailable = $('#defaultCategorySelect').find("option[value='"+categoryId+"']").val();
		var isActive = $.trim($('select[id="eBayCategorySelect"]').find('option[id="'+category+'"]').val());
		if(categoryId != optionsAvailable && isActive == "1")
		{
			/*var o = new Option(categoryId,category);
			$(o).html(category);
			$("#defaultCategorySelect").append(o);*/
			$('#defaultCategorySelect')
	         .append($("<option></option>")
	                    .attr("value",categoryId)
	                    .text(category)); 
		}
	}
	
	function setCategoryRightToLeft()
	{
		var value = $.trim($("#defaultCategorySelect option:selected").text());
		$("#r2l").attr('disabled',false);
	}
	
	function setRightToLeft()
	{
		$("#defaultCategorySelect option:selected").remove();
	}
	
	function setDefaultCategory()
	{
		debugger
		var category = $.trim($("#eBayCategorySelect option:selected").text());
		debugger
		var isActive = $.trim($('select[id="eBayCategorySelect"]').find('option[id="'+category+'"]').val());
		debugger
		//alert("Selected Category:"+category+"\nis Active?:"+isActive);
		if(isActive == 0)
		{
			$("#eBayCategorySelect option:selected").attr('readonly',true);
		}
		else
		{
			$("#eBayCategorySelect option:selected").attr('readonly',false);
			$("#l2r").attr('disabled',false);
		}
	}
	
	function showStore()
	{
		//alert("inside showStore")
		window.open("Configuration.do?tabid=showStore",null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no" );
	}
	
	function setDiv()
	{
		var value = $("#stores option:selected").val();
		//alert("selected Value:"+value);
		if(value == 39)
		{
			document.getElementById("forOnlineOption").style.display = "block";
			document.getElementById("forCdromusaOption").style.display = "none";
		}
		else
		{
			document.getElementById("forOnlineOption").style.display = "none";
			document.getElementById("forCdromusaOption").style.display = "block";
		}
	}
	function seteSalesStores()
	{
		$('select[id="eSalesChannels"]').find('option').attr("selected",false);
		var eSalesStore = $.trim($("#eSalesStoreId option:selected").text());	//selected select option value
		var selectedeSalesStore = $.trim($("#eSalesStoreId option:selected").val()); //selected select option id
		var ab = $.trim($('select[id="eSalesStoreId"]').find('option[id="'+selectedeSalesStore+'"]').val());	//abbreviation of selected option 
		
		var storeChannel = $.trim($('select[id="eSalesStoreId"]').find('option[id="'+eSalesStore+'"]').val());
		
		//alert("Selected eSales Store Value:"+eSalesStore+"\nId is:"+selectedeSalesStore+"\nAbbreviation is:"+ab+"\nStoreType Id is:"+storeChannel);
		
		$('select[id="eSalesStoreId"]').find('option[id="'+selectedeSalesStore+'"]').attr("selected",true);
		$('select[id="eSalesStoreId"]').find('option[id="'+eSalesStore+'"]').attr("selected",true);
		$('select[id="eSalesChannels"]').find('option[id="'+storeChannel+'"]').attr("selected",true);
		
		$("#storeTypeName").val(eSalesStore);
		$("#eSalesAbbreviation").val(ab);
		
	}
	
	function clearFields()
	{
		$("#storeTypeName").val("");
		$("#eSalesAbbreviation").val("");
		$("#btnAddeBayCategory").attr('disabled',false);
	}
	
	/*
	commented on 24-11-2019 to prevent alert message
	function addeBayCategory()
	{
		alert("Inside addeBayCategory")
	} */
</script>
</head>
<!-- <body onload="init3();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.configuration.configurationtitle"/>
	</span>
</div>
<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" />
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
				<logic:iterate name="Labels" id="lbl" indexId="index">
					<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
					<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
				</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations">
		<table cellspacing="0" style="width: 100%; overflow-y: scroll;" class="section-border">
			<tr>
				<td valign="top" style="width: 20%;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu3.jsp" %> --%>
								<%-- <%@include file="menuPage.jsp" %> --%>
								<jsp:include page="menuPage.jsp"></jsp:include>
								<%-- <div id="table-negotiations" style="width: 185px; padding-left: 10px; overflow-y: auto; max-height: 597px;">
									<%@include file="testMenu3.jsp"%>
								</div> --%>
							</td>
						</tr>
						<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();"
									value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();"
									value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%; padding-right: 4%;">
					<!-- Sales & Customer Starts -->
					<div id="sales" class="eSalesWrap" style="display: none;">
						<div id="tabs1" style="height: 950px;">
							<ul>
								<li style="font-size: 1.2em;"><a href="#eSales">
									<bean:message key="BzComposer.configuration.tab.esales" /></a>
								</li>
								<li style="font-size: 1.2em;"><a href="#eSalesChannelSettings">
									<bean:message key="BzComposer.configuration.tab.esaleschannelsettings" /></a>
								</li>
								<li style="font-size: 1.2em;"><a href="#othereSalesSettings">
									<bean:message key="BzComposer.configuration.tab.otheresalessetting" /></a>
								</li>
								<li style="font-size: 1.2em;"><a href="#eSalesCategory">
									<bean:message key="BzComposer.configuration.tab.esalescategory" /></a>
								</li>
								<li style="font-size: 1.2em;"><a href="#itemUploadSetting">
									<bean:message key="BzComposer.configuration.tab.itemuploadsetting" /></a>
								</li>
							</ul>
							<div id="eSales" class="tabPage">
								<div class="p-3">
									<h3 class="mt-0" style="font-size: 1.2em;">
										<bean:message key="BzComposer.configuration.esalesimportconfig"/>
									</h3>
									<div class="form-check" style="font-size: 1em;">
										<html:checkbox property="isEnable" style="class:form-check-input">
											<label class="form-check-label" for="enabledEsales">
												<bean:message key="BzComposer.configuration.enabledesales"/>
											</label>
										</html:checkbox>
									</div>
									<fieldset>
										<legend class="h6" style="font-size: 1.2em;">
											<b><bean:message key="BzComposer.configuration.datetimeintervalsettings"/></b>
										</legend>
										<div class="form-check" style="font-size: 1em;">
											<html:checkbox property="useCurrentTime" style="class:form-check-input">
												<label class="form-check-label" for="useCurrentTime">
													<bean:message key="BzComposer.configuration.usecurrenttimeinandimportorder"/>
												</label>
												<html:select property="importDays">
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
												</html:select>
													<bean:message key="BzComposer.configuration.days"/>
											</html:checkbox>
										</div>
										<div class="form-check" style="font-size: 1em;">
											<html:checkbox property="alloweSalesOnline" style="class:form-check-input">
												<label class="form-check-label" for="alloweSalesOnline">
													<bean:message key="BzComposer.configuration.allowesalesonlineimport"/>
												</label>
											</html:checkbox>
										</div>
										<div class="form-inline mt-2 align-items-start">
											<div class="form-inline mb-2">
												<label for="scheduleTimes" class="" style="font-size: 1em;">
													<bean:message key="BzComposer.configuration.scheduletimes"/> : 
												</label>
											</div>
											<div class="form-inline mx-sm-3 mb-2" style="font-size: 1em;">
												<select id="scheduleTime" name="scheduleTime" multiple="multiple" style="width: 180px;">
												</select>
											</div>
											<div class="form-inline mx-sm-3 mb-2 d-block">
												<p>
													<br>
													<a href="#m1" rel="modal:open">
														<button type="button" class="formbutton" style="font-size: 1em;width:60px;" data-toggle="modal" data-target="#modal">
															<bean:message key="BzComposer.global.add"/>
														</button>
													</a>
													<br><br>
													<button type="button" class="formbutton" style="font-size: 1em;width:60px;" onclick="removeTime()">
														<bean:message key="BzComposer.configuration.remove"/>
													</button>
												</p>
												<div id="m1" class="modal modal1">
  													<div id="container">
  														<div id="title" style="text-align: center;font-size:1.2em;">
  														<h3><bean:message key="BzComposer.configuration.selecttime"/></h3>
  														</div>
  														<div id="container">
  															<div class="row" align="center">
  																<table style="text-align: center; width: 600px;">
  																	<tr>
  																		<td style="font-size: 1em;">
  																			<b><bean:message key="BzComposer.configuration.time"/> :</b>
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
  																				<option value="AM">
  																					<bean:message key="BzComposer.configuration.am"/>
  																				</option>
  																				<option value="PM">
  																					<bean:message key="BzComposer.configuration.pm"/>
  																				</option>
  																			</select>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td>
  																		</td>
  																		<td style="font-size: 1em;">
  																			<b>
  																				<bean:message key="BzComposer.configuration.hours"/>
  																			</b>
  																		</td>
  																		<td style="font-size: 1em;">
  																			<b>
  																				<bean:message key="BzComposer.configuration.miuntes"/>
																			</b>
  																		</td>
  																		<td>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td colspan="2" style="font-size: 1em;">
  																			<input type="submit" id="ok" style="width:90px;"  name="ok" 
  																			class="formbutton" value="<bean:message key='BzComposer.global.ok'/>" onclick="showTime()">
  																		</td>
  																		<td colspan="2" style="font-size: 1em;">
  																			<a href="#m2" rel="modal:close"><input type="reset" id="cancel" 
  																			style="width:90px;" name="cancel" 
  																			class="formbutton" 
  																			value="<bean:message key='BzComposer.global.cancel'/>">
  																			</a>
  																		</td>
  																	</tr>
  																</table>
  															</div>
  														</div>
  													</div> 
												</div>
												<%-- <div id="m2" class="modal modal1">
  													<div id="container">
  														<div id="title" style="text-align: center">
  														<h3><bean:message key="BzComposer.configuration.selecttime"/></h3>
  														</div>
  														<div id="container">
  															<div class="row" align="center">
  																<table style="text-align: center; width: 600px;">
  																	<tr>
  																		<td>
  																			<bean:message key="BzComposer.configuration.time"/>:
  																		</td>
  																		<td>
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
  																		<td>
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
  																		<td>
  																			<select id="selectedTime">
  																				<option value="AM"><bean:message key="BzComposer.configuration.am"/></option>
  																				<option value="PM"><bean:message key="BzComposer.configuration.pm"/></option>
  																			</select>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td>
  																		</td>
  																		<td>
  																			<bean:message key="BzComposer.configuration.hours"/>
  																		</td>
  																		<td>
  																			<bean:message key="BzComposer.configuration.miuntes"/>
  																		</td>
  																		<td>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td colspan="2">
  																			<input type="submit" id="ok" style="width:90px;"  name="ok" 
  																			class="formbutton" 
  																			value="<bean:message key='BzComposer.global.ok'/>" onclick="showTime()">
  																		</td>
  																		<td colspan="2">
  																			<a href="#m2" rel="modal:close">
  																			<input type="reset" id="cancel" style="width:90px;" name="cancel" class="formbutton" 
  																			value="<bean:message key='BzComposer.global.cancel'/>"></a>
  																		</td>
  																	</tr>
  																</table>
  															</div>
  														</div>
  													</div> 
												</div> --%>
											</div>
										</div>
									</fieldset>
										<div class="row">
											<div class="col-lg-6">
												<p style="font-size:1.2em;">
													<bean:message key="BzComposer.configuration.importorderfeature"/>
												</p>
												<div>
													<div class="row mb-2">
														<div class="col-8">&nbsp;</div>
														<div class="col-2 text-bold text-center" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.yes"/>
														</div>
														<div class="col-2 text-bold text-center" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.no"/>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.amazonselleronlineimport"/>	
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="amazoneSeller" id="exampleRadios2" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="amazoneSeller" id="exampleRadios2" value="No">
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.webdesignforus"/>
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="webDesignForUs" id="exampleRadios3" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="webDesignForUs" id="exampleRadios3" value="No">
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.ebayonlineimport"/>
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="eBayOnline" id="exampleRadios2" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="eBayOnline" id="exampleRadios2" value="No">
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.amazonsellerfileimport"/>
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="amazoneSallerFileImport" id="exampleRadios2" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="amazoneSallerFileImport" id="exampleRadios2" value="No">
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.halfcomfileimport"/>
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="HalfFileImport" id="exampleRadios2" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="HalfFileImport" id="exampleRadios2" value="No">
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.amazonmarketplacefileimport"/>
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="amazonMarketPlaceFile" id="exampleRadios2" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="amazonMarketPlaceFile" id="exampleRadios2" value="No">
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-8" style="font-size:1em;">
															<bean:message key="BzComposer.configuration.ebayblackthroneimport"/>
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="eBayBlackthorneImport" id="exampleRadios2" value="yes">
														</div>
														<div class="col-2 text-center">
															<input class="check-input" type="radio" name="eBayBlackthorneImport" id="exampleRadios2" value="No">
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-6">
												<fieldset>
													<legend class="h6" style="font-size:1.2em;">
														<bean:message key="BzComposer.configuration.orderconfirmationmailsetting"/>
													</legend>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value="" id="defaultCheck1"> 
														<label class="form-check-label" for="defaultCheck1"  style="font-size:1em;">
															<bean:message key="BzComposer.configuration.sendconfirmationmailtocustomer"/>
														</label>
													</div>
												</fieldset>
												<fieldset class="mt-4">
													<legend class="h6" style="font-size:1.2em;">
														<bean:message key="BzComposer.configuration.importhistoryofesalesbatch"/>
													</legend>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value="" id="defaultCheck1"> 
														<label class="form-check-label" for="defaultCheck1" style="font-size:1em;">
														<bean:message key="BzComposer.configuration.importhistory"/>	 
														<input type="text" value="1" style="font-size:1em;">
														<bean:message key="BzComposer.configuration.importhistoryactivity"/> 
														</label>
													</div>
												</fieldset>
											</div>
									</div>
									<p style="font-size:1em;">
										<b><bean:message key="BzComposer.configuration.esalesnote"/></b>
									</p>
									<fieldset class="mt-4">
										<legend class="h6"  style="font-size:1.2em;">
											<bean:message key="BzComposer.configuration.setupstores"/>
										</legend>
										<div class="form-check">
											<label class="form-check-label" for="defaultCheck1"  style="font-size:1em;">
												<bean:message key="BzComposer.configuration.setupstoreconfigurationforesalestoestore"/>					 
											</label>
											<br>
											<input class="formButton" type="button" 
											value="<bean:message key='BzComposer.configuration.setupstoresbtn'/>" 
											onclick="showStore()">
										</div>
									</fieldset>
								</div>
							</div>
							<div id="eSalesChannelSettings" class="tabPage">
								<div class="p-3">
									<h3 class="mt-0" style="font-size:1.2em;">
										<bean:message key="BzComposer.configuration.esalesimportconfig"/>
									</h3>
								<div class="card">
									<div class="card-header">
										<h5 class="card-title mb-0" style="font-size:1.2em;">
											<bean:message key="BzComposer.configuration.esalesstore"/>
										</h5>
									</div>
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-sm-3">
												<html:select styleId="eSalesStoreId" multiple="multiple" property="selectedStoreId" 
											style="width:200px;height:200px;" onchange="seteSalesStores()">
												<logic:present name="configurationForm" property="listOfExistingStores"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingStores" scope="session">
														<option value="<bean:write name='objList1' property='storeId' />">
															<bean:write name="objList1" property="storeName" />
															<option id="<bean:write name='objList1' property='storeId' />" value="<bean:write name='objList1' property='abbreviation' />" style="display: none;">
															</option>
															<option id="<bean:write name="objList1" property="storeName" />" value="<bean:write name="objList1" property="storeTypeId" />" style="display: none;">
															</option>
														<%-- <bean:parameter name="storeTypeId" id="storeTypeId" value="<bean:write name="objList1" property="storeTypeId" />"/> --%>
													</logic:iterate>
												</logic:present>
											</html:select>
											</div>
											<div class="col-sm-3" style="max-width: 110px;">
												<div style="font-size: 1em;">
													<input type="button" class="formButton" disabled="disabled" 
													style="width:60px;" id="btnAddeBayCategory" 
													value='<bean:message key="BzComposer.global.add"/>' 
													onclick="addeBayCategory()">
													<input type="button" class="formButton" style="width:60px;" 
													value="<bean:message key="BzComposer.global.delete"/>">
													<input type="button" class="formButton" style="width:60px;" 
													value="<bean:message key="BzComposer.global.update"/>">
													<input type="button" class="formButton" style="width:60px;" 
													value="<bean:message key="BzComposer.global.clear"/>" 
													onclick="clearFields()"/>
												</div>
											</div>	
											<div class="col-sm-6">
  												<div class="form-group row ">
    												<label for="Channel" class="col-sm-3 col-form-label" style="font-size: 1em;">
    													<bean:message key="BzComposer.configuration.channel"/> : 
   													</label>
    												<div class="col-sm-6" style="font-size: 1em;">
      													<html:select styleId="eSalesChannels" property="selectedStoreTypeId" style="width:255px;">
															<logic:present name="configurationForm" property="listOfExistingStoreType"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingStoreType" scope="session">
																<option id="<bean:write name='objList1' property='storeTypeId' />" value="<bean:write name='objList1' property='storeTypeId' />">
																	<bean:write name="objList1" property="storeTypeName" />
																</option>
															</logic:iterate>
															</logic:present> 
														</html:select>
    												</div>
  												</div>
  												<div class="form-group row">
    												<label for="storeType" class="col-sm-3 col-form-label" style="font-size: 1em;">
    													<bean:message key="BzComposer.configuration.storeortype"/>
   													</label>
    												<div class="col-sm-6" style="font-size: 1em;">
      													<!-- <input type="text" class="form-control" id="storeType"> -->
      													<html:text property="storeTypeName" styleClass="form-control" styleId="storeTypeName"></html:text>
    												</div>
  												</div>
  												<div class="form-group row">
    												<label for="storeType" class="col-sm-3 col-form-label" style="font-size: 1em;">
    													<bean:message key="BzComposer.configuration.abbreviation"/> :
   													</label>
    												<div class="col-sm-6" style="font-size: 1em;">
      													<html:text property="abbreviation" styleId="eSalesAbbreviation" styleClass="form-control">
																</html:text>
															<%-- <logic:equal value="storeTypeId" name="storeTypeId">
      													<logic:present name="configurationForm" property="listOfExistingStores" parameter="objList1" scope=""> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingStores" scope="session">
																<input type="text" class="form-control" id="abbreviation" value="<bean:write name="objList1" property="abbreviation" />"> 
															</logic:iterate>
														</logic:present>
														</logic:equal> --%>
    												</div>
  												</div>
											</div>	
										</div>
									</div>
								</div>
								<div class="card mt-4">
									<div class="card-header">
										<h5 class="card-title mb-0">
											<bean:message key="BzComposer.configuration.tab.esaleschannelsettings"/>
										</h5>
									</div>
									<div class="card-body">
										<div class="eSalesChannelSettingWrap">
											<table class=" table table-bordered">
												<tr>
													<th><bean:message key="BzComposer.configuration.description"/></th>
													<th class="text-center"><bean:message key="BzComposer.ComboBox.Select"/></th>
												</tr>
												<tr>
													<td class="">
														<label class="form-check-label" for="eSalesChannelSetting1">
															<bean:message key="BzComposer.configuration.notsynchwithebayonline"/>
														</label>
													</td>
													<td class="text-center">
														<input class="check-input" type="checkbox" id="eSalesChannelSetting1">
													</td>
												</tr>
												<tr>
													<td class="">
														<label class="form-check-label" for="eSalesChannelSetting2">
															<bean:message key="BzComposer.configuration.notsynchwithamazonselleronline"/>
														</label>
													</td>
													<td class="text-center">
														<input class="check-input" type="checkbox" id="eSalesChannelSetting2">
													</td>
												</tr>
												<tr>
													<td class="">
														<label class="form-check-label" for="eSalesChannelSetting3">
															<bean:message key="BzComposer.configuration.notsynchwithamazonmarketplacefile"/>
														</label>
													</td>
													<td class="text-center">
														<input class="check-input" type="checkbox" id="eSalesChannelSetting3">
													</td>
													</tr>
													<tr>
														<td class="">
															<label class="form-check-label" for="eSalesChannelSetting4">
																<bean:message key="BzComposer.configuration.notsynchwithwebdesign"/>
															</label>
														</td>
														<td class="text-center">
															<input class="check-input" type="checkbox" id="eSalesChannelSetting4">
														</td>
													</tr>
												</table>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" id="ignoreQOH"> 
												<label class="form-check-label" for="ignoreQOH">
													<bean:message key="BzComposer.configuration.ignoreqoh"/> 
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						<div id="othereSalesSettings" class="tabPage">
							<div class="p-3">
								<h3 class="mt-0"><bean:message key="BzComposer.configuration.othersalessettings"/></h3>
								<div class="row align-items-center">
									<div class="col-sm-3"><bean:message key="BzComposer.configuration.amazonmerchantfile"/> :</div>
										<div class="col">
											<div class=" custom-file">
  												<input type="file" class="custom-file-input" id="customFile">
  												<label class="custom-file-label" for="customFile">
  													<bean:message key="BzComposer.configuration.browse"/>
 												</label>
											</div>
										</div>						
								</div>									
								<div class="row align-items-center mt-3">
									<div class="col-sm-3 custom-file">
										<bean:message key="BzComposer.configuration.amazonsellerfile"/> :
									</div>
									<div class="col">
										<div class="custom-file">
  											<input type="file" class="custom-file-input" id="customFile">
  											<label class="custom-file-label" for="customFile">
  												<bean:message key="BzComposer.configuration.browse"/>
  											</label>
										</div>
									</div>					
								</div>			
								<fieldset class="mt-4">
									<legend class="h6">
										<bean:message key="BzComposer.configuration.ebayshippingandpaymentinfo"/>
									</legend>
									<div class="row">
										<div class="col-md-6">
											<fieldset class="mb-4">
												<legend class="h6">
													<bean:message key="BzComposer.configuration.paymentdetails"/>
												</legend>
			 									<div class="form-group row">
    												<label for="listingDuration" class="col-sm-3 col-form-label">
    													<bean:message key="BzComposer.configuration.listingduration"/> :
   													</label>
    												<div class="col-sm-9">
      													<select class="form-control" id="listingDuration">
      														<option id="1" value="1 Day">
      															<bean:message key="BzComposer.configuration.oneday"/>
   															</option>
      														<option id="2" value="3 Day">
	      														<bean:message key="BzComposer.configuration.threeday"/>
   															</option>
      														<option id="3" value="5 Day">
      															<bean:message key="BzComposer.configuration.fiveday"/>
   															</option>
      														<option id="4" value="7 Day">
      															<bean:message key="BzComposer.configuration.sevenday"/>
   															</option>
      														<option id="5" value="10 Day">
      															<bean:message key="BzComposer.configuration.tenday"/>
   															</option>
      														<option id="6" value="14 Day">
      															<bean:message key="BzComposer.configuration.fourteenday"/>
   															</option>
      														<option id="7" value="21 Day">
      															<bean:message key="BzComposer.configuration.twentyoneday"/>
     														</option>
      														<option id="8" value="30 Day">
      															<bean:message key="BzComposer.configuration.thirtyday"/>
      														</option>
      														<option id="9" value="60 Day">
      															<bean:message key="BzComposer.configuration.sixtyday"/>
   															</option>
      														<option id="10" value="90 Day">
      															<bean:message key="BzComposer.configuration.ninetyday"/>
   															</option>
      														<option id="11" value="120 Day">
      															<bean:message key="BzComposer.configuration.onetwentyday"/>
   															</option>
      													</select>
    												</div>
  												</div>
 												<div class="form-group row">
    												<label for="paymentMethod" class="col-sm-3 col-form-label">
    													<bean:message key="BzComposer.configuration.paymentmethod"/>:
   													</label>
    												<div class="col-sm-9">
      													<select class="form-control" id="paymentMethod">
      														<option id="1" value="PayPal">
      															<bean:message key="BzComposer.configuration.paypal"/>
   															</option>
      														<option id="2" value="Discover">
      															<bean:message key="BzComposer.configuration.discover"/>
     														</option>
      														<option id="3" value="Visa MAC">
      															<bean:message key="BzComposer.configuration.visamac"/>
      														</option>
      													</select>
    												</div>
  												</div>						
											</fieldset>
										</div>
										<div class="col-md-6">
											<fieldset class="mb-4">
												<legend class="h6">
													<bean:message key="BzComposer.configuration.shippingdetails"/>
												</legend>
 												<div class="form-group row">
    												<label for="shippingFee" class="col-sm-3 col-form-label">
    													<bean:message key="BzComposer.configuration.shippingfee"/> :
   													</label>
    												<div class="col-sm-9">
      													<input type="text" class="form-control" name="shippingFee" id="shippingFee" value="$0.00">
    												</div>
  												</div>							
											</fieldset>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						<div id="eSalesCategory" class="tabPage">
							<div class="p-3">
								<h3 class="mt-0">
									<bean:message key="BzComposer.configuration.othersalessettings"/>
								</h3>
								<fieldset class="mb-4">
									<legend class="h6" style="font-size: 1.2em;"><b>
										<bean:message key="BzComposer.configuration.storelist"/>
									</b></legend>
									<div class="row">
										<div class="col-md-3" style="font-size: 1em;">
											<html:select styleId="stores" property="selectedStoreTypeId" multiple="multiple" style="height:350px;width:180px;">
												<logic:present name="configurationForm" property="listOfExistingActiveStores"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingActiveStores" scope="session">
														<option id="<bean:write name="objList1" property="storeTypeName" />" value="<bean:write name='objList1' property='storeTypeId' />" onclick="setStoreTypeName()">
																<bean:write name="objList1" property="storeTypeName" />
														</option>
														<option id="<bean:write name="objList1" property="storeName" />" value="<bean:write name='objList1' property='storeId' />" onclick="setDiv()">
															&nbsp;&nbsp;&nbsp;&nbsp;
															<bean:write name="objList1" property="storeName" />
														</option>
													</logic:iterate>
												</logic:present> 
											</html:select>
										</div>
										<div class="col-md-9" id="forOnlineOption" style="display:block;">
											<div class="row align-items-center">
												<div class="col-5">
													<p class="h6" style="font-size: 1.2em;">
														<bean:message key="BzComposer.configuration.ebaycategories"/>
													</p>
														<html:select styleId="eBayCategorySelect" property="selectedeBayCategoryId" multiple="multiple" style="height:250px;width:250px;" onchange="setDefaultCategory()">
															<logic:present name="configurationForm" property="listOfExistingeBayCategories"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingeBayCategories" scope="session">
																	<option value="<bean:write name='objList1' property='eBayCategoryId' />">
																		<bean:write name="objList1" property="eBayCategoryName" />
																	</option>
																	<option value="<bean:write name='objList1' property='isLeaf'/>" id="<bean:write name="objList1" property="eBayCategoryName" />" style="display: none;">
																		<bean:write name="objList1" property="isLeaf" />
																	</option>
																</logic:iterate>
															</logic:present> 
														</html:select>
												</div>
												<div class="col-2">
													<button type="button" class="formButton" id="l2r" 
													style="font-size: 1em;width:30px;height:30px;" name="l2r" 
													disabled="disabled" onclick="setLeftToRight()">
														<bean:message key="BzComposer.configuration.lefttorightbtn"/>
													</button>
													<br>
													<br>
													<button type="button" class="formButton" id="r2l" name="r2l" 
													style="font-size:1em;height:30px;width:30px;" disabled="disabled" 
													onclick="setRightToLeft()">
														<bean:message key="BzComposer.configuration.righttoleftbtn"/>
													</button>
												</div>			
												<div class="col-5">
													<p class="h6" style="font-size: 1.2em;">
														<bean:message key="BzComposer.configuration.selectedcategories"/>
													</p>
														<select class="form-control" multiple="multiple" 
														id="defaultCategorySelect" style="height: 250px;" 
														onchange="setCategoryRightToLeft()">
															
														</select>	
														<button class="formButton">
															<bean:message key="BzComposer.configuration.choosedefaultcategorybtn"/>
														</button>
														&nbsp;&nbsp;
														<button class="formButton" style="font-size: 1em;">
															<bean:message key="BzComposer.global.save"/>
														</button>
												</div>
											</div>
										</div>
										<div class="col-md-9" id="forCdromusaOption" style="display:none; border: 10px;">
											<table>
												<tr>
													<td>
														<bean:message key="BzComposer.configuration.selectebaystore"/>
														<select id="eBayStore">
															<option value="online">
																<bean:message key="BzComposer.configuration.online"/>
															</option>
														</select>
													</td>
												</tr>
												<tr>
													<td rowspan="4">
														<bean:message key="BzComposer.configuration.importedsmccategories"/>
														<br>
														<select multiple="multiple" style="height: 150px; width:180px;"></select>
														<br>
														<button type="button" class="formButton" disabled="disabled">
															<bean:message key="BzComposer.configuration.choosedefaultcategorybtn"/>
														</button>
													</td>
												</tr>
												<tr>
													<td>
														<bean:message key="BzComposer.configuration.name"/>
													</td>
													<td>
														<input type="text" id="name" disabled="disabled">
													</td>
												</tr>
												<tr>
													<td>
														<bean:message key="BzComposer.configuration.selectedebaycategories"/>
													</td>
													<td>
														<select style="width:180px;">
															<option></option>
														</select>
													</td>
												</tr>
												<tr>
													<td colspan="2" align="right">
														<input type="button" class="formButton" disabled="disabled" 
														value="<bean:message key="BzComposer.configuration.link"/>">
														&nbsp;&nbsp;
														<input type="button" class="formButton" disabled="disabled" 
														value="<bean:message key="BzComposer.global.update"/>"/>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						<div id="itemUploadSetting" class="tabPage">
							<div class="p-3">
								<h3 class="mt-0">
									<bean:message key="BzComposer.configuration.tab.itemuploadsetting"/>
								</h3>
								<div class="row">
									<div class="col-md-6">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="defaultCheck1"> 
											<label class="form-check-label" for="defaultCheck1">
												<bean:message key="BzComposer.configuration.enableautomaticproduct"/>
											</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="defaultCheck1"> 
											<label class="form-check-label" for="defaultCheck1">
												<bean:message key="BzComposer.configuration.enableasinforupload"/>
											</label>
										</div>
									</div>
								</div>
							</div>
							
							</div>

												</div>
											</div> <!-- sales Ends -->
											</td>
									</tr>
								</table>
								<div>
									<html:hidden property="empStateID" />
									<html:hidden property="labelName" />
									<html:hidden property="fileName" />
								</div>
								<div>
									<input type="hidden" name="tabid" id="tid" value="" />
								</div>
							</div>
							<div>
								<center>
									<html:button property="save"><bean:message key="BzComposer.global.save"/></html:button>
									<html:cancel><bean:message key="BzComposer.global.cancel"/></html:cancel>
								</center>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</html:form>

	<%@ include file="/include/footer.jsp"%>
</body>
<script type="text/javascript">
function selectstoredialog()
{
	event.preventDefault();
	$("#selectstoredialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="selectstoredialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.esales.selectesalesstore'/></p>
</div>