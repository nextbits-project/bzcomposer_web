<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title><bean:message key="menu.eSales.eSalesSalesBoard" /></title>
</head>
<body>

<div id="ddcolortabsline">&nbsp;</div>
<div class="esb_body">

<div class="esb_page-heading">

	<h3><bean:message key="menu.eSales.eSalesSalesBoardName" /></h3>

</div>

<div class="esb_tab">
	<ul>
	
		<li id="esb_tab1"><bean:message key="menu.eSales.eSalesSalesBoardName" /></li>
		<li id="esb_tab2"><bean:message key="menu.eSales.eSales_Product_Submisson" /></li>	
	
	</ul>
</div>

<div class="esb_tab1_details">

	<div class="esb_filter_option">
	
		<div class="esb_date_range">
		
		
		<form action="">
		
		<table>
		
			<tr>
				<td>
						<table>
									<tr>
										<td>Date Range <select>
												<option></option>
												<option>All</option>
												<option>Custom</option>
												<option>ToDay</option>
												<option>This Month</option>
												<option>This Quarter</option>
												<option>1 Year</option>
										</select>
										</td>
									</tr>

									<tr>
										<td><input type="radio" name="a"> Order Date <input
											type="text"> &nbsp;&nbsp;&nbsp; to <input type="text">
										</td>
									</tr>

									<tr>
										<td><input type="radio" name="a"> Sale Date <input
											type="text"> &nbsp;&nbsp;&nbsp; to <input type="text">
										</td>
									</tr>

									<tr>
										<td><input type="checkbox"> Show Only Emails NOT
											Sent</td>
									</tr>

							</table>
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>
						<table>
									<tr>
										<td>Search</td>
									</tr>

									<tr>
										<td>Column
											<select>
												<option></option>
												<option>All</option>
												<option>Custom</option>
												<option>ToDay</option>
												<option>This Month</option>
												<option>This Quarter</option>
												<option>1 Year</option>
										</select>
										</td>
									</tr>

									<tr>
										<td>Text <input type="text">
										</td>
									</tr>

									<tr>
										<td>Date Format : (MM/DD/YYYY)</td>
									</tr>

							</table>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<table>
						<tr>
							<td><input type="submit"></td>
						</tr>
						<tr>
							<td><input type="reset" value="Clear"></td>
						</tr>
						<tr>
							<td><input type="reset" value="Refresh"></td>
						</tr>
					</table>
					
				</td>
				
			</tr>
		
		</table>
      	</form>	
    		
		
		</div>
	
	</div>
	
	
	<div class="esb_button_right">
	
		<ul>
			<li><button>Bulk Mailer</button></li>
			<li><button>eSales Batch Print</button></li>
			<li><button>eSales Batch Import</button></li>
			<li><button>Update Shipping</button></li>
		</ul>
	
	</div>
	
	
	<div class="esb_saleslist">
	
		<div class="esb_saleslist_title">
			<h3>Sales List</h3>
		</div>
		<table border="1">
		<thead>
			<tr>
				<th>Order #</th>
				<th>Market</th>
				<th>Store</th>
				<th>Order Date</th>
				<th>Sale Date</th>
				<th>Order ID (Transaction #)</th>
				<th>Name</th>
				<th>Address</th>
				<th>Product Name</th>
				<th>Amount</th>
				<th>Shipping Cost</th>
				<th>Total Amount</th>
				<th>Email Addr.</th>
				<th><input type="checkbox"> Printed</th>
				<th><input type="checkbox"> Shipped</th>
				<th><input type="checkbox"> Email</th>
			</tr>
		</thead>
		<tbody>
		
			
		
		</tbody>
		</table>
	
	</div>
	
	
	<div class="esb_button_bottom">
	
		<ul>
		
			<li><button>Lookup</button></li>
			<li><button>Create Record</button></li>
			<li><button>Send Email</button></li>
			<li><button>Save</button></li>
			<li><button>Add to Refund List</button></li>
		
		</ul>
	
	</div>
	

</div>

<div class="esb_tab2_details">

	
	<div class="esb_tab2_details_inner_tab">
	
		<ul>
	
		<li id="esb_tab2_details_inner_tab1"><bean:message key="Item_Upload" /></li>
		<li id="esb_tab2_details_inner_tab2"><bean:message key="Upload_History" /></li>	
	
		</ul>
	
	</div>
	
	
	<div class="esb_tab2_details_inner_tab1_details">
	
		<div class="esb_item_upload_tab">
		
			
			<table>
			
				<tr>
					<td style="vertical-align:-webkit-baseline-middle">List On :</td>
					
					<td>
						<p style="margin: 0px;">Available Stores:</p>
						
						<select class="multiselect1" name="myselecttsms1" size="5">
						    <option value="One" rel="0" title="One">One</option>
						    <option value="2" rel="1" title="Two">Two</option>            
						    <option value="4" rel="3" title="Four">Four</option>
						    <option value="5" rel="4" title="Five">Five</option>
						    <option value="6" rel="5" title="Six">Six</option>
						</select>
						
					</td>
					
					<td>
						<button class="add">></button><br>
						<button class="remove"><</button>
					</td>
					
					
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					
					<td>
						<p style="margin: 0px;">Available Stores:</p>
						
						<select class="multiselect2" name="myselecttsms2" id="mySelect2" size="5">
						   
						</select>
						
					</td>
					
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					
					<td style="vertical-align: bottom;"> 
						<button class="add">Save</button>
							<button class="remove">Submit Now</button>
					</td>
					
				</tr>
			
			</table>
			
			
			<div class="esb_saleslist">
	
		<div class="esb_saleslist_title">
			<h3>Sales List</h3>
		</div>
		<table border="1">
		<thead>
			<tr>
				<th>Selected</th>
				<th>Order #</th>
				<th>Market</th>
				<th>Store</th>
				<th>Order Date</th>
				<th>Sale Date</th>
				<th>Order ID (Transaction #)</th>
				<th>Name</th>
				<th>Address</th>
				<th>Product Name</th>
				<th>Amount</th>
				<th>Shipping Cost</th>
				<th>Total Amount</th>
				<th>Email Addr.</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
		</table>
	
	</div>
	
			
			
		
		</div>
		
	
	</div>
	
	
	
	<div class="esb_tab2_details_inner_tab2_details">
	
		tab 2 
	
	</div>
	
	

</div>

</div>

</body>
</html>