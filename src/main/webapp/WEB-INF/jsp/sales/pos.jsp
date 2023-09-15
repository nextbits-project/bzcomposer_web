<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<!--    font-awesome cdn-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/owl.carousel.min.css" />
<script src="${pageContext.request.contextPath}/scripts/owl.carousel.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.postitle" /></title>
<style type="text/css">
/** Semibold */
@font-face {
	font-family: "SF Mono";
	font-weight: 600;
	src: url("https://sf.abarba.me/SFMono-Semibold.otf");
}

/** Semibold Italic */
@font-face {
	font-family: "SF Mono";
	font-weight: 600;
	font-style: italic;
	src: url("https://sf.abarba.me/SFMono-SemiboldItalic.otf");
}

body {
	/* font-family: "SF Mono"; */
	min-width: 1366px;
}

page-title {
	/* font-size: 18px;margin: 30px 0px 15px 0px;padding: 0 0 10px 0; */
	
}

.msgstyle {
	font-size: 18px;
	color: #3D9EAC;
}

.showCustomer {
	font: bold italic 100px;
}

table.cart tbody tr td {
	font-size: 14px;
}
</style>
<script type="text/javascript">
$(function() {
	var locale = "<%= request.getAttribute("selectedLocale")%>";
	$('select[id="locale"]').find('option[value="'+locale+'"]').attr("selected",true);
	$("#sortByLastName").change(function(){
	var checked = $("#sortByLastName").prop('checked');
	if(checked == true){
		$.ajax({
			type: "POST",
			url:"Invoice?tabid=SortInvoice&SortBy=LastName",
			data:{sortBy : "LastName"},
			success : function(data) {
			    $(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
			},
			error : function(data) {
                alert("<bean:message key='BzComposer.categorydetail.erroroccurred'/>");
            }
		});
	} else {
		$.ajax({
        	type : "POST",
         	url:"Invoice?tabid=SortInvoice&SortBy=Name",
        	data:{sortBy : "Name"},
            success : function(data) {
        		$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
        	},
        	 error : function(data) {
        		alert("<bean:message key='BzComposer.categorydetail.erroroccurred'/>");
        	}
        });

	}
});
});
function saveItemName() 
{
	event.preventDefault();
	$("#SaveItemName").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var itemName = $.trim(document.getElementById('pname_id').value);
            	var item = document.getElementById('itemID');
            	var itemId = item.options[item.selectedIndex].value;
            	window.location.href = "Invoice?tabid=saveItemName&itemName="+itemName+"&itemID="+itemId;
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}
function saveNewUnitPrice()
{
	event.preventDefault();
	$("#SaveUnitPrice").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var price = document.getElementById('unitPrice_id').value;
				var item = document.getElementById('itemID');
				var itemId = item.options[item.selectedIndex].value;
				window.location.href = "Invoice?tabid=saveUnitPrice&price="+price+"&itemID="+itemId;
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function updateQuantityOfSelectedItem()
{
	event.preventDefault();
	$("#saveQuantity").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var quantity = document.getElementById('qty_id').value;
				var item = document.getElementById('itemID');
				var itemId = item.options[item.selectedIndex].value;
				//window.location.href = "Invoice?tabid=saveQuantity&quantity="+price+"&itemID="+itemId;
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function showItemOrderNumberDialog(){
	event.preventDefault();
	$("#showItemOrderNumberDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showValidationDialog(){
	event.preventDefault();
	$("#showValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showSelectItemDialog(){
	event.preventDefault();
	$("#showSelectItemDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function deleteInvoiceDialog(){
	event.preventDefault();
	$("#deleteInvoiceDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                window.location="Invoice?tabid=DeleteInvoice&&CustomerID="+cid;
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function ShowBillingAddressPage(form){
    custID = form.custID.value;
    let addressID = form.bsAddressID.value;
    window.open("Invoice?tabid=getBillingAddress&addressType=bill&cvID="+custID+"&addressID="+addressID, null,"scrollbars=yes,height=600,width=600,status=yes,toolbar=no,menubar=no,location=no");
}

function ShowShippingAddressPage(form){
    custID = form.custID.value;
    let addressID = form.shAddressID.value;
    window.open("Invoice?tabid=getBillingAddress&addressType=ship&cvID="+custID+"&addressID="+addressID, null,"scrollbars=yes,height=600,width=600,status=yes,toolbar=no,menubar=no,location=no");
}
</script>
</head>
<body onload="Init();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos" class=" h-100 POS posBG">
		<div class="statusquo ok POS h-100">
			<div id="hoja" class="h-100 posBG">
				<div id="blanquito" class="h-100 posBG">
					<div id="padding" class="h-100 posBG">
						<!-- 
					POS Starts
					 -->
						<div class="container-fluid h-100">
							<div class="row">
								<div class="col-md-2">
									<input type="text" class="form-control" value="Q">
									<div class="card mt-3 p-2 h-100">
										<div
											class="d-flex justify-content-between align-items-center flex-wrap">
											<h4>Running Orders</h4>
											<button class="border-0 bg-transparent">
												<i class="fa-solid fa-arrow-rotate-right"></i>
											</button>
										</div>
										<input type="text" class="form-control"
											placeholder="Table, Order Number, Waiter">
										<section class="mt-3 h-50">
											<div class="border border-1 rounded p-1 my-1">
												<a href="" class="text-dark">Order:A 200, Table:01</a><span
													class="float-right"><i
													class="fa-solid fa-arrow-right"></i></span>
											</div>
											<div class="border border-1 rounded p-1 my-1">
												<a href="" class="text-dark">Order:B 200, Table:02</a><span
													class="float-right"><i
													class="fa-solid fa-arrow-right"></i></span>
											</div>
											<div class="border border-1 rounded p-1 my-1">
												<a href="" class="text-dark">Order:C 200, Table:03</a><span
													class="float-right"><i
													class="fa-solid fa-arrow-right"></i></span>
											</div>
										</section>

										<section class="mt-3">
											<div
												class="border border-1 rounded p-1 my-1 text-center buttonBG">
												<span><i class="fa-solid fa-pen-to-square mr-1"></i></span><a
													href="" class="text-dark">Modify Order,Add Order,
													Change Table</a>
											</div>
											<div
												class="border border-1 rounded p-1 my-1 text-center buttonBG">
												<span><i class="fa-solid fa-circle-info mr-1"></i></span><a
													href="" class="text-dark">Order Details</a>
											</div>
											<div
												class="border border-1 rounded p-1 my-1 text-center buttonBG">
												<span><i class="fa-solid fa-print mr-1"></i></span><a
													href="" class="text-dark">Print KOT</a>
											</div>
											<div
												class="border border-1 rounded p-1 my-1 text-center buttonBG">
												<span><i class="fa-solid fa-file-invoice mr-1"></i></span><a
													href="" class="text-dark">New Invoice & Close</a>
											</div>
											<div
												class="border border-1 rounded p-1 my-1 text-center buttonBG">
												<span><i class="fa-solid fa-ban mr-1"></i></span><a href=""
													class="text-dark">Cancel</a>
											</div>
											<div
												class="border border-1 rounded p-1 my-1 text-center buttonBG">
												<span><i class="fa-solid fa-spinner mr-1"></i></span><a
													href="" class="text-dark">Kitchen Status</a>
											</div>
										</section>
									</div>
								</div>

								<div class="col-md-4">
									<section>
										<div class="d-flex justify-content-between">
											<div class="d-flex">
												<button class="btn buttonBG">
													<span><i class="fa-regular fa-folder-open mr-1"></i></span>Open
													Hold Sales
												</button>
												<select class="form-control ml-1 buttonShadow" name="">
													<option value="en">English</option>
													<option value="bn">Bangla</option>
												</select>
											</div>
											<div class="d-flex align-items-center">
												<button class="btn buttonBG">
													<span><i class="fa-solid fa-calculator mr-1"></i></span>Calculator
												</button>
												<button class="btn btn-danger ml-1 buttonShadow">
													<span><i class="fa-solid fa-circle-question mr-1"></i></span>Read
													Before Begin
												</button>
											</div>
										</div>
									</section>

									<div class="card h-100 mt-3">
										<div class="p-2">
											<div class="d-flex justify-content-between">
												<button class="btn buttonBG btn-sm w-25">
													<span><i class="fa-solid fa-utensils mr-1"></i></span>Dine
													In
												</button>
												<button class="btn buttonBG btn-sm w-25">
													<span><i class="fa-solid fa-bag-shopping mr-1"></i></span>Take
													Away
												</button>
												<button class="btn buttonBG btn-sm w-25">
													<span><i class="fa-solid fa-truck mr-1"></i></span>Delivery
												</button>
											</div>
											<div class="d-flex justify-content-between mt-2">
												<select
													class="form-control buttonShadow w-25 form-control-sm"
													name="">
													<option value="en">Waiter</option>
													<option value="bn">Bangla</option>
												</select>
												<div class="d-flex w-25">
													<select class="form-control buttonShadow form-control-sm"
														name="">
														<option value="en">Customer</option>
														<option value="bn">Bangla</option>
													</select>
													<button class="border-0 bg-transparent btn-sm">
														<span><i class="fa-solid fa-pen-to-square"></i></span>
													</button>
													<button class="border-0 bg-transparent btn-sm p-0">
														<span><i class="fa-solid fa-circle-plus"></i></span>
													</button>
												</div>
												<button class="btn buttonBG btn-sm w-25">
													<span><i class="fa-solid fa-table mr-1"></i></span>Table
												</button>
											</div>
										</div>
										<div class=" itemSection mt-2">
											<div class="row">
												<div class="col-md-4">Item</div>
												<div class="col-md-2">Price</div>
												<div class="col-md-2">QTY</div>
												<div class="col-md-2">Discount</div>
												<div class="col-md-2">Price</div>
											</div>
										</div>

										<div class="h-50"></div>
										<section class="calculationSection p-2">
											<div class="row">
												<div class="col-md-3">Total Item : 0</div>
												<div class="col-md-9">
													<div class="row">
														<div class="col-md-6">
															<p class="float-right mb-0">Sub Total</p>
														</div>
														<div class="col-md-6">$ 00</div>
														<div class="col-md-6">
															<p class="float-right mb-0">Discount</p>
														</div>
														<div class="col-md-6">
															<input type="text" placeholder="Amt Or %"
																class="form-control form-control-sm">
														</div>
													</div>

													<div class="row mt-5">
														<div class="col-md-6">
															<p class="float-right mb-0">total Discount</p>
														</div>
														<div class="col-md-6">$ 00</div>
														<div class="col-md-6">
															<p class="float-right mb-0">Service/ Delivery Charge</p>
														</div>
														<div class="col-md-6">
															<input type="text" placeholder="Amt Or %"
																class="form-control form-control-sm">
														</div>
													</div>
												</div>
											</div>
											<div class="itemSection mt-3">
												<div class="row p-0">
													<div class="offset-6 col-md-6">
														<div class="row">
															<div class="col-md-6">
																<p class="float-right m-0">Total Payable</p>
															</div>
															<div class="col-md-5">$ 00</div>
														</div>
													</div>
												</div>
											</div>
										</section>
										<div class="row p-2">
											<div class="col-md-3">
												<button class="btn buttonBG btn-sm w-100">
													<span><i class="fa-solid fa-ban mr-1"></i></span>Cancel
												</button>
											</div>
											<div class="col-md-3">
												<button class="btn buttonBG btn-sm w-100">
													<span><i class="fa-solid fa-hand mr-1"></i></span>Hold
												</button>
											</div>
											<div class="col-md-3">
												<button class="btn buttonBG btn-sm w-100">
													<span><i class="fa-solid fa-file-invoice mr-1"></i></span>Direct
													Invoice
												</button>
											</div>
											<div class="col-md-3">
												<button class="btn buttonBG btn-sm w-100">
													<span><i class="fa-solid fa-utensils mr-1"></i></span>Place
													Order
												</button>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="d-flex">
										<button class="btn buttonBG w-25 mr-1">
											<span><i class="fa-solid fa-clock-rotate-left mr-1"></i></span>Last
											10 Sales
										</button>
										<button class="btn buttonBG w-25 mx-1">
											<span><i class="fa-solid fa-bell mr-1"></i></span>Kitchen
											Notification
										</button>
										<button class="btn buttonBG w-25 mx-1">
											<span><i class="fa-regular fa-address-card mr-1"></i></span>Register
										</button>
										<button class="btn buttonBG w-25 mx-1">
											<span><i class="fa-solid fa-backward mr-1"></i></span>Back
										</button>
										<button class="btn buttonBG w-25 ml-1">
											<span><i class="fa-solid fa-right-from-bracket mr-1"></i></span>Logout
										</button>
									</div>
									<div class="card p-2 mt-3 h-100">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1"><i
													class="fa-solid fa-magnifying-glass"></i></span>
											</div>
											<input type="text" class="form-control"
												placeholder="Name or Code or Category or VEG or BEV or BAR"
												aria-label="Username" aria-describedby="basic-addon1">
										</div>

										<div class="px-3 mt-2 carousel">
											<div class="owl-carousel p-2">
												<div class="text-center">
													<a class="text-dark border-left border-right px-3" href="">All</a>
												</div>
												<div class="text-center">
													<a class="text-dark border-left border-right px-3" href="">Main
														Dishes</a>
												</div>
												<div class="text-center">
													<a class="text-dark border-left border-right px-3" href="">Bowls</a>
												</div>
												<div class="text-center">
													<a class="text-dark border-left border-right px-3" href="">Additional
														Items</a>
												</div>
												<div class="text-center">
													<a class="text-dark border-left border-right px-3" href="">Family
														Packs</a>
												</div>
												<div class="text-center">
													<a class="text-dark border-left border-right px-3" href="">Drinks</a>
												</div>
												
											</div>
										</div>
										<div class="row mt-2">
											<div class="col-md-3">
												<div class="card p-2 card-color">
													<p class="text-center mb-0 pb-2">$ 50</p>
													<img class="img-fluid card-image"
														src="https://www.eatthis.com/wp-content/uploads/sites/4/2019/06/deep-dish-pizza-chicago.jpg"
														alt="">
													<h5 class="text-center mb-0">Pizza</h5>
												</div>
											</div>
											<div class="col-md-3">
												<div class="card p-2 card-color">
													<p class="text-center mb-0 pb-2">$ 50</p>
													<img class="img-fluid card-image"
														src="http://cdn.cnn.com/cnnnext/dam/assets/140430115517-06-comfort-foods.jpg"
														alt="">
													<h5 class="text-center mb-0">Lasagna</h5>
												</div>
											</div>
											<div class="col-md-3">
												<div class="card p-2 card-color">
													<p class="text-center mb-0 pb-2">$ 50</p>
													<img class="img-fluid card-image"
														src="https://blogs.biomedcentral.com/on-medicine/wp-content/uploads/sites/6/2019/09/iStock-1131794876.t5d482e40.m800.xtDADj9SvTVFjzuNeGuNUUGY4tm5d6UGU5tkKM0s3iPk-620x342.jpg"
														alt="">
													<h5 class="text-center mb-0">Vegetable</h5>
												</div>
											</div>
											<div class="col-md-3">
												<div class="card p-2 card-color">
													<p class="text-center mb-0 pb-2">$ 50</p>
													<img class="img-fluid card-image"
														src="https://cdn.shopify.com/s/files/1/0580/3245/5858/files/29351737_2152446668377854_356570745477300982_o_2152446668377854.jpg?v=1634843436&width=1080"
														alt="">
													<h5 class="text-center mb-0">KFC Chicken</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 
					POS Ends
					 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<!--Owl carousel js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".owl-carousel").owlCarousel({
            loop: true,
            margin: 10,
            responsiveClass: true,
            dots: false,
            responsive: {
                0: {
                    items: 1,
                    nav: true
                },
                600: {
                    items: 3,
                    nav: false
                },
                1000: {
                    items: 5,
                    nav: true,
                    loop: false
                }
            }
        });
    });
</script>
<script type="text/javascript">
isItemExist=0;
var wghtArr = new Array(100);
var itemArr = new Array(100);
var qtyArr = new Array(100);
var upriceArr = new Array(100);
var codeArr = new Array(100);
var taxArr = new Array(100);
var descArr = new Array(100);
var uwghtArr = new Array(100);
var serialArr = new Array(100);
var itmIDArr = new Array(100);
var itmOrdArr = new Array(100);

deleted = 0;
index1=0;
cnt=0;
count=0;
yestax=0;
tax_rate=0;
rate = 0;

// this function clear input value,
function clearShippingCol(){
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) -  parseFloat(document.InvoiceForm.shipping.value);
	document.InvoiceForm.total.value = parseFloat(convertSubData).toFixed(2);
	document.InvoiceForm.shipping.value = 0.00;
}
// this function sum Shipping value in total
function sumShippingTotal() {
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) +  parseFloat(document.InvoiceForm.shipping.value);
	document.InvoiceForm.total.value = parseFloat(convertSubData).toFixed(2);
	document.InvoiceForm.adjustedtotal.value = parseFloat(convertSubData).toFixed(2);

}

//this function clear input value, 
function clearDiscountCol(){
	document.InvoiceForm.adjustedtotal.value = 0.00;
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) + parseFloat(document.InvoiceForm.balance.value);
	document.InvoiceForm.balance.value = "";
}
//this function for calculat discount amount 
function calDiscountTotal() {
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) -  parseFloat(document.InvoiceForm.balance.value);
	document.InvoiceForm.adjustedtotal.value = parseFloat(convertSubData).toFixed(2);
}

function Pending_Value(form){
    if(form.isPending.checked==true){
        form.isPending.value="on";
    } else {
        form.isPending.value="off";
    }
}

function TaxaValue(form){
    if(form.taxable.checked==true){
        form.taxable.value="on";
    } else {
        form.taxable.value="off";
    }
}

function PaidItem(){
    if(document.InvoiceForm.paid.checked==true){
        document.InvoiceForm.paid.value="on";
    } else {
        document.InvoiceForm.paid.value="off";
    }
}
function ShippedItem(){
    if(document.InvoiceForm.itemShipped.checked==true){
        document.InvoiceForm.itemShipped.value="on";
    } else {
        document.InvoiceForm.itemShipped.value="off";
    }
}

function Assignment(value, form){
    debugger;
    if(value==0){
        
        document.InvoiceForm.billTo.value="";
        document.InvoiceForm.shipTo.value="";
        document.InvoiceForm.via.value="0"
        document.InvoiceForm.payMethod.value="0";
        document.InvoiceForm.rep.value="0";
        document.InvoiceForm.term.value="0";
        document.InvoiceForm.taxable.checked=false;
    }
    else if(value==1111){
        window.location.href = "Customer?tabid=NewCustomer";
    } else {
        
        size = document.getElementById("bSize").value;
        shsize = document.getElementById("sSize").value;
        var i;
        for(i=0;i<size;i++){
            var field1 = document.getElementById(i+"clvid").value;
            if(value==field1){
                document.getElementById('cid').value = value;
                form.custID.value = document.getElementById('cid').value;
                form.companyID.value = document.getElementById(i+"cid").value;
                form.bsAddressID.value = document.getElementById(i+"bsaddr").value;
                form.billTo.value = document.getElementById(i+"bl").value;
                break;
            }
        }
        for(i=0;i<shsize;i++){
            var field2 = document.getElementById(i+"sh_id").value;
            if(value==field2){
                form.shAddressID.value = document.getElementById(i+"shaddr").value;
                form.shipTo.value = document.getElementById(i+"sh").value;
                break;
            }
        }
        sz = document.getElementById('custSize').value;
        for(i=0;i<sz;i++)
        {
            var field11 = document.getElementById("a"+i+"clvndid").value;
            if(value==field11)
            {
                let custBalance = document.getElementById(i+"custBalance").value;
                if(custBalance == "true") document.getElementById("CustomerBalanceBtn").style.backgroundColor = "red";
                else document.getElementById("CustomerBalanceBtn").style.backgroundColor = "#05A9C5";
                let viaItem = document.getElementById(i+"va").value;
                /* if(viaItem==""){
                    document.InvoiceForm.via.value="0";
                }
                else{
                    document.InvoiceForm.via.value = viaItem;
                    document.InvoiceForm.rep.value = document.getElementById(i+"rp").value;
                    document.InvoiceForm.payMethod.value = document.getElementById(i+"paym").value;
                    document.InvoiceForm.term.value = document.getElementById(i+"trm").value;
                    document.InvoiceForm.taxable.checked = (document.getElementById("a"+i+"txable").value == "1")?true:false;
                    break;
                } */
            }
        }
    }
}
	
	function StyleChange(value)
	{
	    document.getElementById('inoiceStyle').value = value;
		document.getElementById('invStyle').value = value;
		size = document.getElementById('CartSize').value;
		hidn_val= document.getElementById('hidn').value;
		if(value==0)
		{
			product();
			/*QTY */
			document.getElementById('td4').style.display='none';
			document.getElementById('td3').style.display='block';		
			document.getElementById('td5').style.display='block';
			/*Serial No */
			document.getElementById('td6').style.display='none';
			document.getElementById('td7').style.display='none';
			/* DESC */	
			//document.getElementById('td8').style.display='block';
			//document.getElementById('td9').style.display='block';
					
			/* Unit Price/RatePrice*/		
			document.getElementById('td11').style.display='none';
			document.getElementById('td10').style.display='block';
			document.getElementById('td12').style.display='block';
			/* Amount*/
			document.getElementById('td13').style.display='block';		
			document.getElementById('td14').style.display='block';
			/* Weight*/	
			document.getElementById('td15').style.display='block';		
			document.getElementById('td16').style.display='block';
			/* Tax */	
			document.getElementById('td17').style.display='block';
			document.getElementById('td18').style.display='block';
				
			productTable(size);
			for(x=0;x<hidn_val;x++)
				productItem(x);					
		}
		if(value!=0)
		{
			document.getElementById('InvStyle').value=value;
			if(value==1)
			{
				service();
				/*QTY */
				//document.getElementById('td4').style.display='block';
				document.getElementById('td3').style.display='block';
				document.getElementById('td5').style.display='block';
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				/* DESC */	
				//document.getElementById('td8').style.display='block';
				//document.getElementById('td9').style.display='block';
					
				/* Unit Price/RatePrice*/		
				document.getElementById('td11').style.display='block';
				document.getElementById('td10').style.display='none';
				document.getElementById('td12').style.display='block';
				/* Amount*/
				document.getElementById('td13').style.display='none';		
				document.getElementById('td14').style.display='none';
				/* Weight*/	
				document.getElementById('td15').style.display='none';		
				document.getElementById('td16').style.display='none';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
				
				/* item in table */
				var i;
				for(i=0;i<size;i++)
				{
					document.getElementById(i+"icode").style.visibility='visible';
					document.getElementById(i+"qty").style.visibility='visible';
					document.getElementById(i+"desc").style.visibility='visible';
					document.getElementById(i+"iprice").style.visibility='visible';
					document.getElementById(i+"amt").style.visibility='hidden';
					document.getElementById(i+"wgt").style.visibility='hidden';
					document.getElementById(i+"itax").style.visibility='visible';
					document.getElementById(i+"serial").style.visibility='hidden';
				}
				
				document.getElementById("it1").style.visibility='visible';
				document.getElementById("it2").style.display='block';
				document.getElementById("it3").style.visibility='visible';
				document.getElementById("it4").style.display='none';
				document.getElementById("it5").style.visibility='hidden';
				document.getElementById("it6").style.visibility='hidden';
				document.getElementById("it7").style.visibility='visible';
				document.getElementById("it8").style.visibility='hidden';
				//document.getElementById("it22").style.display='block';
				document.getElementById("it42").style.display='block';
					
				for(x=0;x<hidn_val;x++)
					serviceItem(x);
			}
			else if(value==2)
			{
				quick(size);
				for(x=0;x<hidn_val;x++)
					quickItem(x);
			}
			else if(value==3)
			{
				manufacture(size)
				for(x=0;x<hidn_val;x++)
					manufactureItem(x);
			}
			else if(value==4)
			{
				product();
				productTable(size);
				for(x=0;x<hidn_val;x++)
					productItem(x);
				
				/*QTY */
				//document.getElementById('td4').style.display='none';
				document.getElementById('td3').style.display='block';		
				document.getElementById('td5').style.display='block';
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				/* DESC */	
				//document.getElementById('td8').style.display='block';
				//document.getElementById('td9').style.display='block';
					
				/* Unit Price/RatePrice*/		
				document.getElementById('td11').style.display='none';
				document.getElementById('td10').style.display='block';
				document.getElementById('td12').style.display='block';
				/* Amount*/
				document.getElementById('td13').style.display='block';		
				document.getElementById('td14').style.display='block';
				/* Weight*/	
				document.getElementById('td15').style.display='block';		
				document.getElementById('td16').style.display='block';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
			}
			else if(value==5)
			{
				finance(size);
				for(x=0;x<hidn_val;x++)
					financeItem(x);
			}
			else if(value==6)
			{
				professional(size);
				for(x=0;x<hidn_val;x++)
				{
					quickItem(x);
				}
			}
			else if(value==7)
			{
				ebusiness(size);
				for(x=0;x<hidn_val;x++)
				{
					ebusinessItem(x);
				}
			}
		}
	}
		
	function service()
	{
		/* hidden field for ship to */
		document.getElementById('ship_label').style.visibility="hidden";
		document.getElementById('ship_id').style.visibility="hidden";
				
		/* hidden field for ship date */
		document.getElementById('sh_date_label').style.visibility="hidden";
		document.getElementById('sh_date_id').style.visibility="hidden";
				
		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility="hidden";
		document.getElementById('rep_id').style.visibility="hidden";
		
		/* hidden field for via */
		document.getElementById('via_label').style.visibility="hidden";
		document.getElementById('via_id').style.visibility="hidden";
		
		/* Visible field for bill to */
		document.getElementById('bill_label').style.visibility="visible";
		document.getElementById('bill_id').style.visibility="visible";
		
		/* Visible field for Term & Payment */
		document.getElementById('td2').style.visibility="visible";		
				
	}
		
	function quick(size)
	{
		/* hidden field for ship to */
		document.getElementById('ship_label').style.visibility="hidden";
		document.getElementById('ship_id').style.visibility="hidden";

		/* hidden field for ship date */
		document.getElementById('sh_date_label').style.visibility="hidden";
		document.getElementById('sh_date_id').style.visibility="hidden";
		
		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility="hidden";
		document.getElementById('rep_id').style.visibility="hidden";
		
		/* hidden field for via */
		document.getElementById('via_label').style.visibility="hidden";
		document.getElementById('via_id').style.visibility="hidden";
		
		/* hidden field for bill to */
		document.getElementById('bill_label').style.visibility="hidden";
		document.getElementById('bill_id').style.visibility="hidden";
		
		/* hidden field for Term & Payment */
		document.getElementById('td2').style.visibility="hidden";
				
		/*QTY */
		document.getElementById('td4').style.display='none';
		document.getElementById('td3').style.display='block';		
		document.getElementById('td5').style.display='block';
		
		/*Serial No */
		document.getElementById('td6').style.display='none';
		document.getElementById('td7').style.display='none';
		
		/* DESC */	
		//document.getElementById('td8').style.display='block';
		//document.getElementById('td9').style.display='block';
					
		/* Unit Price/RatePrice*/		
		document.getElementById('td11').style.display='none';
		document.getElementById('td10').style.display='block';
		document.getElementById('td12').style.display='block';
				
		/* Amount*/
		document.getElementById('td13').style.display='block';		
		document.getElementById('td14').style.display='block';
		
		/* Weight*/	
		document.getElementById('td15').style.display='none';		
		document.getElementById('td16').style.display='none';
		
		/* Tax */	
		document.getElementById('td17').style.display='block';
		document.getElementById('td18').style.display='block';
				
		/* Item in Table  */
		quickTable(size);
						
	}
		
	function manufacture(size)
	{
		product();
		
		/*QTY */
		document.getElementById('td4').style.display='none';
		document.getElementById('td3').style.display='block';		
		document.getElementById('td5').style.display='block';
		
		/*Serial No */
		document.getElementById('td6').style.display='block';
		document.getElementById('td7').style.display='block';
			
		/* DESC */	
		//document.getElementById('td8').style.display='block';
		//document.getElementById('td9').style.display='block';
				
		/* Unit Price/RatePrice*/		
		document.getElementById('td11').style.display='none';
		document.getElementById('td10').style.display='block';
		document.getElementById('td12').style.display='block';
			
		/* Amount*/
		document.getElementById('td13').style.display='block';		
		document.getElementById('td14').style.display='block';
			
		/* Weight*/	
		document.getElementById('td15').style.display='none';		
		document.getElementById('td16').style.display='none';
			
		/* Tax */	
		document.getElementById('td17').style.display='block';
		document.getElementById('td18').style.display='block';
					
		/* Item in Table  */
		var i;
		for(i=0;i<size;i++)
		{
			document.getElementById(i+"icode").style.visibility='visible';
			document.getElementById(i+"qty").style.visibility='visible';
			document.getElementById(i+"desc").style.visibility='visible';
			document.getElementById(i+"iprice").style.visibility='visible';
			document.getElementById(i+"amt").style.visibility='visible';
			document.getElementById(i+"wgt").style.visibility='hidden';
			document.getElementById(i+"itax").style.visibility='visible';
			document.getElementById(i+"serial").style.visibility='visible';
		}
		document.getElementById("it1").style.visibility='visible';
		document.getElementById("it2").style.display='block';
		document.getElementById("it3").style.visibility='visible';
		document.getElementById("it4").style.display='block';
		document.getElementById("it5").style.visibility='visible';
		document.getElementById("it6").style.visibility='hidden';
		document.getElementById("it7").style.visibility='visible';
		document.getElementById("it8").style.visibility='visible';
			
		//document.getElementById("it22").style.display='none';
		document.getElementById("it42").style.display='none';
				
	}
		
	function product()
	{
		/* visible field for ship to */
		document.getElementById('ship_label').style.visibility="visible";
		document.getElementById('ship_id').style.visibility="visible";

		/* visible field for ship date */
		document.getElementById('sh_date_label').style.visibility="visible";
		document.getElementById('sh_date_id').style.visibility="visible";
				
		/* Visible field for bill to */
		document.getElementById('bill_label').style.visibility="visible";
		document.getElementById('bill_id').style.visibility="visible";
				
		/* Visible field for Term & Payment */
		document.getElementById('td2').style.visibility="visible";	
				
		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility="visible";
		document.getElementById('rep_id').style.visibility="visible";
				
		/* hidden field for via */
		document.getElementById('via_label').style.visibility="visible";
		document.getElementById('via_id').style.visibility="visible";
					
	}
		
	function productTable(size)
	{
		var i;
		for(i=0;i<size;i++)
		{
			document.getElementById(i+"icode").style.visibility='visible';
			document.getElementById(i+"qty").style.visibility='visible';
			document.getElementById(i+"desc").style.visibility='visible';
			document.getElementById(i+"iprice").style.visibility='visible';
			document.getElementById(i+"amt").style.visibility='visible';
			document.getElementById(i+"wgt").style.visibility='visible';
			document.getElementById(i+"itax").style.visibility='visible';
			document.getElementById(i+"serial").style.visibility='hidden';
		}
		document.getElementById("it1").style.visibility='visible';
		document.getElementById("it2").style.display='block';
		document.getElementById("it3").style.visibility='visible';
		document.getElementById("it4").style.display='block';
		document.getElementById("it5").style.visibility='visible';
		document.getElementById("it6").style.visibility='visible';
		document.getElementById("it7").style.visibility='visible';
		document.getElementById("it8").style.visibility='hidden';
		//document.getElementById("it22").style.display='none';
		document.getElementById("it42").style.display='none';
		
		value=document.getElementById('hidn').value;
		var j;
		for(j=0;j<value;j++)
		{
			document.getElementById(j+'1').style.visibility='visible';
			document.getElementById(j+'2').style.visibility='visible';
			document.getElementById(j+'3').style.visibility='hidden';
			document.getElementById(j+'4').style.visibility='visible';
			document.getElementById(j+'5').style.visibility='visible';
			document.getElementById(j+'6').style.visibility='visible';
			document.getElementById(j+'7').style.visibility='visible';
			document.getElementById(j+'8').style.visibility='visible';
		}
	}
		
	function finance(size)
	{
		service();
		
		/*QTY */
		document.getElementById('td4').style.display='none';
		document.getElementById('td3').style.display='none';		
		document.getElementById('td5').style.display='none';
		
		/*Serial No */
		document.getElementById('td6').style.display='none';
		document.getElementById('td7').style.display='none';
		
		/* DESC */	
		//document.getElementById('td8').style.display='block';
		//document.getElementById('td9').style.display='block';
					
		/* Unit Price/RatePrice*/		
		document.getElementById('td11').style.display='none';
		document.getElementById('td10').style.display='none';
		document.getElementById('td12').style.display='none';
				
		/* Amount*/
		document.getElementById('td13').style.display='block';		
		document.getElementById('td14').style.display='block';
				
		/* Weight*/	
		document.getElementById('td15').style.display='none';		
		document.getElementById('td16').style.display='none';
				
		/* Tax */	
		document.getElementById('td17').style.display='block';
		document.getElementById('td18').style.display='block';
				
		/* Item in Table  */
		var i;
		for(i=0;i<size;i++)
		{
			document.getElementById(i+"icode").style.visibility='visible';
			document.getElementById(i+"qty").style.visibility='hidden';
			document.getElementById(i+"desc").style.visibility='visible';
			document.getElementById(i+"iprice").style.visibility='hidden';
			document.getElementById(i+"amt").style.visibility='visible';
			document.getElementById(i+"wgt").style.visibility='hidden';
			document.getElementById(i+"itax").style.visibility='visible';
			document.getElementById(i+"serial").style.visibility='hidden';
		}
		document.getElementById("it1").style.visibility='visible';
		document.getElementById("it2").style.display='none';
		document.getElementById("it3").style.visibility='visible';
		document.getElementById("it4").style.display='none';
		document.getElementById("it5").style.visibility='visible';
		document.getElementById("it6").style.visibility='hidden';
		document.getElementById("it7").style.visibility='visible';
		document.getElementById("it8").style.visibility='hidden';
		
		//document.getElementById("it22").style.display='none';
		document.getElementById("it42").style.display='none';
						
	}
		
function professional(size){
    service();
    /*QTY */
        document.getElementById('td4').style.display='none';
        document.getElementById('td3').style.display='block';
        document.getElementById('td5').style.display='block';
        /*Serial No */
        document.getElementById('td6').style.display='none';
        document.getElementById('td7').style.display='none';
        /* DESC */
// 				document.getElementById('td8').style.display='block';
// 				document.getElementById('td9').style.display='block';

        /* Unit Price/RatePrice*/
        document.getElementById('td11').style.display='none';
        document.getElementById('td10').style.display='block';
        document.getElementById('td12').style.display='block';
        /* Amount*/
        document.getElementById('td13').style.display='block';
        document.getElementById('td14').style.display='block';
        /* Weight*/
        document.getElementById('td15').style.display='none';
        document.getElementById('td16').style.display='none';
        /* Tax */
        document.getElementById('td17').style.display='block';
        document.getElementById('td18').style.display='block';

        quickTable(size);

}

function quickTable(size){
    /* Item in Table  */
         var i;
        for(i=0;i<size;i++){
            document.getElementById(i+"icode").style.visibility='visible';
            document.getElementById(i+"qty").style.visibility='visible';
            document.getElementById(i+"desc").style.visibility='visible';
            document.getElementById(i+"iprice").style.visibility='visible';
            document.getElementById(i+"amt").style.visibility='visible';
            document.getElementById(i+"wgt").style.visibility='hidden';
            document.getElementById(i+"itax").style.visibility='visible';
            document.getElementById(i+"serial").style.visibility='hidden';
        }
            document.getElementById("it1").style.visibility='visible';
            document.getElementById("it2").style.display='block';
            document.getElementById("it3").style.visibility='visible';
            document.getElementById("it4").style.display='block';
            document.getElementById("it5").style.visibility='visible';
            document.getElementById("it6").style.visibility='hidden';
            document.getElementById("it7").style.visibility='visible';
            document.getElementById("it8").style.visibility='hidden';
            //document.getElementById("it22").style.display='none';
            document.getElementById("it42").style.display='none';

        value=document.getElementById('hidn').value;
        var j;
        for(j=0;j<value;j++){
            document.getElementById(j+'1').style.visibility='visible';//code
            document.getElementById(j+'2').style.visibility='visible';//qty
            document.getElementById(j+'3').style.visibility='hidden';//serial No
            document.getElementById(j+'4').style.visibility='visible';//desc
            document.getElementById(j+'5').style.visibility='visible';//unit price
            document.getElementById(j+'6').style.visibility='visible';//amount
            document.getElementById(j+'7').style.visibility='hidden';//weight
            document.getElementById(j+'8').style.visibility='visible';//tax
        }
}
function ebusiness(size){
    /* visible field for ship to */
        document.getElementById('ship_label').style.visibility="visible";
        document.getElementById('ship_id').style.visibility="visible";

        /* visible field for ship date */
        document.getElementById('sh_date_label').style.visibility="visible";
        document.getElementById('sh_date_id').style.visibility="visible";

        /* hidden field for  rep */
        document.getElementById('rep_label').style.visibility="visible";
        document.getElementById('rep_id').style.visibility="visible";

        /* hidden field for via */
        document.getElementById('via_label').style.visibility="visible";
        document.getElementById('via_id').style.visibility="visible";

        /* hidden field for bill to */
        document.getElementById('bill_label').style.visibility="hidden";
        document.getElementById('bill_id').style.visibility="hidden";

        /*QTY */
        document.getElementById('td4').style.display='none';
        document.getElementById('td3').style.display='block';
        document.getElementById('td5').style.display='block';
        /*Serial No */
        document.getElementById('td6').style.display='none';
        document.getElementById('td7').style.display='none';
        /* DESC */
// 				document.getElementById('td8').style.display='block';
// 				document.getElementById('td9').style.display='block';

        /* Unit Price/RatePrice*/
        document.getElementById('td11').style.display='none';
        document.getElementById('td10').style.display='none';
        document.getElementById('td12').style.display='none';
        /* Amount*/
        document.getElementById('td13').style.display='block';
        document.getElementById('td14').style.display='block';
        /* Weight*/
        document.getElementById('td15').style.display='none';
        document.getElementById('td16').style.display='none';
        /* Tax */
        document.getElementById('td17').style.display='none';
        document.getElementById('td18').style.display='none';

        /* Item in Table  */
         var i;
        for(i=0;i<size;i++){
            document.getElementById(i+"icode").style.visibility='visible';
            document.getElementById(i+"qty").style.visibility='visible';
            document.getElementById(i+"desc").style.visibility='visible';
            document.getElementById(i+"iprice").style.visibility='hidden';
            document.getElementById(i+"amt").style.visibility='visible';
            document.getElementById(i+"wgt").style.visibility='hidden';
            document.getElementById(i+"itax").style.visibility='hidden';
            document.getElementById(i+"serial").style.visibility='hidden';
        }
            document.getElementById("it1").style.visibility='visible';
            document.getElementById("it2").style.display='block';
            document.getElementById("it3").style.visibility='visible';
            document.getElementById("it4").style.display='none';
            document.getElementById("it5").style.visibility='visible';
            document.getElementById("it6").style.visibility='hidden';
            document.getElementById("it7").style.visibility='hidden';
            document.getElementById("it8").style.visibility='hidden';

            //document.getElementById("it22").style.display='none';
            document.getElementById("it42").style.display='none';

}
function TaxValue1(value){
    
    size=document.getElementById("tSize").value;
    if(value==0){
        document.getElementById('tax_field').innerHTML="0.0 %";
        rate = 0;
        tax_rate=0;
        document.getElementById('tax_val').value=rate;
    }
    else{
        for(i=0;i<size;i++){
            var field = document.getElementById(i+"tx_id").value;
            if(value==field){
                rt = document.getElementById(i+"tx_rt").value;
                document.getElementById('tax_field').innerHTML=rt+" %";
                rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);
                document.getElementById('tax_val').value=rate;
                tax_rate=rt;
                break;
            }
        }
    }
}

