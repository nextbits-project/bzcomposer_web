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
<title><bean:message key="BzComposer.reportcentertitle" /></title>

<style type="text/css">
.selected{
background-color: rgba(5, 169, 197, 0.63);
color: white ;
padding: 4px;
cursor: pointer;
}
.nonselected{
color: #666;
padding: 4px;
cursor: pointer;
}
#reports a{
text-decoration: none !important;
color: #05A9C5 !important;
cursor: pointer;

}
#reports a:HOVER{
text-decoration:underline !important;
color: #666 !important;
cursor: pointer;
}
#reports {
width:200px;
}

div#pie { /* 	color:#05A9C5;; */
	padding: 10px 0px 20px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}

table.tabla-listados thead tr th {
	font-size: .7em;
	text-align: left;
	padding: 5px 10px;
	/* 	background: rgba(5, 169, 197, 0.11); */
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	/* 	color: #333; */
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}

table.tabla-listados tbody tr td {
	font-size: .8em;
	/* 	color: #666; */
	padding: 5px 0px 5px 14px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: #fff;
	vertical-align: top;
}
</style>
</head>
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
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
	border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.reportcenter.reportcentertitle"/>
	</span>
</div>
		<div>
		<br/>
			<div id="table-negotiations">
				<table cellspacing="0"  style="width: 100%;" class="section-border">
					<tr height="450">
						<!-- left side start -->
						<td valign="top"  style="width:1%;border-right: 1px solid rgb(207, 207, 207);">
							<div id="table-negotiations" style="width:170;">
								<table class="tabla-listados" cellspacing="0" style="margin: 0px 0px 0px 0px;">
									<tr onclick="SetRow('tr0');" id="tr0">
										<td style="padding-left: 1px;">
											<div id="img01" class="nonselected">
												<bean:message key="BzComposer.reportcenter.customerandreceivables" />
											</div>						
							 				<div id="img02" class="selected">
							 					<bean:message key="BzComposer.reportcenter.customerandreceivables" />
						 					</div>			
										</td>
									</tr>
									<tr onclick="SetRow('tr1');" id="tr1">
										<td style="padding-left: 1px;">
											<div id="img11" class="nonselected"><bean:message key="BzComposer.reportcenter.sales" /></div>						
											<div id="img12" class="selected"><bean:message key="BzComposer.reportcenter.sales" /></div>
										</td>
									</tr>
									<tr onclick="SetRow('tr2');" id="tr2">
										<td style="padding-left: 1px;">
											<div id="img21" class="nonselected"><bean:message key="BzComposer.reportcenter.itemandinventory" /></div>						
											<div id="img22" class="selected" ><bean:message key="BzComposer.reportcenter.itemandinventory" /></div>							
											<%--<div id="img21" class="nonselected"><bean:message key="BzComposer.Report.CustomerReceivables" /></div>						 --%>
											<%--<div id="img22" class="selected" ><bean:message key="BzComposer.Report.CustomerReceivables" /></div> --%>
										</td>
									</tr>
									<tr onclick="SetRow('tr3');" id="tr3">
										<td style="padding-left: 1px;">	
						    				<div id="img31" class="nonselected"><bean:message key="BzComposer.reportcenter.vendorandpurchase" /></div>						
											<div id="img32" class="selected" ><bean:message key="BzComposer.reportcenter.vendorandpurchase" /></div>
										</td>
									</tr>
			        				<tr onclick="SetRow('tr4');" id="tr4">
										<td style="padding-left: 1px;">
											<div id="img41" class="nonselected"><bean:message key="BzComposer.reportcenter.employee" /></div>						
											<div id="img42" class="selected"><bean:message key="BzComposer.reportcenter.employee" /></div>
											<%--<div  id="img41" class="nonselected"><bean:message key="BzComposer.Report.CustomerReceivables" /></div>						 --%>
											<%--<div id="img42" class="selected"><bean:message key="BzComposer.Report.CustomerReceivables" /></div>								 --%>
						   				</td>
									</tr> 
									<!-- Banking & Accounting -->
									<tr onclick="SetRow('tr5');" id="tr5">
										<td style="padding-left: 1px;">
											<div id="img51" class="nonselected"><bean:message key="BzComposer.reportcenter.bankingandaccounting" /></div>						
											<div id="img52" class="selected"><bean:message key="BzComposer.reportcenter.bankingandaccounting" /></div>																												
											<%--<div id="img41" class="nonselected"><bean:message key="BzComposer.Report.CustomerReceivables" /></div>						 --%>
											<%--<div id="img42" class="selected"><bean:message key="BzComposer.Report.CustomerReceivables" /></div>								 --%>
						   				</td>
									</tr> 
									<!-- End of Banking & Accounting -->
									<!-- Profit & Budget Start -->
									<tr onclick="SetRow('tr6');" id="tr6">
										<td style="padding-left: 1px;">
											<div id="img61" class="nonselected"><bean:message key="BzComposer.reportcenter.profitandbudget" /></div>						
											<div id="img62" class="selected"><bean:message key="BzComposer.reportcenter.profitandbudget" /></div>
						   				</td>
									</tr> 
						<!-- End of Profit & Budget -->
						<!-- Start of Tax -->
						 <tr onclick="SetRow('tr7');" id="tr7">
							<td style="padding-left: 1px;">
								<div id="img71" class="nonselected"><bean:message key="BzComposer.reportcenter.tax" /></div>						
								<div id="img72" class="selected"><bean:message key="BzComposer.reportcenter.tax" /></div>
						   </td>
						</tr> 
						<!-- End of Tax -->
						<!-- Start of lists -->
						<tr onclick="SetRow('tr8');" id="tr8">
							<td style="padding-left: 1px;">
								<div id="img81" class="nonselected"><bean:message key="BzComposer.reportcenter.lists" /></div>						
								<div id="img82" class="selected"><bean:message key="BzComposer.reportcenter.lists" /></div>
						   </td>
						</tr> 
						<!-- End Of Lists -->
						
						<!-- Start of eSales -->
						<tr onclick="SetRow('tr15');" id="tr15">
							<td style="padding-left: 1px;">
							<div id="esalesnonsel" class="nonselected"><bean:message key="BzComposer.reportcenter.esales" /></div>						
							<div id="esalessel" class="selected"><bean:message key="BzComposer.reportcenter.esales" /></div>
						   </td>
						</tr> 
						<!-- End Of eSales -->
						
					<!--  
						<tr onclick="SetRow('tr5');" id="tr5">
							<td style="padding-left: 1px;">
							
							<div  id="img51" class="nonselected">Items</div>						
							<div id="img52" class="selected">Items</div>
								
								</td>
						</tr>
							
						<tr onclick="SetRow('tr6');" id="tr6">
							<td style="padding-left: 1px;">
							
							<div  id="img61" class="nonselected">Test</div>						
							<div id="img62" class="selected">Test</div>
								
								</td>
						</tr>
						
						<tr onclick="SetRow('tr7');" id="tr7">
							<td style="padding-left: 1px;">
							
							<div  id="img71" class="nonselected">GGGGGGGG</div>						
							<div id="img72" class="selected">GGGGGGGG</div>
								
								</td>
						</tr>
						<tr onclick="SetRow('tr8');" id="tr8">
							<td style="padding-left: 1px;">
							
							<div  id="img81" class="nonselected">HHHHHHHHH</div>						
							<div id="img82" class="selected">HHHHHHHHH</div>
								
								</td>
						</tr>
						<tr onclick="SetRow('tr9');" id="tr9">
							<td style="padding-left: 1px;">
							
							<div  id="img91" class="nonselected">IIIIIIIIIII</div>						
							<div id="img92" class="selected">IIIIIIIIII</div>
								
								</td>
						</tr>
						<tr onclick="SetRow('tr10');" id="tr10">
							<td style="padding-left: 1px;">
							
							<div  id="img101" class="nonselected">JJJJJJJJ</div>						
							<div id="img102" class="selected">JJJJJJJJ</div>
								
								</td>
						</tr>
						<tr onclick="SetRow('tr11');" id="tr11">
								<td style="padding-left: 1px;">
							
							<div  id="img111" class="nonselected">KKKKKKK</div>						
							<div id="img112" class="selected">KKKKKKK</div>
								
								</td>
						</tr>
						<tr onclick="SetRow('tr12');" id="tr12">
							<td style="padding-left: 1px;">
							
							<div  id="img121" class="nonselected">LLLLLLL</div>						
							<div id="img122" class="selected">LLLLLLL</div>
								
								</td>
						</tr>  -->
					</table>
					</div>
			</td>
	
	<!-- right side start -->
	
			<td valign="top" style="padding-top: 2%;padding-right: 4%;padding-left: 2%;">
			<!-- General(sales) panel -->

			<div id="general">
			<!-- Sale start -->
			<a><span><bean:message key="BzComposer.reportcenter.sales" /></span></a> <br/>
			 	  <table class="tabla-listados">
			<tr>
			<td id="reports"><bean:message key="BzComposer.reportcenter.sales.salesdescription" /></td>		<!-- removed </a> -->		
			</tr>					
			</table>
			
					<a><span><bean:message key="BzComposer.reportcenter.sales" /></span></a> 
					<!-- from here start to check -->
		
		 	<table class="tabla-listados" cellspacing="0">
            <tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports"><a onclick="showSalesReport('SalesRBC');" ><bean:message key="BzComposer.reportcenter.sales.salesreportbycustomer" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.sales.salesreportbycustomer.description" /></td>			
			</tr>
			<tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports"><a onclick="showSalesReport('SalesRID');"><bean:message key="BzComposer.reportcenter.sales.salesbyitem" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.sales.salesbyitem.description" /></td>			
			</tr>		
			<tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports"><a onclick="showSalesReport('SalesRBI');"><bean:message key="BzComposer.reportcenter.sales.salesreportbyitem" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.sales.salesreportbyitem.description" /></td>			
			</tr>		
			</table>   
			<!-- Sale End  -->
		  <a><span><bean:message key="BzComposer.reportcenter.creditrefund.creditrefund" /></span></a> 
		
		 	<table class="tabla-listados" cellspacing="0">
            <tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports"><a onclick="showInvoiceList('AllInvoice');" ><bean:message key="BzComposer.reportcenter.creditrefund.allcreditrefundsalesreport" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.creditrefund.allcreditrefundsalesreport.description" /></td>			
			</tr>
			<tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports"><a onclick="showInvoiceList('PaidInvoice');"><bean:message key="BzComposer.reportcenter.creditrefund.paidcreditrefund" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.creditrefund.paidcreditrefund.description" /></td>			
			</tr>		
			<tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports"><a onclick="showInvoiceList('PaidInvoice');"><bean:message key="BzComposer.reportcenter.creditrefund.unpaidcreditrefund" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.creditrefund.unpaidcreditrefund.description" /></td>			
			</tr>		
			</table>   
			 <!-- <table class="tabla-listados"><tr><td>hello</tr></table> --> 
			<a ><span><bean:message key="BzComposer.reportcenter.invoice" /></span></a>
			<br>
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="showInvoiceList('AllInvoice');" ><bean:message key="BzComposer.reportcenter.invoice.allinvoice" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.invoice.allinvoice.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="showInvoiceList('PaidInvoice');"><bean:message key="BzComposer.reportcenter.invoice.paidinvoice" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.invoice.paidinvoice.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="showInvoiceList('UnPaidInvoice');" ><bean:message key="BzComposer.reportcenter.invoice.unpaidinvoice" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.invoice.unpaidinvoice.description" /></td>			
			</tr>
			
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="showRefundInvoiceReport();"><bean:message key="BzComposer.reportcenter.invoice.refundinvoicereport" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.invoice.refundinvoicereport.description" /></td>			
			</tr>
			
			</table>
	        <a ><span><bean:message key="BzComposer.reportcenter.estimation" /></span></a>
			<br>
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="showEstimationList();" ><bean:message key="BzComposer.reportcenter.estimation.allestimation" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.estimation.allestimation.description" /></td>			
			</tr>					
			</table>
			
			</div>

			<!-- Item & Inventory Start-->
			<div id="nw" style="display:none;">
			  <a><span><bean:message key="BzComposer.reportcenter.inventory" /></span></a>	<br/>			  
			  <table class="tabla-listados">
			<tr>
			<td id="reports" > <bean:message key="BzComposer.reportcenter.inventory.description" /></a></td>		
			</tr>					
			</table>
			
			 <a><span><bean:message key="BzComposer.reportcenter.listing" /></span></a>
			<br>
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width:140px;"><a onclick="showInventoryList();" ><bean:message key="BzComposer.reportcenter.listing.inventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.inventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 140px;"><a onclick="showReservedInventoryList();" ><bean:message key="BzComposer.reportcenter.listing.reservedinventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.reservedinventorylist.description" /></td>			
			</tr>	
			
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 140px;"><a onclick="showItemPriceList();" ><bean:message key="BzComposer.reportcenter.listing.itempricelist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.itempricelist.description" /></td>			
			</tr>
				
		    <tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showDiscontinuedInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.discontinuedinventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.discontinuedinventorylist.description" /></td>			
			</tr>		
			<!-- Remaining From here -->
				<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showDamageInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.damageinventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.damageinventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="MissingInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.missinginventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.returninventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="ReturnInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.returninventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.returninventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showDamagedInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.damagedinventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.damagedinventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showDiscontinuedInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.returnedinventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.returnedinventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showUnknownInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.unknowninventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.unknowninventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showReturnedInventoryList();"  ><bean:message key="BzComposer.reportcenter.listing.returnedinventorylist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.returnedinventorylist.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showDailyItemSummary();"  ><bean:message key="BzComposer.reportcenter.listing.dailyitemsummary" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.dailyitemsummary.description" /></td>			
			</tr>	
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports" style="width: 160px;"><a  onclick="showDailySalesSummary();"  ><bean:message key="BzComposer.reportcenter.listing.dailysalessummary" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.dailysalessummary.description" /></td>			
			</tr>				
			<!-- End of Remaining Here -->	
			</table>
			 <a><span><bean:message key="BzComposer.reportcenter.valuation" /></span></a>	<br/>			  
			  <table class="tabla-listados" cellspacing="0">
			    <tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports" style="width: 140px;"><a onclick="showInvValSummary();" ><bean:message key="BzComposer.reportcenter.valuation.inventoryvaluationsummary" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.valuation.inventoryvaluationsummary.description" /></td>			
			   </tr> 
			   <tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports" style="width: 140px;"><a onclick="showInvValDetail();" ><bean:message key="BzComposer.reportcenter.valuation.inventoryvaluationdetail" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.valuation.inventoryvaluationdetail.description" /></td>			
			   </tr> 
			     			
			  </table>
			  
			  <a><span><bean:message key="BzComposer.reportcenter.inventoryorder" /></span></a>	<br/>			  
			  <table class="tabla-listados" cellspacing="0">
			    <tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports" style="width: 140px;"><a onclick="showInvOrderReport();" ><bean:message key="BzComposer.reportcenter.inventoryorder.inventoryorderreport" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.inventoryorder.inventoryorderreport.description" /></td>			
			   </tr> 
			  </table>
			  
			  <a><span><bean:message key="BzComposer.reportcenter.inventorystatistics" /></span></a>	<br/>			  
			  <table class="tabla-listados" cellspacing="0">
			    <tr>
					<td width="45">
					<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
					</td>
					<td id="reports" style="width: 140px;"><a onclick="showInvStatistic();" ><bean:message key="BzComposer.reportcenter.inventorystatistics.currentinventorystatictics" /></a></td>
					<td><bean:message key="BzComposer.reportcenter.inventorystatistics.currentinventorystatictics.description" /></td>			
			   </tr> 
			  </table> 
			</div>
           <!-- Item & Inventory End-->
			
			<!-- Purchase & Vendor -->
			<div id="purchase" style="display:none;">
			 <a ><span><bean:message key="BzComposer.reportcenter.vendorpayable" /></span></a>	<br/>			  
			  <table class="tabla-listados">
			<tr>
			<td id="reports" > <bean:message key="BzComposer.reportcenter.vendorpayable.description" /></a></td>		
			</tr>					
			</table>
				
				<a ><span><bean:message key="BzComposer.reportcenter.listing"/></span></a>	
			<br>
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowvendorList()" ><bean:message key="BzComposer.reportcenter.listng.vendorlist"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.listng.vendorlist.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowvendorPhoneList()" ><bean:message key="BzComposer.reportcenter.listng.vendorphonelist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listng.vendorphonelist.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowVendorContactList()" ><bean:message key="BzComposer.reportcenter.listng.vendorcontactlist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listng.vendorcontactlist.description" /></td>			
			</tr>
			
		
			</table>
			 <a ><span><bean:message key="BzComposer.reportcenter.balance" /></span></a>	<br/>
			
				   <table class="tabla-listados">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowsvendorBalanceDetails()" ><bean:message key="BzComposer.reportcenter.balance.vendorbalancedetails"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.balance.vendorbalancedetails.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowsvendorBalanceSymmary()" ><bean:message key="BzComposer.reportcenter.balance.vendorbalancesummary" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.balance.vendorbalancesummary.description" /></td>			
			</tr>

			</table>
				 <a ><span><bean:message key="BzComposer.reportcenter.purchase" /></span></a>	<br/>			  
			  <table class="tabla-listados">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowsAllPurchaseorders()" ><bean:message key="BzComposer.reportcenter.purchase.allpurchaseorders"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.purchase.allpurchaseorders.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowAllPurchaseBills()" ><bean:message key="BzComposer.reportcenter.allpurchasebills"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.allpurchasebills.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowPaidPurchaseBills()" ><bean:message key="BzComposer.reportcenter.paidpurchasebills"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.paidpurchasebills.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowUnPaidPurchaseBills()" ><bean:message key="BzComposer.reportcenter.unpaidpurchasebills"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.unpaidpurchasebills.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowCancelledPurchaseRefBill()" ><bean:message key="BzComposer.reportcenter.cancelledpurchasebillrefundlist"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.cancelledpurchasebillrefundlist.description" /></td>			
			</tr>
			</table>
			
			<!-- Vendor 1099 -->
				 <a ><span><bean:message key="BzComposer.reportcenter.vendor1099list" /></span></a>	<br/>			  
			  <table class="tabla-listados">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowVendor1099List()" ><bean:message key="BzComposer.reportcenter.vendor1099list"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.vendor1099.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="Vendor1099TransactionSummary()" ><bean:message key="BzComposer.reportcenter.vendor1099transactionsummary"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.vendor1099transactionsummary.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="vendor1099TransactionDetail()" ><bean:message key="BzComposer.reportcenter.vendor1099transactiondetail"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.vendor1099transactiondetail.description" /></td>			
			</tr>
			</table>
			
			
			<!--End  -->
			
			</div>

			<!-- Sales & Customer  -->
			<div id="sales" style="display:none;">	   
			 <a ><span><bean:message key="BzComposer.reportcenter.employee" /></span></a>	<br/>			  
			  <table class="tabla-listados">
			<tr>
			<td id="reports" > <bean:message key="BzComposer.reportcenter.employee.description" /></a></td>		
			</tr>					
			</table>				
				<a><span><bean:message key="BzComposer.reportcenter.employee.salesbyrepdetails"/></span></a>	
			<br>
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowEmployeeSalesByRep()" ><bean:message key="BzComposer.reportcenter.employee.salesbyrepdetails"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.employee.salesbyrepdetails.description" /></td>			
			</tr>
			</table>
			 <a ><span><bean:message key="BzComposer.reportcenter.employee.salesreportbyrep" /></span></a>	<br/>
			
				   <table class="tabla-listados">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowEmployeeSalesReportByRep()" ><bean:message key="BzComposer.reportcenter.employee.salesreportbyrep"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.employee.salesreportbyrep.description" /></td>			
			</tr>
			

			</table>
			</div>
			
			<!--  customer -->
			<div id="customer" style="display:none;">
			 <a><span><bean:message key="BzComposer.reportcenter.customerreceivables" /></span></a> <br/>
			 	  <table class="tabla-listados">
			<tr>
			<td id="reports" ><bean:message key="BzComposer.reportcenter.customerandreceivables.description" /></a></td>		
			</tr>					
			</table>
				
				<a><span><bean:message key="BzComposer.reportcenter.listing"/></span></a>	
			<br>
			
		
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowCustomerList()" ><bean:message key="BzComposer.reportcenter.listing.customerlist"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.customerlist.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowCustomerPhoneList()" ><bean:message key="BzComposer.reportcenter.listing.customerphonelist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.customerphonelist.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowCustomerContactList()" ><bean:message key="BzComposer.reportcenter.listing.customercontactlist" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.customercontactlist.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowTrancsactionbylistCustomer()" ><bean:message key="BzComposer.reportcenter.listing.transactionlistbycustomer" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.listing.customercontactlist.description" /></td>			
			</tr>
			</table>
			
				<a><span><bean:message key="BzComposer.reportcenter.balance"/></span></a>
				<br>
				
				<table class="tabla-listados" cellspacing="0">
					<tr>
					<td width="45">
						<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowCustomerBalSummary()" ><bean:message key="BzComposer.reportcenter.balance.customerbalancesummary"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.balance.customerbalancesummary.description" /></td>			
					</tr>
					<tr>
					<td width="45">
						<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowCustomerBalDetail()" ><bean:message key="BzComposer.reportcenter.balance.customerbalancedetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.balance.customerbalancedetail.description" /></td>			
					</tr>
				</table>
				
				<!-- Starting sales for customer -->
						<a><span><bean:message key="BzComposer.reportcenter.sales"/></span></a>	
			<br>
			
		
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowCustomerList()" ><bean:message key="BzComposer.reportcenter.sales.salesbycustomerdetails"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.sales.salesbycustomerdetails.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowSalesByCustomerSummary()" ><bean:message key="BzComposer.reportcenter.sales.salesbycustomersummary" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.sales.salesbycustomersummary.description" /></td>			
			</tr>
			</table>
				<!-- end of sales for customer -->
				
			<!-- Starting Income for customer -->
						<a><span><bean:message key="BzComposer.reportcenter.income"/></span></a>	
			<br>
			<table class="tabla-listados" cellspacing="0">
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowIncomeCustomerSummary()" ><bean:message key="BzComposer.reportcenter.income.incomebycustomersummary"/></a></td>
			<td><bean:message key="BzComposer.reportcenter.income.incomebycustomersummary.description" /></td>			
			</tr>
			<tr>
			<td width="45">
			<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
			</td>
			<td id="reports"><a onclick="ShowIncomeCustomerDetail()" ><bean:message key="BzComposer.reportcenter.income.incomebycustomerdetail" /></a></td>
			<td><bean:message key="BzComposer.reportcenter.income.incomebycustomerdetail.description" /></td>			
			</tr>
			</table>
				<!-- end of Income for customer -->	
				
			</div>
			
			<!-- Banking & Accounting Started -->
			<div id="Banking&Accounting">
				<a><span><bean:message key="BzComposer.reportcenter.bankingreports"/></span></a>
				<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td id="BankingReports" > <bean:message key="BzComposer.reportcenter.bankingreports.description" /></a></td>		
					</tr>	
				</table>
				<a><span><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail"/></span></a>
				<br>
				<table class="tabla-listados" cellspacing="0">
					<tr>
					<td width="45">
						<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowCheckDetail()" ><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.checkdetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.checkdetail.description" /></td>			
					</tr>
					<tr>
					<td width="45">
						<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowDepositDetail()" ><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.depositdetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.depositdetail.description" /></td>			
					</tr>
					<tr>
					<td width="45">
						<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowBillDetail()" ><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.billdetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.billdetail.description" /></td>			
					</tr>
					<tr>
					<td width="45">
						<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="TransactionDeatail()" ><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.transactiondeatails"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.bankingandtransactiondetail.transactiondeatails.description" /></td>			
					</tr>
					</table>
					
					<a><span><bean:message key="BzComposer.reportcenter.graph"/></span></a>
					<br>
						<table class="tabla-listados" cellspacing="0"">
							<tr>
								<td width="45">
									<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
									</td>
									<td id="reports"><a onclick="ShowAccountReceivableGraph()" ><bean:message key="BzComposer.reportcenter.graph.accountreceivablegraph"/></a></td>
									<td><bean:message key="BzComposer.reportcenter.graph.accountreceivablegraph.description" /></td>			
								</tr>
						</table>
						<a><span><bean:message key="BzComposer.reportcenter.account"/></span></a>
					<br>
						<table class="tabla-listados" cellspacing="0"">
							<tr>
								<td width="45">
									<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
									</td>
									<td id="reports"><a onclick="ShowAccountReceivable()" ><bean:message key="BzComposer.reportcenter.account.accountreceivable"/></a></td>
									<td><bean:message key="BzComposer.reportcenter.account.accountreceivable.description" /></td>			
								</tr>
						</table>
						<a><span><bean:message key="BzComposer.reportcenter.accountpayable"/></span></a>
					<br>
						<table class="tabla-listados" cellspacing="0"">
							<tr>
								<td width="45">
									<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
									</td>
									<td id="reports"><a onclick="ShowAccountPayable()" ><bean:message key="BzComposer.reportcenter.accountpayable"/></a></td>
									<td><bean:message key="BzComposer.reportcenter.accountpayable.description" /></td>			
								</tr>
						</table>
						<a><span><bean:message key="BzComposer.reportcenter.graph"/></span></a>
					<br>
						<table class="tabla-listados" cellspacing="0"">
							<tr>
								<td width="45">
									<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
									</td>
									<td id="reports"><a onclick="AccountPayableGraph()" ><bean:message key="BzComposer.reportcenter.accountpayablegraph"/></a></td>
									<td><bean:message key="BzComposer.reportcenter.accountpayablegraph.description" /></td>			
								</tr>
						</table>
			</div>
			<!-- End of Banking & Accounting -->
            <!-- Profit & Budget Start -->
            	<div id="Profit&Budget">
            	  <a><span><bean:message key="BzComposer.reportcenter.profitorloss.profitlossreports"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td id="BankingReports" > <bean:message key="BzComposer.reportcenter.profitorloss.profitlossreports.description" /></a></td>		
					</tr>	
				</table>
				 <a><span><bean:message key="BzComposer.reportcenter.profitorloss.profitlossreports"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowProfitLoss()" ><bean:message key="BzComposer.reportcenter.profitorloss.profitlossstandard"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.profitorloss.profitlossstandard.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowProfitLossDetail()"><bean:message key="BzComposer.reportcenter.profitorloss.profitlossdetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.profitorloss.profitlossdetail.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowProfitLossByJob()"><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbyjob"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbyjob.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="showProfitLossByItem()" ><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbyitem"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbyitem.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="showBudgetOverview();"><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbudgetoverview"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbudgetoverview.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="showBudgetVsActual();"><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbudgetactual"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.profitorloss.profitlossbudgetactual.description" /></td>			
					</tr>
				</table>
				
				 <a><span><bean:message key="BzComposer.reportcenter.financialreport"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="showIncomeStatement()" ><bean:message key="BzComposer.reportcenter.financialreport.incomestatement"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.financialreport.incomestatement.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowBalSheet()" ><bean:message key="BzComposer.reportcenter.financialreport.balancesheet"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.financialreport.balancesheet.description" /></td>			
					</tr>
				</table>
				<a><span><bean:message key="BzComposer.reportcenter.cashflow"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports">
						<a onclick="ShowCashFlow()">
							<bean:message key="BzComposer.reportcenter.cashflow.cashflowstatement"/>
						</a>
						</td>
						<td><bean:message key="BzComposer.reportcenter.cashflow.cashflowstatement.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowCashFlowForeCast()" ><bean:message key="BzComposer.reportcenter.cashflow.cashflowforecast"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.cashflow.cashflowforecast.description" /></td>			
					</tr>
				</table>
				
				<a><span><bean:message key="BzComposer.reportcenter.graph"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="IncomeExpenseGraph()" ><bean:message key="BzComposer.reportcenter.graph.incomeandexpensegraph"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.graph.incomeandexpensegraph.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="Networth()" ><bean:message key="BzComposer.reportcenter.graph.networthgraph"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.graph.networthgraph.description" /></td>			
					</tr>
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="BudgetvsActualGraph()" ><bean:message key="BzComposer.reportcenter.graph.budgetvsactualgraph"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.graph.budgetvsactualgraph.description" /></td>			
					</tr>
				</table>
            	</div>
            
            <!-- End of Profit & Budget -->

			<!-- Tax Starting -->
			<div id="taxR">
            	  <a><span><bean:message key="BzComposer.reportcenter.tax"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td id="BankingReports" > <bean:message key="BzComposer.reportcenter.tax.description" /></a></td>		
					</tr>	
				</table>
				 <a><span><bean:message key="BzComposer.reportcenter.tax.salestax"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowSalesTaxSummary()" ><bean:message key="BzComposer.reportcenter.tax.salestax.summary"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.tax.salestax.summary.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShowReportTaxDetail()" ><bean:message key="BzComposer.reportcenter.tax.salestax.detail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.tax.salestax.detail.description" /></td>			
					</tr>
			 	</table>
			</div>
			<!-- End of Tax -->
			
			<!-- Start of Lists -->
			 <div id="lists">
			     <a><span><bean:message key="BzComposer.reportcenter.lists"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td id="BankingReports" > <bean:message key="BzComposer.reportcenter.lists.description" /></a></td>		
					</tr>	
				</table>
				 <a><span><bean:message key="BzComposer.reportcenter.lists"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ChartsofCategories()" ><bean:message key="BzComposer.reportcenter.lists.chartsofcategories"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.chartsofcategories.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="TermList()" ><bean:message key="BzComposer.reportcenter.lists.termlist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.termlist.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="SaleRepList()" ><bean:message key="BzComposer.reportcenter.lists.salereplist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.salereplist.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="PaymentMethodList()" ><bean:message key="BzComposer.reportcenter.lists.paymentmethodlist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.paymentmethodlist.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ShipViaList()" ><bean:message key="BzComposer.reportcenter.lists.shipvialist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.shipvialist.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="TaxTypeList()" ><bean:message key="BzComposer.reportcenter.lists.taxtypelist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.taxtypelist.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="FootnoteList()" ><bean:message key="BzComposer.reportcenter.lists.footnotelist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.footnotelist.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="MessageList()" ><bean:message key="BzComposer.reportcenter.lists.messagelist"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.lists.messagelist.description" /></td>			
					</tr>
			 	</table>
			 </div>
			<!-- End of Lists -->
			
			
			<!-- Start of eSales -->
			 <div id="eSales">
			     <a><span><bean:message key="BzComposer.reportcenter.esales"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td id="BankingReports" > <bean:message key="BzComposer.reportcenter.esales.description" /></a></td>		
					</tr>	
				</table>
				 <a><span><bean:message key="BzComposer.reportcenter.esalesdetail"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ESales_Invoice_Detail()" ><bean:message key="BzComposer.reportcenter.esalesinvoicedetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.esalesinvoicedetail.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ESales_Refund_Detail()" ><bean:message key="BzComposer.reportcenter.esalesrefunddetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.esalesrefunddetail.description" /></td>			
					</tr>
			 	</table>
			 	
			 	 <a><span><bean:message key="BzComposer.reportcenter.esale.sale"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ESales_sale_Detail()" ><bean:message key="BzComposer.reportcenter.esalessaledetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.esalessaledetail.description" /></td>			
					</tr>
					<tr>
					<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ESales_Inventory_Sale_Statistics()" ><bean:message key="BzComposer.reportcenter.esalesinventorysalestatistics"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.esalesinventorysalestatistics.description" /></td>			
					</tr>
			 	</table>
			 	
			 	 <a><span><bean:message key="BzComposer.reportcenter.crosssale"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="Cross_Sell_Inventory_Report()" ><bean:message key="BzComposer.reportcenter.crosssale.crosssaledetail"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.crosssale.crosssaledetail.description" /></td>			
					</tr>
			 	</table>
			 	
			 	 <a><span><bean:message key="BzComposer.reportcenter.graph"/></span></a>
					<br>
				<table class="tabla-listados" cellspacing="0"">
					<tr>
						<td width="45">
							<img src="<bean:write name="path" property="pathvalue"/>/images/invoice.png" />						
						</td>
						<td id="reports"><a onclick="ESale_Sales_Graph()" ><bean:message key="BzComposer.reportcenter.graph.esalesalesgraph"/></a></td>
						<td><bean:message key="BzComposer.reportcenter.graph.esalesalesgraph.description"/></td>			
					</tr>
			 	</table>
			 	
			 </div>
			<!-- End of eSales -->
			
			<!--  Inventory -->
			<div id="inventory">
			Five Content
			</div>

			<!-- Employee -->

			<div id="employee" >
			six content
			</div>

			<!-- Tax -->
			<div id="tax">
			Seven Content
			</div>

			<!--  Reminders -->
			<div id="reminder" >
			Nine Content
			</div>

			<!--  Finance charges -->
			<div id="finance">
			Ten Content
			</div>

			<!-- SMTP Setup -->
			<div id="smtp" >
			ELE Content
			</div>

			<!-- Performance -->
			<div id="perfomance">
			Twe Content
			</div>

			<!-- Manage Service Type -->
			<div id="servicetype" >
			Thit Content
			</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div></div></div></div></div>
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
</html>

