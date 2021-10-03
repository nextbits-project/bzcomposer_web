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
<title><bean:message key="BzComposer.inventorysettingtitle" /></title>
<%-- <link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> --%>

<!-- jQuery Modal -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.min.js"></script>  --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/bootstrap.min.js"></script> --%>
</head>
<script type="text/javascript">
function toggleFunction() {
	debugger;
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
  }
} 
$(document).ready(function()
{
	debugger
	document.configurationForm.showReorderPointList.value = '<%= request.getAttribute("reorder")%>';
	document.configurationForm.showReorderPointWarning.value = '<%= request.getAttribute("reorderWarning")%>';
	document.configurationForm.reservedQuantity.value = '<%= request.getAttribute("reservedQuantity")%>';
	document.configurationForm.salesOrderQty.value = '<%= request.getAttribute("salesOrder")%>';
	document.configurationForm.productTaxable.value = '<%= request.getAttribute("productTaxable")%>';
			    	 		    	 
$('#showReorderPointList').change(function()
{
	var isChecked = "on";
    debugger
    if($(this).prop("checked") == true)
    {
		//alert("showReorderPointList is checked.");
        $("#showReorderPointList").attr('checked', true);
        debugger
        isChecked = "on"; 
	}
    else if($(this).prop("checked") == false)
    {
		//alert("showReorderPointList is unchecked.");
        $("#showReorderPointList").attr('checked', false);
        debugger
        isChecked = "off";
	}	
    else
    {
    	//alert("showReorderPointList is unchecked.");
        $("#showReorderPointList").attr('checked', true);
        debugger
    	document.configurationForm.showReorderPointList.value = isChecked;
    	debugger
    }	
	$("#showReorderPointList").val(isChecked);
});
    
$('#showReorderPointWarning').change(function()
{
	debugger
	var isChecked = "on";
    if($(this).prop("checked") == true)
    {
    	//alert("showReorderPointWarning is checked.");
        $("#showReorderPointWarning").attr('checked', true);
        isChecked = "on";
	}
    else if($(this).prop("checked") == false)
    {
        //alert("showReorderPointWarring is unchecked.");
        $("#showReorderPointWarning").attr('checked', false);
        isChecked = "off";
    }
    else
    {
    	 $("#showReorderPointWarring").attr('checked', true);
    	 debugger
         document.configurationForm.showReorderPointWarning.value = isChecked;
         debugger
    }
    debugger
    $("#showReorderPointWarning").val(isChecked);
    debugger
});
    
$('#reservedQuantity').change(function(){
  		
	var isChecked = "on";
	debugger
    if($(this).prop("checked") == true)
    {
		//alert("reservedQuantity is checked.");
		debugger
		$("#reservedQuantity").attr('checked', true);
		debugger
		isChecked = "on";
    }
     else if($(this).prop("checked") == false)
     {
        //alert("reservedQuantity is unchecked.");
        debugger
        $("#reservedQuantity").attr('checked', false);
        debugger
        isChecked = "off";
     }
	else
    {
    	$("#reservedQuantity").attr('checked', true);
    	debugger
    	document.configurationForm.reservedQuantity.value = isChecked;
    	debugger
    }
    $("#reservedQuantity").val(isChecked);
    debugger
});
    
$('#salesOrderQty').change(function()
{
	var isChecked = "on";
	debugger
    if($(this).prop("checked") == true)
    {
        //alert("salesOrderQty is checked.");
        debugger
        $("#salesOrderQty").attr('checked', true);
        debugger
        isChecked = "on";
    }
    else if($(this).prop("checked") == false)
    {
        //alert("salesOrderQty is unchecked.");
        debugger
        $("#salesOrderQty").attr('checked', false);
        debugger
        isChecked = "off";
    }
    else
    {
		$("#salesOrderQty").attr('checked', true);
    	debugger
        document.configurationForm.salesOrderQty.value = isChecked;
        debugger
    }
	debugger
    $("#salesOrderQty").val(isChecked);
    debugger
});

$('#productTaxable').change(function()
{
	var isChecked = "on";
	debugger
    if($(this).prop("checked") == true)
    {
        //alert("productTaxable is checked.");
        debugger
        $("#productTaxable").attr('checked', true);
        debugger
        isChecked = "on";
    }
    else if($(this).prop("checked") == false)
    {
        //alert("productTaxable is unchecked.");
        debugger
        $("#productTaxable").attr('checked', false);
        debugger
        isChecked = "off";
    }
    else
    {
    	$("#productTaxable").attr('checked', true);
    	debugger
    	document.configurationForm.productTaxable.value = isChecked;
    	debugger
    }
    debugger
    $("#productTaxable").val(isChecked);
    debugger
});
});