function TaxValue(value,form){
    tot = form.shipping.value;
    subtotal = form.subtotal.value;
    size=document.getElementById("tSize").value;
    if(value==0){
        document.getElementById('tax_field').innerHTML="0.0 %";
        rate = 0;
        tax_rate=0;
        document.getElementById('tax_val').value=rate;
    }
    else{
        for(i=0;i<size;i++){
            var field = document.getElementById(i+"tx_id").value;
            if(value==field){
                rt = document.getElementById(i+"tx_rt").value;
                document.getElementById('tax_field').innerHTML=rt+" %";
                rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);
                document.getElementById('tax_val').value=rate;
                tax_rate=rt;
                break;
            }
        }
    }

    document.InvoiceForm.tax.value=rate;
    total = ((tot/1) + (subtotal/1)+(rate)/1);
    document.InvoiceForm.total.value=total.toFixed(2);
    document.InvoiceForm.adjustedtotal.value = total.toFixed(2);
}

function AddItem(form){
    if(form.itemID.value==0 ||form.itemID.value==='01'){
        document.getElementById('serialNo_id').value="";
        document.getElementById('qty_id').value="";

        document.getElementById('unitPrice_id').value="";
        document.getElementById('amount_id').value="";
        document.getElementById('weight_id').value="";
        document.getElementById('pname_id').value="";
        return showSelectItemDialog();
    }
    else{
        isItemExist++;
        style = document.getElementById('invStyle').value;
        /* var wtft = form.weight.value;
        var wtf = wtft.tiFixed(2); */
        wt =  form.weight.value;
        hidn_val= document.getElementById('hidn').value;

        var tr = document.createElement("tr");
        tr.setAttribute("id", "tr"+hidn_val);

        var tr2 = document.getElementById('tr##');
        var parentTr = tr2.parentNode;
        parentTr.insertBefore(tr, tr2);

        serialNo = document.getElementById('serialNo_id').value;
        var desc = document.getElementById('pname_id').value;
        weight = document.getElementById('weight_id').value;
        tax = document.getElementById('tax_id').value;
        ivcode = document.getElementById('code11').value;

        qty=document.getElementById('qty_id').value;
        uprice=document.getElementById('unitPrice_id').value;

        var td1 = document.createElement("td");
        td1.setAttribute("align", "left");
        td1.setAttribute("id",hidn_val+"1");
        tr.appendChild(td1);
        td1.innerHTML=ivcode;

        var td4 = document.createElement("td");
        td4.setAttribute("align", "left");
        td4.setAttribute("id",hidn_val+"4");
        tr.appendChild(td4);
        td4.innerHTML=desc;

        var td3 = document.createElement("td");
        td3.setAttribute("align", "left");
        td3.setAttribute("id",hidn_val+"3");
        tr.appendChild(td3);
        td3.innerHTML=serialNo;

        var td5 = document.createElement("td");
        td5.setAttribute("align", "left");
        td5.setAttribute("id",hidn_val+"5");
        tr.appendChild(td5);
        td5.innerHTML=uprice;

        var td2 = document.createElement("td");
        td2.setAttribute("align", "left");
        td2.setAttribute("id",hidn_val+"2");
        tr.appendChild(td2);
        td2.innerHTML=qty;

        amt=( (qty/1) * (uprice/1) );
        document.getElementById('amount_id').value=amt.toFixed(2);

        var td6 = document.createElement("td");
        td6.setAttribute("align", "left");
        td6.setAttribute("id",hidn_val+"6");
        tr.appendChild(td6);
        td6.innerHTML=amt.toFixed(2);;

        var td7 = document.createElement("td");
        td7.setAttribute("align", "left");
        td7.setAttribute("id",hidn_val+"7");
        tr.appendChild(td7);
        td7.innerHTML=weight;

        var t="";
        if(tax==0){
            t="No";
        }
        else{
            t="Yes";
            yestax = ((yestax/1) + (amt/1)).toFixed(2);
        }

        subtotal= form.subtotal.value;
        subtotal = ((subtotal/1) + (amt/1)).toFixed(2);;
        form.subtotal.value=subtotal;
        tax_val=((yestax * tax_rate) / 100 ).toFixed(2);

        document.InvoiceForm.tax.value=tax_val;

        tot=(form.shipping.value);
        total = ((tot/1) + (subtotal/1) + (tax_val/1)).toFixed(2);
        form.total.value=total;
        form.adjustedtotal.value=total;

        form.subtotal.value=subtotal;
        document.getElementById('amt_id').value=subtotal;

        var td8 = document.createElement("td");
        td8.setAttribute("align", "left");
        td8.setAttribute("id",hidn_val+"8");
        tr.appendChild(td8);
        td8.innerHTML=t;

        var button='<img onclick="DeleteRow1('+hidn_val+',this.form);" width="12" src="${pageContext.request.contextPath}/images/delete.png" title="Delete" size="8"/>';

        var td9 = document.createElement("td");
        td9.setAttribute("align", "left");
        td9.setAttribute("colspan","4");
        tr.appendChild(td9);
        td9.innerHTML=button;

        val=(( wt / 1 ) + (weight/1) );

        itemVal=document.getElementById('itmVal').value;
        //wghtArr[indx]=val;
        itemArr[index1]=itemVal;
        qtyArr[index1]=qty;
        upriceArr[index1]=uprice;

        codeArr[index1]=ivcode;
        taxArr[index1]=tax;
        descArr[index1]=desc;
        uwghtArr[index1]=weight;
        serialArr[index1]=serialNo;
        itmIDArr[index1]=document.getElementById('itmId').value;

        index1++;

        form.weight.value=val;
        form.wt.value=val;
        if(style==0 || style==4){//Product/select

            productItem(hidn_val);
        }
        if(style==1){//service
            serviceItem(hidn_val);

        }
        if(style==2 || style==6){//Quick/Professional
            quickItem(hidn_val);
        }

        if(style==3){
            manufactureItem(hidn_val);
        }

        if(style==5){//Finance
            financeItem(hidn_val);
        }

        if(style==7){//Ebusinness
            ebusinessItem(hidn_val);
        }
        //form.amount.value+=amt+";"

        hidn_val=( (hidn_val/1) + 1);

        document.getElementById('hidn').value=hidn_val;
    }
    document.getElementById('serialNo_id').value="";
    document.getElementById('qty_id').value="";

    document.getElementById('unitPrice_id').value="";
    document.getElementById('amount_id').value="";
    document.getElementById('weight_id').value="";
    document.getElementById('pname_id').value="";
    document.getElementById('itemID').value="0";
}