<script type="text/javascript">


// function showAllInvoiceList(){
// 	window.open("SalesBord.do?tabid=AllInvoiceList",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );

	
// }

	function SetRow(rid){
		debugger;
		setTableVisible(rid);
	}	
	function setTableVisible(rid){
		if(rid=="tr0"){
			debugger;
			document.getElementById('customer').style.display='block';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			document.getElementById('eSales').style.display='none';
			
			
			document.getElementById('img01').style.display='none';
			document.getElementById('img02').style.display='block';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block'; */
			/* document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block'; */
			/* document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block'; */
			debugger;
			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
		}
		else if(rid=="tr1"){
			debugger;
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='block';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			document.getElementById('eSales').style.display='none';
			
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='none';
			document.getElementById('img12').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block'; */

			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
		}
		else if(rid=="tr2"){
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='block';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			document.getElementById('eSales').style.display='none';
			
			
			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='block';
			document.getElementById('img21').style.display='none';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block'; */
		}
		else if(rid=="tr3"){
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='block';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			document.getElementById('eSales').style.display='none';
			
			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img31').style.display='none';
			document.getElementById('img32').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block'; 
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/	
		}
		else if(rid=="tr4"){
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='block';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			
			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='block';
			document.getElementById('img41').style.display='none';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/	
		}
		/* else if(rid=="tr5"){
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='block';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='block';
			document.getElementById('img51').style.display='none';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';
		} */
		else if(rid=="tr5"){
			debugger;
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='block';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			
			
			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='block';
			document.getElementById('img51').style.display='none';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block'; 
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
		}
		else if(rid=="tr6"){
			/* document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='block';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='block';
			document.getElementById('img61').style.display='none';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block'; */
			
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='block';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='block';
			document.getElementById('img61').style.display='none';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
		}
		else if(rid=="tr7"){
			/* document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='block';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='block';
			document.getElementById('img71').style.display='none';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block'; */
			
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='block';
			document.getElementById('lists').style.display='none';
			
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='block';
			document.getElementById('img71').style.display='none';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block'; 
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
		}
		else if(rid=="tr8"){
			/* document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='block';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='block';
			document.getElementById('img81').style.display='none';
			document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block'; */
			
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('eSales').style.display='none';
			document.getElementById('lists').style.display='block';
			
			
			document.getElementById('esalesnonsel').style.display='block';
			document.getElementById('esalessel').style.display='none';
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='block';
			document.getElementById('img81').style.display='none';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
		}
		else if(rid=="tr9"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='block';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='block';
			document.getElementById('img91').style.display='none'; 
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
			
		}
		else if(rid=="tr10"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='block';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='block';
			document.getElementById('img101').style.display='none';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
			
		}
		else if(rid=="tr11"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='block';
			document.getElementById('servicetype').style.display='none';
			
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='block';
			document.getElementById('img111').style.display='none';
			document.getElementById('img122').style.display='none';
			document.getElementById('img121').style.display='block';*/
			
		}
		else if(rid=="tr12"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='block';
			
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/*document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='block';
			document.getElementById('img121').style.display='none';*/
			
		}
		
		else if(rid=="tr15"){
			document.getElementById('customer').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('Banking&Accounting').style.display='none';
			document.getElementById('Profit&Budget').style.display='none';
			document.getElementById('taxR').style.display='none';
			document.getElementById('lists').style.display='none';
			document.getElementById('eSales').style.display='block';
			
			
			document.getElementById('img01').style.display='block';
			document.getElementById('img02').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img22').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img62').style.display='none';
			document.getElementById('img61').style.display='block';
			document.getElementById('img72').style.display='none';
			document.getElementById('img71').style.display='block';
			document.getElementById('img82').style.display='none';
			document.getElementById('img81').style.display='block';
			/* document.getElementById('img92').style.display='none';
			document.getElementById('img91').style.display='block';
			document.getElementById('img102').style.display='none';
			document.getElementById('img101').style.display='block';
			document.getElementById('img112').style.display='none';
			document.getElementById('img111').style.display='block';
			document.getElementById('img122').style.display='block';
			document.getElementById('img121').style.display='none'; */
			document.getElementById('esalesnonsel').style.display='none';
			document.getElementById('esalessel').style.display='block';
		}
	}
	
function init()
{
	debugger;
	SetRow('tr0');
}
</script>