<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu_add.js"></script> -->
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/menu.jsp"%> 
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.additemtitle"/> </title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<script src="https://cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>
<style type="text/css">
.myTable {
    height: 150px;
    width:450px;
    overflow-y: scroll;
}
tr.highlight td
{
	background-color: navy;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    $("body").show();
});
var pId,pName,pSKU,pQty,pAmount;
function getData()
{
	var data = CKEDITOR.instances.editor1.getData();
	$("#textAreaContent").val(data);
	document.getElementById("Editor").style.display = "none";
	document.getElementById("tAreaContent").style.display = "block";
}

function openThumbnail()
{
  document.getElementById("imgupload1").click();
  var ima = $('#imgupload1').val();
  /* var im = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
  debugger */
  $('#thumbnail').val(ima);
}
function getEditor()
{
	var data = document.getElementById("textAreaContent").value;
	CKEDITOR.instances['editor1'].setData(data);
	document.getElementById("Editor").style.display = "block";
	document.getElementById("tAreaContent").style.display = "none";
}

function showSelectedOption(priceLevelId,priceLevelDesc,priceLevelPercentage)
{
	size = document.getElementById('priceLevelSize').value;
	/* for(i=0;i<size;i++)
	{
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	} */
	/* var rd=document.getElementById(rid);
	rd.className = "draft"; */
	/* alert("priceLevelId"+priceLevelId+"\n PriceLevel:"+priceLevelDesc+"\n PriceLevel Percentage:"+priceLevelPercentage); */
	
	$('#priceLevelName').val(priceLevelDesc);
	$('#pricePercentage').val(priceLevelPercentage);
}

function showSelectedProduct(productId,productName,productCode,productQty,productType,productPrice)
{
	/* alert("Selected Product:"+productId+"\nproductName:"+productName+"\nproductCode:"+productCode+
			"\nproductType:"+productType+"\nproductQty:"+productQty+"\nproductPrice:"+productPrice); */
	var product = productId;
	pId = productId;
	pName = productCode;
	pSKU = productName;
	pQty = productQty;
	pAmount = productPrice;
	debugger
	$("#eBayProductTable tr").each(function() {
		$("#eBayProductTable tr").removeClass("draft");
	});
	var rows = document.getElementById("eBayProductTable").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
	debugger
	for(i=0;i<rows;i++)
	{
		var row1=document.getElementById("productId"+productId);
		row1.className = "draft";
	} 
}

function highlightSelectedSupplier(supplierId)
{
	$("#supplierName tr").each(function() {
		$("#supplierName tr").removeClass("draft");
	});
	var rows = document.getElementById("supplierName").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
	debugger
	for(i=0;i<rows;i++)
	{
		var row1=document.getElementById("supplier"+supplierId);
		row1.className = "draft";
	} 
}

function showSelectedCrossSellProduct(productId)
{
	$("#crossSellProductTable tr").each(function() {
		$("#crossSellProductTable tr").removeClass("draft");
	});
	var rows = document.getElementById("crossSellProductTable").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
	debugger
	for(i=0;i<rows;i++)
	{
		var row1=document.getElementById("crossSellProductId"+productId);
		row1.className = "draft";	
	}
} 

function addToCrossSellProduct()
{
	debugger
	var rows = document.getElementById("eBayProductTable").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
	debugger
	for(i=0;i<rows;i++)
	{
		var rowId = document.getElementById("ProductId");
		if(rowId.className == "draft")
		{
			//alert($("#productId"+[i]));
		}
		/*var row1=document.getElementById("productId"+productId);
		row1.className = "draft"; */
	} 
}

function Remove() {
	/* var row = document.getElementById("rowId").value;
   	debugger
   	//var name = row.getElementsByTagName("TD")[0].innerHTML;
   	if (confirm("Do you want to delete: " + row + "Row?")) {
	//Get the reference of the Table.
	var table = document.getElementById("addTableRow");
	debugger */
    $(this).parent().parent('tr').remove();
	//}
};

function addData()
{
	//alert("inside addData function");
}