function productItem(hidn_val){
    document.getElementById(hidn_val+"3").style.visibility='hidden';
    document.getElementById(hidn_val+"1").style.visibility='visible';
    document.getElementById(hidn_val+"2").style.visibility='visible';
    document.getElementById(hidn_val+"4").style.visibility='visible';
    document.getElementById(hidn_val+"5").style.visibility='visible';
    document.getElementById(hidn_val+"6").style.visibility='visible';
    document.getElementById(hidn_val+"7").style.visibility='visible';
    document.getElementById(hidn_val+"8").style.visibility='visible';

    document.getElementById("it1").style.visibility='visible';
    document.getElementById("it2").style.display='block';
    document.getElementById("it3").style.visibility='visible';
    document.getElementById("it4").style.display='block';
    document.getElementById("it5").style.visibility='visible';
    document.getElementById("it6").style.visibility='visible';
    document.getElementById("it7").style.visibility='visible';
    document.getElementById("it8").style.visibility='hidden';
    //document.getElementById("it22").style.display='none';
    document.getElementById("it42").style.display='none';
}

function serviceItem(hidn_val){
    document.getElementById(hidn_val+"3").style.visibility='hidden';
    document.getElementById(hidn_val+"1").style.visibility='visible';
    document.getElementById(hidn_val+"2").style.visibility='visible';
    document.getElementById(hidn_val+"4").style.visibility='visible';
    document.getElementById(hidn_val+"5").style.visibility='visible';
    document.getElementById(hidn_val+"6").style.visibility='hidden';
    document.getElementById(hidn_val+"7").style.visibility='hidden';
    document.getElementById(hidn_val+"8").style.visibility='visible';

    document.getElementById("it1").style.visibility='visible';
    document.getElementById("it2").style.display='none';
    document.getElementById("it3").style.visibility='visible';
    document.getElementById("it4").style.display='none';
    document.getElementById("it5").style.visibility='hidden';
    document.getElementById("it6").style.visibility='hidden';
    document.getElementById("it7").style.visibility='visible';
    document.getElementById("it8").style.visibility='hidden';
    //document.getElementById("it22").style.display='block';
    document.getElementById("it42").style.display='block';
}

