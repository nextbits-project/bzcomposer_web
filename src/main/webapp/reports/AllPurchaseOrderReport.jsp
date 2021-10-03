<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>${sessionScope.user}-<bean:message key="BzComposer.allpurchaseorderstitle"/></title>
</head>
<body>
<html:form action="PurchaseBoard.do?tabid=AllPurchaseOrderList" method="post">
	<div class="report-form-headerpanel" id="headerPanel">
		<table>
			<tr>
			<%--<td><input type="button" value='<bean:message key="BzComposer.Report.btn.ModifyReport"/>' class="formbutton mar"></td> --%>
			<%--<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Print"/>' class="formbutton mar" onclick="printPage()"></td> --%>
		   		<td>
		   			<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.emailbtn"/>' 
		   			class="formbutton mar" onclick="sendMail()" id="email">
	   			</td>
		   		<td>
		   			<input id="btnHeader1" type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.hideheaderbtn"/>' 
		   			class="formbutton mar" onclick="hideShowHeader()">
		   		</td>
		   		<td>
		   			<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.refreshbtn"/>' 
		   			class="formbutton mar" onclick="search()">
	   			</td>
		   	</tr>
		</table>
	</div>
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="table-negotiations">
		<table align="center">
			<tr>
				<td align="center">
					<logic:notEmpty name="msg">
						<font color="red"><b><bean:write name="msg" /></b></font>
					</logic:notEmpty>
				</td>
			</tr>
		</table>
		<div id="printContent">	
			<div id="headerBar">
				<h5 style="text-align: center; color: blue; padding-top: 20px">${sessionScope.user}</h5>
				<h6 style="text-align: center; color: blue;" id="headerBarValue">
					<bean:message key="BzComposer.report.allpurchaseorder.allpurchaseordertitle" />
				</h6>
			</div>							
			<div class="report-form-underheader">
	 			<table>
	    			<tr>
	    				<td>
	    		  			<label style="padding-right: 10px">
	    		  				<bean:message key="BzComposer.reportcenter.allinvoicelist.dates"/>
    		  				</label>
	    				</td>
	    				<td>
	    		  			<html:select property="datesCombo">
				    		  	<html:option value="0">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.all"/>
			    		  		</html:option>
				    		  	<html:option value="1">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.today"/>
			    		  		</html:option>
				    		  	<html:option value="2">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thisweek"/>
			    		  		</html:option>
				    		  	<html:option value="3">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thisweektodate"/>
			    		  		</html:option>
				    		  	<html:option value="4">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thismonth"/>
			    		  		</html:option>
				    		  	<html:option value="5">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thismonthtodate"/>
			    		  		</html:option>
				    		  	<html:option value="6">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.fiscalquarter"/>
			    		  		</html:option>
				    		  	<html:option value="7">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.fiscalquartertodate"/>
			    		  		</html:option>
				    		  	<html:option value="8">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.custom"/>
			    		  		</html:option>
				    		  	<html:option value="9">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last10days"/>
			    		  		</html:option>
				    		  	<html:option value="10">
				    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last30days"/>
			    		  		</html:option>
				    		  	<html:option value="11">
				    		  		<bean:message key="BizComposer.amazonBulkMailer.DateSelect.60Days"/>
			    		  		</html:option>
	    		  			</html:select>
	    				</td>
	    				<td>
	    					<label style="padding-left: 15px">
	    						<bean:message key="BzComposer.reportcenter.allinvoicelist.from"/>
    						</label>
   						</td>
	    				<td>
	    					<html:text property="fromDate" size="15"/>
    					</td>
	    				<td>
	    					<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
	    					onclick="displayCalendar(document.PurchaseBoardForm.fromDate,'mm-dd-yyyy',this);" 
	    					style="padding-left: 5px">
    					</td>
	    				<td>
	    					<label style="padding-left: 15px">
	    						<bean:message key="BzComposer.sales.to"/>
    						</label>
   						</td>
	    				<td>
	    					<html:text property="toDate" size="15"/>
    					</td>
	    				<td>
	    					<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
	    					onclick="displayCalendar(document.PurchaseBoardForm.toDate,'mm-dd-yyyy',this);" 
	    					style="padding-left: 5px">
    					</td>
	    				<td>
	    					<label style="padding-right: 10px;padding-left: 15px">
	    						<bean:message key="BzComposer.reportcenter.allinvoicelist.sortby"/>
    						</label>
   						</td>
	    				<td>
	    		 			<html:select property="sortBy">
	    		  				<html:option value="0"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.default"/></html:option>
				    		  	<html:option value="1"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.type"/></html:option>
				    		  	<html:option value="2"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.id"/></html:option>
				    		  	<html:option value="3"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.clientorvendor"/></html:option>
				    		  	<html:option value="4"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.memo"/></html:option>
				    		  	<html:option value="4"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.amount"/></html:option>
	    					</html:select>
	    				</td>
	    	    		<td>
	    	    			<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.searchbtn"/>' 
	    	    			class="formbutton mar" style="margin-left: 195px" onclick="search()">
    	    			</td>
	    			</tr>
	 			</table>
			</div>
			<div id="table-negotiations" style="overflow: auto; height: 400; text-align: center;">
				<table class="tabla-customListOds" id="exportPd" border="1">
					<thead>
						<tr>
							<th>
								<bean:message key="BzComposer.report.allpurchaseorder.podate" />
							</th>
							<th>
								<bean:message key="BzComposer.report.allpurchaseorder.name" />
							</th>
							<th>
								<bean:message key="BzComposer.report.allpurchaseorder.amount" />
							</th>
							<th>
								<bean:message key="BzComposer.global.balance" />
							</th>
						</tr>
					</thead>
					<tbody>
					<%--<logic:present name="PurchaseBoardDetails" scope="request">		
							<logic:notEmpty name="PurchaseBoardDetails" scope="request">
								<bean:size id="SalesListSize" name="PurchaseBoardDetails" />
								<input type="hidden" name="sListSize" id="lSize"
								value='<bean:write name="SalesListSize" />'> --%>
						<logic:iterate name="PurchaseBoardDetails" id="objList" indexId="ndx">
							<tr>
								<td><bean:write name="objList" property="dateAdded" /></td>
								<td><bean:write name="objList" property="clientvendor" /></td>							
								<td><bean:write name="objList" property="amount" /></td>
								<td><bean:write name="objList" 	property="amount" /></td>
							<%--<td id="total"><bean:write name="objList" 	property="total" /></td>--%>								
							</tr>
						</logic:iterate>
					<%--</logic:notEmpty>
					</logic:present> --%>
							<tr>
								<td>
									<b><bean:message key="BzComposer.report.allpurchaseorder.total" /></b>
								</td>
								<td></td>
								<td></td>
								<td>
									<b><bean:write name="total" /></b>
								</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</html:form>
