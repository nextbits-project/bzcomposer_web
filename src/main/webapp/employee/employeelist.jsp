<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="expires" content="-1">
<%@include file="/include/header.jsp"%>
<title>BizComposer</title>
<script type="text/javascript">
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;

var r = null;
var flag1=false;
var flag2=false;
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
function oGET(oo, url) {
  try {
    oo.open("GET", url, true);	
    oo.send(null);
  } catch (ex) {
  }
}

function writeSelect()
{
  
   if (o.readyState != 4 || o.status != 200)
    { 
       
      return;
    }
    
    if(flag1==true)
    {
        document.getElementById("hdata").innerHTML="";
        document.getElementById("hdata").innerHTML = o.responseText ;
       
       
    }    
    if(flag2==true)
    {
      document.getElementById("tdata").innerHTML="";
      document.getElementById("tdata").innerHTML = o.responseText ;
      
    
    }
}
function refreshItemsNow(val)
{
 
  document.getElementById("hdata").innerHTML="";
  document.getElementById("tdata").innerHTML="";
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue" />/include/GetEmployeeList.jsp?type=' + val)
}


function showDivs(val)
{

   if(val==1 && flag1==false)
   {
     document.getElementById('hanswer').style.display= 'block'; 
     document.getElementById('tanswer').style.display= 'none';
     flag1=true;
     flag2=false;
     refreshItemsNow(1);
   }  
   else
   {
    document.getElementById('hanswer').style.display= 'none'; 
    flag1=false;
      
   }
   if(val==0 && flag2==false)
   {
   
      document.getElementById('hanswer').style.display= 'none'; 
      document.getElementById('tanswer').style.display= 'block';
      flag2=true;
      flag1=false;
      refreshItemsNow(0)
   }
   else
   {
       
       document.getElementById('tanswer').style.display= 'none';
       flag2=false;
      
   }

}



</script>


</head>
<body>


<!-- begin shared/header -->

<div id="header">
	<div id="header-content">
	<ul id="ulnav">
		<li><a
			href="<bean:write name="path" property="pathvalue"/>/Invoice.do?tabid=Invoice"
			title="Sales"  rel="section"><bean:message
			key="BzComposer.Sales" /></a></li>
		<li><a href="<bean:write name="path" scope="session" property="pathvalue"/>/PurchaseOrder.do?tabid=PurchaseOrder" title="Purchase"
			rel="section"><bean:message key="BzComposer.Purchase" /></a></li>
				
        <li><a href="Item.do?tabid=Item" title="Item"   rel="section"><span><bean:message
			key="BzComposer.sales.Item" /></span></a></li>
	
		<li><a href="Customer.do?tabid=Customer" title="Customer"  rel="section"><span><bean:message
			key="BzComposer.sales.Customer" /></span></a></li>
				
		<li><a href="employee.do" title="Employee" class="selected" rel="section"><bean:message
			key="BzComposer.Employee" /></a></li>
		<li><a	href="javascript: void(0)" title="Accounting" rel="section"><bean:message key="BzComposer.Accounting" /></a></li>
		
<%-- 		<li><a href="javascript: void(0)" title="Email" rel="section"><bean:message --%>
<!-- 			key="BzComposer.Email" /></a></li> -->
		<li><a href="<bean:write name="path" property="pathvalue"/>/Configuration.do?tabid=config"  title="Confuguration" rel="section" ><bean:message
			key="BzComposer.Confuguration" /></a></li>
	</ul>
	<div class="clear"></div>

	</div>

	</div>


<div id="ddcolortabs">
<ul>
	<li style="margin-left: 1px" id="current"><a href="employee.do"
		title="Employee"><span><bean:message key="BzComposer.Employee" /></span></a></li>
	<li><a href="taxinfo.do" title="Tax Info"><span><bean:message
		key="BzComposer.Employee.TaxInfo" /></span></a></li>
	<li><a href="companytax.do" title="Company Tax Option"><span><bean:message
		key="BzComposer.Employee.CompanyTaxOption" /></span></a></li>
</ul>
</div>

<div id="ddcolortabsline">&nbsp;</div>

<div id="pointermenu">
<ul>
	<li><a href="employeelist.do" title="View Employees" id="selected"><bean:message
		key="BzComposer.Employee" /></a></li>
	<li><a href="manageemployee.do?act=add" title="Add New Employee"><bean:message
		key="BzComposer.Employee.AddNewEmployee" /></a></li>
	<li><a href="manageemployee.do?act=print" title="Print Label"><bean:message
		key="BzComposer.Employee.PrintLabel" /></a></li>
	<li><a href="manageemployee.do?act=timesheet" title="Time Sheet"><bean:message
		key="BzComposer.Employee.TimeSheet" /></a></li>
	<li><a href="manageemployee.do?act=search" title="Search Employee"><bean:message
		key="BzComposer.Employee.Search" /></a></li>
</ul>
</div>
<br>

<br>
<br>



<div id="cos">

<div class="statusquo ok">


<div id="hoja">
<div id="blanquito">
<div id="padding"><!-- begin Contents --> <span id="waitMessage"><img
	src='<bean:write name="path" property="pathvalue"/>/images/spinner.gif'>
Loading Contents...</span>


<div id="hquestion"><span
	style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px;  padding: 0 0 .3em 0;">
<a href="javascript:showDivs(1);"> <bean:message
	key="BzComposer.Employee.HiredEmployeeList" /></a> </span></div>
<div id="hanswer">
<div id="table-negotiations">
<div id="hdata"></div>
</div>
</div>
<div id="tquestion"><span
	style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px;  padding: 0 0 .3em 0;">
<a href="javascript:showDivs(0);"><bean:message
	key="BzComposer.Employee.TerminatedEmployeeList" /> </a></span></div>
<div id="tanswer">
<div id="table-negotiations">
<div id="tdata"></div>
</div>
</div>
<!-- end Contents --></div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
<script>
 document.getElementById('hanswer').style.display= 'none'; 
 document.getElementById('tanswer').style.display= 'none';
 document.getElementById("hdata").innerHTML="";
 document.getElementById("tdata").innerHTML="";
</script>
</body>
</html>
<script>


</script>