function quickItem(hidn_val){
    document.getElementById(hidn_val+"3").style.visibility='hidden';
    document.getElementById(hidn_val+"1").style.visibility='visible';
    document.getElementById(hidn_val+"2").style.visibility='visible';
    document.getElementById(hidn_val+"4").style.visibility='visible';
    document.getElementById(hidn_val+"5").style.visibility='visible';
    document.getElementById(hidn_val+"6").style.visibility='visible';
    document.getElementById(hidn_val+"7").style.visibility='hidden';
    document.getElementById(hidn_val+"8").style.visibility='visible';

    document.getElementById("it1").style.visibility='visible';
    document.getElementById("it2").style.display='block';
    document.getElementById("it3").style.visibility='visible';
    document.getElementById("it4").style.display='block';
    document.getElementById("it5").style.visibility='visible';
    document.getElementById("it6").style.visibility='hidden';
    document.getElementById("it7").style.visibility='visible';
    document.getElementById("it8").style.visibility='hidden';
    //document.getElementById("it22").style.display='none';
    document.getElementById("it42").style.display='none';
}

function manufactureItem(hidn_val){
    document.getElementById(hidn_val+"3").style.visibility='visible';
    document.getElementById(hidn_val+"1").style.visibility='visible';
    document.getElementById(hidn_val+"2").style.visibility='visible';
    document.getElementById(hidn_val+"4").style.visibility='visible';
    document.getElementById(hidn_val+"5").style.visibility='visible';
    document.getElementById(hidn_val+"6").style.visibility='visible';
    document.getElementById(hidn_val+"7").style.visibility='hidden';
    document.getElementById(hidn_val+"8").style.visibility='visible';

    document.getElementById("it1").style.visibility='visible';
    document.getElementById("it2").style.display='block';
    document.getElementById("it3").style.visibility='visible';
    document.getElementById("it4").style.display='block';
    document.getElementById("it5").style.visibility='visible';
    document.getElementById("it6").style.visibility='hidden';
    document.getElementById("it7").style.visibility='visible';
    document.getElementById("it8").style.visibility='visible';

    //document.getElementById("it22").style.display='none';
    document.getElementById("it42").style.display='none';
}

