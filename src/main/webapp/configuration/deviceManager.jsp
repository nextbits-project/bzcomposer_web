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
<title><bean:message key="BzComposer.devicemanagertitle" /></title>
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
		alert("Please Select eSales Store");	
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
	
	function addeBayCategory()
	{
		alert("Inside addeBayCategory")
	}
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
	<div id="table-negotiations"  style="padding: 0; border: 1px solid #ccc;">
		<table cellspacing="0" style="border: 0;width: 100%; overflow-y: scroll;" class="section-border">
			<tr>
			<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
				<td id="leftMenu" style="position: relative; width: 180px;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu3.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
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
				<td valign="top">
					<!-- Device Manager Starts -->
					<div id="deviceManager"  style="display:none;padding: 0; position: relative; left: 0;">
						<table class="table-notifications" width="100%">
							<tr>
								<th align="left" colspan="2" style="font-size: 14px; padding: 5px;">
									<bean:message key="BzComposer.configuration.connectionconfiguration" />
								</th>
							</tr>
							<tr>
								<td colspan="2" style="font-size: 14px;">
									<b><bean:message key="BzComposer.configuration.barcodescanner"/></b>
								</td>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									<bean:message key="BzComposer.configuration.portname"/> :
								</td>
								<td style="font-size: 14px;">
									<select id="portName" style="width:160px;">
										<option></option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									<bean:message key="BzComposer.configuration.timeout"/> :
								</td>
								<td>
									<input type="text" id="portName" value="30000" style="font-size: 14px;"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									<bean:message key="BzComposer.configuration.baudrate"/> :
								</td>
								<td>
									<input type="text" id="portName" value="38400" style="font-size: 14px;"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: 14px;">
									<bean:message key="BzComposer.configuration.buffersize"/> :
								</td>
								<td>
									<input type="text" id="bufferSize" value="200" style="font-size: 14px;"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left" style="font-size: 14px; padding: 5px;">
									<b><bean:message key="BzComposer.configuration.barcodescannernote"/></b>
								</td>
							</tr>
							<tr>
								<td align="left" id="clientVendorUsingImportFile" style="display:none;">
									<fieldset><legend></legend>
									<bean:message key="BzComposer.configuration.clientvendorusingimportfile"/>
									<br>
									<bean:message key="BzComposer.configuration.browse"/>:
									<br>
									<input type="file" name="importFile" name="importFile">
									<br>
									<button type="button" id="ok" name="ok">
										<bean:message key="BzComposer.global.ok"/>
									</button>
									
									</fieldset>											
								</td>
								<td align="left" id="checkMoreRecordInDatabase" style="display:none;">
									<fieldset>
									<bean:message key="BzComposer.configuration.checkmorerecordindatabase"/>
									<br>
									<bean:message key="BzComposer.configuration.numberofcheckrecord"/> :
									<input type="text" name="numberOfRecord" name="numberOfRecord">
									<br>
									<button type="button" id="ok" name="ok">
										<bean:message key="BzComposer.global.ok"/>
									</button>
									</fieldset>											
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2" id="bothButton" style="display:none;">
									<button type="button" id="both" name="both">
										<bean:message key="BzComposer.configuration.bothbtn"/>
									</button>
								</td>
							</tr>
						</table>
					</div> 
					<!-- Device Manager Ends -->
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
		<div align="center" style="font-size: 14px;">
			<html:button property="save"><bean:message key="BzComposer.global.save"/></html:button>
			<%-- <html:cancel><bean:message key="BzComposer.global.cancel"/></html:cancel> --%>
			<input type="reset" name="Cancel" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
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

</script>
</html>