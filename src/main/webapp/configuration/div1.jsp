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
<title><bean:message key="BizComposer.Configuration.Title" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.min.js"></script>  --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/bootstrap.min.js"></script> --%>
</head>
<script type="text/javascript">

$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
  });
  
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var o22 = null;
var o33 = null;
var oEmail = null;
var oT = null;
var nm="";
var r = null;

function c(r) {

  if (___) {
	var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    try {
	  o = new ActiveXObject(t);
      o.onreadystatechange = r;
	} catch (ex) {
      alert("<bean:message key='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
	}
  } else {
	o = new XMLHttpRequest();
    o.onload = r;
	o.onerror = r;
  }
  return o;
}
  
function trim(inputString) 
{
	// Removes the spaces  return from the passed string. 
	var retValue = inputString;
	var ch = retValue.substring(0, 1);
	while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) 
	{ 
		retValue = retValue.substring(1, retValue.length);
	    ch = retValue.substring(0, 1);
	}
	return retValue; 
}

function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;

	if (unicode!=8)
	{
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
 			return true;
		} 
		else 
		if (unicode<48||unicode>57) //if not a number
			return false; //disable key press
	}
}

function oGET(oo, url) 
{
	try 
	{
  		oo.open("GET", url, true);	
	    oo.send(null);
	} 
	catch (ex) 
	{}
}