function financeItem(hidn_val){
    document.getElementById(hidn_val+"3").style.visibility='hidden';
    document.getElementById(hidn_val+"1").style.visibility='visible';
    document.getElementById(hidn_val+"2").style.visibility='hidden';
    document.getElementById(hidn_val+"4").style.visibility='visible';
    document.getElementById(hidn_val+"5").style.visibility='hidden';
    document.getElementById(hidn_val+"6").style.visibility='visible';
    document.getElementById(hidn_val+"7").style.visibility='hidden';
    document.getElementById(hidn_val+"8").style.visibility='visible';

    document.getElementById("it1").style.visibility='visible';
    document.getElementById("it2").style.display='none';
    document.getElementById("it3").style.visibility='visible';
    document.getElementById("it4").style.display='none';
    document.getElementById("it5").style.visibility='visible';
    document.getElementById("it6").style.visibility='hidden';
    document.getElementById("it7").style.visibility='visible';
    document.getElementById("it8").style.visibility='hidden';

    //document.getElementById("it22").style.display='none';
    document.getElementById("it42").style.display='none';
}

function ebusinessItem(hidn_val){
    document.getElementById(hidn_val+"3").style.visibility='hidden';
    document.getElementById(hidn_val+"1").style.visibility='visible';
    document.getElementById(hidn_val+"2").style.visibility='visible';
    document.getElementById(hidn_val+"4").style.visibility='visible';
    document.getElementById(hidn_val+"5").style.visibility='hidden';
    document.getElementById(hidn_val+"6").style.visibility='visible';
    document.getElementById(hidn_val+"7").style.visibility='hidden';
    document.getElementById(hidn_val+"8").style.visibility='hidden';

    document.getElementById("it1").style.visibility='visible';
    document.getElementById("it2").style.display='block';
    document.getElementById("it3").style.visibility='visible';
    document.getElementById("it4").style.display='none';
    document.getElementById("it5").style.visibility='visible';
    document.getElementById("it6").style.visibility='hidden';
    document.getElementById("it7").style.visibility='hidden';
    document.getElementById("it8").style.visibility='hidden';

    //document.getElementById("it22").style.display='none';
    document.getElementById("it42").style.display='none';
}