<%@ include file="/include/emailModal.jsp"%>
<%@ include file="/include/footer.jsp"%>
<!-- Javascript begins here -->
<script type="text/javascript">
var modal = document.getElementById('myModal');
function hideShowHeader()
{
	debugger;
	document.getElementById("headerBar").style.display = "none";
	/* $("#btnHeader1").hide(); */
	document.getElementById("headerBar").style.display = "none";
	$("#btnHeader1").replaceWith("<input id='btnHeader2' type='button' value='<bean:message key='BzComposer.reportcenter.allinvoicelist.showheaderbtn'/>' class='formbutton mar' onclick='ShowHeader()'>");
}
function ShowHeader()
{
	document.getElementById("headerBar").style.display = "block";
	$("#btnHeader2").replaceWith("<input id='btnHeader1' type='button' value='<bean:message key='BzComposer.reportcenter.allinvoicelist.hideheaderbtn'/>' class='formbutton mar' onclick='hideShowHeader()'>");
}
function search()
{
	document.forms[0].action = "PurchaseBoard.do?tabid=AllPurchaseOrderList";
	document.forms[0].submit();
}
function sendMail() {
	modal.style.display = "block";
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
}
function closeModal()
{
	modal.style.display = "none";
}
</script>
<!-- Javascript end here -->
</body>
</html>