function showCategoryDialog()
{
	debugger;
	event.preventDefault();
	$("#showCategoryDialog").dialog({
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
function showCantaddItemDialog()
{
	event.preventDefault();
	$("#showCantaddItemDialog").dialog({
		resizable: false,
	    height: 200,
	    width: 550,
	    modal: true,
	    buttons: {
			"<bean:message key='BzComposer.global.ok'/>": function () {
	        	$(this).dialog("close");
			}
		}
	});
	return false;
}

function showitemcodedialog()
{
	debugger;
	event.preventDefault();
	$("#showitemcodedialog").dialog({
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

function showsalepricedialog()
{
	debugger;
	event.preventDefault();
	$("#showsalepricedialog").dialog({
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

function showpurchasepricedialog()
{
	debugger;
	event.preventDefault();
	$("#showpurchasepricedialog").dialog({
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

function showqueantitydialog()
{
	debugger;
	event.preventDefault();
	$("#showqueantitydialog").dialog({
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

function showweightdialog()
{
	debugger;
	event.preventDefault();
	$("#showweightdialog").dialog({
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

function showcodediscountdialog()
{
	debugger;
	event.preventDefault();
	$("#showcodediscountdialog").dialog({
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

function showitemcodesubdialog()
{
	debugger;
	event.preventDefault();
	$("#showitemcodesubdialog").dialog({
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

function showservicenamedialog()
{
	debugger;
	event.preventDefault();
	$("#showservicenamedialog").dialog({
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
<script>
	self.moveTo(100,100);

$(function() {
    $("#tabs").tabs();
    $("#tabsPricing").tabs();
    $('#stockInOut').tabs()
    $('#drop_cat').prop('disabled', 'disabled');
    $('#drop_cat1').prop('disabled', 'disabled');
    $('select[id="unitMeasurement"]').find('option[value=" "]').attr("selected",true);
    $('select[id="clientVendor"]').find('option[id="defaultCvId"]').attr("selected",true);
    var historyVisible = <%= request.getAttribute("showHistoryPanel")%>;
    if(historyVisible >0)
    {
    	$("#liHistory-11").show();
    }
    else
    {
    	$("#liHistory-11").hide();
    }
  });
  
 $(function(){
	 var result;
	 var id = 1;
	/*  $('#browseImage').click(function(e)
	 {
		 //$('#imgupload').trigger('click');
		 $('#resultImage').fadeIn("fast").attr('src',URL.createObjectURL(e.target.files[0]));
	 });  */
	 
	/*  $(document).on('click', "[id^=deleteOption]", function() {
		  $(this).parents("tr").remove();
	}); */
	
	/* $('#eBayProductTable tr').click(function (event) {
        alert($(this).attr('value')); //trying to alert id of the clicked row          
        $(this).parent().addClass('highlight'); 
   }); */
	
	$('#createCategory').click(function(){
		var category = $('#itemCode').val();
		
		if(category == "")
		{
			/* alert("Please type a category name"); */
			return showCategoryDialog();
		}
		/* commented on 23-11-2019 
		else
		{
			alert("Entered category is:"+category);
		} */
	});
   
   $('#createCategory1').click(function(){
		var category = $('#serviceCode1').val();
		
		if(category == "")
		{
			//alert("Please type a category name");
			return showCategoryDialog();
		}
		/* commented on 23-11-2019 
		else
		{
			alert("Entered category is:"+category);
		} */
	});
   
   $('#addCrossSell').click(function(){
	/* alert("productId:"+pId+"\nproductName:"+pName+"\nProductCode:"+pSKU+"\nproductQty:"+pQty+"\nproductPrice:"+pAmount); */
	var isAvailable = $('#crossSellProductTable tr > td:contains('+pName+')').length;
	if(isAvailable == 0)
	{
		$('#crossSellProductTable').append("<tr id='crossSellProductId"+pId+"' value="+pId+" onclick='showSelectedCrossSellProduct("+pId+");'><td>"+pName+"</td><td>"+pSKU+"</td><td>"+pQty+"</td><td>"+pAmount+"</td></tr>");
	}
	else
	{
		/* alert("you can't add this item because it is already available"); */
		return showCantaddItemDialog();
	}
   });

	$('#deleteCrossSellProduct').click(function(){
		if($("#crossSellProductTable tr").hasClass('draft'))
		{
			$("#crossSellProductTable tr").each(function() {
				if($(this).hasClass('draft'))
				{
					/*if(confirm("Do you want to delete this item?"))
					{
						$(this).remove();
					}*/ 
					debugger;
					event.preventDefault();
					$("#deleteCrossSellProductDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "<bean:message key='BzComposer.global.ok'/>": function () {
				            	debugger;
				                $(this).dialog("close");
				                $(this).remove();
				                debugger;
				            },
				            "<bean:message key='BzComposer.global.cancel'/>": function () {
				                $(this).dialog("close");
				                return false;
				            }
				        }
				    });
				    return false;
				}
			});
		}
		else
		{
			alert("Please select cross-sell product from list.");
		}
   });
	$('#availableStores').change(function(){
		var storeId = $(this).val();
		if(storeId == 3 || storeId == 9)
		{
			alert("Please Select eSales Store");
		}
		/* else
		{
			alert("Selected StoreId:"+storeId);
		} */
	});
	
	$('#clientVendor').change(function()
	{
		debugger
		var id = $("#clientVendor").val();
		debugger
		var name = $('#clientVendor option:selected').text();
		var myWindow;
		if(id == 0)
		{
			debugger
			 mywindow = window.open("Customer.do?tabid=addSupplier","_blank","scrollbars=No,height=900,width=1400,status=yes,toolbar=no,menubar=no,location=no");
			debugger
			myWindow.moveTo(90,90);
		}
		else if(id = 10101010)
		{
			window.stop();
		}
	});
	
	$('#addSupplierBtn').click(function(){
		debugger
		var id = $("#clientVendor").val();
		debugger
		var name = $('#clientVendor option:selected').text();
		var names = name.split(' ');
		/* alert("Array Elements:"+names); */
		debugger
		if(id == 0)
		{
			alert("Please select a supplier from list.");
		}
		else
		{
			var rows = document.getElementById("supplierName").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
			debugger
			if(rows<3)
			{
				debugger
				var isAvailable = $('#supplierName tr > td:contains('+name+')').length;
				if(isAvailable == 0)
				{
					$('#supplierName').append("<tr id='supplier"+id+"' onclick='highlightSelectedSupplier("+id+");'><td id="+id+">"+name+"</td></tr>");
				}
				else
				{
					alert("Supplier is already added.Please select another supplier.");
				}
			}
			else
			{
				alert("Supplier number reach the maximum limit.");
			}
			
		}
	});
	
	$('#deleteSupplierBtn').click(function(){
		if($("#supplierName tr").hasClass('draft'))
		{
			$("#supplierName tr").each(function() {
				if($(this).hasClass('draft'))
				{
					if(confirm("Do you want to delete this item?"))
					{
						$(this).remove();
					}
				}
			});
		}
		else
		{
			alert("Please select a supplier from list.");
		}
	});
	
	$('#measurementList').change(function(){
		$('select[id="unitMeasurement"]').show();
		var measurement = $('#measurementList option:selected').text();
		var measurementId = $('#measurementList').val();
		alert("Selected measurementId:"+measurementId);
		if(measurementId == "3" || measurementId == "4" || measurementId == "5")
		{
			document.getElementById("displayHWL").style.display = "block";
		}
		else
		{
			document.getElementById("displayHWL").style.display = "none";
		}
		$("#unitMeasurement > option").each(function() {
			if(measurementId == "3" || measurementId == "4" || measurementId == "5")
			{
				$('select[id="unitMeasurement"]').find('option[value="2"]').show();
			}
			else if(this.value == measurementId)
			{
				$('select[id="unitMeasurement"]').find('option[value="'+this.value+'"]').show();
			}
			else
			{
				$('select[id="unitMeasurement"]').find('option[value="'+this.value+'"]').hide();
			}
		});
	});
	
	$('#drop_cat').change(function(){
		var inventoryId = $('#drop_cat').val();
		$("#drop_cat1 > option").each(function() {
			if(this.value == inventoryId)
			{
				$('select[id="drop_cat1"]').find('option[value="'+this.value+'"]').show();
			}
			else
			{
				$('select[id="drop_cat1"]').find('option[value="'+this.value+'"]').hide();
			}
		});
	});
	
	$('#priceLevel').change(function(){
		if($(this).prop("checked") == true)
		{
			$('#tabsPricing').tabs( "enable", 0 );
			$('#tabsPricing').tabs( "enable", 1 );
			
			$('#UpdatePricelevel').prop('disabled',false);
			$('#ClearPriceLevel').prop('disabled',false);
			
			$('#addPriceLevel').prop('disabled',false);
			$('#ClearPriceLevel2').prop('disabled',false);
		}
		else
		{
			$('#tabsPricing').tabs( { disabled: [0, 1] });
			
			$('#UpdatePricelevel').prop('disabled','disabled');
			$('#ClearPriceLevel').prop('disabled','disabled');
			
			$('#addPriceLevel').prop('disabled','disabled');
			$('#ClearPriceLevel2').prop('disabled','disabled');
		}
	});
	
	$('#subItem').change(function(){
		if($(this).prop("checked") == true)
		{
			$('#drop_cat').prop('disabled', false);
		}
		else
		{
			$('#drop_cat').prop('disabled', 'disabled');
		}
	});
	
	$('#subItem1').change(function(){
		if($(this).prop("checked") == true)
		{
			$('#drop_cat1').prop('disabled', false);
		}
		else
		{
			$('#drop_cat1').prop('disabled', 'disabled');
		}
	});
	 
	$('#subItem3').change(function(){
		if($(this).prop("checked") == true)
		{
			$('#subItemSelect3').prop('disabled', false);
		}
		else
		{
			$('#subItemSelect3').prop('disabled', 'disabled');
		}
	});
	
	$('#discounted').change(function(){
		if($(this).prop("checked") == true)
		{
			$('#AddBtn').prop('disabled','disabled');
			$('#editBtn').prop('disabled','disabled');
		}
		else
		{
			$('#AddBtn').prop('disabled',false);
			$('#editBtn').prop('disabled',false);
		}
	});
	 
	$('#imgupload').change(function(e)
	{
		$('#resultImage').fadeIn("fast").attr('src',URL.createObjectURL(e.target.files[0]));
		result = $('#imgupload').val();
		var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
		$('#imageName').val(filename);
	}); 
	
	$('#viewImage').click(function(e)
	{
		/* $('#imgupload').trigger('click'); */
		var largeImage = document.getElementById('resultImage');
		var url=largeImage.getAttribute('src');
		var myWindow = window.open(url,'myImage','height=250,width=250,resizable=1');
		myWindow.moveTo(700,250);
	});		
			
	$('#imgupload1').change(function(e)
	{
		$('#resultImageThumbnail').attr('src',URL.createObjectURL(e.target.files[0]));
		result = $('#imgupload1').val();
		var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
		var i = result.replace(/C:\\fakepath\\/i, '');
		$('#thumbnail').val(i);
		
		$('#viewImage1').attr("disabled",false);
	}); 
	
	$('#viewImage1').click(function(e){
		var im = document.getElementById('resultImageThumbnail');
		var u = im.getAttribute('src');
		var myWindow1 = window.open(u,'myImage','height=250,width=250,resizable=1');
		myWindow1.moveTo(700,250);
	});
	
	$('#imgupload2').change(function(e)
	{
		$('#resultImage2').attr('src',URL.createObjectURL(e.target.files[0]));
		result = $('#imgupload2').val();
		var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
		var i = result.replace(/C:\\fakepath\\/i, '');
		$('#image2').val(i);
		$('#viewImage2').attr("disabled",false);
	}); 
	
	$('#viewImage2').click(function(e){
		var im = document.getElementById('resultImage2');
		var u = im.getAttribute('src');
		var myWindow1 = window.open(u,'myImage','height=250,width=250,resizable=1');
		myWindow1.moveTo(700,250);
	});
	
	
	$('#addOption').click(function(){
		var table ="<table border='1'><input type='hidden' id='rowId' value="+id+" name='rowId'/><tr><td>Title</td><td>ItemType</td><td>Is Required</td><td>Sort Order</td><td></td></tr>"+
    		"<tr><td><input type='text' id='title' value='"+id+"'/></td><td><input type='text' id='itemType'/></td><td><input type='text' id='title'/></td>"+
    		"<td><input type='text' id='title'/></td><td align='center'><input type='button' class='formbutton' id='deleteOptionBtn' name='deleteOptionBtn' value='Delete Option'/></td></tr></table><br><br>";
    	//alert("table value:"+table);
    	id++;
		$('#addTableRow').append(table);
	});
	

	/* $('#deleteOptionBtn').click(function(){
		debugger
	    $(this).parent().parent('tr').remove();
		debugger
	});  */
	
	/* $('#addTableRow').on('click', 'input[type="button"]', function () {
	    alert("Inside remove row from table Option...")
		//$(this).parent().parent().remove();
	    $(this).closest('tr').remove();
	}); */
	
	/* $(document).on('click', '.formbutton', function() {
	    $(this).parent().parent('tr').remove();
	}); */
	
	$('#deleteOptionBtn').click(function(){
		//$(this).parents("tr").remove();
		$("addTableRow").find('input[name="deleteOptionBtn"]').each(function(){            
			if($(this).is(":clicked")){
                $(this).parents("tr").remove();
            }
       });
	});
});
</script>
</head>
<body onload="Init();" style="display:none">
<div id="ddcolortabsline">
&nbsp;
</div>
<html:form action="Item.do" enctype="MULTIPART/FORM-DATA" method="post" styleId="AddItemfrm">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size:1.1em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<bean:message key="BzComposer.additem.additemtitle"/>
	</span>
</div>
<br/>
<table cellpadding="0" cellspacing="0" border="0" align=center  style="width: 100%;">	
	<logic:present name="Status">
		<tr>
			<td colspan="3">
				<span class="msgstyle">*
					<bean:write name="Status" />
				</span>
			</td>
		</tr>
	</logic:present>
	<logic:present name="SaveStatus">
		<tr>
			<td colspan="3">
				<span class="msgstyle">*
					<bean:write name="SaveStatus"/>
				</span>
			</td>
		</tr>
	</logic:present>
	<tr>
	<td colspan="3">
	<div id="table-negotiations" style="overflow:auto;width:100%">
		<table class="tabla-listados" cellspacing="0" align="left">
			<tr>
				<td colspan="3" style="padding-right: 14px;">
					<div id="table-negotiations" style="width:100%">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th colspan="12"><bean:message key="BzComposer.additem.itemtype"/></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="100" align="left">
										<bean:message key="BzComposer.global.type" />
		          					</td>                
									<td colspan="2" align="left">
										<html:select property="itemType" onchange="call11(this.value);" 
										value='<%=request.getParameter("ItemType") %>'>
										<%-- <html:option value="1">
											<bean:message key="BzComposer.Item.Inventory" />
										</html:option>
										<html:option value="2">
											<bean:message key="BzComposer.Item.Discount" />
										</html:option>
										<html:option value="3">
											<bean:message key="BzComposer.Item.Subtotal" />
										</html:option>
										<html:option value="4">
											<bean:message key="BzComposer.Item.Service" />
										</html:option> --%>
										<html:option value="1">
											<bean:message key="BzComposer.additem.product" />
										</html:option>
										<html:option value="2">
											<bean:message key="BzComposer.additem.service" />
										</html:option>
										<html:option value="3">
											<bean:message key="BzComposer.additem.recurringservice"/>
										</html:option>
										<html:option value="4">
											<bean:message key="BzComposer.additem.giftcertificate"/>
										</html:option>
										<html:option value="5">
											<bean:message key="BzComposer.additem.inventoryassembly"/>
										</html:option>
									</html:select>
								</td>
								<td colspan="10">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>		
		</tr>
		<tr>
			<td colspan="3" align="center" style="padding-right: 14px;">
			
				<!-- productTab Starts -->
				<div id="productTab">
					<div id="tabs" style="height:650px;">
  						<ul id="tabsAddItem">
    						<li style="font-size: 1em;"><a href="#productInfo-1"><bean:message key="BzComposer.tabs.productinformation"/></a></li>
		    				<li style="font-size: 1em;"><a href="#pricing-2"><bean:message key="BzComposer.tabs.pricing"/></a></li>
		    				<li style="font-size: 1em;"><a href="#description-3"><bean:message key="BzComposer.tabs.description"/></a></li>
		    				<li style="font-size: 1em;"><a href="#channelSetting-4"><bean:message key="BzComposer.tabs.channelsetting"/></a></li>
		    				<li style="font-size: 1em;"><a href="#alternateBarcodeSKU-5"><bean:message key="BzComposer.tabs.alternatebarcodeandskus"/></a></li>
		    				<li style="font-size: 1em;"><a href="#images-6"><bean:message key="BzComposer.tabs.images"/></a></li>
		    				<li style="font-size: 1em;"><a href="#webFields-7"><bean:message key="BzComposer.tabs.webfields"/></a></li>
		    				<li style="font-size: 1em;"><a href="#eBay-8"><bean:message key="BzComposer.tabs.ebay"/></a></li>
		    				<li style="font-size: 1em;"><a href="#itemCategory-9"><bean:message key="BzComposer.tabs.itemcategory"/></a></li>
		    				<li style="font-size: 1em;"><a href="#customOption-10"><bean:message key="BzComposer.tabs.customoption"/></a></li>
		    				<li style="font-size: 1em;" id="liHistory-11"><a href="#history-11"><bean:message key="BzComposer.tabs.history"/></a></li>
						</ul>
						
						<div id="productInfo-1">
   							<div id="content1" class="tabPage">
   								<!-- add here the content of first tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<thead>
											<tr>
												<th colspan="12" style="font-size:1.3em;">
													<bean:message key="BzComposer.additem.iteminfo"/>
												</th>
											</tr>
										</thead>		
										<tbody>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.itemcodecategory"/>
													<span class="highlighted">*</span>
												</td>
												<td>
													<input type="text" id="itemCode" name="itemCode">
												</td>
												<td>
													<input type="button" id="createCategory" class="formbutton" value="<bean:message key='BzComposer.additem.createcategorybtn'/>"/>
												</td>
												<td colspan="9">&nbsp;</td>
											</tr>
											<tr>
												<td></td>
												<td>
													<input type="checkbox" id="subItem" name="subItem" value="subItem">
													<bean:message key="BzComposer.additem.subitemof"/>
												</td>
												<td>
													<html:select property="tectcmd" disabled="false" value="0" styleId="drop_cat">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="itemCategory" property="value" labelProperty="label"></html:options>
													</html:select>
												</td>
												<td>
													<input type="checkbox" id="subItem1" name="subItem1" value="subItem1">
													<bean:message key="BzComposer.additem.subitemof"/>
												</td>
												<td>	
													<html:select property="tectcmd" disabled="false" value="0" styleId="drop_cat1">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="itemSubCategory" property="value" labelProperty="label"></html:options>
													</html:select>
												</td>
												<td>
													<input type="checkbox" id="consignedItem" name="consignedItem">
													<bean:message key="BzComposer.additem.iscosigneditem"/>
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.itemtitle"/>
												</td>
												<td colspan="2">	
													<input type="text" id="itemTitle" name="itemTitle"/>
												</td>
												<td colspan="9">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" id="itemTaxable" name="itemTaxable">
													<bean:message key="BzComposer.additem.taxableitem"/>
												</td>
												<td>
													<input type="checkbox" id="dropShipping" name="dropShipping">
													<bean:message key="BzComposer.additem.dropshipping"/>
												</td>
												<td>
													<input type="checkbox" id="discounted" name="discounted">
													<bean:message key="BzComposer.additem.discounted"/>
												</td>
												<td>
													<bean:message key="BzComposer.additem.account"/>
													<html:select property="accountId">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="AccountList" property="value" labelProperty="label"></html:options>
													</html:select>
												</td>
												<td colspan="8">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.serialnum"/>
												</td>
												<td>
													<input type="text" id="serialNo"/>
												</td>
												<td>
													<bean:message key="BzComposer.additem.productsku"/>
												</td>
												<td>
													<input type="text" id="productSKU"/>
												</td>
												<td>
													<bean:message key="BzComposer.additem.orderunit"/>
												</td>
												<td>
													<input type="text" id="orderUnit"/>
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.qtyonhand"/>
												</td>
												<td>
													<input type="text" id="qty" value="0"/>
												</td>
												<td>
													<bean:message key="BzComposer.additem.reorderpoint"/>
												</td>
												<td>
													<input type="text" id="reorderPoint"/>
												</td>
												<td>
													<bean:message key="BzComposer.additem.location"/>
												</td>
												<td>
													<html:select property="locationId" styleId="location">
														<html:options collection="locationList" property="value" labelProperty="label"></html:options>
													</html:select>
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.publishedweight"/>
												</td>
												<td>
													<input type="text" id="publishedWeight" name="weight"/>
												</td>
												<td>
													<html:select property="tectcmd" disabled="false" value="0" styleId="drop_cat1">
														<html:options collection="weightList" property="value" labelProperty="label"></html:options>
													</html:select>
												</td>
												<td>
													<bean:message key="BzComposer.additem.actualweight"/>
												</td>
												<td>
													<input type="text" id="actualWeight"/>
												</td>
												<td>
													<bean:message key="BzComposer.additem.saleprice"/>
												</td>
												<td>
													<input type="text" id="salePrice"/>
												</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="11">
													<table class="tabla-listados" cellspacing="0">
														<thead>
															<tr>
																<th colspan="12" style="font-size:1.3em;">
																	<bean:message key="BzComposer.additem.unitofmeasure"/>
																</th>
															</tr>
														</thead>		
														<tbody>
															<tr>
																<td>
																	<bean:message key="Bizcomposer.additem.type"/>
																</td>
																<td>
																	<html:select property="measurementId" styleId="measurementList">
																		<html:option value=" ">
																			
																		</html:option>
																		<html:options collection="measurementList" property="value" labelProperty="label"></html:options>
																	</html:select>
																</td>
																<td>
																	<html:select property="submeasurementId" styleId="unitMeasurement">
																		<html:option value=" "></html:option>
																		<html:options collection="unitMeasurementList" property="value" labelProperty="label"></html:options>
																	</html:select>
																</td>
																<td colspan="9">
																	&nbsp;
																</td>
															</tr>
															<tr><td colspan="12">&nbsp;</td></tr>
															<tr>
																<td colspan="3">
																	<div id="displayHWL" style="display: none;">
																		<table>
																			<tr>
																				<td>
																					<bean:message key="BzComposer.additem.height"/>
																				</td>
																				<td>
																					<input type="text" id="height" size="4">
																				</td>
																				<td>
																					<bean:message key="BzComposer.additem.width"/>
																				</td>
																				<td>
																					<input type="text" id="width" size="4">
																				</td>
																				<td>
																					<bean:message key="BzComposer.additem.length"/>
																				</td>
																				<td>
																					<input type="text" id="length" size="4">
																				</td>
																			</tr>
																		</table>
																	</div>
																</td>
																<td colspan="9">
																	&nbsp;
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.itemsupplier"/>
												</td>
												<td colspan="2" align="left">
													<html:select property="vendorId" styleId="clientVendor">
														<%-- <html:option value="AddNew"><bean:message key="BzComposer.addNew"/></html:option> --%>
														<html:option value="10101010" styleId="defaultCvId">
															&nbsp;
														</html:option>
														<html:option value="0">
															<bean:message key="BzComposer.additem.addnew" />
														</html:option>
														<html:options collection="vendorList" property="value" labelProperty="label"></html:options>
													</html:select>
												</td>
												<td></td>
												<td>
													<bean:message key="BzComposer.additem.supplierssku"/>
												</td>
												<td>
													<input type="text" id="supplierSKU">
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.supplierforthissku"/>
												</td>
												<td colspan="2" align="left">
													<input type="checkbox" id="primarySupplier" name="primarySupplier">
													<bean:message key="BzComposer.additem.primarysupplier"/>
												</td>
												<td>
												</td>
												<td>
													<bean:message key="BzComposer.additem.suppliersbarcode"/>
												</td>
												<td>
													<input type="text" id="barcode">
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="3" rowspan="3">
													<table border="1" style="width: 100%;height: 100%;">
														<tr>
															<td>
																<bean:message key="BzComposer.additem.suppliername"/>
															</td>
														</tr>
														<tr>
															<td>
																<table id="supplierName">
																	<tbody></tbody>
																</table>
															</td>
														</tr>
													</table>
												</td>
												<td align="center">
													<%-- <input type="button" class="formbutton" id="addSupplierBtn" name="addSupplierBtn" value="<bean:message key='BzComposer.global.add'/>"/> --%>
												</td>
												<td>
													<bean:message key="BzComposer.additem.purchaseprice"/>
												</td>
												<td>
													<input type="text" id="purchasePrice" value="$0.00">
												</td>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
												<td align="center">
													<%-- <input type="button" class="formbutton" id="editBtn" name="edit" value="<bean:message key='BzComposer.global.edit'/>"> --%>
												</td>
												<td>
													<bean:message key="BzComposer.additem.minimumorderunit"/>
												</td>
												<td>
													<input type="text" id="orderUnit" value="0">
												</td>
												<td colspan="6">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td align="center">
													<input type="button" class="formbutton" id="addSupplierBtn" name="addSupplierBtn" value="<bean:message key='BzComposer.global.add'/>"/>
													<input type="button" class="formbutton" id="editBtn" name="edit" value="<bean:message key='BzComposer.global.edit'/>">
													<input type="button" class="formbutton" id="deleteSupplierBtn" name="deleteSupplierBtn" value="<bean:message key='BzComposer.global.delete'/>">
													
												</td>
												<td>
													<bean:message key="BzComposer.additem.onorder"/>
												</td>
												<td>
													<input type="text" id="order" value="0">
												</td>
												<td colspan="6">
													&nbsp;
												</td>
											</tr>
											
										</tbody>
									</table>
									
								</div>
   							</div>
						</div>
						
						<div id="pricing-2">
							<div id="content2" class="tabPage">
   								<!-- add here the content of second tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<thead>
											<tr>
												<th colspan="12" style="font-size:1.3em;">
													<bean:message key="BzComposer.tabs.pricing" />
												</th>
											</tr>
										</thead>		
										<tbody>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.saleprice"/>
												</td>
												<td>
													<input type="text" id="salePrice" name="salePrice">
												</td>	
												<td colspan="10">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.dealerprice"/>
												</td>
												<td>
													<input type="text" id="dealerPrice" name="dealerPrice">
												</td>	
												<td colspan="10">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" id="priceLevel" name="priceLevel" checked>
													<bean:message key="BzComposer.additem.applypricelevel"/>
												</td>
												<td colspan="11">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="11">
													<div id="tabsPricing" style="height:400px;">
  														<ul>
    														<li style="font-size: 1em;">
    															<a href="#priceLevel-1">
    																<bean:message key="BzComposer.additem.pricelevel"/>
   																</a>
															</li>
		    												<li style="font-size: 1em;">
		    													<a href="#addPriceLevel-2">
		    														<bean:message key="BzComposer.additem.addpricelevel"/>
    															</a>
   															</li>
		    											</ul>
														<div id="priceLevel-1">
   															<div id="content1" class="tabPage">
   															<!-- add here the content of first tab -->
																<div id="table-negotiations">
																	<table class="tabla-listados" cellspacing="0">
																		<thead>
																			<tr>
																				<td colspan="12" style="font-size:1.3em;">
																					
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2" rowspan="3">
																					<table border="1" style="width: 200px;" id="">
																						<tr>
																							<td>
																								<bean:message key="BzComposer.additem.pricelevel"/>
																							</td>
																							<td>
																								<bean:message key="BzCompoer.additem.percentagebracket"/>
																							</td>
																						</tr>
																						<%-- <html:select property="priceLevelId" styleId="customerPaymentMethod"> --%>
																						<logic:present name="ItemForm" property="listOfExistingPriceLevels" > 
																						<input type="hidden" id="priceLevelSize" name="priceLevelSize" value='<bean:write name="priceLevelSize" />' />
																						<logic:iterate name="ItemForm" id="objList1" property="listOfExistingPriceLevels" scope="session">
																						<tr id="priceLevel" value="<bean:write name='objList1' property='priceLevelId' />" 
																						onclick="showSelectedOption('<bean:write name='objList1' property='priceLevelId' />',
																						'<bean:write name="objList1" property="priceLevel" />',
																						'<bean:write name="objList1" property="pricePercentage" />');">
																							<td>
																							<%-- <html:select property="priceLevelId">
																							<html:options collection="priceLevelList" property="value" labelProperty="label"></html:options>
																							</html:select> --%>
																							<bean:write name="objList1" property="priceLevel" />
																							</td>
																							<td><bean:write name="objList1" property="pricePercentage" /></td>
																							
																						</tr>
																						</logic:iterate>
																						</logic:present> 
																					</table>
																				</td>
																				<td>
																					<bean:message key="BzComposer.additem.pricelevelname"/>
																				</td>
																				<td>
																					<html:text property="priceLevel" styleId="priceLevelName"></html:text>
																				</td>
																				<td>
																				</td>
																				<td>
																					<input type="checkbox" id="priceLevelInactive" name="priceLevelInactive">
																					<bean:message key="BzComposer.additem.pricelevelisinactive"/>
																				</td>
																				<td colspan="6">&nbsp;</td>
																			</tr>
																			<tr>
																				<td>
																					<bean:message key="BzComposer.additem.thispricelevelwill"/>
																				</td>
																				<td>
																					<select id="priceLevelWill">	
																						<option value="1"><bean:message key="BzComposer.additem.increase"/></option>
																						<option value="2"><bean:message key="BzComposer.additem.decrease"/></option>
																					</select>
																				</td>
																				<td>
																					<bean:message key="BzComposer.additem.itempricesby"/>
																				</td>
																				<td>
																					<html:text property="pricePercentage" styleId="pricePercentage"></html:text>
																				</td>
																				<td colspan="6">&nbsp;</td>
																			</tr>
																			<tr>
																				<td>
																					<bean:message key="BzComposer.additem.priceleveltype"/>
																				</td>
																				<td>
																					<select id="priceLevelOption">	
																						<option value="1"><bean:message key="BzComposer.additem.fixed"/></option>
																						<option value="2"><bean:message key="BzComposer.additem.itemprice"/></option>
																					</select>
																				</td>
																				<td colspan="8">&nbsp;</td>
																			</tr>
																			<tr>
																				<td colspan="8">&nbsp;</td>
																				<td>
																					<input type="button" id="UpdatePricelevel" name="UpdatePriceLevel" class="formbutton" value="<bean:message key='BzComposer.global.update'/>">
																				</td>
																				<td>
																					<input type="reset" id="ClearPriceLevel" name="ClearPriceLevel" class="formbutton" value="<bean:message key='BzComposer.additem.clearbtn'/>">
																				</td>
																				<td colspan="2">
																					&nbsp;
																				</td>
																			</tr>
																		</thead>		
																		<tbody>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div id="addPriceLevel-2">
   															<div id="content1" class="tabPage">
   															<!-- add here the content of first tab -->
																<div id="table-negotiations">
																	<table class="tabla-listados" cellspacing="0">
																		<thead>
																			<tr>
																				<td colspan="12" style="font-size:1.3em;">
																					
																				</td>
																			</tr>
																		</thead>		
																		<tbody>
																			<tr>
																				<td>
																					<bean:message key="BzComposer.additem.pricelevelname"/>
																				</td>
																				<td>
																					<input type="text" id="priceLevelName" name="priceLevelName">
																				</td>
																				<td>
																				</td>
																				<td>
																					<input type="checkbox" id="priceLevelInactive" name="priceLevelInactive">
																					<bean:message key="BzComposer.additem.pricelevelisinactive"/>
																				</td>
																				<td colspan="8">&nbsp;</td>
																			</tr>
																			<tr>
																				<td>
																					<bean:message key="BzComposer.additem.thispricelevelwill"/>
																				</td>
																				<td>
																					<select id="priceLevel">	
																						<option value="1"><bean:message key="BzComposer.additem.increase"/></option>
																						<option value="2"><bean:message key="BzComposer.additem.decrease"/></option>
																					</select>
																				</td>
																				<td>
																					<bean:message key="BzComposer.additem.itempricesby"/>
																				</td>
																				<td>
																					<input type="text" id="itemPrice">
																				</td>
																				<td colspan="8">&nbsp;</td>
																			</tr>
																			<tr>
																				<td>
																					<bean:message key="BzComposer.additem.priceleveltype"/>
																				</td>
																				<td>
																					<select id="priceLevel">	
																						<option value="1"><bean:message key="BzComposer.additem.fixed"/></option>
																						<option value="2"><bean:message key="BzComposer.additem.itemprice"/></option>
																					</select>
																				</td>
																				<td colspan="10">&nbsp;</td>
																			</tr>
																			<tr>
																				<td colspan="8">&nbsp;</td>
																				<td>
																					<input type="button" id="addPriceLevel" name="addPriceLevel" class="formbutton" value="<bean:message key='BzComposer.global.add'/>" onclick="addData();">
																				</td>
																				<td>
																					<input type="button" id="ClearPriceLevel2" name="ClearPriceLevel2" class="formbutton" value="<bean:message key='BzComposer.additem.clearbtn'/>">
																				</td>
																				<td colspan="2">
																					&nbsp;
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td colspan="12">
													&nbsp;
												</td>
											</tr>												
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<div id="description-3">
							<div id="content2" class="tabPage">
   								<!-- add here the content of third tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<tr>
											<td id="Editor" style="display: block;">
												<textarea name="editor1"></textarea>
												<script>
												/* CKEDITOR.editorConfig = function( config ) {
												config.toolbar = [
													{ name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
													{ name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
													{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
													{ name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
													'/',
													{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
													{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
													{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
													{ name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
													'/',
													{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
													{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
													{ name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
													{ name: 'others', items: [ '-' ] },
													{ name: 'about', items: [ 'About' ] }
												];

												// Toolbar groups configuration.
												config.toolbarGroups = [
													{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
													{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
													{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
													{ name: 'forms' },
													'/',
													{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
													{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
													{ name: 'links' },
													{ name: 'insert' },
													'/',
													{ name: 'styles' },
													{ name: 'colors' },
													{ name: 'tools' },
													{ name: 'others' },
													{ name: 'about' }
												];
												};
												CKEDITOR.replace( 'editor1' ); */
												/* CKEDITOR.editorConfig = function( config ) {
													alert("Inside ckEditor config function"); */
													/* config.toolbar = [
														{ name: 'save', items: [ 'savebtn','Undo','Redo' ] },
										                { name: 'clipboard', items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord'] },
										                { name: 'document', items: [ 'Find','Replace'] },
										                '/',
										                { name: 'lists', items: [ 'NumberedList','BulletedList','Outdent','Indent'] },
										                { name: 'insert', items: [ 'Image','Table','Smiley','SpecialChar'] },
										                { name: 'link', items: ['Link','Unlink'] },
										                '/',
										                { name: 'basicstyles', items: [ 'Font','FontSize','Bold','Italic','Underline','Strike','Subscript','Superscript'] },
										                //'/',
										                { name: 'align', items: [ 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] }
										        	]; */
													/* CKEDITOR.config.toolbar = [
														   ['Styles','Format','Font','FontSize'],
														   '/',
														   ['Bold','Italic','Underline','StrikeThrough','-','Undo','Redo','-','Cut','Copy','Paste','Find','Replace','-','Outdent','Indent','-','Print'],
														   '/',
														   ['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
														   ['Image','Table','-','Link','Flash','Smiley','TextColor','BGColor','Source']
														] ;
												};
												CKEDITOR.replace( 'editor1' ); */
												
											   	CKEDITOR.replace( 'editor1' );
												</script>
											</td>
											<td id="tAreaContent" style="display: none;">
												<textarea id="textAreaContent" rows="10" cols="130"></textarea>
											</td>
										</tr>
										<tr>
											<td>
												<input type="button" class="formbutton" onclick="getData();" value="<bean:message key='BzComposer.additem.htmlbtn'/>">
												&nbsp;&nbsp;
												<input type="button" class="formbutton" onclick="getEditor();" value="<bean:message key='BzComposer.global.edit'/>">
											</td>
										</tr>
											<!-- <td>Description</td>
											<td>
												<select id="fontStyle">
													<option id="BodyText">Body Text</option>
													<option id="Paragraph">Paragraph</option>
													<option id="Blockquote">Blockquote</option>
													<option id="Preformatted">Preformatted</option>
													<option id="Heading-1">Heading 1</option>
													<option id="Heading-2">Heading 2</option>
													<option id="Heading-3">Heading 3</option>
													<option id="Heading-4">Heading 4</option>
													<option id="Heading-5">Heading 5</option>
													<option id="Heading-6">Heading 6</option>
													<option id="UnorderedList">Unordered List</option>
													<option id="OrderedList">Ordered List</option>
												</select>
											</td>
											<td>
												<select id="fontType">
													<option value="Default">Default</option>
													<option value="serif">serif</option>
													<option value="sans-serif">sans-serif</option>
													<option value="monospaced">monospaced</option>
												</select>
											</td>
											<td>
												<font size="5"><a><b>A</b></a></font>
												&nbsp;
												<input type="color" name="favcolor">
											</td>
											<td>
												<font size="5"><a><b>B</b></a></font>
												&nbsp;
												<font size="5"><a><i>I</i></a></font>
												&nbsp;
												<font size="5"><a><u>U</u></a></font>
											</td>
										</tr>
										<tr>
											<td colspan="12">&nbsp;</td>
										</tr> -->
									</table>
								</div>
							</div>
						</div>
						
						<div id="channelSetting-4">
							<div id="content2" class="tabPage">
   								<!-- add here the content of fourth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<tr>
											<td>
												<bean:message key="BzComposer.additem.selectstore"/>
											</td>
											<td colspan="11">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="4">
												<table class="tabla-listados" border="1">
													<thead>
														<tr>
															<td><bean:message key="Bzcomposer.additem.active"/></td>
															<td><bean:message key="Bzcomposer.additem.storename"/></td>
															<td><bean:message key="BzComposer.additem.idasin"/></td>
															<td><bean:message key="BzComposer.additem.price"/></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<!-- <td>
																<input type="checkbox" id="active" name="active" value="active">
															</td> -->
															<td>
															<logic:present name="ItemForm" property="listOfExistingChannelSettings" > 
																<logic:iterate name="ItemForm" id="objList1" property="listOfExistingChannelSettings" scope="session">
																	<tr id="channelSettings">
																		<td>
																			<input type="checkbox" id="active" name="active" value="active">
																		</td>
																		<td>
																			<bean:write name="objList1" property="channelSettingName" />
																		</td>
																		<td>&nbsp;</td>
																		<td>0.0</td>
																		<%-- <td>
																			<bean:write name="objList1" property="pricePercentage" />
																		</td> --%>
																	</tr>
																</logic:iterate>
															</logic:present> 
															</td>
														</tr>
																<!-- Amazon Market Place File-Amazon Market
															</td>
															<td>&nbsp;</td>
															<td>0.0</td>
														</tr>
														<tr>
															<td>
																<input type="checkbox" id="active" name="active" value="active">
															</td>
															<td>
																Amazon Seller File Import-CDI Amazon Seller
															</td>
															<td>&nbsp;</td>
															<td>0.0</td>
														</tr>
														<tr>
															<td>
																<input type="checkbox" id="active" name="active" value="active">
															</td>
															<td>
																Amazon Seller online-cdromusa
															</td>
															<td>&nbsp;</td>
															<td>0.0</td>
														</tr>
														<tr>
															<td>
																<input type="checkbox" id="active" name="active" value="active">
															</td>
															<td>
																eBay online-online
															</td>
															<td>&nbsp;</td>
															<td>0.0</td>
														</tr>
														<tr>
															<td>
																<input type="checkbox" id="active" name="active" value="active">
															</td>
															<td>
																WebDesignForUs.com-cdromusa
															</td>
															<td>&nbsp;</td>
															<td>0.0</td>
														</tr> -->
													</tbody>
												</table>
											</td>
											<td colspan="8">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="3" align="left">
												<bean:message key="BzComposer.additem.asinnote"/>
											</td>
											<td align="right">
												<input type="button" id="edit" name="edit" class="formbutton" value="<bean:message key='BzComposer.global.edit'/>">
											</td>
											<td colspan="8">
												&nbsp;
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						<div id="alternateBarcodeSKU-5">
							<div id="content2" class="tabPage">
   								<!-- add here the content of fifth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<tbody>
											<tr>
												<td align="right">
													<bean:message key="BzComposer.additem.alternatebarcodes"/>
												</td>
												<td>
													&nbsp;
												</td>
												<td align="left">
													<bean:message key="BzComposer.additem.alternateskus"/>
												</td>
												<td colspan="2">
													&nbsp;
												</td>
												<td colspan="7">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td align="right">
													<select id="barcodes" multiple="multiple" style="height: 190px;width: 130px;">
														<option value="0">
														</option>
													</select>
												</td>
												<td>
													&nbsp;
												</td>
												<td align="left">
													<select id="sku" multiple="multiple" style="height: 190px;width: 130px;">
														<option value="0">
														</option>
													</select>
												</td>
												<td>
													<table>
														<tr>
															<td colspan="2">&nbsp;</td>
														</tr>
														<tr>
															 <td>
																<bean:message key="BzComposer.additem.barcode"/>
															</td>
															<td>
																<input type="text" id="barcode" name="barcode" style="width: 60px;">
															</td>
														</tr>
														<tr>
															<td colspan="2">&nbsp;</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BzComposer.additem.sku"/>
															</td>
															<td>
																<input type="text" id="barcode" name="barcode" style="width: 60px;">
															</td>
														</tr>
														<tr>
															<td colspan="2">&nbsp;</td>
														</tr>
														<tr>
															<td>
																<input type="submit" id="add" name="add" class="formbutton" value="<bean:message key='BzComposer.global.add'/>">
															</td>
															<td>
																<input type="submit" id="delete" name="delete" class="formbutton" value="<bean:message key='BzComposer.global.delete'/>">
															</td>
														</tr>
													</table>
												</td>
												<!-- <td>
													Barcode
												</td>
												<td>
													<input type="text" id="barcode" name="barcode" style="width: 60px;">
												</td> -->
												<td colspan="8">
													&nbsp;
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<div id="images-6">
							<div id="content2" class="tabPage">
   								<!-- add here the content of sixth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<tr>
											<td style="width:10%;">
												<bean:message key="BzComposer.additem.image"/>
											</td>
											<td style="width: 15%;">
												<input type="text" id="imageName" name="imageName" size="55">
											</td>
											<td align="right" style="width:20%;">
												<input type="button" id="viewImage" name="viewImage" class="formbutton" value="<bean:message key='BzComposer.additem.viewimage'/>">
											</td>
											<td align="left" style="width: 20%;">
												<input type="file" class="formbutton" id="imgupload" value=""/> 
												<!-- <input type="button" id="browseImage" name="browseImage" class="formbutton" value="Browse Image"> -->
											</td>
											<td colspan="8" style="width:35%;">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td colspan="3" align="left" style="width: 45%;">
												<img src="" id="resultImage" style="height: 139px; width: 299px;border: 1em;">
											</td>
											<td colspan="9" style="width: 55%;">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td colspan="12">
												&nbsp;
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						<div id="webFields-7">
							<div id="content2" class="tabPage">
   								<!-- add here the content of seventh tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<tr>
											<td>
												<bean:message key="BzComposer.additem.producttitle"/>
											</td>
											<td style="width: 80px;">
												<input type="text" id="productTitle" name="productTitle">
											</td>
											<td colspan="10">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<bean:message key="BzComposer.additem.keyword"/>
											</td>
											<td style="width: 80px;">
												<input type="text" id="keyword" name="keyword">
											</td>
											<td colspan="10">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<bean:message key="BzComposer.additem.thumbnail"/>
											</td>
											<td style="width: 50px;">
												<input type="text" id="thumbnail" name="thumbnail">
											</td>
											<td>
												<input type="button" id="viewImage1" class="formbutton" value="<bean:message key='BzComposer.additem.viewimage'/>" disabled="disabled">
											</td>
											<td>
												<input type="file" id="imgupload1" class="formbutton" value=""/> 
												<!-- <input type="button" id="browseImage" name="browseImage" onclick="openThumbnail();" class="formbutton" value="Browse Image"> -->
												<img src="" id="resultImageThumbnail" style="display: none;">
											</td>
											<td colspan="8">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<bean:message key="BzComposer.additem.image"/>
											</td>
											<td style="width: 50px;">
												<input type="text" id="image2" name="image2">
											</td>
											<td>
												<input type="button" id="viewImage2" class="formbutton" value="<bean:message key='BzComposer.additem.viewimage'/>" disabled="disabled">
											</td>
											<td>
												<input type="file" id="imgupload2" class="formbutton" value=""/> 
												<!-- <input type="button" id="browseImage2" name="browseImage2" class="formbutton" value="Browse Image"> -->
												<img src="" id="resultImage2" style="display: none;">
											</td>
											<td colspan="8">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<bean:message key="BzComposer.additem.header"/>
											</td>
											<td>
												<textarea rows="5" cols="12" id="itemHeader"></textarea>
											</td>
											<td colspan="10">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<bean:message key="Bzcomposer.additem.footer"/>
											</td>
											<td>
												<textarea rows="5" cols="12" id="itemFooter"></textarea>
											</td>
											<td colspan="10">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="10">
												<table class="tabla-listados" style="width: 500px;">
													<thead>
														<tr>
															<td colspan="2">
																<b><bean:message key="BzComposer.additem.esaleschannelsetting"/></b>
															</td>
														</tr>
														<tr>
															<td colspan="2"><u></u></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td colspan="2">
																<table border="1">
																	<tr>
																		<td>
																			<bean:message key="BzComposer.additem.description"/>
																		</td>
																		<td>
																			<bean:message key="BzComposer.ComboBox.Select"/>
																		</td>
																	</tr>
																	<logic:present name="ItemForm" property="listOfExistingeSaleChannelList" > 
																<logic:iterate name="ItemForm" id="objList1" property="listOfExistingeSaleChannelList" scope="session">
																	<tr id="channelSettings">
																		<td>
																			<bean:write name="objList1" property="eSaleChannelListName" />
																		</td>
																		<td>
																			<input type="checkbox" id="active" name="active" value="active">
																		</td>
																	</tr>
																	</logic:iterate>
																	</logic:present>
																	<!-- <tr>
																		<td> 
																		</td>
																		<td>
																			<input type="checkbox" id="active" name="active" checked>
																		</td>
																	</tr>
																	<!-- <tr>
																		<td>
																			Don't Synch with Amazon Seller online
																		</td>
																		<td>
																			<input type="checkbox" id="active" name="active" checked>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			Don't Synch with Amazon Market Place File
																		</td>
																		<td>
																			<input type="checkbox" id="active" name="active" checked>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			Don't Synch with WebDesignForUs.com
																		</td>
																		<td>
																			<input type="checkbox" id="active" name="active" checked>
																		</td>
																	</tr> -->
																</table>
															</td>
														</tr>
														<tr>
															<td colspan="2">
																<input type="checkbox" id="ignoreQOH" name="ignoreQOH">
																<bean:message key="Bzcomposer.additem.ignoreqoh"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="12">&nbsp;</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						<div id="eBay-8">
							<div id="content2" class="tabPage">
   								<!-- add here the content of eighth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<thead>
											<tr>
												<th colspan="12" style="font-size:1.3em;">
													<bean:message key="BzComposer.additem.crosssell"/>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="12" align="left">
													<bean:message key="BzComposer.additem.productlist"/>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<div class="myTable">
													<table id="eBayProductTable" border="1">
														<thead>
															<tr>
																<td>
																	<bean:message key="BzComposer.additem.itemname"/>
																</td>
																<td>
																	<bean:message key="BzComposer.additem.sku"/>
																</td>
																<td>
																	<bean:message key="BzComposer.additem.itemtitle"/>
																</td>
																<td>
																	<bean:message key="BzComposer.additem.qty"/>
																</td>
															</tr>
														</thead>
														<tbody>
														<logic:present name="ItemForm" property="listOfExistingeBayProducts"> 
															<input type="hidden" id="productListSize" name="productListSize" value='<bean:write name="eBayProductListSize" />' />
															<logic:iterate name="ItemForm" id="objList1" property="listOfExistingeBayProducts" scope="session">
															<tr id="productId<bean:write name="objList1" property="eBayProductId" />" value="<bean:write name="objList1" property="eBayProductId" />"
															onclick="showSelectedProduct('<bean:write name="objList1" property="eBayProductId" />',
															'<bean:write name="objList1" property="eBayProductName" />',
															'<bean:write name="objList1" property="eBayProductCode" />',
															'<bean:write name="objList1" property="eBayProductQty" />',
															'<bean:write name="objList1" property="eBayProductType"/>',
															'<bean:write name="objList1" property="eBayProductPrice" />');">
																<td id="productCode<bean:write name="objList1" property="eBayProductId" />">
																	<bean:write name="objList1" property="eBayProductCode" />
																</td>
																<td id="productName<bean:write name="objList1" property="eBayProductId" />">
																	<bean:write name="objList1" property="eBayProductCode"/>
																</td>
																<td id="productType<bean:write name="objList1" property="eBayProductId" />">
																	<bean:write name="objList1" property="eBayProductType"/>
																</td>
																<td id="productQty<bean:write name="objList1" property="eBayProductId" />">
																	<bean:write name="objList1" property="eBayProductQty"/>
																	<html:hidden property="eBayProductPrice"/>
																	<html:hidden property="eBayProductName"/>
																</td>
															</tr>
															</logic:iterate>
														</logic:present>
														</tbody>
													</table>
													</div>
												</td>
												<td>
													<input type="button" id="addCrossSell" class="formbutton" name="addCrossSell" value="<bean:message key='BzComposer.additem.addtocrosssellbtn'/>">
												</td>
												<td colspan="7">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td colspan="12">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="12" align="left">
													<bean:message key="BzComposer.additem.crosssellproducts"/>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<table border="1" id="crossSellProductTable">
														<thead>
															<tr>
																<td>
																	<bean:message key="BzComposer.additem.itemname"/>
																</td>
																<td>
																	<bean:message key="BzComposer.additem.sku"/>
																</td>
																<td>
																	<bean:message key="BzComposer.additem.qty"/>
																</td>
																<td>
																	<bean:message key="BzComposer.additem.amount"/>
																</td>
															</tr>
														</thead>
														<tbody>
														</tbody>
													</table>
												</td>
												<td>
													<input type="button" class="formbutton" id="deleteCrossSellProduct" name="deleteCrossSellProduct" 
													value="<bean:message key='BzComposer.global.delete'/>">
												</td>
												<td colspan="7">
												</td>
											</tr>
											<tr>
												<td colspan="12">&nbsp;</td>
											</tr>
										</tbody>	
									</table>
								</div>
							</div>
						</div>
						
						<div id="itemCategory-9">
							<div id="content2" class="tabPage">
   								<!-- add here the content of ninth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<thead>
											<tr>
												<th colspan="12" style="font-size:1.3em;">
													
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="12" align="left">
													<bean:message key="Bzcomposer.additem.storelist"/>
												</td>
											</tr>
											<tr>
												<td style="width: 20%;">
													<html:select property="storeId" multiple="multiple" styleId="availableStores" style="height: 150px;width: 120px;">
														<html:options collection="itemStoreList" property="value" labelProperty="label"/>
													</html:select>
												</td>
												<td align="left">
													<table>
														<tr>
															<td>
																<bean:message key="Bzcomposer.additem.selectedcategories"/>
															</td>
															<td>
																<select id="categories">
																	<option value="0"></option>
																</select>
															</td>
														</tr>
														<tr>
															<td colspan="2" align="center">
																<input type="submit" id="save" class="formbutton" name="save" 
																value="<bean:message key='BzComposer.global.save'/>">
															</td>
														</tr>
													</table>
												</td>
												<td colspan="10">
													&nbsp;
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<div id="customOption-10">
							<div id="content2" class="tabPage">
   								<!-- add here the content of tenth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<thead>
											<tr>
												<th colspan="12" style="font-size:1.3em;">
													<bean:message key="BzComposer.tabs.customoption"/>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="11" align="right">
													<input type="button" id="addOption" name="addOption" 
													value="<bean:message key='Bzcomposer.additem.addnewoption'/>" class="formbutton"/>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td colspan="12">
													<div>
														<table id="addTableRow">
															<tbody></tbody>
														</table>
													</div>
												</td>
											</tr>
									</table>
								</div>
							</div>
						</div>
						
						<!-- History tab starts -->
						<div id="history-11">
							<div id="content2" class="tabPage">
   								<!-- add here the content of tenth tab -->
								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<tbody>
											<tr>
												<td><bean:message key='BzComposer.additem.filteroption'/></td>
												<td>
													<select id="filterOption">
														<option>All</option>
														<option>Custom</option>
														<option>Today</option>
														<option>This Month</option>
														<option>This Quarter</option>
														<option>This Year</option>
														<option>1 Year</option>
														<option>2 Year</option>
														<option>3 Year</option>
														<option>This Month-to-Date</option>
														<option>This Quarter-to-Date</option>
														<option>This Year-to-Date</option>
														<option>Last 10 days</option>
														<option>Last 30 days</option>
														<option>Last 60 days</option>
														<option>1 Week</option>
													</select>
												</td>
												<td>
													<bean:message key="BzComposer.additem.datefrom"/>
													&nbsp;&nbsp;
													<input type="date" id="dateFrom">													
												</td>
												<td>
													<bean:message key="BzComposer.additem.dateto"/>
													&nbsp;&nbsp;
													<input type="date" id="dateTo">
												</td>
												<td>
													<input type="text" id="search" name="search" class="formbutton" 
													value="<bean:message key='BzComposer.additem.search'/>" size="5"/>
												</td>
												<td colspan="7">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="BzComposer.additem.itemcode"/>
												</td>
												<td>
													<select>
														<option></option>
														<option></option>
													</select>
												</td>
												<td>
													<bean:message key='BzComposer.additem.startinginventoryquantity'/>
												</td>
												<td colspan="9">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td colspan="11">
													<div id="stockInOut" style="height:300px;width:100%;">
														<ul id="stockInOut">
    														<li style="font-size: 1em;"><a href="#stockInOut-1">
    															<bean:message key="BzComposer.additem.stockinout"/>
   															</a></li>
		    											</ul>
		    											<div id="stockInOut-1">
		    												<div id="content1" class="tabPage">
								   								<!-- add here the content of first tab -->
																<div id="table-negotiations">
																	<table class="tabla-listados" cellspacing="0">
																		<thead>
																			<tr>
																				<th style="font-size:1em;">
																					<bean:message key="BzComposer.additem.date"/>
																				</th>
																				<th style="font-size:1em;">
																					<bean:message key="BzComposer.additem.customerorvendor"/>
																				</th>
																				<th style="font-size:1em;">
																					<bean:message key="BzComposer.additem.invoiceorbill"/>
																				</th>
																				<th style="font-size:1em;">
																					<bean:message key="BzComposer.additem.invoicetype"/>
																				</th>
																				<th style="font-size:1em;">
																					<bean:message key="BzComposer.additem.quantity"/>
																				</th>
																				<th style="font-size:1em;">
																					<bean:message key="BzComposer.additem.qtyonhand"/>
																				</th>
																			</tr>
																		</thead>		
																		<tbody>
																			<tr>
																				<td>
																				</td>
																			</tr>
																			<tr>
																				<td>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
		    											</div>
		    										</div>
												</td>
												<td>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td colspan="12">&nbsp;</td>
											</tr>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- productTab Ends -->
				
				<!-- serviceTab Starts -->
				<div id="serviceTab" style="display:none;">
					<div id="table-negotiations">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th colspan="12" style="font-size:1.3em;">
										<bean:message key="BzComposer.Item.ServiceInformation" />
									</th>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.ServiceCode"/>
										<span class="highlighted">*</span>
									</td>
									<td align="left" colspan="2">
										<input type="text" id="serviceCode1" width="20%"/>
									</td>
									<td>&nbsp;</td>
									<td>
										<input type="button" class="formbutton" id="createCategory1" name="createCategory1" value="Create Category"/>
									</td>
									<td colspan="7">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td></td>
									<td width="10%">
										<input type="checkbox" id="subItem3" name="subItem3" value="subItem3">
										<bean:message key="BzComposer.Item.SubItemOf"/>
									</td>
									<td>
										<select id="subItemSelect3" disabled style="width: 70%;">
											<option value="0"> <bean:message key="BzComposer.ComboBox.Select" /> </option>
											<option value="1"> Root</option>
										</select>
									</td>
									<td colspan="9">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ServiceTitle"/>
										<span class="highlighted">*</span>
									</td>
									<td colspan="2" align="left">
										<input type="text" id="serviceCode" width="20%"/>
									</td>
									<td colspan="9">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ServiceRate"/>
									</td>
									<td>
										<input type="text" id="serviceRate"/>
									</td>
									<td>
										<bean:message key="BzComposer.TimeUnit"/>
									</td>
									<td>
										<select id="unitTime">
											<option value="0">Select</option>
											<option value="1">weekly</option>
											<option value="2">semi-monthly</option>
											<option value="3">monthly</option>
											<option value="4">quarterly</option>
											<option value="4">semi-yearly</option>
											<option value="5">yearly</option>
										</select>
									</td>
									<td colspan="8">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ServiceDescription"/>
									</td>
									<td align="left">
										<textarea rows="5" cols="10"></textarea>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
							</thead>		
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- serviceTab Ends -->
				
				<!-- recurringServiceTab Starts -->
				<div id="recurringServiceTab" style="display:none;">
					<div id="table-negotiations">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th colspan="12" style="font-size:1.3em;">
										<bean:message key="BzComposer.Item.ServiceInformation" />
									</th>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.ServiceCode"/>
										<span class="highlighted">*</span>
									</td>
									<td align="left" colspan="2">
										<input type="text" id="serviceCode" width="20%"/>
									</td>
									<td colspan="9">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ServiceTitle"/>
										<span class="highlighted">*</span>
									</td>
									<td colspan="2" align="left">
										<input type="text" id="serviceCode" width="20%"/>
									</td>
									<td colspan="9">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ServiceRate"/>
									</td>
									<td>
										<input type="text" id="serviceRate"/>
									</td>
									<td>
										<bean:message key="BzComposer.TimeUnit"/>
									</td>
									<td>
										<select id="unitTime">
											<option value="0">Select</option>
											<option value="1">weekly</option>
											<option value="2">semi-monthly</option>
											<option value="3">monthly</option>
											<option value="4">quarterly</option>
											<option value="4">semi-yearly</option>
											<option value="5">yearly</option>
										</select>
									</td>
									<td colspan="8">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ServiceDescription" />
									</td>
									<td align="left">
										<textarea rows="5" cols="10"></textarea>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
							</thead>		
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- recurringServiceTab Ends -->
				
				<!-- giftCertificateTab Starts -->
				<div id="giftCertificateTab" style="display:none;">
					<div id="table-negotiations">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th colspan="12" style="font-size:1.6em;">
										<bean:message key="BzComposer.Item.GiftCertificate"/>
									</th>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Code"/>
										<span class="highlighted">*</span>
									</td>
									<td>
										<input type="text" id="certificateCode" value="GC0001" readonly="readonly"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.ItemName"/>
										<span class="highlighted">*</span>
									</td>
									<td>
										<input type="text" id="itemName"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="Bizcomposer.Configuration.active"/>
									</td>
									<td>
										<input type="radio" id="itemActive" name="itemActive" value="Active"/>
										<bean:message key="Bizcomposer.active"/>
										<input type="radio" id="itemInActive" name="itemInActive" value="Inactive"/>
										<bean:message key="BzComposer.InActive"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Price"/>
										<span class="highlighted">*</span>
									</td>
									<td>
										<input type="text" id="itemPrice" name="itemPrice"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.RedeemPrice"/>
										<span class="highlighted">*</span>
									</td>
									<td>
										<input type="text" id="itemRedeemPrice" name="itemRedeemPrice"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Details"/>
									</td>
									<td>
										<textarea rows="3" cols="20" id="details"></textarea>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.UseDays"/>
										<span class="highlighted">*</span>
									</td>
									<td>
										<input type="text" id="useDays" name="useDays"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Note"/>
									</td>
									<td align="left">
										<textarea rows="5" cols="20"></textarea>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.CertificateLogo"/>
										<span class="highlighted">*</span>
									</td>
									<td>
										<input type="file" id="certificateLogo" name="certificateLogo"/>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
							</thead>		
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- giftCertificateTab Ends -->
				
				<!-- inventoryAssemblyTab Starts -->
				<div id="inventortAssemblyTab" style="display:none;">
					<div id="table-negotiations">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th colspan="12" style="font-size:1.6em;">
										<bean:message key="BzComposer.InventoryAssemblyInformation"/>
									</th>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.ItemNameNumber"/>
									</td>
									<td>
										<input type="text" id="itemNameNumber" />
									</td>
									<td>
										<bean:message key="BzComposer.Report.vendor.BalanceSummary.Account"/>
									</td>
									<td>
										<html:select property="accountId">
											<html:option value="0">
												<bean:message key="BzComposer.ComboBox.Select" />
											</html:option>
											<html:options collection="AccountList" property="value" labelProperty="label"></html:options>
										</html:select>
									</td>
									<td colspan="8">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Purchase.PurchaseOrder.Cost"/>
									</td>
									<td>
										<input type="text" id="itemCost"/>
									</td>
									<td>
										<bean:message key="BzComposer.SalesTax"/>
									</td>
									<td colspan="9">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.SalesPrice"/>
									</td>
									<td>
										<input type="text" id="salesPrice" name="salesPrice"/>
									</td>
									<td>
										<bean:message key="BzComposer.Item.PurchasePrice"/>
									</td>
									<td>
										<input type="text" id="purchasePrice" name="purchasePrice"/>
									</td>
									<td colspan="8">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Item.Description"/>
									</td>
									<td>
										<textarea rows="5" cols="10"></textarea>
									</td>
									<td colspan="10">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="itemTaxable" name="itemTaxable">
										<bean:message key="BzComposer.Item.TaxableItem"/>
									</td>
									<td colspan="11">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<table border="1" style="width: 100%">
											<tr>
												<td><bean:message key="BzComposer.sales.Item"/></td>
												<td><bean:message key="BzComposer.Item.Description"/></td>
												<td><bean:message key="BzComposer.Customer.Type"/></td>
												<td><bean:message key="BzComposer.Purchase.PurchaseOrder.Cost"/></td>
												<td><bean:message key="Bizcomposer.qty"/></td>
												<td><bean:message key="eSalesInvoiceDetails.Total"/></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</table>
									</td>
									<td>
										<input type="button" id="delete" class="formbutton" name="delete" value="Delete"/>
									</td>
									<td colspan="8">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.BuildPoint"/>
									</td>
									<td>
										<input type="text" id="buildPoint" name="buildPoint"/>
									</td>
									<td>
										<bean:message key="BzComposer.OnHand"/>
									</td>
									<td>
										<input type="text" id="onHand" name="onHand"/>
									</td>
									<td>
										<bean:message key="Bzcomposer.TotalValue"/>
									</td>
									<td>
										<input type="text" id="totalValue" name="totalValue"/>
									</td>
									<td colspan="6">
										&nbsp;
									</td>
								</tr>
							</thead>		
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- inventoryAssemblyTab Ends -->
				
				<!-- inventoryTab starts -->
				<%-- <div id="inventoryTab">
					<table style="width: 100%;" class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="12">
									<bean:message key="BzComposer.Item.InventoryInformation" />
								</th>
							</tr>
						</thead>
						<tr>	
							<td>
								<table style="padding-left: 17px;padding-top: 13px;">
								<td><bean:message key="BzComposer.Item.InventryName" /></td>
									<tr>
										<td>Inventory code</td>
										<td><html:text property="itemCode" /></td>
										<td colspan="10">&nbsp;</td>
									</tr>	
								</table>			
							</td>
							<td colspan="11">&nbsp;</td>
						</tr>
						<tr>
							<td>
								<table style="padding-left: 116px;padding-top: 11px;">				
									<tr>
										<td>
											<input type="checkbox" name="iscategory" id="chk_cat" onclick="hide_other(this.value);"> 
										<td>
											<bean:message key="BzComposer.Item.isCategory" />
										</td>
										<td>
											<bean:message key="BzComposer.Item.Subcategoryof" />
										</td>	
										<td>
											<html:select property="tectcmd" disabled="false" value="0" styleId="drop_cat">
												<html:option value="0">
													<bean:message key="BzComposer.ComboBox.Select" />
												</html:option>
												<html:options collection="fillList" property="value" labelProperty="label"></html:options>
											</html:select>
										</td>
										<td>
											<bean:message key="BzComposer.Item.Barcode" />
										</td>
										<td>
											<html:text property="barcode" onkeydown="return numbersonly(event,this.value)" />
										</td>
										<td>
											<input type="checkbox" name="discontinued"> 
										</td>
										<td>
											<bean:message key="BzComposer.Item.Discontinued" />
										</td>
										<td>
											<div id="labelid">
												<bean:message key="BzComposer.Item.AddPicture" />
											</div>
										</td>
										<td>
											<div id="photoid">
												<html:file property="photoName" />
											</div>
										</td>
										<td colspan="2"></td>
									</tr>
								</table>
							</td>
							<td colspan="11">&nbsp;</td>
						</tr>
						<tr id="hide_all">
							<td colspan="12">
								<table>
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<bean:message key="BzComposer.Item.InventoryTitle" />
													</td>
													<td>
														<input type="text" name="itemName" id="itm_name" size="60" />
													</td>
													<td>
														<input type="checkbox" name="taxable" id="chk_tax">
														<bean:message key="BzComposer.Item.Taxable" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tr>
													<td style="padding-left: 30px;">
														<bean:message key="BzComposer.Item.Description" />
													</td>
													<td>
														<textarea name="invTitle" id="txt_invtitle" cols="100"></textarea>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table align="center" style="padding-left:25px"> 
												<tr>
													<td>
														<bean:message key="BzComposer.Item.SalePrice" />
													</td>
													<td>
														<input type="text" name="salePrice" id="sale_price"
														onkeydown="return numbersonly(event,this.value)" />
													</td>
													<td>
														<bean:message key="BzComposer.Item.PurchasePrice" />
													</td>
													<td>
														<input type="text" name="purchasePrice" id="Pur_price"
														onkeydown="return numbersonly(event,this.value)" />
													</td>
													<td>
														<bean:message key="BzComposer.Item.QtyonHand" />
													</td>
													<td>
														<input type="text" name="qty" id="qty" onkeydown="return numbersonly(event,this.value)" />
													</td>
													<td>
														<bean:message key="BzComposer.Item.Weight" />
													</td>
													<td>
														<input type="text" name="weight" id="weight" onkeydown="return numbersonly(event,this.value)" />
													</td>
												</tr>
												<tr>							
													<td>
														<bean:message key="BzComposer.Item.Location" />
													</td>
													<td>
														<input type="text" name="location" id="loc" />
													</td>
													<td>
														<bean:message key="BzComposer.Item.Serial" />
													</td>
													<td>
														<input type="text" name="serialNum" id="serial" onkeydown="return numbersonly(event,this.value)" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div> --%>
				<!-- inventoryTab ends -->
				
				<!----servicesTab starts -->
				<%-- <div id="servicesTab" style="display:none">
					<table style="width: 100%;" class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="9"> 
									<bean:message key="BzComposer.Item.ServiceInformation" />
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>	
								<td>
									<table style="padding-left: 17px;padding-top: 13px;">
									<td><bean:message key="BzComposer.Item.InventryName" /></td>
										<tr>
											<td>
												<bean:message key="BzComposer.Item.ServiceName" />
											</td>
											<td>
												<html:text property="itemCodeSer" />
											</td>
											<td>
												<bean:message key="BzComposer.Item.Subcategoryof" />
											</td>
											<td>
												<html:select property="tectcmdSer" disabled="disabled">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="fillList" property="value" labelProperty="label"></html:options>
												</html:select>
											</td>
										</tr>	
									</table>			
								</td>
								<td colspan="8">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<table style="padding-left: 116px;padding-top: 11px;">
										<tr>
											<td>
												<input type="checkbox" name="iscat" id="sercat" onclick="hide_service(this.value);"> 
												<bean:message key="BzComposer.Item.isCategory" />
											</td>
										</tr>
									</table>
								</td>
								<td colspan="8">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<table id="hide_ser" style="padding-left: 116px;padding-top: 11px;">
										<tr>
											<td>
												<bean:message key="BzComposer.Item.ServiceTitle" />
											</td>
											<td>
												<html:text property="itemNameSer" />
											</td>
										</tr>
										<tr>
											<td>
												<bean:message key="BzComposer.Item.ServiceDescription" />
											</td>	
											<td>
												<html:textarea property="invTitleSer" />
											</td>
											<td>
												<input type="checkbox" name="taxableSer" id="taxser">
												<bean:message key="BzComposer.Item.Taxable" />
											</td>
										</tr>
										<tr>
											<td>
												<bean:message key="BzComposer.Item.ServiceRate" />
											</td>
											<td>	
												<html:text property="serviceRate" onkeydown="return numbersonly(event,this.value)" />
											</td>
										</tr>
									</table>
								</td>
								<td colspan="8">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div> --%>
				<!-- servicesTab ends -->
		
				<!---subtotalTab starts -->
				<%-- <div id="subtotalTab" style="display:none;">
					<table align="center" valign="Top" style="width: 100%;" class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="9">
									<bean:message key="BzComposer.Item.Subtotal" />
								</th>
							</tr>
						</thead>
						<tr>	
							<td>
								<table style="padding-left: 17px;padding-top: 13px;">
									<td><bean:message key="BzComposer.Item.InventryName" /></td>
									<tr>
										<td>
											<bean:message key="BzComposer.Item.SubtotalName" />
										</td>
										<td>
											<html:text property="itemCodeSub" />
										</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.Item.Description" />
										</td>
										<td>
											<html:text property="itemNameSub" />
										</td>
									</tr>
									<tr>
									</tr>
								</table>
							</td>
							<td colspan="8">&nbsp;</td>
						</tr>
					</table>
				</div> --%>
				<!-- subTotalTab ends -->			
						
				<!-- discountTab starts  -->
				<%-- <div id="discountTab" style="display:none;">
					<table style="width: 100%;" class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="9">
									<bean:message key="BzComposer.Item.Discount" />
								</th>
							</tr>
						</thead>
						<tr>
							<td>
								<table>
									<tr>
										<td>
											<bean:message key="BzComposer.Item.DiscountName" />
										</td>
										<td>
											<html:text property="itemCodeDis" />
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.Item.AmountofDiscount" />
										</td>
										<td>
											<html:text property="discountAmt" onkeydown="return numbersonly(event,this.value)" />
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BzComposer.Item.DiscountTitle" />
										</td>
										<td>
											<html:textarea property="invTitleDis" />
										</td>
									</tr>
								</table>
							</td>
							<td colspan="8">
								&nbsp;
							</td>
						</tr>
					</table>
				</div> --%>
				<!-- discountTab ends -->
			</td>
		</tr>
		<tr align="center">
			<td colspan="3">
				<table>
					<tr>
						<td>	
							<input type="button" name="updatBtn" class="formbutton" onclick="CheckMambership(this.form);" 
							value='<bean:message key="BzComposer.global.add" />'>
						</td>
						<td>	
						    <input type="button" class="formbutton" id="editBtn" name="edit" value="<bean:message key='BzComposer.global.edit'/>">
						</td>
						<td>	
							<input type="button" class="formbutton" id="deleteSupplierBtn" name="deleteSupplierBtn" value="<bean:message key='BzComposer.global.delete'/>">
						</td>
						<td>
							<input type="button" name="updatBtn" class="formbutton" value='<bean:message key="BzComposer.additem.clearbtn" />'
							onclick="ClearMe(this.form);">
						</td>
						<td>
							<input type="button" class="formbutton" name="updatBtn" value='<bean:message key="BzComposer.global.close" />'
							onclick="CloseMe();">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</td>
</tr>
</table>
</div>
</div>
</div>
</div>
</div>
<!-- end Contents -->
</html:form>
</body>
</html>
<script>
function hide_other(val){
	cat = document.getElementById('chk_cat');
	if(cat.checked==true){
		document.getElementById("hide_all").style.visibility="hidden";
		document.getElementById('labelid').style.visibility="hidden";
		document.getElementById('photoid').style.visibility="hidden";
		document.getElementById('drop_cat').disabled=true;    
	}
	else{
		document.getElementById("hide_all").style.visibility="visible";
		document.getElementById('labelid').style.visibility="visible";
		document.getElementById('photoid').style.visibility="visible";
		document.getElementById('drop_cat').disabled=false;    
	}
}
function showCombo(){
	if(chkbox.checked==true){
		document.getElementById("cmdbox").disabled=false;
	}
	else
		document.getElementById("cmdbox").disabled=true;
}
function CheckMambership(form) {
	debugger;
	var membershipLevel = "<%= request.getAttribute("membershipLevel")%>";
	var size = "<%= request.getAttribute("itemSize")%>";
	
	if(membershipLevel == "Standard"){
		if(size>=100){
			debugger;
			return maxnumberofuserdialog();
		}else {
			return  ShowAdd(form);
		}
	}else if(membershipLevel == "Professional"){
		if(size>=500){
			debugger;
			return maxnumberofuserdialog();
		}else {
			return  ShowAdd(form);
		}
	}
	/* else if(membershipLevel == "Enterprise"){
		if(size>=10){
			debugger;
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	} */
}
function maxnumberofuserdialog()
{
	event.preventDefault();
	$("#maxnumberofuserdialog").dialog({
    	resizable: false,
        height: 250,
        width: 800,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function ShowAdd(form){
	val = form.itemType.value;
	if(val=="1"){
		cat = document.getElementById('chk_cat');
		if(cat.checked==false){
			if(form.itemCode.value==""){
			/* alert('<bean:message key="BzComposer.AddItem.InventoryName.Validation" />'); */
				//alert('<bean:message key="BzComposer.additem.inventorynamevalidation" />');
				return showitemcodedialog();
				form.itemCode.focus();
			}
			else if(form.salePrice.value==""){
				/* alert('<bean:message key="BzComposer.AddItem.SalePrice.Validation" />'); */
				//alert('<bean:message key="BzComposer.additem.salepricevalidation" />');
				return showsalepricedialog();
				form.salePrice.focus();
			}
			else if(form.purchasePrice.value==""){
/* alert('<bean:message key="BzComposer.AddItem.PurchasePrice.Validation" />'); */
				//alert('<bean:message key="BzComposer.additem.purchasepricevalidation" />');
				return showpurchasepricedialog();
				form.purchasePrice.focus();
			}
			else if(form.qty.value==""){
/* alert('<bean:message key="BzComposer.AddItem.Quantity.Validation" />'); */
				//alert('<bean:message key="BzComposer.additem.quantityvalidation" />');
				return showqueantitydialog();
				form.qty.focus();
			}
			else if(form.weight.value=="")
			{
/* alert('<bean:message key="BzComposer.AddItem.Weight.Validation" />'); */
				//alert('<bean:message key="BzComposer.additem.weightvalidation" />');
				return showweightdialog();
				form.weight.focus();
			}
			else
			{
				/* var res=window.confirm('<bean:message key="BzComposer.AddItem.Confirmation.Validation" />') */
				/* var res=window.confirm('<bean:message key="BzComposer.additem.insertitemvalidation" />')
				if (res)
				{
					document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
					document.forms[0].submit();
				} */
				event.preventDefault();
				$("#showItemDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "<bean:message key='BzComposer.global.ok'/>": function () {
				            	document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
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
		}
		else if(cat.checked==true){
			if(form.itemCode.value=="")
			{
				/* alert('<bean:message key="BzComposer.AddItem.InventoryName.Validation" />'); */
				//alert('<bean:message key="BzComposer.additem.inventorynamevalidation" />');
				return showitemcodedialog();
				form.itemCode.focus();
			}
			else
			{
				form.salePrice.value="0";
				form.purchasePrice.value="0";
				form.qty.value="0";
				form.weight.value="0";
				/* var res=window.confirm('<bean:message key="BzComposer.AddItem.Confirmation.Validation" />') */
				/* var res=window.confirm('<bean:message key="BzComposer.additem.insertitemvalidation" />')
				if (res)
				{
					document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
					document.forms[0].submit();
				} */
				event.preventDefault();
				$("#showItemDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "<bean:message key='BzComposer.global.ok'/>": function () {
				            	document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
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
		}
	}
	else if(val=="2"){
		//if(form.itemCodeDis.value==""){
			/* alert('<bean:message key="BzComposer.AddItem.Discount.Validation" />'); */
			//alert('<bean:message key="BzComposer.additem.discountvalidation" />');
		//	return showcodediscountdialog();
		//	form.itemCodeDis.focus();
		//}
		//else{
			/* var res=window.confirm('<bean:message key="BzComposer.AddItem.Confirmation.Validation" />') */
			/* var res=window.confirm('<bean:message key="BzComposer.additem.insertitemvalidation" />')
			 if (res){
				form.itemCode.value=form.itemCodeDis.value;
				document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
				document.forms[0].submit();
			} */
			event.preventDefault();
			$("#showItemDialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			        	
			            "<bean:message key='BzComposer.global.ok'/>": function () {
			            	document.forms['AddItemfrm'].action = "Item.do?tabid=AddItem&ItemType="+val;
							document.forms['AddItemfrm'].submit();
							//$('form').submit();
			            },
			            <bean:message key='BzComposer.global.cancel'/>: function () {
			                $(this).dialog("close");
			                return false;
			            }
			        }
			    });
			    return false;
		//}
	}
	else if(val=="3"){
		if(form.itemCodeSub.value==""){
			/* alert('<bean:message key="BzComposer.AddItem.Subtotal.Validation" />'); */
			//alert('<bean:message key="BzComposer.additem.subtotalvalidation" />');
			return showitemcodesubdialog();
			form.itemCodeSub.focus();
		}
		else{
			/* var res=window.confirm('<bean:message key="BzComposer.AddItem.Confirmation.Validation" />') */
			/* var res=window.confirm('<bean:message key="BzComposer.additem.insertitemvalidation" />')
			 if (res){
				form.itemCode.value=form.itemCodeSub.value;
				document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
				document.forms[0].submit();
			} */
			event.preventDefault();
			$("#showItemDialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			            "<bean:message key='BzComposer.global.ok'/>": function () {
			            	document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
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
	}
	else if(val=="4"){
		if(form.itemCodeSer.value==""){
			/* alert('<bean:message key="BzComposer.AddItem.Service.Validation" />'); */
			//alert('<bean:message key="BzComposer.additem.servicenamevalidation" />');
			return showservicenamedialog();
			form.itemCodeSer.focus();
		}
		else{
			/* var res=window.confirm('<bean:message key="BzComposer.AddItem.Confirmation.Validation" />') */
			/* var res=window.confirm('<bean:message key="BzComposer.additem.insertitemvalidation" />')
				if (res){
					form.itemCode.value=form.itemCodeSer.value;
					document.forms[0].action = "Item.do?tabid=AddItem&ItemType="+val;
					document.forms[0].submit();
				} */
				event.preventDefault();
				$("#showItemDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "<bean:message key='BzComposer.global.ok'/>": function () {
				            	document.forms['AddItemfrm'].action = "Item.do?tabid=AddItem&ItemType="+val;
								document.forms['AddItemfrm'].submit();
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
	}
}


function numbersonly(e,val){
		var temp=val.indexOf(".");
		var key=e.charCode? e.charCode : e.keyCode;
		if(window.event){
               	if(window.event.ctrlKey)
                        isCtrl = true;
                else
                    isCtrl = false;
        }
        else{
                if(e.ctrlKey)
                        isCtrl = true;
                else
                        isCtrl = false;
        }
        if(isCtrl){ 
	        if("v" == String.fromCharCode(key).toLowerCase()) {
	        	return false;
            }
            if("x" == String.fromCharCode(key).toLowerCase()) {
                return false;
            }
        }
		else if (key!=8){
			var str =String(val);
			var temp=val.indexOf(".");
			index=0;		
			for(i=0;i<str.length;i++){
				if(str.charAt(i)=='.'){
					index=1;
					break;
				}
			}
			if(key==46 && temp==-1){
				 return true;
			} 
			else if(key==37 || key==39){
				return true; 	
			}
			else if(key==110 && index==0){
				return true;
			}
			else if(key==190 && index==0){
				return true;
			}
			else if(key>=96 && key<=105){
				return true; 	
			}
			else if (key<48||key>57) //if not a number
				return false; //disable key press
		}
	}

function CloseMe(){
	window.close();
}
function ClearMe(form){
	form.tectcmd.value="0";
	form.photoName.value="";
	form.itemCode.value="";
	form.tectcmdSer.value="0";
	form.itemCodeSer.value="";
	form.barcode.value="";
	form.itemCodeSub.value="";
	form.itemCodeDis.value="";
	form.itemNameSub.value="";
	form.invTitleDis.value="";
	form.discountAmt.value="";
	form.itemNameSer.value="";
	form.invTitleSer.value="";
	form.serviceRate.value="";
	
	document.getElementById('itm_name').value="";
	document.getElementById('txt_invtitle').value="";
	document.getElementById('sale_price').value="";
	document.getElementById('Pur_price').value="";
	document.getElementById('qty').value="";
	document.getElementById('weight').value="";
	document.getElementById('loc').value="";
	document.getElementById('serial').value="";
	
	document.getElementById('chk_cat').checked=false;
	document.getElementById('chk_tax').checked=false;
	
	document.getElementById('taxser').checked=false;
	document.getElementById('sercat').checked=false;
	
	hide_other(0);
	hide_service(0);
}		
function call11(value){
	/* if(value==1){
		document.getElementById('inventoryTab').style.display='block';
		document.getElementById('discountTab').style.display='none';
		document.getElementById('subtotalTab').style.display='none';
		document.getElementById('servicesTab').style.display='none';
	}
	else if(value==2){
		debugger
		document.getElementById('inventoryTab').style.display='none';
		debugger
		document.getElementById('discountTab').style.display='block';
		debugger
		document.getElementById('subtotalTab').style.display='none';
		debugger
		document.getElementById('servicesTab').style.display='none';
	}
	else if(value==3){
		debugger
		document.getElementById('inventoryTab').style.display='none';
		debugger
		document.getElementById('discountTab').style.display='none';
		debugger
		document.getElementById('subtotalTab').style.display='block';
		debugger
		document.getElementById('servicesTab').style.display='none';
	}
	else if(value==4)
	{
		document.getElementById('inventoryTab').style.display='none';
		debugger
		document.getElementById('discountTab').style.display='none';
		debugger
		document.getElementById('subtotalTab').style.display='none';
		debugger
		document.getElementById('servicesTab').style.display='block';	
		debugger
	} */
	if(value==1)
	{
		document.getElementById('productTab').style.display='block';
		document.getElementById('serviceTab').style.display='none';
		document.getElementById('recurringServiceTab').style.display='none';
		document.getElementById('giftCertificateTab').style.display='none';
		document.getElementById('inventortAssemblyTab').style.display='none';
	}
	else if(value==2){
		document.getElementById('productTab').style.display='none';
		document.getElementById('serviceTab').style.display='block';
		document.getElementById('recurringServiceTab').style.display='none';
		document.getElementById('giftCertificateTab').style.display='none';
		document.getElementById('inventortAssemblyTab').style.display='none';
	}
	else if(value==3){
		document.getElementById('productTab').style.display='none';
		document.getElementById('serviceTab').style.display='none';
		document.getElementById('recurringServiceTab').style.display='block';
		document.getElementById('giftCertificateTab').style.display='none';
		document.getElementById('inventortAssemblyTab').style.display='none';
	}
	else if(value==4)
	{
		document.getElementById('productTab').style.display='none';
		document.getElementById('serviceTab').style.display='none';
		document.getElementById('recurringServiceTab').style.display='none';
		document.getElementById('giftCertificateTab').style.display='block';
		document.getElementById('inventortAssemblyTab').style.display='none';	
	}
	else if(value==5)
	{
		document.getElementById('productTab').style.display='none';
		document.getElementById('serviceTab').style.display='none';
		document.getElementById('recurringServiceTab').style.display='none';
		document.getElementById('giftCertificateTab').style.display='none';
		document.getElementById('inventortAssemblyTab').style.display='block';
	}
}
function hide_service(val){
	category = document.getElementById('sercat');
	if(category.checked==true){
		document.getElementById("hide_ser").style.visibility="hidden";
	}
	else{
		document.getElementById("hide_ser").style.visibility="visible";
	}
}
function Init(){
	call11(<%= request.getParameter("ItemType")%>);
}
</script>
<!-- Dialog box used in sales order page -->
<div id="showCategoryDialog" style="display:none;">
	<p><bean:message key="Bzcomposer.additem.selectcategoryname"/></p>
</div>
<div id="showCantaddItemDialog" style="display:none;">
	<p>
		<bean:message key="Bzcomposer.additem.notadditem"/>
		<!-- You can't add this item because it is already available -->
	</p>
</div>
<div id="deleteCrossSellProductDialog" style="display:none;">
	<p>
		<bean:message key="Bzcomposer.additem.deleteselecteditem"/>
		<!-- Do you want to delete this item? -->
	</p>
</div>
<div id="showitemcodedialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.inventorynamevalidation"/></p>
</div>
<div id="showsalepricedialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.salepricevalidation" /></p>
</div>
<div id="showpurchasepricedialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.purchasepricevalidation" /></p>
</div>
<div id="showqueantitydialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.quantityvalidation" /></p>
</div>
<div id="showweightdialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.weightvalidation" /></p>
</div>
<div id="showcodediscountdialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.discountvalidation" /></p>
</div>
<div id="showitemcodesubdialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.subtotalvalidation" /></p>
</div>
<div id="showservicenamedialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.servicenamevalidation" /></p>
</div>
<div id="showItemDialog" style="display:none;">
	<p><bean:message key="BzComposer.additem.insertitemvalidation" /></p>
</div>
<!-- Dialog box used in this page -->
<div id="maxnumberofuserdialog" style="display:none;">
	<p><bean:message key="BzComposer.addnewcustomer.maxnumberofitem"/></p>
</div>