function ItemChange(value){
    if(value == '01')
    {
        document.getElementById('qty_id').value="";
        document.getElementById('unitPrice_id').value="";
        document.getElementById('amount_id').value="";
        document.getElementById('weight_id').value="";
        document.getElementById('tax_id').value="";
        document.getElementById('pname_id').value="";

        document.getElementById('qty_id').readonly="true";
        document.getElementById('unitPrice_id').readonly="true";
        document.getElementById('weight_id').readonly="true";
        document.getElementById('code11').value=document.getElementById(count+'code').value;
    }
    var size = document.getElementById('itemSize').value;
    var count;
    for(count=0;count<size;count++){
        var invID = document.getElementById(count+'inv').value;
        if(value==invID){
            var category = document.getElementById(count+'cat').value;
            if(category==1){
                //document.getElementById('serialNo_id').value="";
                document.getElementById('qty_id').value="";
// 				document.getElementById('desc_id').value="";
                document.getElementById('unitPrice_id').value="";
                document.getElementById('amount_id').value="";
                document.getElementById('weight_id').value="";
                document.getElementById('tax_id').value="";

                document.getElementById('qty_id').readonly="true";
                document.getElementById('unitPrice_id').readonly="true";
                document.getElementById('weight_id').readonly="true";
                document.getElementById('code11').value=document.getElementById(count+'code').value;
            }
            else{
                var qty = 1;
                //	You can not enter more then your available stock using this function
                var qtyVal = document.getElementById(count+'q').value;
                document.getElementById('qty_id').max = qtyVal;
                var qtyMax = document.getElementById('qty_id').max;
                var qtyMin = 1;
                //you can replace eventListner like keyup keypress blur change

                $(".minutesInput").on('keyup', function(e) {
                    
                    var num = parseInt(this.value, 10),
                        min = qtyMin,
                        max = qtyMax;

                    if (isNaN(num)) {
                        this.value = "";
                        return;
                    }

                    this.value = Math.max(num, min);
                    this.value = Math.min(num, max);
                });

                var uprice = document.getElementById(count+'price').value;
                var serialNo = document.getElementById(count+'serial').value;
                document.getElementById('serialNo_id').readonly="false";
                document.getElementById('qty_id').readonly="false";
                document.getElementById('unitPrice_id').readonly="false";
                document.getElementById('weight_id').readonly="false";

                document.getElementById('serialNo_id').value=serialNo;
                document.getElementById('qty_id').value=qty;
// 				document.getElementById('desc_id').value=document.getElementById(count+'desc').value;
                document.getElementById('pname_id').value=document.getElementById(count+'pname').value;
                document.getElementById('unitPrice_id').value=uprice;
                amt=((qty/1)*(uprice/1)).toFixed(2);;
                document.getElementById('amount_id').value=amt;
                document.getElementById('weight_id').value=document.getElementById(count+'wt').value;
                document.getElementById('code11').value=document.getElementById(count+'code').value;
                document.getElementById('itmId').value=document.getElementById(count+'itmId').value;
                document.getElementById('itmVal').value=value;
            }
        }
    }
}