function showTime()
{
	debugger
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
	var time = h+":"+ m +" "+ t;
	//alert("Inserted time:"+time);
	debugger
	$("#scheduleTime").append("<option>"+ time + "</option>");
	debugger
}
function removeTime()
{
	$('#scheduleTime option:selected').remove();
}
</script>
<style type="text/css">
.biggerFonts
{
	font-size:1em;
}
.modal1 {
    overflow: visible;
    height: auto;
    vertical-align: top;
}
</style>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
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
						<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname' value='<bean:write name="lbl" property="value" />' />
						<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm' value='<bean:write name="lbl" property="label" />' />
					</logic:iterate>
			</logic:present>
		</div>
		<div id="m1" class="modal modal1" style="display: none;">
  					<div id="container">
						<div id="title" style="text-align: center">
							<h3><bean:message key="BzComposer.configuration.selecttime"/></h3>
						</div>
						<div id="container">
							<div class="row" align="center">
								<table style="text-align: center; width: 600px;">
												<tr>
													<td>
														<bean:message key="BzComposer.configuration.time"/> :
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
														value="<bean:message key='BzComposer.global.ok'/>" 
														onclick="showTime()">
													</td>
													<td colspan="2">
														<a href="#m2" rel="modal:close">
															<input type="reset" id="cancel" style="width:90px;" 
															name="cancel" class="formbutton" 
															value="<bean:message key='BzComposer.global.cancel'/>">
														</a>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div> 
					</div>
		<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
			<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
			<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
				<tr>
					<td id="leftMenu" style="position: relative; width: 180px;">
						<table>
							<tr>
								<td>
									<%-- <%@include file="testMenu1.jsp" %> --%>
									<%@include file="menuPage.jsp" %>
									<%-- <div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
										<%@include file="testMenu1.jsp" %>
									</div> --%>
								</td>
							</tr>
							<%-- <tr align="center">
								<td>
									<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
									<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr> --%>
						</table>
					</td>
					<td valign="top" style="padding-top: 20px;padding-right: 20px;">
			<!--  Inventory Starts -->
			<!-- Modal -->
  			<div class="modal fade" id="myModal" role="dialog">
    			<div class="modal-dialog">
    
      			<!-- Modal content-->
      			<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
          				<h4 class="modal-title">Modal Header</h4>
        			</div>
        			<div class="modal-body">
          				<p class="biggerFonts">Some text in the modal.</p>
        			</div>
        			<div class="modal-footer">
          				<button type="button" class="btn btn-default" data-dismiss="modal" style="font-size:1em;">Close</button>
        			</div>
      			</div>
    			</div>
  			</div>
    		
 
			<div id="inventory" style="display:none;padding: 0; position: relative; left: 0;">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="2" align="left" style="font-size:12px; padding: 5px;"><bean:message
						key="BzComposer.configuration.inventorysetting" /></th>
				</tr>
				<tr>
					<td colspan="2" style="font-size:12px;">
						<html:checkbox property="showReorderPointList" styleId="showReorderPointList">
							<bean:message key="BzComposer.configuration.allowreorderlist" />
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<b><bean:message key="BzComposer.configuration.scheduletimes"/></b> :
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="width:30px;font-size:12px;">
						<%-- <html:textarea property="scheduleTimes" styleId="scheduleTimes">
						</html:textarea> --%>
						<html:select property="scheduleTime" multiple="multiple" styleId="scheduleTime">
						</html:select>
					</td>
					<td>
						&nbsp;&nbsp;
						<!-- <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" style="font-size:1em;">Add</button> -->
						<a href="#m1" rel="modal:open" style="font-size:12px;">
							<!-- <button type="button" class="formbutton" data-toggle="modal" data-target="#modal" style="width:80px;font-size:1em;">
								Add
							</button> -->
							<input type="button" class="formButton" style="width:60px;font-size:12px;" 
							name="Add" value="<bean:message key='BzComposer.global.add'/>" data-target="#modal" data-toggle="modal">
						</a>
						<!-- <input type="submit" id="add" name="Add" value="Add"> -->
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="font-size:12px;">
						&nbsp;&nbsp;&nbsp;<input type="reset" id="Remove" class="formButton" name="Remove" 
						value="<bean:message key='BzComposer.configuration.remove'/>" onclick="removeTime()">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size:12px;">
						<html:checkbox property="showReorderPointWarning" styleId="showReorderPointWarning">
							<bean:message key="BzComposer.configuration.showoutofstockwarning"/>
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 12px;">
						<html:checkbox property="productTaxable" styleId="productTaxable">
							<bean:message key="BzComposer.configuration.allproductsaretaxable"/>
						</html:checkbox>
					</td>
				<tr>
					<td colspan="2" style="font-size:12px;">
						<html:checkbox property="reservedQuantity" styleId="reservedQuantity">
							<bean:message key="BzComposer.configuration.quantityreservedforpendingbuilds"/>
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size:12px;">
						<html:checkbox property="salesOrderQty" style="font-size:1em;" styleId="salesOrderQty"> 
							<bean:message key="BzComposer.configuration.quantityonsalesorder"/>
						</html:checkbox>
					</td>
				</tr>
			</table>
			</div>
			<!-- Inventory Ends -->
			</td>
		</tr>
	</table>
	<div><html:hidden property="empStateID" /> <html:hidden
		property="labelName" /> <html:hidden property="fileName" /></div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="reorderPointList" id="reorderPointList" value=""/>
		<input type="hidden" name="reorderPointWarning" id="reorderPointWarning" value=""/>
		<input type="hidden" name="reservedQuantity" id="reservedQuantity" value=""/>
		<input type="hidden" name="salesOrderQty" id="salesOrderQty" value=""/>
		<input type="hidden" name="productTaxable" id="productTaxable" value=""/>   	
	</div>
	</div>
	<div align="center">
		<%-- <center><html:button property="save" style="font-size:1em;">Save</html:button>
		<html:cancel style="font-size:1em;">Cancel</html:cancel></center> --%>
		<input type="Submit" name="Submit" onclick="SaveValues()" style="font-size:12px;" value="<bean:message key="BzComposer.global.save"/>"/>
		<input type="reset" name=Cancel" onclick="RevokeValues()" style="font-size:12px;" value="<bean:message key="BzComposer.global.cancel"/>"/>
	</div>
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
function SaveValues()
{
	/* debugger
	if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>')){
		debugger
		var scheduleTimes;
		document.configurationForm.showReorderPointList.value = document.configurationForm.showReorderPointList.value;
		document.configurationForm.showReorderPointWarning.value = document.configurationForm.showReorderPointWarning.value;
		document.configurationForm.reservedQuantity.value = document.configurationForm.reservedQuantity.value;
		document.configurationForm.salesOrderQty.value = document.configurationForm.salesOrderQty.value;
		document.configurationForm.productTaxable.value = document.configurationForm.productTaxable.value; 
		document.configurationForm.scheduleTime.value = document.configurationForm.scheduleTime.value;
		
		$("#scheduleTime option").each(function()
		{
			debugger
			scheduleTimes = $(this).text();
			debugger
		});
		
		var srpl = $("#showReorderPointList").val();
		var srpw = $("#showReorderPointWarning").val();
		var rq = $("#reservedQuantity").val();
		var soq = $("#salesOrderQty").val();
		var pt = $("#productTaxable").val();
		
		//alert("is reorderPoin is checked?:"+document.configurationForm.showReorderPointList.value
				//+"\nis warningPoint is checked?:"+document.configurationForm.showReorderPointWarning.value
				//+"\nis ReservedQuantity is checked?:"+document.configurationForm.reservedQuantity.value
				//+"\nis salesOrderQty is checked?:"+document.configurationForm.salesOrderQty.value
				//+"\nis productTaxable is checked?:"+document.configurationForm.productTaxable.value);
		//alert("ScheduleTimes:"+scheduleTimes);
		
		
		document.getElementById('tabid').value="SaveConfigurationInventorySettng";
		
		document.getElementById('reorderPointList').value = srpl;
		document.getElementById('reorderPointWarning').value = srpw;
		document.getElementById('reservedQuantity').value = rq;
		document.getElementById('salesOrderQty').value = soq;
		document.getElementById('productTaxable').value = pt;
		
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit(); 
	} */
	
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	var scheduleTimes;
	        		document.configurationForm.showReorderPointList.value = document.configurationForm.showReorderPointList.value;
	        		document.configurationForm.showReorderPointWarning.value = document.configurationForm.showReorderPointWarning.value;
	        		document.configurationForm.reservedQuantity.value = document.configurationForm.reservedQuantity.value;
	        		document.configurationForm.salesOrderQty.value = document.configurationForm.salesOrderQty.value;
	        		document.configurationForm.productTaxable.value = document.configurationForm.productTaxable.value; 
	        		document.configurationForm.scheduleTime.value = document.configurationForm.scheduleTime.value;
	        		
	        		$("#scheduleTime option").each(function()
	        		{
	        			debugger
	        			scheduleTimes = $(this).text();
	        			debugger
	        		});
	        		
	        		var srpl = $("#showReorderPointList").val();
	        		var srpw = $("#showReorderPointWarning").val();
	        		var rq = $("#reservedQuantity").val();
	        		var soq = $("#salesOrderQty").val();
	        		var pt = $("#productTaxable").val();
	        		
	        		//document.getElementById('tabid').value="SaveConfigurationInventorySettng";
	        		
	        		document.getElementById('reorderPointList').value = srpl;
	        		document.getElementById('reorderPointWarning').value = srpw;
	        		document.getElementById('reservedQuantity').value = rq;
	        		document.getElementById('salesOrderQty').value = soq;
	        		document.getElementById('productTaxable').value = pt;

	        		var formData = $('form').serialize();
	        		alert("clicked save button");
	        		
	        		var today = new Date();
	        		var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	        		var x = document.getElementById("scheduleTime");
	        	    var scheduleTimes = "";
	        	    var txt1 = " ";
	        	    var i;
	        	    var scheduleTimeslist = [];
	        	    for (i = 0; i < x.length; i++) {
	        	    	scheduleTimes =date +txt1+ x.options[i].value;
	        	    	scheduleTimeslist.push(scheduleTimes);
	        	    }
	        	    
	        		 $.ajax({
	        			type : "POST",
	        			url : "Configuration.do?tabid=SaveConfigurationInventorySettng&scheduleTimeslist="+scheduleTimeslist,
	        			data : formData,
	        			success : function(data) {
	        				debugger
	        				$("#showsaverecorddialog").dialog("close");
	        				$("#showsuccessdialog").dialog({
	        						resizable: false,
	        				        height: 200,
	        				        width: 500,
	        				        modal: true,
	        				        buttons: {
	        				        	"<bean:message key='BzComposer.global.ok'/>": function () {
	        				        		$(this).dialog("close");
	        				                return false;
	        				        	},
	        				            "<bean:message key='BzComposer.global.cancel'/>": function () {
	        				                $(this).dialog("close");
	        				                return false;
	        				            }
        				        	}
	        				});
	        			},
	        			error : function(data) {
	        				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	        			}
	        		});
	        		
	        		//document.forms[0].action = "Configuration.do";
	        		//document.forms[0].submit(); 
					//$('form').submit();
	            },
	            "<bean:message key='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}
</script>
</html>
 <!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="showsuccessdialog" style="display:none;">
	<p>Record updated</p>
</div>