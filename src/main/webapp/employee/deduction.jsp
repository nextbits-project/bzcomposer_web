<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<script>
window.onload = initShowHideDivs;
</script>
<title><bean:message key="BzComposer.deductiontitle" /></title>
</head>
<body>
<html:form action="/Deduction" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
	<!-- begin Contents --> 
	<span id="waitMessage">
		<img src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif">
		<bean:message key="BzComposer.deduction.loadingcontents"/>
	</span>
	<div class="dhtmlgoodies_question">
		<span style="font-size:1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;
		border-bottom:1px dotted #333;padding:0 0 .3em 0;">
			<bean:message key="BzComposer.deduction.deductioninformation" />
		</span>
	</div>
	<div class="dhtmlgoodies_answer">
		<div id="table-negotiations">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th class="emblem" colspan="5" style="font-size:1.6em;">
							<bean:message key="BzComposer.deduction.adddeductioninformation"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="right" class="formlabel" style="font-size:1em;">
							<bean:message key="BzComposer.deduction.name" />:
						</td>
						<td style="font-size:1em;"  style="font-size:1em;">
							<input type="hidden" name="hidDid" id="myDid" value="0"> 
							<html:text property="dname" />
						</td>
						<td align="left" colspan="2" style="font-size:1em;">
							<input type="checkbox" name="taxex" style="font-size:1em;">&nbsp;
							<bean:message key="BzComposer.deduction.taxexemption" />
						</td>
					</tr>
					<tr>
						<td align="right" style="font-size:1em;">
							<input type="radio" name="rateVal" value="ON" onclick="changeRadioRate();"> 
							<bean:message key="BzComposer.deduction.rate" />:
						</td>
						<td style="font-size:1em;">
							<html:text property="drate" onkeypress="return numbersonly(event,this.value)" />
						</td>
						<script>
  							document.CompanyTaxForm.rateVal.checked=true;
  							document.getElementById("aBtn").style.display="";
  						</script>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td align="right" style="font-size:1em;">
							<input type="radio" name="amnt" onclick="changeRadioAmount();"> 
							<bean:message key="BzComposer.deduction.amount" />:
						</td>
						<td>
							<html:text property="damount" onkeypress="return numbersonly(event,this.value)" 
							style="font-size:1em;"/>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4" align="center" style="font-size:1em;">
							<input type="button" value="<bean:message key="BzComposer.deduction.cleardatabtn"/>" 
							onclick="cleardata();" class="formbutton">
							&nbsp;&nbsp;&nbsp;
							<input type="button" value="<bean:message key="BzComposer.deduction.adddeductioninfobtn"/>" 
							id="aBtn" name="AddBtn" 
							onclick="addDeduction();" class="formbutton"> 
							<input type="button" value="<bean:message key="BzComposer.deduction.upadtedeductioninfo"/>" 
							id="upBtn" name="UpdateBtn" 
							onclick="updateDeduction();" style="display:none" class="formbutton">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div>
		<span style="font-size:1.6em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;
		border-bottom:1px dotted #333;padding:0 0 .3em 0;">
			<bean:message key="BzComposer.deduction.deductionlist" />
		</span>
	</div>
	<div>
		<div id="table-negotiations">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th class="emblem">&nbsp;</th>
						<th style="font-size:1em;"><bean:message key="BzComposer.deduction.deduction" /></th>
						<th style="font-size:1em;"><bean:message key="BzComposer.deduction.amount" /></th>
						<th style="font-size:1em;"><bean:message key="BzComposer.deduction.rate" /></th>
						<th style="font-size:1em;"><bean:message key="BzComposer.deduction.userrate" /></th>
						<th style="font-size:1em;"><bean:message key="BzComposer.deduction.taxexempt" /></th>
						<th style="font-size:1em;" class="emblem">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<logic:present name="CompTaxlist" scope="request">
						<logic:notEmpty name="CompTaxlist" scope="request">
							<logic:iterate name="CompTaxlist" id="CobjList" scope="request">
								<tr id='<bean:write name="CobjList" property="ddId" />'>
									<td class="emblem">
										<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" 
										alt="Edit" title="Edit"
										onclick="editDeduction('<bean:write  name="CobjList" property="ddId" />');">
									</td>
									<td style="font-size:1em;">
										<bean:write name="CobjList" property="dname" />
									</td>
									<td style="font-size:1em;">
										<bean:write name="CobjList" property="damount" />
									</td>
									<td style="font-size:1em;">
										<bean:write name="CobjList" property="drate" />
									</td>
									<td style="font-size:1em;">
										<logic:equal name="CobjList" property="isRate" value="true">
											<input type="checkbox" name="isRate" checked="true" value="ON" />
										</logic:equal>
										<logic:equal name="CobjList" property="isRate" value="false">
											<input type="checkbox" name="isRate" />
										</logic:equal>
									</td>
									<td style="font-size:1em;">
										<logic:equal name="CobjList" property="taxExmp" value="true">
											<input type="checkbox" name="taxExmp" checked="true" value="ON" />
										</logic:equal> 
										<logic:equal name="CobjList" property="taxExmp" value="false">
											<input type="checkbox" name="taxExmp" />
										</logic:equal>
									</td>
									<td class="emblem">
										<img src="<bean:write name="path" property="pathvalue"/>/images/delete.png" 
										alt="Delete" title="Delete"
										onclick="deleteDeduction(<bean:write  name="CobjList" property="ddId" />);">
									</td>
								</tr>
							</logic:iterate>
						</logic:notEmpty>
					</logic:present>
				</tbody>
			</table>
		</div>
	</div>
	<!-- end Contents -->
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
</html:form>
</body>
</html>
<script>
function addDeduction()
{
	document.forms[0].action = "Deduction.do?tabid=c2o2m2";
	document.forms[0].submit();
}
function editDeduction(Myrowid)
{
	var row1=document.getElementById(Myrowid);
	var cells=row1.getElementsByTagName("td");
	var data1=cells[1].innerHTML;//value in first td
	var data2=cells[2].innerHTML;//value in second td
	var data3=cells[3].innerHTML;//value in third td
	var data4=cells[4].innerHTML;//value in forth td
	var data5=cells[5].innerHTML;//value in fifth td
	document.CompanyTaxForm.dname.value=data1;
	document.CompanyTaxForm.drate.value=data2;
	document.CompanyTaxForm.damount.value=data3;
	document.CompanyTaxForm.rateVal.checked=false;
	document.CompanyTaxForm.amnt.checked=true;
	document.CompanyTaxForm.taxex.checked=false;

	document.getElementById("upBtn").style.display="";
	document.getElementById("aBtn").style.display="none";

	document.CompanyTaxForm.hidDid.value=Myrowid;

	str = new String(data4)
 	str = str.match("checked")
 	for(i=0;i<str.length;i++)
 	{
  		document.CompanyTaxForm.rateVal.checked=true;
		document.CompanyTaxForm.amnt.checked=false;
 	}
 	str = new String(data5)
 	str = str.match("checked")
  	for(i=0;i<str.length;i++)
 	{
  		document.CompanyTaxForm.taxex.checked=true;
 	}
}
function deleteDeduction(Id)
{
	/* var res=confirm("<bean:message key='BzComposer.deduction.deletededuction'/>");
	if(res==true)
	{
		document.forms[0].action = "Deduction.do?tabid=c4o4m4&Id="+Id;
		document.forms[0].submit();
	} */
	event.preventDefault();
	$("#deletedeductiondialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                document.forms[0].action = "Deduction.do?tabid=c4o4m4&Id="+Id;
        		document.forms[0].submit();
				//$('form').submit();
            },
            <bean:message key='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
		}
	});
	return false;
}
function updateDeduction()
{
	var Id=document.CompanyTaxForm.hidDid.value;
	if(Id==0)
	{
		//alert("<bean:message key='BzComposer.deduction.selectlisttoedit'/>");
		debugger;
		return showlisttoeditdialog();
	}
	else
	{
		document.forms[0].action = "Deduction.do?tabid=c5o5m5&Id="+Id;
		document.forms[0].submit();
	}
}
function cleardata()
{
	document.CompanyTaxForm.dname.value="";
	document.CompanyTaxForm.drate.value="";
	document.CompanyTaxForm.damount.value="";
	document.CompanyTaxForm.rateVal.checked=true;
	document.CompanyTaxForm.amnt.checked=false;
	document.CompanyTaxForm.taxex.checked=false;
	document.getElementById("upBtn").style.display="none";
	document.getElementById("aBtn").style.display="";
}
function changeRadioAmount()
{
	document.CompanyTaxForm.rateVal.checked=false;
	document.CompanyTaxForm.amnt.checked=true;
}
function changeRadioRate()
{
	document.CompanyTaxForm.rateVal.checked=true;
	document.CompanyTaxForm.amnt.checked=false;
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

function showlisttoeditdialog()
{
	event.preventDefault();
	$("#showlisttoeditdialog").dialog({
    	resizable: false,
        height: 200,
        width: 400,
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
<!-- Dialog box used in sales order page -->
<div id="showlisttoeditdialog" style="display:none;">
	<p><bean:message key='BzComposer.deduction.selectlisttoedit'/></p>
</div>
<div id="deletedeductiondialog" style="display:none;">
	<p><bean:message key='BzComposer.deduction.deletededuction'/></p>
</div>