function Multiplication(){
    var qty=document.getElementById('qty_id').value;
    var uprice = document.getElementById('unitPrice_id').value;

    var amount=qty*uprice;
    document.getElementById('amount_id').value=amount.toFixed(2);

    return updateQuantityOfSelectedItem();
}

function AddTotal(form){
    value=prompt("Enter Adjusted Amount","");
    form.adjustedtotal.value=value;
}

function Init(){

    var sortId = '<%= request.getAttribute("sortById")%>';
    TaxValue1(1);
    document.getElementById('tax_val').value=rate;
    $('select[id="itemID"]').find('option[value="0"]').attr("selected",true);
    isItemExist = document.getElementById('CartSize').value;
    var initPending='${InvoiceForm.isPending}';
    if(initPending == 'true'){
        //toggle_visibility('pending');
    }
    <c:if test="${not empty Style}">
        StyleChange(${Style});
    </c:if>
    <c:if test="${empty Style}">
        StyleChange(document.InvoiceForm.invoiceStyle.value);
    </c:if>
    var i;
    for(i=0;i<100;i++){
        deleted[i]=0;
    }
    for(j=0;j<100;j++){
        wghtArr[j]=0;
        itemArr[j]=0;
        qtyArr[j]=0;
        upriceArr[j]=0;
        codeArr[j]=0;
        taxArr[j]=0;
        descArr[j]=0;
        uwghtArr[j]=0;
        serialArr[j]=0;
        itmIDArr[j]=0;
    }
    <c:if test="${not empty TaxValue}">
        yestax = ${TaxValue.taxValue};
        val = document.InvoiceForm.taxID.value;
        if(value!=0){
            for(i=0;i<size;i++){
                var field = document.getElementById(i+"tx_id").value;
                if(val==field){
                    rt = document.getElementById(i+"tx_rt").value;
                    document.getElementById('tax_field').innerHTML=rt+" %";
                    rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);
                    document.getElementById('tax_val').value=rate;
                    tax_rate=rt;
                    break;
                }
            }
        }
    </c:if>
    /*To display data either in readonly or not*/
    var readOnly = <%= request.getAttribute("readData") %>

    if(readOnly)
    {
        $('#newInvoice').prop('disabled', true);
        $('#btnNewInvoice').prop('disabled', true);
        $('#btnSaveInvoice').prop('disabled', true);
        $('#btnUpdateInvoice').prop('disabled', true);
        //$('#btnDeleteInvoice').prop('disabled', true);
        $(':input[type="text"]').prop('disabled', false);
        $('input[type=text],textarea').prop('readonly', true);
        $('#custID').prop('readonly', true);
        $('#invoiceStyle').prop('readonly',true);
        $("#sortByLastName").prop('checked',false);
    }
    else{
        $('#newInvoice').prop('disabled', false);
        $('#btnNewInvoice').prop('disabled', false);
        $('#btnSaveInvoice').prop('disabled', false);
        $('#btnUpdateInvoice').prop('disabled', false);
        //$('#btnDeleteInvoice').prop('disabled', false);
        $('input[type=text],textarea').prop('readonly', false);
        $('#custID').prop('readonly', true);
        $('#invoiceStyle').prop('readonly',true);
        $("#sortByLastName").prop('checked',false);
    }
    StyleChange(4);
}

function onSave(form)
{
    
    No = form.orderNo.value;
    var bill = form.billTo.value;
    if(form.custID.value==0){
        return showValidationDialog();
    }
    else if(isItemExist <=0){
        return showSelectItemDialog();
    } else {
        if(No.length==0 || No==0) {
            return showItemOrderNumberDialog();
        } else {
            event.preventDefault();
            $("#saveInvoice").dialog({
                    resizable: false,
                    height: 200,
                    width: 500,
                    modal: true,
                    buttons: {
                        "<spring:message code='BzComposer.global.ok'/>": function () {

                            $(this).dialog("close");
                            
                            subtotal=form.subtotal.value;
                            value = form.taxID.value;
                            sze=document.getElementById("tSize").value;
                            var rt=0;
                            for(i=0;i<sze;i++){
                                var field = document.getElementById(i+"tx_id").value;
                                if(value==field){
                                    rt = document.getElementById(i+"tx_rt").value;
                                    document.getElementById('tax_field').innerHTML=rt+" %";
                                    rt = ((((yestax)/1 ) * (rt/1)) / 100 ).toFixed(2);
                                    document.getElementById('tax_val').value=rt;
                                    break;
                                }
                            }
                            subtotal = form.subtotal.value;
                            shipping = form.shipping.value;
                            total = ( (rt/1) + (subtotal/1) + (shipping/1)).toFixed(2);
                            form.total.value=total;
                            form.tax.value=rt;
                            val1 = document.getElementById('hidn').value;
                            val =((val1)/1 - (deleted)/1);
                            form.size.value=val/1;
                            var x;
                            var idV=0;
                            for(x=0;x<val1;x++){
                                value = itemArr[x];
                                if(value!=-1){
                                    form.item.value+=itemArr[x]+";";
                                    form.qty.value+=qtyArr[x]+";";
                                    form.uprice.value+=upriceArr[x]+";";
                                    form.code.value+=codeArr[x]+";";
                                    form.isTaxable.value+=taxArr[x]+";";
                                    form.desc.value+=descArr[x]+";";
                                    form.unitWeight.value+=uwghtArr[x]+";";
                                    form.wgt.value+="0"+";";
                                    form.serialNo.value+=serialArr[x]+";";

                                    form.itemTypeID.value+=itmIDArr[x]+";";
                                    form.itemOrder.value+=idV+";";
                                    idV++;
                                }
                            }
                            csize = document.getElementById('CartSize').value
                            if(csize!=0)
                            {
                                val=((csize/1) + (val)/1) ;
                                var i;
                                ordVal = ( ((document.getElementById('hidn').value)/1) + 1 );
                                for(i=0;i<csize;i++)
                                {
                                    rowid=document.getElementById(i+'delt').value
                                    if(rowid=="del") {
                                        cnt++;
                                    }
                                    else if(rowid=="0") {
                                        form.code.value+=document.getElementById(i+"invCode").value+";";
                                        form.qty.value+= document.getElementById(i+"qty").value+";";
                                        form.desc.value+= document.getElementById(i+"invDesc").value+";";
                                        form.uprice.value+= document.getElementById(i+"uprice").value+";";
                                        form.unitWeight.value+= document.getElementById(i+"weight").value+";";
                                        form.wgt.value+="0"+";";

                                        form.serialNo.value+=document.getElementById(i+"serial").value+";";

                                        itid=document.getElementById(i+'itId11').value;
                                        form.itemTypeID.value+=itid+";";
                                        form.itemOrder.value+=idV+";";
                                        valTax=document.getElementById(i+"tax").value;
                                        if(valTax=="Yes"){
                                            form.isTaxable.value+="1"+";";
                                        } else {
                                            form.isTaxable.value+="0"+";";
                                        }
                                        idV++;
                                        itemVal=document.getElementById(i+'invID11').value;
                                        form.item.value+=itemVal+";";
                                    }
                                }
                                val = ((((val)/1 - (cnt)/1)));
                                form.size.value = val;
                            }
                            
                            ShippedItem();
                            PaidItem();
                            var amount = document.getElementById("amount_id").value;
                            var custID = form.custID.value;
                            var bsAddressID = form.bsAddressID.value;
                            var shAddressID = form.shAddressID.value;
                            //document.getElementById('tabid').value="SaveInvoice";
                            document.forms["frmInvoice"].action = "Invoice?tabid=SaveInvoice&custID="+custID;
                            document.forms["frmInvoice"].submit();
                        },
                        <spring:message code='BzComposer.global.cancel'/>: function () {
                            $(this).dialog("close");
                            return false;
                        }
                    }
                });
                return false;
        }
    }
}
		
function NewInvoice(){
    window.location.href="Invoice?tabid=NewInvoice";
}

