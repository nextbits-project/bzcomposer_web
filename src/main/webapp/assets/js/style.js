$(document).ready(function () {
    let loader = $(".loader");
    let base_url = "http://localhost:8080"

    $(document).on('click', '.print', function () {
        $(this).attr("disabled", "disabled");
        loader.removeClass("d-none");
        let invoiceItems = [];

        let subTotal = $("#sub_total").text();
        let taxTotal = $("#tax_total").text();
        let discount = $("#discount_amount").val();
        let grandTotal = $("#grand_total").text();
        let paymentMethod = $('input[name="payment_method"]:checked').val();
        let customerId = $("#customerId").val();

        $(".cart-row.cart-item").each(function () {
            let id = $(this).prop("id");
            let itemId = id.replace("cart_item_", "");
            let itemName = $(this).attr("cname_"+itemId);
            let itemCode = $(this).attr("ccode_"+itemId);
            let qty = $(this).attr("cqty_"+itemId);
            let price = $(this).attr("cprice_"+itemId);
            let amount = $(this).attr("crowtotal_"+itemId);
            invoiceItems.push({
                'itemId': itemId,
                'itemName': itemName,
                'itemCode': itemCode,
                'qty': qty,
                'price': price,
                'amount': amount
            })
        });
        if (invoiceItems.length < 1) {
            loader.addClass("d-none");
            $(this).removeAttr("disabled");
            alert("Nothing added to cart");
            return false;
        }

        if(customerId === "") {
            if(!confirm("You want to save without customer. Are you sure?")) {
                loader.addClass("d-none");
                $(this).removeAttr("disabled");
                return false;
            }
            // alert("You have to select customer");
            // loader.addClass("d-none");
            // $(this).removeAttr("disabled");
            // return false;
        }

        let requestBody = {
            'invoiceItems': invoiceItems,
            'subTotal': isEmpty(subTotal),
            'taxTotal': isEmpty(taxTotal),
            'discount': isEmpty(discount),
            'grandTotal': isEmpty(grandTotal),
            'paymentMethod': paymentMethod,
            'customerId': isEmpty(customerId)
        };

        // data: JSON.stringify(requestBody),
        $.ajax({
            url: base_url + "/retail-pos-ajax-actions/save",
            method: "POST",
            data: JSON.stringify(requestBody),
            contentType: 'application/json',
            success: function (response) {
                if (response && response.status === true) {
                    $(".clear-cart").trigger("click");
                    let url = base_url + "/retail-pos/" + parseInt(response.invoiceId);
                    window.open(url, "_blank");
                } else {
                    alert("Not saved");
                }
                $(".print").removeAttr("disabled");
                loader.addClass("d-none");
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
                $(".print").removeAttr("disabled");
                loader.addClass("d-none");
            }
        });
    });

    // save action
    $(document).on('click', '.save', function () {
        $(this).attr("disabled", "disabled");
        loader.removeClass("d-none");
        let invoiceItems = [];

        let subTotal = $("#sub_total").text();
        let taxTotal = $("#tax_total").text();
        let discount = $("#discount_amount").val();
        let grandTotal = $("#grand_total").text();
        let paymentMethod = $('input[name="payment_method"]:checked').val();
        let customerId = $("#customerId").val();

        $(".cart-row.cart-item").each(function () {
            let id = $(this).prop("id");
            let itemId = id.replace("cart_item_", "");
            let itemName = $(this).attr("cname_"+itemId);
            let itemCode = $(this).attr("ccode_"+itemId);
            let qty = $(this).attr("cqty_"+itemId);
            let price = $(this).attr("cprice_"+itemId);
            let amount = $(this).attr("crowtotal_"+itemId);
            invoiceItems.push({
                'itemId': itemId,
                'itemName': itemName,
                'itemCode': itemCode,
                'qty': qty,
                'price': price,
                'amount': amount
            })
        });
        if (invoiceItems.length < 1) {
            loader.addClass("d-none");
            $(this).removeAttr("disabled");
            alert("Nothing added to cart");
            return false;
        }

        if(customerId === "") {
            if(!confirm("You want to save without customer. Are you sure?")) {
                loader.addClass("d-none");
                $(this).removeAttr("disabled");
                return false;
            }
        }

        let requestBody = {
            'invoiceItems': invoiceItems,
            'subTotal': isEmpty(subTotal),
            'taxTotal': isEmpty(taxTotal),
            'discount': isEmpty(discount),
            'grandTotal': isEmpty(grandTotal),
            'paymentMethod': paymentMethod,
            'customerId': isEmpty(customerId)
        };

        // data: JSON.stringify(requestBody),
        $.ajax({
            url: base_url + "/retail-pos-ajax-actions/save",
            method: "POST",
            data: JSON.stringify(requestBody),
            contentType: 'application/json',
            success: function (response) {
                if (response && response.status === true) {
                    $(".clear-cart").trigger("click");
                    $("#save").modal("show");
                } else {
                    $("#save").modal("hide");
                    alert("Not saved");
                }
                $(".save").removeAttr("disabled");
                loader.addClass("d-none");
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
                $(".save").removeAttr("disabled");
                loader.addClass("d-none");
            }
        });
    });

    // Load items by category
    $(document).on('click', '.category', function () {
        loader.removeClass("d-none");
        // remove active class from category
        $(".cate-link").each(function () {
            $(this).removeClass("active");
        });
        // add active class of clicked one
        $(this).children("a.cate-link").addClass("active");

        let targetArea = $(".products");
        let propValue = $(this).prop("id");
        let categoryId = propValue.replace("category-", "");
        if (categoryId === "" || categoryId == null) {
            categoryId = 0;
        }

        $.ajax({
            url: base_url + "/retail-pos-ajax/" + categoryId + "/items",
            method: "GET",
            success: function (response) {
                loader.addClass("d-none");
                targetArea.html(response);
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
                loader.addClass("d-none");
            }
        });
        return false;
    });

    $(document).on('keyup', '.search-item', function () {
        let searchValue = $(this).val();
        let targetArea = $(".products");

        if (searchValue === "") {
            $(".category.all-cat").trigger("click");
            return;
        }

        $.ajax({
            url: base_url + "/retail-pos-ajax/items/" + searchValue,
            method: "GET",
            success: function (response) {
                loader.addClass("d-none");
                targetArea.html(response);
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
                loader.addClass("d-none");
            }
        });
        return false;
    });

    $(document).on('click', '.cate-and-item-refresh', function () {
        $(".category.all-cat").trigger("click");
        $(".search-item").val("");
        return false;
    });

    function getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty) {

        let content = '';
        content += '<div class="cart-row cart-item cart_item_' + itemId + '" id="cart_item_' + itemId + '" cQty_' + itemId + '="' + qty + '" cPrice_' + itemId + '="' + itemPrice + '" cName_' + itemId + '="' + itemName + '" cCode_' + itemId + '="' + itemCode + '" stockQty_' + itemId + '="' + stockQty + '" cRowTotal_' + itemId + '="' + rowTotal + '">';
        content += '<a href="javascript:void(0)">' + itemName + '</a>';
        content += '<p>' + itemPrice + '</p>';
        content += '<div class="number">';
        content += '<span class="minus">-</span>';
        content += '<input type="number" min = "1" class="change-qty"  value="' + qty + '"/>';
        content += '<span class="plus">+</span>';
        content += '</div>';
        content += '<p>' + rowTotal.toFixed(2) + '</p>';
        content += '<button type="button" class="btn btn-lg btn-danger cart-trash cart-item-remove"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></button>';
        content += '</div>';

        return content;
    }

    function calculate() {
        let subTotal = 0;
        $(".cart-row.cart-item").each(function () {
            let id = $(this).prop("id");
            let itemId = id.replace("cart_item_", "");
            let cRowTotal = $(this).attr("crowtotal_"+itemId);
            subTotal += parseFloat(cRowTotal);
        });
        let discountValue = $("#discount_amount").val();
        let discount = discountValue === "" || discountValue === undefined ? 0 : parseFloat(discountValue);
        let taxTotal = subTotal * (7.75/100);
        let grandTotal = (taxTotal + subTotal) - discount;

        $("#sub_total").text(subTotal.toFixed(2));
        $("#tax_total").text(taxTotal.toFixed(2));
        $("#grand_total").text(grandTotal.toFixed(2));

        // if cash then auto-populate
        let method = $('input[name="payment_method"]:checked').val();
        if (method === 'cash') {
            let value = $("#received_amount").val();
            cashOption(value);
        }
    }

    // re calculate and populate received amount and change amount
    function cashOption(value) {
        let receivedAmount = value === "" || value === undefined ? 0 : parseFloat(value);
        let grandTotal = parseFloat($("#grand_total").text() === 0 ? 0 : $("#grand_total").text());

        if (receivedAmount === 0) {
            $("#due_amount").text('');
        } else {
            let due = grandTotal - receivedAmount;
            $("#due_amount").text(due.toFixed(2));
        }
    }

    $(document).on('click', '.item', function () {
        loader.removeClass("d-none");

        let targetArea = $(".cart-group");
        let propValue = $(this).prop("id");
        let itemId = propValue.replace("item_", "");
        // console.log(propValue)

        let itemName = $(this).attr(propValue + "_name");
        let itemCode = $(this).attr(propValue + "_code");
        let stockQty = parseFloat($(this).attr(propValue + "_qty"));
        let itemPrice = parseFloat($(this).attr(propValue + "_price"));
        if (stockQty < 1) {
            alert("Product is not available");
            loader.addClass("d-none");
            return;
        }
        // existence check of cart item
        let hasPrev = $(".cart-item").hasClass("cart_item_" + itemId);
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let qty = hasPrev ? parseFloat(targetRow.attr("cQty_" + itemId)) + 1 : 1;
        let rowTotal = qty * itemPrice;

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);

        // Replace content
        if (hasPrev) {
            targetRow.replaceWith(content);
        } else { // Add content
            targetArea.append(content);
        }

        // Calculation of all items
        calculate();
        loader.addClass("d-none");
        return false;
    });

    // Remove item
    $(document).on('click', '.btn.cart-item-remove', function () {
        $(this).parent().remove();
        // Calculation of all items
        calculate();
        return false;
    });

    // Change qty
    $(document).on('change', '.change-qty', function () {

        let propValue = $(this).parent().parent().attr("id");
        let itemId = propValue.replace("cart_item_", "");
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let itemName = targetRow.attr("cname_" + itemId);
        let itemCode = targetRow.attr("ccode_" + itemId);
        let stockQty = parseFloat(targetRow.attr("stockqty_" + itemId));
        let itemPrice = parseFloat(targetRow.attr("cprice_" + itemId));

        let inputValue = parseFloat($(this).val());
        if (!inputValue) {
            $(this).val(1);
            return false;
        }
        if (inputValue < 1) {
            alert("Minimum quantity is 1");
            return false;
        }
        let qty = inputValue;
        let rowTotal = qty * itemPrice;
        // alert(itemId + ' ' + qty + ' ' + itemPrice + ' ' + rowTotal + ' ' + itemName + ' ' + itemCode + ' ' + stockQty)

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);
        // Replace content
        targetRow.replaceWith(content);
        // Calculation of all items
        calculate();
        return false;
    });

    // add qty
    $(document).on('click', '.minus', function () {
        let propValue = $(this).parent().parent().attr("id");
        let itemId = propValue.replace("cart_item_", "");
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let itemName = targetRow.attr("cname_" + itemId);
        let itemCode = targetRow.attr("ccode_" + itemId);
        let stockQty = parseFloat(targetRow.attr("stockqty_" + itemId));
        let itemPrice = parseFloat(targetRow.attr("cprice_" + itemId));

        let preQty = parseFloat(targetRow.attr("cqty_" + itemId));
        if (preQty <= 1) {
            alert("Minimum quantity is 1");
            return false;
        }
        let qty = preQty - 1;
        let rowTotal = qty * itemPrice;

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);
        // Replace content
        targetRow.replaceWith(content);
        // Calculation of all items
        calculate();
        return false;
    });

    // add qty
    $(document).on('click', '.plus', function () {
        let propValue = $(this).parent().parent().attr("id");
        let itemId = propValue.replace("cart_item_", "");
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let itemName = targetRow.attr("cname_" + itemId);
        let itemCode = targetRow.attr("ccode_" + itemId);
        let stockQty = parseFloat(targetRow.attr("stockqty_" + itemId));
        let itemPrice = parseFloat(targetRow.attr("cprice_" + itemId));

        let preQty = parseFloat(targetRow.attr("cqty_" + itemId));
        let qty = preQty + 1;
        let rowTotal = qty * itemPrice;

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);
        // Replace content
        targetRow.replaceWith(content);
        // Calculation of all items
        calculate();

        return false;
    });

    $(document).on('change', '.payment_method', function () {
        let method = $('input[name="payment_method"]:checked').val();
        if (method === 'cash') {
            $(".received-amount").removeClass('d-none');
        } else {
            $(".received-amount").addClass('d-none');
        }
        $("#received_amount").val('');
        $("#due_amount").text('');
    });

    $(document).on('change', '#received_amount', function () {
        let value = $(this).val();
        cashOption(value)
    });

    $(document).on('change', '#discount_amount', function () {
        calculate();
        return false;
    });

    $(document).on('click', '.clear-cart', function () {
        $(".cart-row").each(function () {
            if(!$(this).hasClass("cart-header")) {
                $(this).remove();
            }
        });

        $("#sub_total").text(0.00);
        $("#tax_total").text(0.00);
        $("#discount_amount").text(0.00);
        $("#grand_total").text(0.00);
        $("#received_amount").val('');
        $("#due_amount").text('');
        $("#customerId").val('');

        let paymentMethods = document.querySelectorAll('.payment_method');
        for (let i = 0; i < paymentMethods.length; i++) {
            paymentMethods[i].checked = false;
        }
        $(".received-amount").addClass('d-none');

        return false;
    });

    // customer refresh
    $(document).on('click', '.customer-refresh', function () {
        loader.removeClass("d-none");
        let targetArea = $(".select-user");
        $.ajax({
            url: base_url + "/retail-pos-ajax/refresh-customers",
            method: "GET",
            success: function (response) {
                loader.addClass("d-none");
                targetArea.html(response);
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
                loader.addClass("d-none");
            }
        });
        return false;
    });

    function parseFloat(i) {
        return Number.parseFloat(i);
    }

    function isEmpty(value) {
        if (value === "" || value === null || value === 0) {
            return 0;
        }
        return value;
    }
});