$(document).ready(function () {
    var loader = $(".loader");
    var base_url = "http://localhost:8080"

    // Load items by category
    $(document).on('click', '.category', function () {
        loader.removeClass("d-none");
        let targetArea = $(".products");
        let propValue = $(this).prop("id");
        let categoryId = propValue.replace("category-", "");

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

    function getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty) {

        let content = '';
        content += '<div class="cart-row cart-item cart_item_' + itemId + '" id="cart_item_' + itemId + '" cQty_' + itemId + '="' + qty + '" cPrice_' + itemId + '="' + itemPrice + '" cName_' + itemId + '="' + itemName + '" cCode_' + itemId + '="' + itemCode + '" stockQty_'+itemId+'="'+stockQty+'">';
        content += '<a href="javascript:void(0)">' + itemName + ' <span>(' + itemCode + ')</span></a>';
        content += '<p>' + itemPrice + '</p>';
        content += '<div class="number">';
        content += '<span class="minus">-</span>';
        content += '<input type="text" class="change-qty"  value="' + qty + '"/>';
        content += '<span class="plus">+</span>';
        content += '</div>';
        content += '<p>' + rowTotal.toFixed(2) + '</p>';
        content += '<button type="button" class="btn btn-lg btn-danger cart-trash cart-item-remove"><i data-feather="trash"></i>x</button>';
        content += '</div>';

        return content;
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

        loader.addClass("d-none");
        return false;
    });

    // Remove item
    $(document).on('click', '.btn.cart-item-remove', function () {
        $(this).parent().remove();
        return false;
    });

    // Change qty
    $(document).on('change', '.change-qty', function () {

        let propValue = $(this).parent().parent().attr("id");
        let itemId = propValue.replace("cart_item_", "");
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let itemName = targetRow.attr("cname_"+itemId);
        let itemCode = targetRow.attr("ccode_"+itemId);
        let stockQty = parseFloat(targetRow.attr("stockqty_"+itemId));
        let itemPrice = parseFloat(targetRow.attr("cprice_"+itemId));

        let inputValue = parseFloat($(this).val());
        if (!inputValue) {
            $(this).val(1);
            return false;
        }
        if (inputValue < 1 ) {
            alert("Minimum quantity is 1");
            return false;
        }
        let qty =  inputValue;
        let rowTotal = qty * itemPrice;
        // alert(itemId + ' ' + qty + ' ' + itemPrice + ' ' + rowTotal + ' ' + itemName + ' ' + itemCode + ' ' + stockQty)

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);
        // Replace content
        targetRow.replaceWith(content);

        return false;
    });

    // add qty
    $(document).on('click', '.minus', function () {
        let propValue = $(this).parent().parent().attr("id");
        let itemId = propValue.replace("cart_item_", "");
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let itemName = targetRow.attr("cname_"+itemId);
        let itemCode = targetRow.attr("ccode_"+itemId);
        let stockQty = parseFloat(targetRow.attr("stockqty_"+itemId));
        let itemPrice = parseFloat(targetRow.attr("cprice_"+itemId));

        let preQty = parseFloat(targetRow.attr("cqty_" + itemId));
        if (preQty <= 1 ) {
            alert("Minimum quantity is 1");
            return false;
        }
        let qty =  preQty - 1;
        let rowTotal = qty * itemPrice;

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);
        // Replace content
        targetRow.replaceWith(content);

        return false;
    });

    // add qty
    $(document).on('click', '.plus', function () {
        let propValue = $(this).parent().parent().attr("id");
        let itemId = propValue.replace("cart_item_", "");
        let targetRow = $(".cart-item.cart_item_" + itemId);

        let itemName = targetRow.attr("cname_"+itemId);
        let itemCode = targetRow.attr("ccode_"+itemId);
        let stockQty = parseFloat(targetRow.attr("stockqty_"+itemId));
        let itemPrice = parseFloat(targetRow.attr("cprice_"+itemId));

        let preQty = parseFloat(targetRow.attr("cqty_" + itemId));
        let qty =  preQty + 1;
        let rowTotal = qty * itemPrice;

        let content = getRowContent(itemId, qty, itemPrice, rowTotal, itemName, itemCode, stockQty);
        // Replace content
        targetRow.replaceWith(content);

        return false;
    });

    function parseFloat(i) {
        return Number.parseFloat(i);
    }
});