function onDelete(form){
    No = form.orderNo.value;
    cid = form.custID.value;
    if(cid==0){
        return showValidationDialog();
    }
    else{
        if(No.length==0 || No==0){
            return showItemOrderNumberDialog();
        }
        else{
            return deleteInvoiceDialog();
        }
    }
}
function ShowUpdate(form){
    cid=form.custID.value;
    if(cid==0){
        return showValidationDialog();
    }
    else{
        window.open("Customer?tabid=editCustomer&cvId="+cid,null,"scrollbars=yes,height=600,width=1225,status=yes,toolbar=no,menubar=no,location=no" );
    }
}

function paymentHistory(form){
    cid=form.custID.value;
    if(cid==0){
        return showValidationDialog();
    }
    else{
        window.open("Invoice?tabid=PaymentHistory&Type=Invoice&CustId="+cid,null,"scrollbars=yes,height=500,width=1300,status=yes,toolbar=no,menubar=no,location=no" );
    }
}

function SendMail(form){
    cid=form.orderNo.value;
    window.open("Invoice?tabid=ShowEmail&OrderType=invoice&OrderNo="+cid,null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no" );
}

function SendMailDisabled(form){
	return showItemOrderNumberDialog();
}

function DeleteRow(d,form)
{
    event.preventDefault();
    $("#deleteRowDialog").dialog({
            resizable: false,
            height: 200,
            width: 300,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {

                    $(this).dialog("close");

                    size=document.getElementById('CartSize').value;
                    isItemExist--;
                    for(jj=0;jj<size;jj++)
                    {
                        rowId=document.getElementById(jj+'rowVal').value;
                        if(d==rowId)
                        {
                            
                            var rt=0;
                            document.getElementById(d).style.display='none';

                            document.getElementById(jj+'delt').value="del";

                            qty1=document.getElementById(jj+'qty').value;

                            uprice1=document.getElementById(jj+'uprice').value;

                            amt = ((qty1)/1 * (uprice1)/1);

                            wegt=document.getElementById(jj+'weight').value;
                            w=document.InvoiceForm.weight.value;
                            wg=( (w)/1 - (wegt)/1);
                            document.InvoiceForm.weight.value=wg.toFixed(2);

                            subtotal= document.InvoiceForm.subtotal.value;

                            subtotal = ((subtotal/1) - (amt/1));
                            valu=document.InvoiceForm.taxID.value;
                            subtotal=subtotal.toFixed(2);
                            document.InvoiceForm.subtotal.value=subtotal;
                            sze=document.getElementById("tSize").value;
                            var taxid = document.getElementById(jj+"tax").value;

                            for(i=0;i<sze;i++)
                            {
                                var field = document.getElementById(i+"tx_id").value;
                                if(valu==field)
                                {
                                    if(taxid=="Yes")
                                    {
                                        rt = document.getElementById(i+"tx_rt").value;
                                        document.getElementById('tax_field').innerHTML=rt+" %";

                                        yestax = (yestax - (amt/1)).toFixed(2);
                                        tax_rate=rt;
                                        rt = (yestax * (rt/1))/100;
                                        document.getElementById('tax_val').value=rt;
                                        break;
                                    }
                                }
                            }
                            rt = (yestax * (tax_rate/1))/100;
                            shipping = document.InvoiceForm.shipping.value;
                            total = ( (rt/1) + (subtotal/1) + (shipping/1));
                            document.InvoiceForm.total.value=total.toFixed(2);
                            document.InvoiceForm.adjustedtotal.value = total.toFixed(2);
                            document.InvoiceForm.tax.value=rt;
                            break;
                        }
                    }
                },
                <spring:message code='BzComposer.global.cancel'/>: function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });
        return false;
    }
		
function DeleteRow1(d,form){
event.preventDefault();
 $("#deleteRowDialog").dialog({
        resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                document.getElementById('tr'+d).style.display='none';
                isItemExist--;
                for(jj=0;jj<=index1;jj++)
                {
                    if(d==jj)
                    {
                        itemArr[jj]=-1;
                        qty1=qtyArr[jj];
                        uprice1=upriceArr[jj];
                        t = taxArr[jj];
                        qtyArr[jj]=-1;
                        upriceArr[jj]=-1;
                        codeArr[jj]=-1;
                        taxArr[jj]=-1;
                        descArr[jj]=-1;
                        wegt=uwghtArr[jj];
                        uwghtArr[jj]=-1;
                        serialArr[jj]=-1;
                        itmIDArr[jj]=-1;

                        amt = ((qty1)/1 * (uprice1)/1).toFixed(2);

                        w=document.InvoiceForm.weight.value;
                        wg=( (w)/1 - (wegt)/1);
                        document.InvoiceForm.weight.value=wg.toFixed(2);

                        subtotal= document.InvoiceForm.subtotal.value;

                        subtotal = ((subtotal/1) - (amt/1));
                        document.InvoiceForm.subtotal.value=subtotal.toFixed(2);
                        tot=(document.InvoiceForm.shipping.value);
                        tx = document.InvoiceForm.tax.value;
                        if(t==1)
                        {
                            yestax = (yestax - amt).toFixed(2);
                            tx=(yestax * tax_rate)/100;
                            document.InvoiceForm.tax.value=tx;
                        }

                        total = ((tot/1) + (subtotal/1) + (tx/1));
                        document.InvoiceForm.total.value=total.toFixed(2);
                        document.InvoiceForm.adjustedtotal.value = total.toFixed(2);
                        deleted++;
                    }
                }
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function getInvoiceDetailsByBtnName(form, url){
    debugger;
    No = form.orderNo.value;
    var bill = form.billTo.value;
    if(form.custID.value==0){
        // return showValidationDialog();
    }
    else if(isItemExist <=0){
        // return showSelectItemDialog();
    } else {
        if(No.length==0 || No==0) {
            // return showItemOrderNumberDialog();
        } else {
        onSave(form);
        }
    }
    //window.location.href="Invoice?tabid=FirstInvoice";
    $.ajax({
        type : "GET",
        url : "/Invoice?tabid="+url,
        success : function(data) {
            $(document).find('div#fullPageDetails section').replaceWith($(data).find('div#fullPageDetails').html());
            let cvID2 = form.clientVendorID.value;
            if(cvID2!=null && cvID2!=''){
                form.custID.value = cvID2;
            }
            Init();
        },
        error : function(data) {
            alert("<bean:message key='BzComposer.categorydetail.erroroccurred'/>");
        }
    });
}

function truncate(num) {
    string = "" + num;
    if (string.indexOf('.') == -1)
        return string + '.00';
    seperation = string.length - string.indexOf('.');
    if (seperation > 3)
        return string.substring(0,string.length-seperation+3);
    else if (seperation == 2)
        return string + '0';
    return string;
}
function printCustomerOrder(form){
    let cid = form.custID.value;
    let ttype = form.templateType.value;
    if(cid==0){
        return showValidationDialog();
    } else {
        event.preventDefault();
        $("#printInvoiceDialog").dialog({
            resizable: false,
            height: 250,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.print'/>": function () {
                    $(this).dialog("close");
                    if(document.getElementById("PrintInvoiceCbx").checked){
                        window.open("Invoice?tabid=PrintInvoice&custID="+cid+"&ttype="+ttype, null, "scrollbars=yes,height=900,width=900,status=yes,toolbar=no,menubar=no,location=no" );
                    }else if(document.getElementById("PrintPackingSlipCbx").checked){
                        window.open("Invoice?tabid=PrintPackingSlip&custID="+cid, null, "scrollbars=yes,height=900,width=900,status=yes,toolbar=no,menubar=no,location=no" );
                    }
                },
                <spring:message code='BzComposer.global.cancel'/>: function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });
    }
}

function PrintInvoice22(form){
    orderNo=document.InvoiceForm.orderNo.value;
    if(orderNo==""){
        return showItemOrderNumberDialog();
    }
    else{
        window.open("Invoice?tabid=ShowPrint&OrderNo="+orderNo,null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=yes,location=no" );
    }
}
</script>
<!-- dialog box that used in this page -->
<div id="saveInvoice" style="display: none;">
	<p>
		<spring:message code="BizComposer.Invoice.SaveUpdate" />
	</p>
</div>
<div id="showValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Estimaion.cName.Validation" />
	</p>
</div>

<div id="showSelectItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.invoice.selectItemFirst" />
	</p>
</div>
<div id="showItemOrderNumberDialog" style="display: none;">
	<p>
		<spring:message code="BizComposer.Invoice.OrderNo.Validation" />
	</p>
</div>
<div id="deleteInvoiceDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Invoice.Delete" />
	</p>
</div>
<div id="updateBillingAddressDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.invoice.saveBillingAddress" />
	</p>
</div>
<div id="updateShippingAddressDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.invoice.saveShippingAddress" />
	</p>
</div>
<div id="deleteRowDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Estimaion.DeleteItem" />
	</p>
</div>
<div id="printInvoiceDialog" style="display: none;">
	<div style="margin-bottom: 10px;">
		<strong>Please select what would you like to print</strong>
	</div>
	<div>
		<input type="checkbox" id="PrintInvoiceCbx" /> <span><spring:message
				code="BzComposer.invoice.invoicetitle" /></span>
	</div>
	<div>
		<input type="checkbox" id="PrintPackingSlipCbx" /> <span><spring:message
				code="BzComposer.configuration.packingslips" /></span>
	</div>
</div>