function setJobValues(jobid,job,cost,desc,rid)
{
	size = document.getElementById('tabsize').value;
	for(i=0;i<size;i++)
	{
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	var rd=document.getElementById(rid);
	rd.className = "draft";
	document.getElementById('jcode').value = job;
	document.getElementById('cost').value = cost;
	document.getElementById('desc').value = desc;
	jid = jobid;
}

function wxToFixed(value,digits)
{
    factor = Math.pow(10,digits);
    fixed = ( Math.floor(value * factor + 0.5) ) / factor;
    fixedString = ''+fixed; // toString is JavaScript 1.1
    decimalPosition = fixedString.indexOf('.');
    if ( decimalPosition == -1 )
    {
        decimalsLength = 0;
        if ( digits > 0 )
        {
            fixedString = fixedString + '.';
        }
    }
    else
    {
        decimalsLength = (fixedString.substr(decimalPosition + 1)).length;
    }
    numZerosAppend = digits - decimalsLength;
    for ( i = 0; i < numZerosAppend; i++ )
    {
        fixedString = fixedString + '0';
    }
    return fixedString;
}

function SelectJob()
{
	if (o.readyState != 4 || o.status != 200) { 
	  return;
}
	document.getElementById("jobCodeTime").innerHTML = "";
    document.getElementById("jobCodeTime").innerHTML = o.responseText ;
}


function AddJobCode()
{
	
	code = trim(document.getElementById('jcode').value);
	if(code=="" || document.getElementById('jcode').value.length == 0)
	{
		alert('<bean:message key="BizComposer.Configuration.Employee.Add.JobCodeNotEmptyValidation" />');
		document.getElementById('jcode').focus();
	}
	else
	{
		cst = wxToFixed(document.getElementById('cost').value,2);
		document.getElementById('cost').value = cst;
		if(cst=="" || cst==0)
		{
			alert('<bean:message key="BizComposer.Configuration.Employee.CostGreaterValidation" />');
			document.getElementById('cost').value="";
			document.getElementById('cost').focus();
		}
		else
		{
			if(confirm('<bean:message key="BizComposer.Configuration.Employee.AddJobCodeConfirm" />'))
			{
				description = document.getElementById('desc').value;
				d = new Date();
				o = c(SelectJob);
				oGET(o,'<bean:write name="path" property="pathvalue"/>/include/'+
					'jobCodeTimeSheet.jsp?action=Add&code='+code+'&cost='+cst+'&desc='+description+'&Date='+d);
			}
		}
	}
}

function AddJobTitle()
{
	var jobTitle = $("#txtjobTitle").val();
	debugger
	var availableJobTitle = $.trim($("#selectedJobTitle option:selected").val());
	
	var availablejobs = $.trim($("#selectedJobTitle option[value='"+jobTitle+"']").val());
	debugger
	var camelized = jobTitle.toLowerCase().replace(/\b[a-z]/g, function(letter) {
	    return letter.toUpperCase();
	});
	debugger

	debugger
	if(jobTitle == "")
	{
		alert("Job Title can not be blank.")	
	}
	/* else if(availableJobTitle == "")
	{
		alert("Please select a row.")
	} */
	else if(camelized == availableJobTitle || jobTitle == availablejobs)
	{
		alert("You can not add duplicate job title ")
	}
	else 
	{
		alert("Entered jobTitle:"+jobTitle);
		window.location.href="Configuration.do?tabid=saveJobTitle&jobTitle="+jobTitle+"&operation=add";
		//window.open("Configuration.do?tabid=saveJobTitle&jobTitle="+jobTitle+"&operation=add");
	}
}

function EditJobTitle()
{
	var jobTitle = $("#txtjobTitle").val();
	debugger
	var availableJobTitle = $.trim($("#selectedJobTitle option:selected").val());
	
	var selectedJobtitleId = $("#selectedJobTitle").children(":selected").attr("id");
	
	var availablejobs = $.trim($("#selectedJobTitle option[value='"+jobTitle+"']").val());
	debugger
	var camelized = jobTitle.toLowerCase().replace(/\b[a-z]/g, function(letter) {
	    return letter.toUpperCase();
	});
	debugger

	debugger
	if(jobTitle == "")
	{
		alert("Job Title can not be blank.")	
	}
	
	else if(availableJobTitle == "")
	{
		alert("Please select a row.")
	}
	
	else if(camelized == availableJobTitle || jobTitle == availablejobs)
	{
		alert("You can not add duplicate job title ")
	}
	else 
	{
		alert("Entered jobTitle:"+jobTitle);
		window.location.href="Configuration.do?tabid=saveJobTitle&jobTitle="+jobTitle+"&titleId="+selectedJobtitleId+"&operation=edit";
	}
}

function DeleteJobTitle()
{
	debugger
	var selectedJobTitleId = $("#selectedJobTitle").children(":selected").attr("id");
	debugger
	var deletedJobTitle = $("#selectedJobTitle option:selected").val();
	debugger
	var jobTitle = $("#txtjobTitle").val();
	debugger
	if(selectedJobTitleId == "")
	{
		alert("Please select a row.")
	}
	else if(jobTitle == "")
	{
		alert("Job title can not be blank.")
	}
	else 
	{
		alert("Deleted jobTitleId:"+selectedJobTitleId+"\nAnd Name is:"+jobTitle);
		window.location.href="Configuration.do?tabid=saveJobTitle&titleId="+selectedJobTitleId+"&operation=delete";
	}
	
}

function EditJobCode()
{	
	if(jid==0)
	{
		alert('<bean:message key="BizComposer.Configuration.Employee.Remove.JobCodeNotSelectedValidation" />');
	}
	else
	{
		code = trim(document.getElementById('jcode').value);
		
		if(code=="" || document.getElementById('jcode').value.length == 0)
		{
			alert('<bean:message key="BizComposer.Configuration.Employee.Add.JobCodeNotEmptyValidation" />');
			document.getElementById('jcode').focus();
		}
		else
		{
			cst = wxToFixed(document.getElementById('cost').value,2);
			document.getElementById('cost').value = cst;
			if(cst=="" || cst==0)
			{
				alert('<bean:message key="BizComposer.Configuration.Employee.CostGreaterValidation" />');
				document.getElementById('cost').value="";
				document.getElementById('cost').focus();
			}
			else
			{
				if(confirm('<bean:message key="BizComposer.Configuration.Employee.EditJobCodeConfirm" />'))
				{
					description = document.getElementById('desc').value;
					d = new Date();
					o = c(SelectJob);
					oGET(o,'<bean:write name="path" property="pathvalue"/>/include/'+
						'jobCodeTimeSheet.jsp?action=Edit&code='+code+'&cost='+cst+'&desc='+description+'&jobId='+jid+'&Date='+d);
				}
			}
		}
	}
}

function RemoveJobCode()
{
	if(jid==0)
	{
		alert('<bean:message key="BizComposer.Configuration.Employee.Remove.JobCodeNotSelectedValidation" />');
	}
	else
	{
		if(confirm('<bean:message key="BizComposer.Configuration.Employee.RemoveJobCodeConfirm" />')){
			d = new Date();
			o = c(SelectJob);
			oGET(o,'<bean:write name="path" property="pathvalue"/>/include/'+
				'jobCodeTimeSheet.jsp?action=Remove&jobId='+jid+'&Date='+d);
		}
	}
}

function ClearJobField()
{
	document.getElementById('jcode').value = "";
	document.getElementById('cost').value = "";
	document.getElementById('desc').value = "";
	
	size = document.getElementById('tabsize').value;
	for(i=0;i<size;i++)
	{
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	jid=0;
	document.getElementById('jcode').focus();
}


function disable() 
{
	var value = document.configurationForm.selectedCountryId.value;
	/* alert("Selected Country:"+value); */
	if(value == "2")
	{
		document.configurationForm.selectedStateId.disabled=false;
	}
	else
	{
		document.configurationForm.selectedStateId.disabled=true;
	}
}

function disable1() 
{
	var value = document.configurationForm.selectedCountryId1.value;
	/* alert("Selected Country:"+value); */
	if(value == "2")
	{
		document.configurationForm.selectedStateId1.disabled=false;
	}
	else
	{
		document.configurationForm.selectedStateId1.disabled=true;
	}
}

function ShowEditFoootenote()
{
	/*if(window.showModalDialog){
		window.showModalDialog("Configuration.do?tabid=ShowEditFootnote","BizComposer - Select Footnote to be printed","dialogWidth:600px;dialogHeight:600px");
	}
	else*/
		window.open("Configuration.do?tabid=ShowEditFootnote",null,"scrollbars=yes,height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,modal=yes");
}	
function showSetupID()
{
	var val = document.getElementById("setupID").value;

		
		if(val == "Location")
		{
			document.getElementById("location").style.display = 'block';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "Message")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'block';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "REP")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'block';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "Terms")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'block';
			document.getElementById("days").style.display = 'block';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "SalesTax")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'block';
			document.getElementById("tax").style.display = 'block';
			document.getElementById("creditTerm").style.display = 'none';
			document.getElementById("days1").style.display = 'none';
		}
		else if(val == "creditTerm")
		{
			document.getElementById("location").style.display = 'none';
			document.getElementById("message").style.display = 'none';
			document.getElementById("rep").style.display = 'none';
			document.getElementById("terms").style.display = 'none';
			document.getElementById("days").style.display = 'none';
			document.getElementById("salesTax").style.display = 'none';
			document.getElementById("tax").style.display = 'none';
			document.getElementById("creditTerm").style.display = 'block';
			document.getElementById("days1").style.display = 'block';
		}
	}
	
	function setDefaultReason()
	{
		debugger
		var reason = $('#refundReasonSel :selected').text();
		if(reason == "")
		{
			debugger
			alert("Please select a refundreason from the list")
		}
		else
		{
			alert("Selected Reason is:"+reason);
		}
	}
	
	function setJobTitle()
	{
		debugger
		var jobTitle = $.trim($("#selectedJobTitle option:selected").val());
		debugger
		//$("#txtJobTitle").html(jobTitle);
		document.getElementById("txtjobTitle").value = jobTitle;
		debugger
	}
	
	function setReason()
	{
		debugger
		var oldReason = $('#refundReasonSel option:selected').text();
		$('#refundReasonSel option:selected').remove();
    	document.getElementById("refundReason").value = oldReason;	
	}
	
	function setCategory()
	{
		debugger
		var oldCategory = $('#jobCategory option:selected').text();
		$('#jobCategory option:selected').remove();
    	document.getElementById("txtJobCategory").value = oldCategory;	
	}
	function setDescription()
	{
		var text = $('#location :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription1()
	{
		var text = $('#message :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription2()
	{
		var text = $('#rep :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription3()
	{
		var text = $('#terms :selected').text();
		document.getElementById("description").value = text;
	}
	
	function setDescription4()
	{
		var text = $('#salesTax :selected').text();
		var e = document.getElementById("salesTax");
		var strUser = e.options[e.selectedIndex].value;
		document.getElementById("description").value = text;
		document.getElementById("txtTerms1").value = strUser;
	}
	
	function setDescription5()
	{
		
		var text = $('#creditTerm :selected').text();
		document.getElementById("description").value = text;
		
		var e = document.getElementById("creditTerm");
		var strUser = e.options[e.selectedIndex].value;
		document.getElementById("txtDays").value = strUser;
	}
	
	function AddDescription()
	{
		debugger
		var text = $('#description').val();
		if(text == "" || text == " ")
		{
			alert("Necessary data is empty");
		}
		else
		{
			alert(text);
		}
	}
	
	function deleteDescription()
	{
		var t =  $('#description').val();
		if(t == "" || t == " ")
		{
			alert("Please select an item to delete");
		}
	}
	
	function updateDescription()
	{
		var t =  $('#description').val();
		if(t == "" || t == " ")
		{
			alert("Necessary data is empty");
		}
		else
		{
			alert("new Data is:"+t)	
		}
	}
	
	$(function () 
	{
        $("#allowRefundSetting").click(function () 
		{
            if ($(this).is(":checked")) {
                $("#refundReason").prop('readonly', false);
                $("#refundReasonSel").prop('readonly',false);
                $("#addRefundReason").prop('disabled',false);
                $("#updateRefundReason").prop('disabled',false);
                $("#deleteRefundReason").prop('disabled',false);
                $("#defaultReason").prop('disabled',false);
            } else {
                $("#refundReason").prop('readonly', true);
                $("#refundReasonSel").prop('readonly',true);
                $("#addRefundReason").prop('disabled',true);
                $("#updateRefundReason").prop('disabled',true);
                $("#deleteRefundReason").prop('disabled',true);
                $("#defaultReason").prop('disabled',true);
            }
        });
    });
	
	$(function () {
        $("#addRefundReason").click(function (e) {
        	
        	debugger
        	//var item = $('#refundReasonSel option').val();
        	var r = $("#refundReason").val();
            if (r == '') {
                alert("Please enter refund reason");
            }
            else if(r == ' ')
            {
            	alert("Whitespace is not allowed")
            }
            else
            {
            	var itemExists = false;
                e.preventDefault();
                $("#refundReasonSel option").each(function() {
                    if ($(this).text() == $.trim(r)) {
                        itemExists = true;
                        alert('Reason already exists');
                        $("#refundReason").val('');
                    }
                });

              if (!itemExists) {
              $("#refundReasonSel").append("<option value="+r+" onclick=setReason()>" + r + "</option>");
              $("#refundReason").val('');
              }
            
            }
        });
    });
	
	$(function () {
        $("#updateRefundReason").click(function () 
        {
        	debugger
        	var oldReason = $('#refundReasonSel option:selected').text();
        	var newReason = $('#refundReason').text();
            if (oldReason == '' || oldReason == ' ') {
                alert("Please select a refund reason from the list");
            }
            else if(oldReason == newReason)
            {
            	alert("Same Reason can't update to the list")	
            }
            else
            {
            	debugger
            	//var addDisc = $("#refundReason").text();
            	$('#refundReasonSel option:selected').remove();
            	$('#refundReasonSel').append($("<option value="+$('#refundReason').val()+" onclick=setReason()>" + $('#refundReason').val() + "</option>"));
            	/*$('#refundReasonSel').append($("<option>" + newReason + "</option>")); */
            }
        });
    });
	
	$(function () {
        $("#deleteRefundReason").click(function () {
        	debugger
        	var reason = $('#refundReasonSel selected').val();
            if (reason == '') {
                alert("Please select a refund reason from the list");
            }
            else if(reason == ' ')
            {
            	alert("Whitespace is not allowed")
            }
            else
            {
            	debugger
            	var con = confirm("Are you sure to remove this reason?");

            	if(con)
            	//$('#refundReasonSel option:selected').remove();
            	$("#refundReason").val('');
            		
            }
        });
    });
	
	$(function () {
        $("#addJobCategory").click(function (e) {
        	debugger
        	var cat = $("#txtJobCategory").val();
        	//var items = $("#jobCategory option").val();
            if (cat == '') {
                alert("Please enter a job category.");
            }
            else if(cat == ' ')
            {
            	alert("Whitespace is not allowed.")
            }
            else
            {
            	//$('#jobCategory').append($("<option value="+cat+">" + cat + "</option>"));
            	var itemExists = false;
                //var txt = $("#refundReason").val();
                e.preventDefault();
                $("#jobCategory option").each(function() {
                    if ($(this).text() == $.trim(cat)) {
                        itemExists = true;
                        alert('Job Category already exists');
                        $("#txtJobCategory").val('');
                    }
                });

              if (!itemExists) {
              $("#jobCategory").append("<option value="+cat+" onclick=setCategory()>" + cat + "</option>");
              $("#txtJobCategory").val('');
              }
            }
        });
    });
	
	$(function () {
        $("#updateJobCategory").click(function () {
        	var oldCategory = $('#jobCategory option:selected').text();
        	var newCategory = $('#txtJobCategory').val();
        	debugger
            if (oldCategory == "") {
                alert("Please Select a Job from the list.");
            }
            else if(oldCategory == ' ')
            {
            	alert("Whitespace is not allowed.")
            }
            else
            {
            	debugger
            	$('#jobCategory option:selected').remove();
            	$('#jobCategory').append($("<option value="+newCategory+" onclick=setCategory()>" + newCategory + "</option>"));
            }
        });
    });
	
	$(function () {
        $("#deleteJobCategory").click(function () {
        	debugger
            if ($("#jobCategory option").text() == "") {
                alert("Please Select a Job from the List");
            }
            else
            {
            	debugger
            	var con = confirm("Are You Sure to remove this job?");
            	if(con)
            	//$('#jobCategory option:selected').remove();
            	$("#txtJobCategory").val('');
            }
        });
    });
	
	
	function clearDescription()
	{
		document.getElementById("description").value = "";
	}
</script>
</head>
<body onload="init1();">
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
			<bean:message key="BzComposer.Confuguration"/>
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
		<div id="table-negotiations">
			<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
				<tr>
					<td valign="top"  style="width: 20%;">
						<table>
							<tr>
								<td>
									<div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
										<%@include file="testMenu1.jsp" %>
									</div>
								</td>
							</tr>
							<tr align="center">
								<td>
									<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
									<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
						</table>
					</td>
					<td valign="top" style="padding-top: 2%;padding-right: 4%;">
						<!-- customerInvoice Starts -->
						<div id="customerInvoice" style="display:none;" >
							<div id="tabs1" style="height:700px;">
  								<ul>
    								<li><a href="#Customer"><bean:message key="Bizcomposer.customer" /></a></li>
    								<li><a href="#Sales&Invoice"><bean:message key="Bizcomposer.salesInvoice" /></a></li>
    								<li><a href="#SalesOption"><bean:message key="Bizcomposer.salesOption" /></a></li>
    								<li><a href="#RefundSettings"><bean:message key="Bizcomposer.refundSetting" /></a></li>
    								<li><a href="#InvoiceSaveOption"><bean:message key="Bizcomposer.invoiceSaveOption" /></a></li>
    								<li><a href="#Customer&Job"><bean:message key="Bizcomposer.customerJob" /></a></li>
  								</ul>
  								<div id="Customer">
									<div id="content1" class="tabPage">
   						 				<table class="table-notifications" width="100%">
											<tr>
												<th colspan="5" align="left">
													<bean:message key="Bizcomposer.customer" />
												</th>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.customerSortBy" />
												</td>
												<td>
													<html:select property="sortBy">
														<html:option value="1">Company Name</html:option>
														<html:option value="2">Last Name</html:option>
													</html:select>
												</td>
												<td>
													<bean:message key="Bizcomposer.customerGroup"/>
												</td>
												<td>
													<html:select property="selectedCustomerGroupId">
														<logic:present name="configurationForm" property="listOfExistingCustomerGroup"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCustomerGroup" scope="session">
																<option value="<bean:write name='objList1' property='selectedCustomerGroupId' />">
																	<bean:write name="objList1" property="groupName" />
																</option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td>
													<html:file property="saveImage" accept="image/*"></html:file>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.defaultCustomerCountry"/>
												</td>
												<td id="country">
													<html:select property="selectedCountryId" onchange="disable()">
														<option value="0"></option>
														<logic:present name="configurationForm" property="listOfExistingCountry"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCountry" scope="session">
																<option value="<bean:write name='objList1' property='countryId' />"><bean:write name="objList1" property="countryName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td>
													<bean:message key="Bizcomposer.defaultCustomerState"/>
												</td>
												<td id="state">
													<html:select property="selectedStateId">
														<logic:present name="configurationForm" property="listOfExistingState"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingState" scope="session">
																<option value="<bean:write name='objList1' property='selectedStateId' />"><bean:write name="objList1" property="stateName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<html:checkbox property="taxable">
													</html:checkbox><bean:message key="Bizcomposer.allCustomerAreTaxable"/>
												</td>
												<td align="center">
													<bean:message key="Bizcomposer.province"/>
												</td>
												<td>
													<input type="text" id="provinceName" name="provinceName">
												</td>
											</tr>
											<tr>
												<th colspan="5" align="left">
													<bean:message key="Bizcomposer.customerPrefrence"/>
												</th>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.shipping"/>
												</td>
												<td>
													<html:select property="selectedShippingId">
														<option value="0"></option>
														<logic:present name="configurationForm" property="listOfExistingShipping"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingShipping" scope="session">
																<option value="<bean:write name='objList1' property='selectedShippingId' />"><bean:write name="objList1" property="shippingName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td>
													<bean:message key="Bizcomposer.term"/>
												</td>
												<td>
									  				<html:select property="selectedTermId">
														<option value="0"></option>	
														<logic:present name="configurationForm" property="listOfExistingTerm"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTerm" scope="session">
																<option value="<bean:write name='objList1' property='selectedTermId' />"><bean:write name="objList1" property="termName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>  
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.rep"/>
												</td>
												<td>
													<html:select property="selectedSalesRepId">
														<option value="0"></option>
														<logic:present name="configurationForm" property="listOfExistingSalesRep"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesRep" scope="session">
																<option value="<bean:write name='objList1' property='selectedSalesRepId' />"><bean:write name="objList1" property="salesRepName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td>
													<bean:message key="Bizcomposer.payMethod"/>
												</td>
												<td>
													<html:select property="selectedPaymentId">
														<logic:present name="configurationForm" property="listOfExistingPayment"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
																<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<th colspan="5" align="left">
													<bean:message key="Bizcomposer.addressSettings"/>
												</th>
											</tr>
											<tr>
												<td colspan="5">
													<html:checkbox property="addressSettings"></html:checkbox>
													<bean:message key="Bizcomposer.addressSettingsText"/>
												</td>
											</tr>
											<tr>
												<th colspan="5" align="left">
													<bean:message key="Bizcomposer.salesOrderPreference"/>
												</th>
											</tr>
											<tr>
												<td colspan="5">
													<html:checkbox property="isSalesOrder"></html:checkbox>
													<bean:message key="Bizcomposer.useSalesOrder"/>
												</td>
											</tr>
										</table> 
 									</div>
								</div>	
								<div id="Sales&Invoice">
									<div id="content1" class="tabPage">
   										<table class="table-notifications" width="100%">
											<tr>
												<th colspan="4" align="left">
													<bean:message key="Bizcomposer.invoiceSalesPreference" />
												</th>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.startInvoiceNumber"/>
												</td>
												<td>
													<html:text property="startInvoiceNo" value="1" readonly="true"></html:text>
												</td>
												<td>
													<bean:message key="Bizcomposer.defaultPackingSlipStyle"/>
												</td>
												<td>
													<%-- <html:select property="selectedBillingTypeId" >
														<logic:present name="configurationForm" property="listOfExistingBillingType"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBillingType" scope="session">
																<option value="<bean:write name='objList1' property='selectedBillingTypeId' />"><bean:write name="objList1" property="billingTypeName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select> --%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.invoiceStyle"/>
												</td>
												<td>
													<%-- <html:select property="selectedInvoiceStyleId">
														<logic:present name="configurationForm" property="listOfExistingInvoiceStyle"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingInvoiceStyle" scope="session">
																<option value="<bean:write name='objList1' property='selectedInvoiceStyleId' />"><bean:write name="objList1" property="invoiceStyle" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select> --%>
												</td>
												<td>
													<bean:message key="Bizcomposer.PoNumPrefix"/>
												</td>
												<td>
													<html:text property="poNumPrefix"></html:text>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="Bizcomposer.defaultFootnote"/>
												</td>
												<td>
													<%-- <html:select property="selectedMessageId">
														<logic:present name="configurationForm" property="messages"> 
											<logic:iterate name="configurationForm" id="objList1" property="messages" scope="session">
												<option value="<bean:write name='objList1' property='selectedMessageId' />"><bean:write name="objList1" property="messageName" /></option>
											</logic:iterate>
										</logic:present>
									</html:select> --%>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox"> &nbsp;<bean:message key="Bizcomposer.showCountryNameOnInvoice"/>
								</td>
								<td>
									<input type="checkbox" checked="checked"> &nbsp;<bean:message key="Bizcomposer.ratePriceChangable"/>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox"> &nbsp;<bean:message key="Bizcomposer.showtelephoneFaxOnInvoice"/>
								</td>
								<td>
									<input type="checkbox"> &nbsp;<bean:message key="Bizcomposer.usePrefix"/>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.taxCode"/>
								</td>
								<td>
									<input type="text" value="California">
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.taxRate"/>
								</td>
								<td>
									<input type="text" value="0.00">
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.howOftenYouPaySalesTax"/>
								</td>
								<td>
									<input type="radio" checked="checked"><bean:message key="Bizcomposer.monthly"/>&nbsp;
									<input type="radio"><bean:message key="Bizcomposer.quarterly"/>&nbsp;
									<input type="radio"><bean:message key="Bizcomposer.annually"/>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message key="Bizcomposer.dropShippingCharge" /></th>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.dropShippingCharge1"/>
								</td>
								<td>
									<input type="text" value="">
								</td>
							</tr>
							<tr>
								<td>
									<input type="radio" checked="checked"><bean:message key="Bizcomposer.showAllItems"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<input type="radio"><bean:message key="Bizcomposer.showDropShipItemsOnly"/>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message key="Bizcomposer.extraChargeForInvoice" /></th>
							</tr>
							<tr>
								<td>
									<input type="checkbox"><bean:message key="Bizcomposer.isExtraChargeApplicable"/>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.chargeExtra"/>
								</td>
								<td>
									<input type="text" id="chargeExtra" name="chargeExtra">
								</td>
								<td>
									<bean:message key="Bizcomposer.ifTotalOrderIsLessThan"/>
								</td>
								<td>
									<input type="text" id="orderLessThan" name="orderLessThan">
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="backOrderNeeded"><bean:message key="Bizcomposer.backOrderConfirmationNeeded"/>
								</td>
							</tr>
							
						</table> 
 					</div>
				</div>
				<div id="SalesOption">
					<div id="content1" class="tabPage">
   						 <table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left"><bean:message key="Bizcomposer.salesOption" /></th>
							</tr>
							<tr>
								<td style="width:100px;">
									<b><bean:message key="Bizcomposer.setup"/></b>
								</td>
								<td>
									<select id="setupID" onchange="showSetupID()">
										<option value="Location">Location</option>
										<option value="Message">Message</option>
										<option value="REP">REP</option>
										<option value="Terms">Terms</option>
										<option value="SalesTax">Sales Tax</option>
										<option value="creditTerm">Line of Credit Term</option>
									</select>
								</td>
								<td rowspan="2" align="center">
									<button type="button" id="Add" name="Add" onclick="AddDescription()">Add</button><br><br>
									<button type="button" id="Delete" name="Delete" onclick="deleteDescription()">Delete</button><br><br>
									<button type="button" id="Update" name="Update" onclick="updateDescription()">Update</button><br><br>
									<button type="button" id="Clear" name="Clear" onclick="clearDescription()">Clear</button>
								</td>
								<td style="height:2px;">
									<b><bean:message key="Bizcomposer.description"/></b>
									<br>
									<input type="text" id="description" name="description"> 
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="width:100px;">
									<select id="location" name="location" style="display:block; width: 200px; height: 200px;" multiple="multiple">
										<logic:present name="configurationForm" property="listOfExistingLocation"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingLocation" scope="session">
												<option value="<bean:write name='objList1' property='selectedLocationId' />" onclick="setDescription()"><bean:write name="objList1" property="locationName" /></option>
											</logic:iterate>
										</logic:present> 
									</select>
									<select id="message" name="message" style="display:none; width: 200px; height: 200px;" multiple="multiple">
										<logic:present name="configurationForm" property="messages"> 
											<logic:iterate name="configurationForm" id="objList1" property="messages" scope="session">
												<option value="<bean:write name='objList1' property='selectedMessageId' />" onclick="setDescription1()"><bean:write name="objList1" property="messageName" /></option>
											</logic:iterate>
										</logic:present> 
									</select>
									<select id="rep" name="rep" style="display:none; width: 200px; height: 200px;" multiple="multiple">
										<logic:present name="configurationForm" property="listOfExistingSalesRep"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesRep" scope="session">
												<option value="<bean:write name='objList1' property='selectedSalesRepId' />" onclick="setDescription2()"><bean:write name="objList1" property="salesRepName" /></option>
											</logic:iterate>
										</logic:present> 
									</select>
									<%-- <select id="terms" name="terms" style="display:none; width: 200px; height: 200px;" multiple="multiple">
									<logic:present name="configurationForm" property="listOfExistingTerm"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTerm" scope="session">
												<option value="<bean:write name='objList1' property='selectedTermId' />" onclick="setDescription3()"><bean:write name="objList1" property="termName" /></option>
											</logic:iterate>
										</logic:present>
									</select> --%>
									<%-- <select id="salesTax" name="salesTax" style="display:none; width: 200px; height: 200px;" multiple="multiple">
									<logic:present name="configurationForm" property="listOfExistingSalesTax"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesTax" scope="session">
												<option value="<bean:write name='objList1' property='salesTaxRate' />" onclick="setDescription4()"><bean:write name="objList1" property="salesTaxName" /></option>
											</logic:iterate>
										</logic:present>
									</select>  --%> 
									<%-- <select id="creditTerm" name="creditTerm" style="display:none; width: 200px; height: 200px;" multiple="multiple">
									<logic:present name="configurationForm" property="listOfExistingCreditTerm"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditTerm" scope="session">
												<option id="<bean:write name='objList1' property='selectedCreditTermId' />" value="<bean:write name="objList1" property="days" />" onclick="setDescription5()"><bean:write name="objList1" property="creditTermName" /></option>
											</logic:iterate>
										</logic:present>
									</select>   --%>
								</td>
								<td>
									<div id="days" style="display:none;">
										<b><bean:message key="Bizcomposer.days"/><br></b>
										<input type="text" id="txtTerms" name="txtTerms">
									</div>
									<div id="tax" style="display:none;">
										<b><bean:message key="Bizcomposer.tax"/><br></b>
										<input type="text" id="txtTerms1" name="txtTerms">
									</div>
									<div id="days1" style="display:none;">
										<b><bean:message key="Bizcomposer.days"/><br></b>
										<input type="text" id="txtDays" name="txtDays"><br><br>
										<input type="checkbox">Default
									</div>
								</td>
							</tr>
						</table> 
 					</div>
				</div>	
				<div id="RefundSettings">
					<div id="content1" class="tabPage">
						<input type="checkbox" id="allowRefundSetting" name="allowRefundSetting" checked="checked"><bean:message key="Bizcomposer.allowRefund"/>
						<div id="refundDiv" style="display:block;">
   						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left"><bean:message key="Bizcomposer.refSetting" /></th>
							</tr>
							<tr>
								<td>
									<b><bean:message key="BzComposer.RMA.Reason" /></b><br>
									<input type="text" id="refundReason" name="refundReason"><br><br>
									<input type="button" id="addRefundReason" name="addRefundReason" value="Add">&nbsp;&nbsp;
									<input type="button" id="updateRefundReason" name="updateRefundReason" value="Update">&nbsp;&nbsp;
									<input type="button" id="deleteRefundReason" name="deleteRefundReason" value="Delete">
								</td>
								<td rowspan="2" align="justify">
									<%-- <select id="refundReasonSel" name="refundReasonSel" style="display:block; width: 200px; height: 200px;" multiple="multiple">
									<option value="Default Reason" onclick="setReason()">Default Reason</option>
									<logic:present name="configurationForm" property="listOfExistingRefundReason"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRefundReason" scope="session">
												<option value="<bean:write name='objList1' property='selectedRefundReasonId' />" onclick="setReason()"><bean:write name="objList1" property="refundReason" /></option>
											</logic:iterate>
										</logic:present>
									</select> --%>
									<br>
									<input type="button" id="defaultReason" name="defaultReason" value="Set As Default Reason" onclick="setDefaultReason()">  <br><br>
									<bean:message key="Bizcomposer.defaultReason"/>
								</td>
							</tr>
						</table> 
						</div>  
 					</div>
				</div>	
				<div id="InvoiceSaveOption">
					<div id="content1" class="tabPage">
   						<table class="table-notifications" width="100%">
							<tr>
								<td colspan="4" align="left"><bean:message key="Bizcomposer.customer.note" /></td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.selectLocation" />
								</td>
								<td>
									<html:file property="invoiceLocation"></html:file>
								</td>
							</tr>
						</table> 
 					</div>
				</div>	
				<div id="Customer&Job">
					<div id="content1" class="tabPage">
   						 <div id="refundDiv" style="display:block;">
   						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left"><bean:message key="Bizcomposer.customerJob" /></th>
							</tr>
							<tr>
								<td>
									<b><bean:message key="Bizcomposer.jobCategory" /></b><br>
									<input type="text" id="txtJobCategory" name="txtJobCategory"><br><br>
									<input type="button" id="addJobCategory" name="addJobCategory" value="Add">&nbsp;&nbsp;
									<input type="button" id="updateJobCategory" name="updateJobCategory" value="Update">&nbsp;&nbsp;
									<input type="button" id="deleteJobCategory" name="deleteJobCategory" value="Delete">
									
								</td>
								<td rowspan="2" align="justify">
									<%-- <select id="jobCategory" name="jobCategory" style="display:block; width: 200px; height: 200px;" multiple="multiple">
									<option value="Default Category" onclick="setCategory()">Default Category</option>
									<logic:present name="configurationForm" property="listOfExistingRefundReason"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRefundReason" scope="session">
												<option value="<bean:write name='objList1' property='selectedRefundReasonId' />" onclick="setCategory()"><bean:write name="objList1" property="refundReason" /></option>
											</logic:iterate>
										</logic:present>
									</select> --%>
								</td>
							</tr>
							<tr>
								<td>
									
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left"><bean:message key="Bizcomposer.recurringServiceBilling" /></th>
							</tr>
							<tr>
								<td>
									<input type="checkbox" id="recurringServiceBill" checked="checked"><bean:message key="Bizcomposer.useRecurringServiceBill"/>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.recurringServiceBillingName"/>
								</td>
								<td>
									<input type="text" id="serviceBillName" name="serviceBillName" value="Recurring Service Billing" style="width:200px;">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<bean:message key="Bizcomposer.recurringServiceBillingNote"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="button" id="EditInfo" name="EditInfo" value="EditInfo">
								</td>
							</tr>
						</table> 
						</div>   
 					</div>
				</div>		
  				</div>
			</div>
						<!-- customerInvoice Ends -->

			<!-- estimation Starts -->
			<div id="estimation" style="display:none;">
				<table class="table-notifications">
				<tr>
					<th align="left" colspan="2">Estimation preference</th>
				</tr>
				<tr>
					<td>Starting Estimation Number:
					</td>
					<td><input type="text" name="txtNumber" ></td>
				</tr>
				</table>
				
			</div>
			<!-- estimation Ends -->
			
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
          				<p>Some text in the modal.</p>
        			</div>
        			<div class="modal-footer">
          				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        			</div>
      			</div>
    			</div>
  			</div>
    		
 
			<div id="inventory">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="2" align="left"><bean:message
						key="Bizcomposer.inventorySetting" /></th>
				</tr>
				<tr>
					<td colspan="2">
						<html:checkbox property="productTaxable">
							<bean:message key="Bizcomposer.allowReorderList" />
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="Bizcomposer.scheduleTimes"/>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="width:30px; ">
						<html:textarea property="scheduleTimes">
						</html:textarea>
					</td>
					<td>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Add</button>
						<!-- <input type="submit" id="add" name="Add" value="Add"> -->
					</td>
				</tr>
				<tr>
					<td align="left">
						&nbsp;&nbsp;<input type="reset" id="Remove" name="Remove" value="Remove">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" id="allowOutOfStocks"><bean:message key="Bizcomposer.showOutOfStockWarning"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" id="ProductTaxable"><bean:message key="BizComposer.Configuration.Inventory.ProductTaxable"/>
					</td>
				<tr>
					<td colspan="2">
						<input type="checkbox" id="quantityReservedForPendingBuilds"><bean:message key="Bizcomposer.quantityReservedForPendingBuilds"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" id="quantityOnSalesOrder"><bean:message key="Bizcomposer.quantityOnSalesOrder"/>
					</td>
				</tr>
			</table>
			</div>
			<!-- Inventory Ends -->
			
			<!-- formCustomization Starts -->
			<div id="formCustomization" style="display:none;">
				<table class="table-notifications" width="100%">
				<tr>
					<th colspan="3" align="left"><bean:message
						key="Bizcomposer.templateCustomization" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="Bizcomposer.selectType"/>
					</td>
					<td colspan="2">
						<select id="templateCust">
							<option value="0">Invoice</option>
							<option value="1">Sales Order</option>
							<option value="2">Bills</option>
							<option value="3">Packing Slips</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="Bizcomposer.active"/>
					</td>
					<td>&nbsp;&nbsp;
					</td>
					<td>
						<bean:message key="Bizcomposer.notActive"/>
					</td>
				</tr>
				<tr>
					<td style="width:50px;">
						<textarea id="activeID">
						</textarea>
					</td>
					<td align="center">
						<input type="button" id="addL2R" name="addL2R" value=">>">
						<br>
						<input type="button" id="addR2L" name="addR2L" value="<<">
					</td>
					<td>
					<textarea id="nonActiveID">
						</textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td align="center">
						<input type="button" id="Add" name="Add" value="Add">
					</td>
					<td></td>
				</tr>
				</table>
			</div>
			<!-- formCustomization Ends -->
			
			<!-- Purchase & Vendor Starts -->
			<div id="purchase" style="display:none;">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="4" align="left"><bean:message
						key="BizComposer.Configuration.Purchase.Vendor" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="Bizcomposer.Configuration.Ourchase.vendorSortBy"/>
 					</td>
					<td>
						<html:select property="sortBy">
							<html:option value="1">Company Name</html:option>
							<html:option value="2">Last Name</html:option>
						</html:select>
					</td>
					<td>
						<bean:message key="BizComposer.Configuration.Purchase.vendorState"/>
					</td>
						<td id="state">
							 
							 <html:select property="selectedStateId1">
								<logic:present name="configurationForm" property="listOfExistingState1"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingState1" scope="session">
										<option value="<bean:write name='objList1' property='selectedStateId1' />"><bean:write name="objList1" property="stateName1" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>  
						</td>
				</tr>

				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Purchase.VendorDefaultCountry" />
					</td>
					<td>
						<html:select property="selectedCountryId1" onchange="disable1()">
							<option value="0"></option>
							<logic:present name="configurationForm" property="listOfExistingCountry1"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCountry1" scope="session">
									<option value="<bean:write name='objList1' property='countryId1' />"><bean:write name="objList1" property="countryName1" /></option>
								</logic:iterate>
							</logic:present> 
						</html:select> 
					</td>
					<td align="center">
						<bean:message key="Bizcomposer.province"/>
					</td>
					<td>
						<input type="text" id="provinceName" name="provinceName">
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left"><bean:message
						key="BizComposer.Configuration.Purchase.PurchaseOrderPreference" />
					</th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Purchase.StartPONum" /></td>
					<td><html:text property="startPONum" size="20" maxlength="15"
						style="width:100;"
						onkeypress="return numbersonly(event,this.value);">
					</html:text></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Purchase.POStyle" /></td>
					<td><logic:present name="InvStyle">
						<%-- Comment because of this error on 25-03-2019:The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:select property="poStyleID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="InvStyle" property="value"
								labelProperty="label" />
						</html:select> --%>
					</logic:present></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.DefaultFootnote" /></td>
					<td id="vdfoot"><logic:present name="Footnote">
					<%-- Comment because of this error on 25-03-2019:The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:select property="vendorDefaultFootnoteID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="Footnote" property="value"
								labelProperty="label" />
						</html:select> --%>
					</logic:present></td>
					<td valign="top">&nbsp; <a href="#"
						onclick="ShowEditFoootenote();"> <strong> <bean:message
						key="BizComposer.Configuration.Sales.EditFootnoteButton" /> </strong> </a></td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" id="countryOnPurchaseOrder" name="countryOnPurchaseOrder">
						<bean:message key="BizComposer.Configuration.Purchase.showCountoryNameOnPurchaseOrder"/> 
					</td>
					<td>
						<input type="checkbox" id="telephoneFaxOnPurchaseOrder" name="telephoneFaxOnPurchaseOrder">
						<bean:message key="BizComposer.Configuration.Purchase.showTelephoneAndFaxNumberOnPurchaseOrder"/> 
					</td>
					<td>
						<input type="checkbox" id="usePrefixPO" name="usePrefixPO">
						<bean:message key="BizComposer.Configuration.Purchase.usePrefixPO"/>
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left">
						<bean:message key="BizComposer.Configuration.Purchase.VendorPreference" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="Bizcomposer.shipping"/>
					</td>
					<td>
					<%-- Comment because of this error on 25-03-2019:The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:select property="selectedShippingId" >
							<option value="0"></option>
							<logic:present name="configurationForm" property="listOfExistingShipping"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingShipping" scope="session">
									<option value="<bean:write name='objList1' property='selectedShippingId' />"><bean:write name="objList1" property="shippingName" /></option>
								</logic:iterate>
							</logic:present> 
						</html:select> --%>
					</td>
					<td>
						<bean:message key="Bizcomposer.term"/>
					</td>
					<td>
					<%-- Comment because of this error on 25-03-2019:The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:select property="selectedTermId" >
							<option value="0"></option>	
							<logic:present name="configurationForm" property="listOfExistingTerm"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTerm" scope="session">
									<option value="<bean:write name='objList1' property='selectedTermId' />"><bean:write name="objList1" property="termName" /></option>
								</logic:iterate>
							</logic:present> 
						</html:select> --%>
					</td>
				</tr>
				<tr>
					 <td>
						<bean:message key="Bizcomposer.rep"/>
					</td>
					<td>
						<%-- Commented on 28-03-2019 because of this error:
						The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:select property="selectedSalesRepId" >
							<option value="0"></option>
							<logic:present name="configurationForm" property="listOfExistingSalesRep"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesRep" scope="session">
									<option value="<bean:write name='objList1' property='selectedSalesRepId' />"><bean:write name="objList1" property="salesRepName" /></option>
								</logic:iterate>
							</logic:present> 
						</html:select> --%>
					</td> 
					<td>
						<bean:message key="Bizcomposer.payMethod"/>
					</td>
					<td>
						<%-- Commented on 28-03-2019 because of this error:
						The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:select property="selectedPaymentId" >
							<logic:present name="configurationForm" property="listOfExistingPayment"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
									<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
								</logic:iterate>
							</logic:present> 
						</html:select> --%>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.Purchase.defaultCategoryForAccountPayable"/>
					</td>
					<td>
						<%-- Commented on 28-03-2019 because of this error:
						The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit 
						<html:select property="selectedCategoryId">
							<html:option value=""></html:option>
								<logic:present name="configurationForm" property="listOfExistingCategory"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
										<option value="<bean:write name='objList1' property='selectedCategory' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
									</logic:iterate>
								</logic:present> 
						</html:select> --%>
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left"><bean:message
						key="BizComposer.Configuration.Inventory.ReceivedItemPreference" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.Inventory.StartRI"/>
					</td>
					<td>
						<input type="text" id="riNumber">
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left"><bean:message
						key="BizComposer.Configuration.Purchase.employeeInChargeOfItemReceive" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.Purchase.selectEmployee"/>
					</td>
					<td>
						<select id="employee1">
							<!-- <option value="0"></option> -->
							<option value="1">Daniel Kim</option>
							<option value="2">Jason Lee</option>
						</select>
					</td>
				</tr>
			</table>
			</div>
			<!-- Purchase & Vendor Ends -->
			
			<!-- Employee Starts-->

			<div id="employee" >
			<table width="100%">
				<tr>
					<td>
					<table class="table-notifications" width="100%">
						<tr>
							<th colspan="3" align="left">
								<bean:message key="BizComposer.Configuration.Employee.General" />
							</th>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Employee.State" />
							</td>
							<td id="state">
								<html:select property="selectedStateId">
									<logic:present name="configurationForm" property="listOfExistingState"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingState" scope="session">
												<option value="<bean:write name='objList1' property='selectedStateId' />">
												<bean:write name="objList1" property="stateName" /></option>
											</logic:iterate>
										</logic:present> 
								</html:select>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Employee.Country" />
							</td>
							<td>
								<logic:present name="CountryList">
									<html:select property="empCountryID" style="width:200;" onchange="refreshItemsNow(this.value,0)">
										<html:option value="0">
											<bean:message key="BzComposer.ComboBox.Select" />
										</html:option>
										<html:options collection="CountryList" property="value"
											labelProperty="label" />
									</html:select>
								</logic:present>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<th colspan="3" align="left">
								<bean:message key="BizComposer.Configuration.Employee.JobCodeTimesheet" />
							</th>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Employee.JobCode" />
							</td>
							<td colspan="2">
								<input type="text" size="35" name="jobcode" id="jcode" maxlength="35" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Employee.JobCost" />
							</td>
							<td colspan="2">
								<input type="text" size="20" name="jobcost" id="cost" onkeypress="return numbersonly(event,this.value);" maxlength="10" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Employee.Description" />
							</td>
							<td colspan="2">
								<input type="text" size="45" name="jobdesc" id="desc" maxlength="60" />
							</td>
						</tr>
					</table>
					</td>
				<tr>
					<td align="center">
					<div style="overflow:auto;height:200;" id="jobCodeTime" class="section-border">
					<table class="tabla-listados" cellspacing="0" border="1">
						<thead>
							<tr>
								<th class="emblem">
									<bean:message key="BizComposer.Configuration.Employee.Job" />
								</th>
								<th class="emblem">
									<bean:message key="BizComposer.Configuration.Employee.Cost" />
								</th>
								<th class="emblem">
									<bean:message key="BizComposer.Configuration.Employee.Description" />
								</th>
							</tr>
						</thead>
						<tbody>
							<logic:present name="JobCodeDetail">
								<bean:size name="JobCodeDetail" id="tsize" />
								<input type="hidden" id="tabsize" name="size" value='<bean:write name="tsize" />' />
								<logic:iterate name="JobCodeDetail" id="jobcode" indexId="index">
										<tr id='<bean:write name="index"/>$$' 
											onclick="setJobValues('<bean:write name="jobcode" property="jobCodeID"/>','<bean:write name="jobcode" property="job"/>',
																	'<bean:write name="jobcode" property="cost"/>','<bean:write name="jobcode" property="description"/>',
																	'<bean:write name="index"/>$$');">
											<td><bean:write name="jobcode" property="job" /></td>
											<td align="left">
												<bean:write name="jobcode" property="cost" />
											</td>
											<td>
												&nbsp;<bean:write name="jobcode" property="description" />
											</td>
										</tr>
								</logic:iterate>
							</logic:present>
						</tbody>
					</table>
					</div>
					</td>
				</tr>
				<tr>
					<td>
						<table class="table-notifications" width="100%">
							<tr align="center">
								<td colspan="3">
									<input type="button" class="formButton" name="add" onclick="AddJobCode();" 
										value='<bean:message key="BizComposer.Configuration.Employee.Add"/>' />
									<input type="button" class="formButton" name="edit" onclick="EditJobCode();"
										value='<bean:message key="BizComposer.Configuration.Employee.Edit"/>' />
									<input type="button" class="formButton" name="remove" onclick="RemoveJobCode();"
										value='<bean:message key="BizComposer.Configuration.Employee.Remove"/>' />
									<input type="button" class="formButton" name="clear" onclick="ClearJobField();"
										value='<bean:message key="BizComposer.Configuration.Employee.Clear"/>' />
								</td>
							</tr>
							<tr>
								<th colspan="3" align="left">
									<bean:message key="BizComposer.Configuration.Employee.TimeSheet" />
								</th>
							</tr>
							<tr>
								<td colspan="3">
									<bean:message key="BizComposer.Configuration.Employee.NoOfInOutTimeSheet" />
									<html:text property="timeSheet" style="width:100;" maxlength="10"
										onkeypress="return numbersonly(event,this.value);">
									</html:text>
								</td>
							</tr>
							<tr>
								<th colspan="3" align="left">
									<bean:message key="BizComposer.Configuration.Employee.jobTitleSettings"/>
								</th>
							</tr>
							<tr>
								<td>
									<bean:message key="BzComposer.Employee.JobTitle"/>
								</td>
								<td>
									<html:text styleId="txtjobTitle" property="jobTitleName" styleClass="\" autoComplete=\"off"></html:text> 
									<!-- <input type="text" id="txtJobTitle" /> -->
								</td>
							</tr>
							<tr>
								<td>
									<html:select styleId="selectedJobTitle" property="selecctedJobTitleId" multiple="multiple" style="width:300px;hieight:500px;" onclick="setJobTitle()">
										<logic:present name="configurationForm" property="listOfJobTitle"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfJobTitle" scope="session">
												<option id="<bean:write name='objList1' property='jobTitleId' />" value="<bean:write name="objList1" property="jobTitleName" />">
													<bean:write name="objList1" property="jobTitleName" />
												</option>
											</logic:iterate>
										</logic:present> 
									</html:select>
								</td>
								<td>
									<input type="button" class="formButton" name="add" onclick="AddJobTitle();"
										value='<bean:message key="BizComposer.Configuration.Employee.Add"/>' />
									<input type="button" class="formButton" name="edit" onclick="EditJobTitle();"
										value='<bean:message key="BizComposer.Configuration.Employee.Edit"/>' />
									<input type="button" class="formButton" name="delete" onclick="DeleteJobTitle()"
										value='<bean:message key="BizComposer.Configuration.Shipping.delete"/>' />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</div>
			<!-- Employee Ends -->
			
			</td>
		</tr>
	</table>
	<div><html:hidden property="empStateID" /> <html:hidden
		property="labelName" /> <html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" />
	</div>
	</div>
	<div>
		<center><html:button property="save">Save</html:button>
		<html:cancel>Cancel</html:cancel></center>
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

</html>
 