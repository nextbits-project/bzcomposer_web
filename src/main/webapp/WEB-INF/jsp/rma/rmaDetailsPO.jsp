<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<script>
	window.onload = initShowHideDivs;
</script>
<script type="text/javascript">
	function cancelRMADialog() {

		$("#cancelRMADialog").dialog({
			resizable : false,
			height : 200,
			width : 500,
			modal : true,
			buttons : {
				"Ok" : function() {
					$(this).dialog("close");

					RID = document.getElementById("RMAID").value;
					document.forms[0].action = "RMA?tabid=R0R0M0&RMAno=" + RID;
					document.forms[0].submit();
				},
				Cancel : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function showRMAQuantityDialog() {

		$("#showRMAQuantityDialog").dialog({
			resizable : false,
			height : 200,
			width : 550,
			modal : true,
			buttons : {
				"Ok" : function() {
					$(this).dialog("close");

				},
				Cancel : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function RMADetailsDialog() {

		$("#RMADetailsDialog").dialog({
			resizable : false,
			height : 200,
			width : 550,
			modal : true,
			buttons : {
				"Ok" : function() {
					$(this).dialog("close");

				},
				Cancel : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function RMAQuantityDialog() {

		$("#RMAQuantityDialog").dialog({
			resizable : false,
			height : 200,
			width : 550,
			modal : true,
			buttons : {
				"Ok" : function() {
					$(this).dialog("close");

				},
				Cancel : function() {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}
</script>
<title><spring:message
		code="BzComposer.RMA.RMADetails.RMADetailsTitle" /></title>
</head>
<body onload="init();">
	<!-- begin shared/header -->
	<form:form action="RMA?tabid=R0S0C0" method="post"
		modelAttribute="RMADetails">
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<!-- begin Contents -->
							<span id="waitMessage"></span>

							<div id="table-negotiations">
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-12">
											<div class="heading"><spring:message code="BzComposer.rma.rmaDetails" /></div>
										</div>
										<div class="col-md-6">
											<table class="tabla-listados rmaInvoice rmaTable">
												<thead>
													<tr>
														<th class="emblem" colspan="4"><spring:message
																code="BzComposer.rma.POInfo" /></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><spring:message code="BzComposer.RMA.PO" /></td>
														<td>: <spring:bind path="order">
																<c:out value="${status.value}" />
															</spring:bind></td>
														<td><spring:message code="BzComposer.RMA.CompanyName" /></td>
														<td>: <spring:bind path="companyName">
																<c:out value="${status.value}" />
															</spring:bind></td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.RMA.name" /></td>
														<td>: <spring:bind path="fname">
																<c:out value="${status.value}" />
															</spring:bind>
															<spring:bind path="lname">
																<c:out value="${status.value}" />
															</spring:bind>
															</td>
														<td><spring:message code="BzComposer.RMA.poTotal" /></td>
														<td>: <spring:bind path="total">
																<fmt:formatNumber value="${status.value}" type="number" minFractionDigits="2" maxFractionDigits="2" />
															</spring:bind></td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.RMA.orderDate" /></td>
														<td>: <spring:bind path="orderDate">
																<c:out value="${status.value}" />
															</spring:bind></td>
														<td><spring:message code="BzComposer.RMA.email" /></td>
														<td>: <spring:bind path="email">
																<c:out value="${status.value}" />
															</spring:bind></td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.RMA.phone" /></td>
														<td>: <spring:bind path="phone">
																<c:out value="${status.value}" />
															</spring:bind></td>
														<td><spring:message code="BzComposer.RMA.mobile" /></td>
														<td>: <spring:bind path="mobile">
																<c:out value="${status.value}" />
															</spring:bind></td>
													</tr>
												</tbody>
											</table>
											<table class="tabla-listados rmaTable rmaItemTable">
												<thead>
													<tr>
														<th class="emblem" colspan="5"><spring:message
																code="BzComposer.rma.POItem" /></th>
													</tr>
													<tr>
														<th><spring:message code="BzComposer.RMA.ItemCode" /></th>
														<th><spring:message
																code="BzComposer.RMA.ItemDescription" /></th>
														<th><spring:message
																code="BzComposer.RMA.RmaDetail.Qty" /></th>
														<th><spring:message code="BzComposer.RMA.UnitPrice" /></th>
														<th><spring:message code="BzComposer.RMA.UnitWeight" /></th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${not empty ItemDetails}">
														<input type="hidden" name="RMADID" id="lSize"
															value='${ItemDetails.size()}'>
														<c:forEach items="${ItemDetails}" var="objList"
															varStatus="loop">
															<tr id='${loop.index}$'
																onclick="setItemId('${objList.cartID}','${loop.index}$');">
																<td align="center" nowrap="nowrap">${objList.itemCode}</td>
																<td>${objList.itemDesc}&nbsp;&nbsp;${objList.lname}</td>
																<td>${objList.qty}</td>
																<td>${objList.unitPrice}</td>
																<td>${objList.unitWeight}</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
										</div>
										<div id="rmaDetailsSection" class="col-md-6">
											<table class="tabla-listados rmaTable">
												<thead>
													<tr>
														<th class="emblem" colspan="6"><spring:message
																code="BzComposer.rma.RMAInfo" /></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td nowrap="nowrap"><spring:message
																code="BzComposer.RMA.rma" /></td>
														<td>: <spring:bind path="rma">
																<c:out value="${status.value}" />
															</spring:bind></td>
														<td><spring:message code="BzComposer.RMA.Status" /></td>
														<td>: <spring:bind path="status">
																<c:out value="${status.value}" />
															</spring:bind></td>
													</tr>
													<tr>
														<td><spring:message
																code="BzComposer.RMA.ReasonCategory" /></td>
														<td nowrap="nowrap">: <select name="rmaMasterReason"
															id="rmaMasterReason"
															onchange="loadChildReasons(this.value)">
																<option value="0">Please Select</option>
																<c:forEach items="${masterRmaReasonsList}"
																	var="masterReason">
																	<option value="${masterReason.reasonId}" 
																	<c:if test="${RMADetails.parentReasonID == masterReason.reasonId}">
														                selected="selected"
														            </c:if>
														            >${masterReason.rmaReason}</option>
																</c:forEach>
														</select>
														</td>
														<td><spring:message code="BzComposer.RMA.Reason" /></td>
														<td nowrap="nowrap">: <select name="rmaReason"
															id="rmaReason">
																<option value="0">Please Select</option>
																<c:forEach items="${rmaReasonsList}"
																	var="rmaReasons">
																	<option value="${rmaReasons.reasonId}" 
																	<c:if test="${RMADetails.reasonId == rmaReasons.reasonId}">
														                selected="selected"
														            </c:if>
														            >${rmaReasons.rmaReason}</option>
																</c:forEach>
														</select>
														</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.RMA.RmaRequest" /></td>
														<td>: <spring:bind path="sentDate">
																<c:out value="${status.value}" />
															</spring:bind></td>
														<td><spring:message code="BzComposer.RMA.ReasonDetails" /></td>
														<td><form:textarea path="reason" maxlength="240"
																style="width: 100%; height: 50px;"></form:textarea></td>
													</tr>
												</tbody>
											</table>
											<table class="tabla-listados rmaTable rmaItemTable">
												<thead>
													<tr>
														<th colspan="5"><spring:message
																code="BzComposer.rma.RmaItem" /></th>
													</tr>
													<tr>
														<th><spring:message code="BzComposer.RMA.rmaItemID" /></th>
														<th><spring:message code="BzComposer.RMA.ItemCode" /></th>
														<th><spring:message
																code="BzComposer.RMA.ItemDescription" /></th>
														<th align="right"><spring:message
																code="BzComposer.RMA.RmaQty" /></th>
														<th><spring:message code="BzComposer.RMA.Action" /></th>
													</tr>
												</thead>
												<tbody id="rmaItemList">
													<c:if test="${not empty RMAItemDetails}">
														<input type="hidden" name="RMALID" id="l2Size"
															value='${RMAItemDetails.size()}'>
														<c:forEach items="${RMAItemDetails}" var="RobjList"
															varStatus="loop">
															<tr id="${loop.index}$$"
																onclick="setRMAId('${RobjList.rma}','${loop.index}$$');">
																<td nowrap="nowrap">${RobjList.rmaItemID}</td>
																<td nowrap="nowrap">${RobjList.itemCode}</td>
																<td nowrap="nowrap" width="250">${RobjList.itemDesc}</td>
																<td align="center"><input type="number" name="qty_${loop.index}"
																	value="${RobjList.qty}" min="1" required /></td>
																<td>
																	<button type="button" class="btn-danger"
																		onclick="deleteItem(${loop.index})">Delete</button>
																</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<input type="hidden" id="RMAID" name="RMAVal"> <input
												type="hidden" id="cartID" name="ItemVal">
											<div class="rmaActions">
												<input type="button" id="approveId"
													class="formButton" onclick="approveRMA('${RMADetails.rma}');" name="findBtn"
													value="Approve RMA" title="Select an Item from Invoice">
												<input type="button" id="RMACancel"
													onclick="cancelRma('${RMADetails.rma}');" class="formButton"
													title='<spring:message code="BzComposer.RMA.RmaDetails.CancelRMAToolTip" />'
													name="findBtn"
													value='<spring:message code="BzComposer.RMA.RmaDetails.CancelRMA" />'>
												<input type="button" onclick="closeme();" name="findBtn"
													value='<spring:message code="BzComposer.RMA.RmaDetails.Close" />'
													class="formButton" title="Close">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- end Contents -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</form:form>

	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<script>
	function numbersonly(e, val) {
		var temp = val.indexOf(".");

		var unicode = e.charCode ? e.charCode : e.keyCode;

		if (unicode != 8) {
			//if the key isn't the backspace key (which we should allow)

			if (unicode == 46 && temp == -1) {
				return true;
			} else if (unicode<48||unicode>57) //if not a number
				return false; //disable key press

		}
	}

	function trim(inputString) {
		// Removes the spaces  return from the passed string. 
		var retValue = inputString;
		var ch = retValue.substring(0, 1);
		while (ch == "\n" || ch == "\r" || ch == " " || ch == "\t") {
			retValue = retValue.substring(1, retValue.length);
			ch = retValue.substring(0, 1);
		}
		return retValue;
	}

	/* function approveRMA() {
		cartID = document.getElementById("cartID").value;
		if (trim(document.RMAForm.rma.value) == "") {

			return RMADetailsDialog();
			document.RMAForm.rma.focus();
		} else if (parseInt(document.RMAForm.qty.value) == 0
				|| document.RMAForm.qty.value == "") {

			return showRMAQuantityDialog();
			document.RMAForm.qty.focus();
		} else if ((!IsNumeric(document.RMAForm.qty.value))) {

			return RMAQuantityDialog();
			document.RMAForm.qty.focus();
		} else {
			document.RMAForm.qty.value = parseInt(document.RMAForm.qty.value);
			document.forms[0].action = "RMA?tabid=R0A0D0&cartID=" + cartID;
			document.forms[0].submit();
		}
	} */

	function IsNumeric(stext) {
		var validchars = "0123456789";
		var isnumber = true;
		var ch;
		for (i = 0; i < stext.length && isnumber == true; i++) {
			ch = stext.charAt(i);
			if (validchars.indexOf(ch) == -1) {
				isnumber = false;
			}
		}
		return isnumber;
	}

	function CancelRMA() {

		return cancelRMADialog();
		/* if(confirm('<spring:message code="BzComposer.RMA.CancelRMA.Confirm" />'))
		{
			RID=document.getElementById("RMAID").value ;
			document.forms[0].action = "RMA?tabid=R0R0M0&RMAno="+RID;
			document.forms[0].submit();
		} */
	}

	function setItemId(Ino, rid) {

		size = document.getElementById("lSize").value;
		for (i = 0; i < size; i++) {
			var row1 = document.getElementById("$" + i + "$");
			row1.className = "";
		}
		var rd = document.getElementById(rid);
		rd.className = 'draft';

		document.getElementById("cartID").value = Ino;
		document.getElementById("approveId").disabled = false;
	}

	function setRMAId(Rno, rid) {
		size = document.getElementById("l2Size").value;
		for (i = 0; i < size; i++) {
			var row1 = document.getElementById(i + "$$");
			row1.className = "";
		}
		var rd = document.getElementById(rid);
		rd.className = 'draft';
		document.getElementById("RMAID").value = Rno;
		document.getElementById("RMACancel").disabled = false;
	}

	function closeme() {
		if (window.opener) {
	        window.opener.location.reload();
	    }
	    window.close();
	}

	function init() {

		document.RMAForm.rma.value = "";
	}
	
	function loadChildReasons(masterReasonId) {
	    // Clear the child dropdown
	    var rmaReasonDropdown = document.getElementById("rmaReason");
	    rmaReasonDropdown.innerHTML = '<option value="0">Please Select</option>';
	    
	    if (masterReasonId == 0) {
	        return;
	    }

	    // Make an AJAX request to fetch the child options based on the selected parent option
	    fetch('/getRmaReasons?masterReasonId=' + masterReasonId)
	        .then(response => response.json())
	        .then(data => {
	            data.forEach(function(reason) {
	                var option = document.createElement("option");
	                option.value = reason.reasonId;
	                option.text = reason.rmaReason;
	                rmaReasonDropdown.add(option);
	            });
	        })
	        .catch(error => console.error('Error fetching RMA reasons:', error));
	}
	var deletedItemIds = [];
	function deleteItem(index) {
		debugger;
        // Find the row by its index and remove it from the table
        var row = document.getElementById(index + '$$');
        if (row) {
            // Track the ID of the deleted item
            var rmaItemID = row.cells[0].innerText;
            deletedItemIds.push(rmaItemID);

            // Remove the row from the table
            row.parentNode.removeChild(row);
        }

        // Optionally, update the hidden input field or make other necessary adjustments
        var sizeInput = document.getElementById('l2Size');
        if (sizeInput) {
            var currentSize = parseInt(sizeInput.value, 10);
            sizeInput.value = currentSize - 1;
        }
    }
	function approveRMA(rmaId) {
		debugger;
        // Collect remaining items 
        var rmaReasonDropdown = document.getElementById("rmaReason");
        var reasonId = rmaReasonDropdown.value;
        var reasonDetails = document.getElementById("reason").value;
        var remainingItems = [];
        $('#rmaItemList tr').each(function() {
            var item = {
                rmaItemID: $(this).find('td').eq(0).text(),
                itemCode: $(this).find('td').eq(1).text(),
                itemDesc: $(this).find('td').eq(2).text(),
                qty: $(this).find('input').val()
            };
            remainingItems.push(item);
        });

        $.ajax({
            url: 'RMA/approveRma',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ rma: rmaId, reasonId: reasonId, reason: reasonDetails, rmaItems: remainingItems, deletedItemIds: deletedItemIds }),
            success: function(response) {
                if (response.success) {
                    alert('RMA approved successfully.');
                    // Optionally, update the status in the DOM
                    $('#rmaStatus').text('Approved');
                } else {
                    alert('Failed to approve the RMA.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error approving RMA:', error);
            }
        });
    }
	
	
	function cancelRma(rmaId) {
		debugger;
        // Collect remaining items 
        var rmaReasonDropdown = document.getElementById("rmaReason");
        var reasonId = rmaReasonDropdown.value;
        var reasonDetails = document.getElementById("reason").value;
        var remainingItems = [];
        $('#rmaItemList tr').each(function() {
            var item = {
                rmaItemID: $(this).find('td').eq(0).text(),
                itemCode: $(this).find('td').eq(1).text(),
                itemDesc: $(this).find('td').eq(2).text(),
                qty: $(this).find('input').val()
            };
            remainingItems.push(item);
        });

        $.ajax({
            url: 'RMA/cancelRma',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ rma: rmaId, reasonId: reasonId, reason: reasonDetails, rmaItems: remainingItems, deletedItemIds: deletedItemIds }),
            success: function(response) {
                if (response.success) {
                    alert('RMA Cancelled successfully.');
                    // Optionally, update the status in the DOM
                    $('#rmaStatus').text('Approved');
                } else {
                    alert('Failed to Cancel the RMA.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error approving RMA:', error);
            }
        });
    }
	
</script>
<!-- Dialog box used in rmadetails page -->
<div id="cancelRMADialog" title="Cancel RMA" style="display: none;">
	<p>
		<spring:message code="BzComposer.RMA.CancelRMA.Confirm" />
	</p>
</div>
<div id="RMADetailsDialog" title="Select First Name and Last Name"
	style="display: none;">
	<p>
		<spring:message code="BzComposer.RMA.rmano.Validation" />
	</p>
</div>
<div id="showRMAQuantityDialog" title="Enter Quantity greater than 0"
	style="display: none;">
	<p>
		<spring:message code="BzComposer.RMA.qty.Validation" />
	</p>
</div>
<div id="RMAQuantityDialog" title="Enter Quantity in only digits"
	style="display: none;">
	<p>
		<spring:message code="BzComposer.RMA.qty.InNumber.Validation" />
	</p>
</div>