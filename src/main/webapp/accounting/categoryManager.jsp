<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.nxsol.bizcomposer.common.TblCategoryType"%>
<%@page import="com.nxsol.bizcomposer.common.TblBudgetCategory"%>
<%@ page isELIgnored="false"%>
<%@page import="java.util.Currency"%>
<%-- <%@page import="jdk.nashorn.internal.runtime.linker.JavaAdapterFactory"%> --%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPayment"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblAccount"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPaymentType"%>
<%@page import="com.nxsol.bizcomposer.global.clientvendor.ClientVendor"%>
<%@page import="com.nxsol.bizcomposer.common.JProjectUtil"%>
<%@page import="java.util.Date"%>
<%@page import="com.nxsol.bizcompser.global.table.TblCategory"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.ReceivableListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<title><bean:message key="BzComposer.categorymanagertitle"/></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!--  Here Is the context path -->
 <script>var ctx = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
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
.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	min-height: 500px;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}
#highlight {
	
 		background-color: blue; 
 
	 }
.highlight { background-color: #00CED1 !important;color: #fff }	 
	
</style>

</head>
<body>
<% ArrayList<TblCategoryType> categoryType = (ArrayList)request.getAttribute("categoryType"); 
   ArrayList<TblBudgetCategory> budgetCategoryList = (ArrayList)request.getAttribute("budgetCategoryList");
%>
<div id="tabs1" class="mb-3 clear custom-fixed-tabs">
	<ul class="tabs">
		<li>
			<a href="#tabs-1">
				<bean:message key="BzComposer.categorymanager.tab.categorylist"/>
			</a>
		</li>
		<li>
			<a href="#tabs-2">
				<bean:message key="BzComposer.categorymanager.tab.editcategory"/>
			</a>
		</li>
	</ul>
	<div class="tab-content"> 
		<div id="tabs-1" class="pl-2 pr-2 pt-3 pb-1">
			<div class="table1 table2" id="devCategoryTable">
				<table class="table table-bordered table-sm devAcCategoryListTable">
					<thead class="thead-light">
						<tr>
							<th><bean:message key="BzComposer.categorymanager.type"/></th>
							<th><bean:message key="BzComposer.categorymanager.name"/></th>
							<th><bean:message key="BzComposer.categorymanager.categorynumber"/></th>
							<th><bean:message key="BzComposer.categorymanager.budgetgroup"/></th>
							<th><bean:message key="BzComposer.categorymanager.description"/></th>
						</tr>
					</thead>
					<tbody>
						<% ArrayList<TblCategory> listOfCategory = (ArrayList)request.getAttribute("listOfCategory");
						int index = 1;
						for(int i=0;i<listOfCategory.size();i++)
						{	   
						%>
						<tr onclick="selectrow(<%=listOfCategory.get(i).getId()%>,<%= index%>)">
							<td hidden="categoryId">
								<% out.println(listOfCategory.get(i).getId()); %>
							</td>
							<td value="<%= listOfCategory.get(i).getCategoryTypeName()%>">
								<% out.println(listOfCategory.get(i).getCategoryTypeName()); %>
							</td>
							<% if(listOfCategory.get(i).getParent().equals("root")) {%>
							<td class="font-weight-bold">
								<% out.println(listOfCategory.get(i).getName()); %>
							</td>
							<% } else { %>
							<td>
								<% out.println("  ^ "+ listOfCategory.get(i).getName()); %>
							</td>
							<% } %>
							<td>
								<% out.println(listOfCategory.get(i).getCategoryNumber()); %>
							</td>
							<% if(listOfCategory.get(i).getBudgetCategoryName() != null && listOfCategory.get(i).getBudgetCategoryName() != "") {%>
							<td>
								<% out.println(listOfCategory.get(i).getBudgetCategoryName()); %>
							</td>
							<% } else { %>
							<td></td>
							<% } %>
							<td>
								<% out.println(listOfCategory.get(i).getDescription()); %>
							</td>
							<td hidden="budgetCatId" value="<%= listOfCategory.get(i).getBudgetCategoryID()%>">
								<% out.println(listOfCategory.get(i).getBudgetCategoryID()); %>
							</td>
							<td hidden="parentId" value="<%= listOfCategory.get(i).getParent()%>">
								<% out.println(listOfCategory.get(i).getParent()); %>
							</td>
						</tr>
						<% index++; } %>	
					</tbody>
				</table>
			</div>
			<div class="text-center ">
				<div class="btngroup2-fixed">
					<button class="btn btn-success" id="AddNewCategory">
						<bean:message key="BzComposer.global.add"/>
					</button>
					<button class="btn btn-success" id="EditCategory">
						<bean:message key="BzComposer.global.edit"/>
					</button>
					<button class="btn btn-success" onclick="return deleteCategory()">
						<bean:message key="BzComposer.global.delete"/>
					</button>
				</div>
			</div>
		</div>
		<div id="tabs-2" class="pl-2 pr-2 pt-3 pb-1">
			<div class="form1">
				<div class="form-inline">
					<div class="form-group">
						<label>
							<bean:message key="BzComposer.categorymanager.type"/>
							&nbsp;
						</label>
						<select class="form-control CategoryTypeForUpdate" id="CategoryTypeForUpdate">
							<% 
						   	for(int i=0;i<categoryType.size();i++)
						   	{	   
							%>
							<option value="<%=categoryType.get(i).getCategoryTypeName() %>" label="<%= categoryType.get(i).getCategoryTypeID()%>">
								<% out.println(categoryType.get(i).getCategoryTypeName()); %>
							</option>
							<% }%>
						</select>
					</div>
				</div>
				<h6>
					<bean:message key="BzComposer.categorymanager.accountinformation"/>
				</h6>
				<div class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-2 col-form-label">
							<bean:message key="BzComposer.categorymanager.name"/>
						</label>
						<div class="col-md-4">
							<input type="text" id="CategoryNameForUpdate">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-2 col-form-label"></label>
						<div class="col-md-4 form-inline">
							<div class="form-check form-check-inline">
						  		<input class="form-check-input" type="checkbox" id="subAccountOfCheckForUpdate">
						  		<label class="form-check-label" for="inlineCheckbox1">
						  			<bean:message key="BzComposer.categorymanager.subaccountof"/>
						  		</label>
							</div>
							<select class="form-control SubAccountOfCategoryForUpdate" id="SubAccountOfCategoryForUpdate">
								<% for(int i=0;i<listOfCategory.size();i++)
								{
									if(listOfCategory.get(i).getParent().equals("root"))
									{	
								%>
								<option class="font-weight-bold" value="<%=listOfCategory.get(i).getCategoryTypeName() %>" label="<%=listOfCategory.get(i).getId() %>" id="<%=listOfCategory.get(i).getParent()%>">
									<% out.println(listOfCategory.get(i).getName()); %>
								</option>
								<% } else {%>
								<option value="<%=listOfCategory.get(i).getCategoryTypeName() %>" label="<%=listOfCategory.get(i).getId() %>" id="<%=listOfCategory.get(i).getParent()%>">
									<% out.println(" " + listOfCategory.get(i).getName()); %>
								</option>
								<% } }%> 
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-2 col-form-label">
							<bean:message key="BzComposer.categorymanager.accountnumber"/>
						</label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="AccountNumberForUpdate">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-2 col-form-label">
							<bean:message key="BzComposer.categorymanager.description"/>
						</label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="DescriptionForUpdate">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-2 col-form-label">
							<bean:message key="BzComposer.categorymanager.budgetcategory"/>
						</label>
						<div class="col-md-4">
							<select class="form-control" id="BudgetCategoryForUpdate">
								<% 
									for(int i=0;i<budgetCategoryList.size();i++)
							   		{	   
						     	%>
						    	<option value="<%= budgetCategoryList.get(i).getBudgetCategoryID()%>">
						    		<% out.println(budgetCategoryList.get(i).getBudgetCategoryName());%>
					    		</option>
						    	<% }%>
							</select>
						</div>
					</div>
				</div>
				<div class="text-center row pb-2">
					<div class="col-md-6">
						<button class="btn btn-success" onclick="newForm()">
							<bean:message key="BzComposer.global.new"/>
						</button>
						<button class="btn btn-success" onclick="return updateCategory()" id="updateCategory">
							<bean:message key="BzComposer.global.update"/>
						</button>
						<button class="btn btn-success" onclick="return deleteCategory()" id="deleteCategory">
							<bean:message key="BzComposer.global.delete"/>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="btngroup2"></div>
<div id="AddNewCategoryDlgId">
	<div class="form1">
		<div class="form-inline">
			<div class="form-group" id="addNewCategoryCatTypeDivId">
				<label>
					<bean:message key="BzComposer.categorymanager.type"/>
					&nbsp;
				</label>
				<select class="form-control" id="categoryTypeForAdd">
					<% 
						for(int i=0;i<categoryType.size();i++)
						{	   
					%>
					<option value="<%=categoryType.get(i).getCategoryTypeName() %>" label="<%= categoryType.get(i).getCategoryTypeID()%>">
						<% out.println(categoryType.get(i).getCategoryTypeName()); %>
					</option>
					<% }%>
				</select>
			</div>
		</div>
		<h6>
			<bean:message key="BzComposer.categorymanager.accountinformation"/>
		</h6>
		<div class="form-horizontal">
			<div class="form-group row">
				<label class="col-md-2 col-form-label">
					<bean:message key="BzComposer.categorymanager.name"/>
				</label>
				<div class="col-md-4">
					<input type="text" id="CategoryNameForAdd"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label"></label>
				<div class="col-md-4 form-inline" id="subCategoryList">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="subAccountOfCheckBox">
						<label class="form-check-label" for="inlineCheckbox1">
							<bean:message key="BzComposer.categorymanager.subaccountof"/>
						</label>
					</div>
					<select class="form-control" id="addCategoryCombo">
						<% for(int i=0;i<listOfCategory.size();i++)
						{
							if(listOfCategory.get(i).getParent().equals("root"))
							{	
						%>
						<option class="font-weight-bold" value="<%=listOfCategory.get(i).getCategoryTypeName() %>" label="<%=listOfCategory.get(i).getId() %>" id="<%=listOfCategory.get(i).getParent()%>">
							<% out.println(listOfCategory.get(i).getName()); %>
						</option>
						<% } else {%>
						<option value="<%=listOfCategory.get(i).getCategoryTypeName() %>" label="<%=listOfCategory.get(i).getId() %>" id="<%=listOfCategory.get(i).getParent()%>">
							<% out.println(" " + listOfCategory.get(i).getName()); %>
						</option>
						<% } }%> 
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">
					<bean:message key="BzComposer.categorymanager.accountnumber"/>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="accountNumberForAdd">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">
					<bean:message key="BzComposer.categorymanager.description"/>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="descriptionForAdd">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">
					<bean:message key="BzComposer.categorymanager.budgetcategory"/>
				</label>
				<div class="col-md-4">
					<select class="form-control" id="budgetCategoryId">
						<% 
							for(int i=0;i<budgetCategoryList.size();i++)
							{	   
						%>
						<option value="<%= budgetCategoryList.get(i).getBudgetCategoryID()%>">
							<% out.println(budgetCategoryList.get(i).getBudgetCategoryName());%>
						</option>
						<% }%>
					</select>
				</div>
			</div>
		</div>
		<div class="text-center row pb-2">
			<div class="col-md-6">
				<button class="btn btn-success" onclick="return saveNewCategory()" id="saveNewcategory">
					<bean:message key="BzComposer.global.save"/>
				</button>
				<button class="btn btn-success">
					<bean:message key="BzComposer.global.close"/>
				</button>
			</div>
		</div>
	</div>
</div>
<script>
var categoryId = -1;
var index = -1;
var categoryName = "";
function selectrow(catId,inv)
{
	debugger;
	this.categoryId = catId;
	this.index = inv;
	$('select.CategoryTypeForUpdate').val($('table.devAcCategoryListTable tbody tr:nth-child('+index+')').find('td:nth-child(2)').attr('value'));
	var parent = $('table.devAcCategoryListTable tbody tr:nth-child('+index+')').find('td:nth-child(8)').attr('value');
	if(parent == 'root')
	{
		$("#subAccountOfCheckForUpdate").prop("checked",false);
		$("#SubAccountOfCategoryForUpdate").prop('disabled',true);
	}
	else
	{
		$("#subAccountOfCheckForUpdate").prop("checked",true);
		$("#SubAccountOfCategoryForUpdate").prop('disabled',false);
		/* $("#SubAccountOfCategoryForUpdate").text(parent); */
		/* var combo = document.getElementById("SubAccountOfCategoryForUpdate")
		combo.options[combo.selectedIndex].label = parent; */
	}
	categoryName = $('table.devAcCategoryListTable tbody tr:nth-child('+index+')').find('td:nth-child(3)').text();
	if(categoryName.startsWith(" "))
	{
		categoryName = categoryName.substr(4);
	}
	$("#CategoryNameForUpdate").val(categoryName);
	$("select#BudgetCategoryForUpdate").val($('table.devAcCategoryListTable tbody tr:nth-child('+index+')').find('td:nth-child(7)').attr('value'));
	$("#AccountNumberForUpdate").val($('table.devAcCategoryListTable tbody tr:nth-child('+index+')').find('td:nth-child(4)').text());
	$("#DescriptionForUpdate").val($('table.devAcCategoryListTable tbody tr:nth-child('+index+')').find('td:nth-child(6)').text());
	var d;
}
  $(function() {
    debugger;
	  $( "#tabs1" ).tabs();
  } );
  $(document).ready(function () {
	    $('tr').click(function () {
	         var selected = $(this).hasClass("highlight"); 
	         $("tr").removeClass("highlight");
	         if(!selected)
	             $(this).addClass("highlight");
	    });
	}); 
  $(document).ready(function(){
		debugger;
	   $("#AddNewCategoryDlgId").hide();
	   $("#addCategoryCombo").prop('disabled',true);
	  
});
  $(function() { 
		 $( "#AddNewCategory").on("click", function(){
			/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
			 debugger;	
			 $("#addCategoryCombo").val(""); 
			 $("#addCategoryCombo").children('option').hide();
			   $( "#AddNewCategoryDlgId").dialog({
		    	   modal: true,
		    	   title: 'Add Category'
		        });
		    });		    
		   $(document.forms[0]).submit(function(event) {
			    event.preventDefault();
			});
		 });
 function deleteCategory()
 {
			/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
			 debugger;	
			 $.ajax({
					
					type : "POST",
				 	url : "CategoryManage.do?tabid=CheckChildCategory", 
					data :"CategoryId=" + categoryId,
				    success : function(data) {
						
						debugger;
						if(data != "")
						{
							 $.ajax({
								
								 type : "POST",
								 	url : "CategoryManage.do?tabid=CheckIsCategoryID", 
									data :"CategoryId=" + categoryId,
								    success : function(data) {
								    	if(data == "")
								    	{
								    		debugger;
								    		//alert("<bean:message key='BzComposer.categorymanager.categoryusedforotherinvoice'/>");
								    		return otherinvoicedialog();
								    		//alert("The_category is being_used on other invoice");
								    		/* var status = window.confirm("<bean:message key='BzComposer.categorymanager.wanttodelete'/>");
								    		if(status == true)
								    		{
								    			 $.ajax({
								    				 type : "POST",
								 				 	url : "CategoryManage.do?tabid=DeleteCategory", 
								 					data :"CategoryId=" + categoryId,
								 				    success : function(data) {
								 				    	debugger;
								 				    	updateCategoryManager(data);
								 				    }
								    				 
								    			 });
								    		}
								    		else
								    		{
								    			return false;
								    		} */
								    		debugger;
											event.preventDefault();
											$("#deletedialogbox").dialog({
											    	resizable: false,
											        height: 200,
											        width: 500,
											        modal: true,
											        buttons: {
											        	"<bean:message key='BzComposer.global.ok'/>": function () {
											        		$.ajax({
											    				 type : "POST",
											 				 	url : "CategoryManage.do?tabid=DeleteCategory", 
											 					data :"CategoryId=" + categoryId,
											 				    success : function(data) {
											 				    	debugger;
											 				    	updateCategoryManager(data);
											 				    }
											    				 
											    			 });
											            },
											            "<bean:message key='BzComposer.global.cancel'/>": function () {
											                $(this).dialog("close");
											                return false;
											            }
											        }
											    });
								    	}
								    	else
								    	{
								    		debugger;
								    		/* var status = window.confirm("<bean:message key='BzComposer.categorymanager.wanttodelete'/>");
								    		if(status == true)
								    		{
								    			 $.ajax({
								    				 type : "POST",
								 				 	url : "CategoryManage.do?tabid=DeleteCategory", 
								 					data :"CategoryId=" + categoryId,
								 				    success : function(data) {
								 				    	
								 				    	updateCategoryManager(data);
								 				    }
								    				 
								    			 });
								    		}
								    		else
								    		{
								    			return false;
								    		} */
								    		debugger;
											event.preventDefault();
											$("#deletedialogbox").dialog({
											    	resizable: false,
											        height: 200,
											        width: 500,
											        modal: true,
											        buttons: {
											        	"<bean:message key='BzComposer.global.ok'/>": function () {
											        		$.ajax({
											    				 type : "POST",
											 				 	url : "CategoryManage.do?tabid=DeleteCategory", 
											 					data :"CategoryId=" + categoryId,
											 				    success : function(data) {
											 				    	debugger;
											 				    	updateCategoryManager(data);
											 				    }
											    				 
											    			 });
											            },
											            "<bean:message key='BzComposer.global.cancel'/>": function () {
											                $(this).dialog("close");
											                return false;
											            }
											        }
											    });
								    	}
								    	
								    },
							 });
						}
						else{
							//alert("<bean:message key='BzComposer.categorymanager.itemcantdelete'/>");
							return itemcantdeletedialog();
							return false;
						}
					},
					 error : function(data) {
						//alert("<bean:message key='BzComposer.categorymanager.erroroccurred'/>");
						return showerrordialog()
					} 
				});
			
		   $(document.forms[0]).submit(function(event) {
			    event.preventDefault();
			});
 } 
  
  $(function() { 
		 $( "#subAccountOfCheckBox").on("click", function(){
		if($("#subAccountOfCheckBox").prop("checked"))
		{
			 $("#addCategoryCombo").prop('disabled',false);
		}
		else
		{
			$("#addCategoryCombo").prop('disabled',true);
		}	 
	});	
});	 
  $(function() { 
		 $( "#subAccountOfCheckForUpdate").on("click", function(){
		if($("#subAccountOfCheckForUpdate").prop("checked"))
		{
			 $("#SubAccountOfCategoryForUpdate").prop('disabled',false);
		}
		else
		{
			$("#SubAccountOfCategoryForUpdate").prop('disabled',true);
		}	 
	});	
});	 
  $("#categoryTypeForAdd").change(function () {
	  debugger; 
	    $("#addCategoryCombo").children('option').hide();
	    $("#addCategoryCombo").children("option[value^=" + $(this).val() + "]").show();
	    $("#addCategoryCombo").val($(this).val());
}); 
  $("#CategoryTypeForUpdate").change(function () {
	  debugger; 
	    $("#SubAccountOfCategoryForUpdate").children('option').hide();
	    $("#SubAccountOfCategoryForUpdate").children("option[value^=" + $(this).val() + "]").show();
	    $("#SubAccountOfCategoryForUpdate").val($(this).val());
}); 
  function saveNewCategory()
  {
	 debugger;
	 var categoryTypeCombo = document.getElementById("categoryTypeForAdd");
	 var categoryTypeId = categoryTypeCombo.options[categoryTypeCombo.selectedIndex].label;
	 
	 var categoryName = $("#CategoryNameForAdd").val();
	 var subAccountOf = $("#subAccountOfCheckBox").prop("checked");
	 var categoryCombo = document.getElementById("addCategoryCombo");
	 var categoryId = categoryCombo.options[categoryCombo.selectedIndex].label;
	 var parent = categoryCombo.options[categoryCombo.selectedIndex].id;
	 var accountNumber = $("#accountNumberForAdd").val();
	 var description = $("#descriptionForAdd").val();
	 var budgetCategoryCombo = document.getElementById("budgetCategoryId");
	 var budgetCategoryId = budgetCategoryCombo.options[budgetCategoryCombo.selectedIndex].value; 
	  
	 TblCategory = {
			 
			 "categoryTypeID":categoryTypeId,
			 "name":categoryName,
			 "subAccountOf":subAccountOf,
			 "id":categoryId,
			 "accountNumber":accountNumber,
			 "description":description,
			 "budgetCategoryID":budgetCategoryId,
			 "parent":parent
	 };
	 
	 
	 var obj = JSON.stringify(TblCategory);
	 $('#AddNewCategoryDlgId').dialog('close');
	  debugger;
	  $.ajax({
			
			type : "POST",
		 	url : "CategoryManage.do?tabid=AddNewCategory", 
			data :"data=" + obj,
		    success : function(data) {
				
				debugger;
				if(data != "")
				{
					updateCategoryManager(data);
				}
				else{
					//alert("<bean:message key='BzComposer.categorymanager.categorynameexist'/>");
					return categorynameexistdialog();
					categoryManageWithoutUpdate();
				}
			},
			 error : function(data) {
				//alert("<bean:message key='BzComposer.categorymanager.erroroccurred'/>");
				return showerrordialog();
			} 
		});
		$(document.forms[0]).submit(function( event ) {
		    event.preventDefault();
		});
  }
  function saveNewcategoryFromEdit()
  {
	  	 debugger;
		 var categoryTypeCombo = document.getElementById("CategoryTypeForUpdate");
		 var categoryTypeId = categoryTypeCombo.options[categoryTypeCombo.selectedIndex].label;
		 
		 var categoryName = $("#CategoryNameForUpdate").val();
		 var subAccountOf = $("#subAccountOfCheckForUpdate").prop("checked");
		 var categoryCombo = document.getElementById("SubAccountOfCategoryForUpdate");
		 var categoryID = categoryCombo.options[categoryCombo.selectedIndex].label;
		 var parent = categoryCombo.options[categoryCombo.selectedIndex].id;
		 var accountNumber = $("#AccountNumberForUpdate").val();
		 var description = $("#DescriptionForUpdate").val();
		 var budgetCategoryCombo = document.getElementById("BudgetCategoryForUpdate");
		 var budgetCategoryId = budgetCategoryCombo.options[budgetCategoryCombo.selectedIndex].value; 
		  
		 TblCategory = {
				 
				 "categoryTypeID":categoryTypeId,
				 "name":categoryName,
				 "subAccountOf":subAccountOf,
				 "id":categoryID,
				 "accountNumber":accountNumber,
				 "description":description,
				 "budgetCategoryID":budgetCategoryId,
				 "parent":parent
		 };
	
		 var obj = JSON.stringify(TblCategory);
		  debugger;
		  $.ajax({
				
				type : "POST",
			 	url : "CategoryManage.do?tabid=AddNewCategory", 
				data :"data=" + obj,
			    success : function(data) {
					
					debugger;
					if(data != "")
					{
						updateCategoryManager(data);
					}
					else{
						//alert("<bean:message key='BzComposer.categorymanager.categorynameexist'/>");
						return categorynameexistdialog();
						categoryManageWithoutUpdate();
					}
				},
				 error : function(data) {
					//alert("<bean:message key='BzComposer.categorymanager.erroroccurred'/>");
					 return showerrordialog();
				} 
			});
			$(document.forms[0]).submit(function( event ) {
			    event.preventDefault();
			});
  }
  
  function updateCategory()
  {
		 debugger; 
	  	 var categoryTypeCombo = document.getElementById("CategoryTypeForUpdate");
		 var categoryTypeId = categoryTypeCombo.options[categoryTypeCombo.selectedIndex].label;
		 
		 var categoryName = $("#CategoryNameForUpdate").val();
		 var subAccountOf = $("#subAccountOfCheckForUpdate").prop("checked");
		 var categoryCombo = document.getElementById("SubAccountOfCategoryForUpdate");
		 var categoryID = categoryCombo.options[categoryCombo.selectedIndex].label;
		 var parent = categoryCombo.options[categoryCombo.selectedIndex].id;
		 var accountNumber = $("#AccountNumberForUpdate").val();
		 var description = $("#DescriptionForUpdate").val();
		 var budgetCategoryCombo = document.getElementById("BudgetCategoryForUpdate");
		 var budgetCategoryId = budgetCategoryCombo.options[budgetCategoryCombo.selectedIndex].value;
		 var categoryIdForUpdate = parseInt(this.categoryId);
		 TblCategory = {
				 
				 "categoryTypeID":categoryTypeId,
				 "name":categoryName,
				 "subAccountOf":subAccountOf,
				 "id":categoryID,
				 "accountNumber":accountNumber,
				 "description":description,
				 "budgetCategoryID":budgetCategoryId,
				 "parent":parent
		 };
		 var obj = JSON.stringify(TblCategory);
		 $.ajax({
				
				type : "POST",
			 	url : "CategoryManage.do?tabid=UpdateCategory", 
				data :"data=" + obj + "&CategoryId=" + categoryIdForUpdate ,
			    success : function(data) {
					
					debugger;
					$("#updateCategory").replaceWith('<button class="btn btn-success" onclick="return saveNewcategoryFromEdit()" id="saveNewcategory"><bean:message key="BzComposer.global.save"/></button>')
					updateCategoryManager(data);
					categoryId = -1;
				},
				 error : function(data) {
					//alert("<bean:message key='BzComposer.categorymanager.erroroccurred'/>");
					return showerrordialog();
				} 
			});
			$(document.forms[0]).submit(function( event ) {
			    event.preventDefault();
			});
  }
  $(function() { 
		 $( "#EditCategory").on("click", function(){
			/*   $("#dateForAddAccount").val(dName+" "+((new Date().getMonth())+1)+"-"+new Date().getDate()+"-"+new Date().getFullYear()); */
			 debugger;	
			 /* e.preventDefault(); */
			 $("#saveNewcategory").replaceWith('<button class="btn btn-success" onclick="return updateCategory()" id="updateCategory"><bean:message key="BzComposer.global.update"/></button>')
			if(categoryId == -1)
			{
				//alert("<bean:message key='BzComposer.categorymanager.selectcategory'/>");
				return selectcategorydialog();
				return false;
			}
			else
			{	
			 $(function() {

				  var activate = false,
				      tabLinks = $('.tabs a');
				      tabContent = $('.tab-content').children();

				  tabLinks.eq(0).addClass('active'); // Add active class, could possibly go in markup
				  $('#tabs-2').hide(); // Hide second tab
				  
				  tabLinks.bind('click', function(e) {
				    e.preventDefault();
				    if(activate === true) { // Only do something if button has been clicked
				      var target = this.hash,
				          el = $(this);

				      tabLinks.filter('.active').removeClass('active');
				      el.addClass('active');

				      tabContent.hide(); // Hide all
				      $(target).show(); // Show selected
				    }
				  });
				    activate = true; // Activate tab functionality
				    tabLinks.eq(1).trigger('click'); // Trigger a click on the second tab link
				 
				});
			} 
		    });		    
		   $(document.forms[0]).submit(function(event) {
			    event.preventDefault();
			});
		 });
  function addCss()
  {
	  $(document).ready(function () {
		    $('tr').click(function () {
		         var selected = $(this).hasClass("highlight"); 
		         $("tr").removeClass("highlight");
		         if(!selected)
		             $(this).addClass("highlight");
		    });
		}); 
	  $("#addCategoryCombo").val(""); 
	  $("#addCategoryCombo").children('option').hide();
  }
  function updateCategoryManager(data)
  {
	  debugger;
	  $(document).find('div#devCategoryTable table').replaceWith($(data).find('div#devCategoryTable').html());
	  $(document).find('div#subCategoryList select').replaceWith("<select class='form-control' id='addCategoryCombo'>"+$(data).find('div#subCategoryList select').html() + "</select>");
	  $('#AddNewCategoryDlgId').find('input:text').val('');
	  $('#tabs-2').find('input:text').val('');
	  $("#subAccountOfCheckBox").prop("checked",false);
	  $("#subAccountOfCheckForUpdate").prop("checked",false);
	  $("#addCategoryCombo").prop('disabled',true);
	  $("#SubAccountOfCategoryForUpdate").prop('disabled',true);
      $("#categoryTypeForAdd").val($("#categoryTypeForAdd option:first").val());
      $("#CategoryTypeForUpdate").val($("#categoryTypeForAdd option:first").val());
      $("#budgetCategoryId").val($("#budgetCategoryId option:first").val());
      $("#BudgetCategoryForUpdate").val($("#budgetCategoryId option:first").val());
	  addCss();
  }
  function categoryManageWithoutUpdate()
  {
	  $('#AddNewCategoryDlgId').find('input:text').val('');
	  $("#subAccountOfCheckBox").prop("checked",false);
	  $("#addCategoryCombo").prop('disabled',true);
      $("#categoryTypeForAdd").val($("#categoryTypeForAdd option:first").val());
      $("#budgetCategoryId").val($("#budgetCategoryId option:first").val());
      addCss();
  }
  function newForm()
  {
	  debugger;
	  $("#CategoryTypeForUpdate").val($("#categoryTypeForAdd option:first").val());
	  document.getElementById("CategoryNameForUpdate").value = '';
	  document.getElementById("DescriptionForUpdate").value = '';
	  document.getElementById("CategoryNameForUpdate").value = '';
	  document.getElementById("AccountNumberForUpdate").value = '';
	  $("#subAccountOfCheckForUpdate").prop("checked",false);
	  $("#SubAccountOfCategoryForUpdate").prop('disabled',true);
	  $("#BudgetCategoryForUpdate").val($("#BudgetCategoryForUpdate option:first").val()); 
	  $("#SubAccountOfCategoryForUpdate").val(""); 
	  $("#SubAccountOfCategoryForUpdate").children('option').hide();
	  $("#updateCategory").replaceWith('<button class="btn btn-success" onclick="return saveNewcategoryFromEdit()" id="saveNewcategory"><bean:message key="BzComposer.global.save"/></button>');
	  $("#deleteCategory").replaceWith('<button class="btn btn-success"><bean:message key="BzComposer.global.cancel"/></button>');
  }
  function selectcategorydialog()
  {
	  event.preventDefault();
		$("#selectcategorydialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	    return false;
  }
  function showerrordialog()
  {
	  event.preventDefault();
		$("#showerrordialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	    return false;
  }
  function itemcantdeletedialog()
  {
	  event.preventDefault();
		$("#itemcantdeletedialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	    return false;
  }
  
  function categorynameexistdialog()
  {
	  event.preventDefault();
		$("#categorynameexistdialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "<bean:message key='BzComposer.global.ok'/>": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	    return false;
  }
  function otherinvoicedialog()
  {
	  event.preventDefault();
		$("#otherinvoicedialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
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
</body>
<!-- Dialog box used in this page -->
<div id="selectcategorydialog" style="display:none;">
	<p><bean:message key='BzComposer.categorymanager.selectcategory'/></p>
</div>
<div id="showerrordialog" style="display:none;">
	<p><bean:message key='BzComposer.reconciliation.someerroroccurred'/></p>
</div>
<div id="itemcantdeletedialog" style="display:none;">
	<p><bean:message key='BzComposer.categorymanager.itemcantdelete'/></p>
</div>
<div id="categorynameexistdialog" style="display:none;">
	<p><bean:message key='BzComposer.categorymanager.categorynameexist'/></p>
</div>
<div id="deletedialogbox" style="display:none;">
	<p><bean:message key='BzComposer.categorymanager.wanttodelete'/></p>
</div>
<div id="otherinvoicedialog" style="display:none;">
	<p><bean:message key='BzComposer.categorymanager.categoryusedforotherinvoice'/></p>
</div>