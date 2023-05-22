$(document).ready(function () {
    var loader = $(".loader");
    var base_url = "http://localhost:8080"

    // Load items by category
    $('.category').click(function () {
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

    $('.item').click(function () {
        loader.removeClass("d-none");

        let targetArea = $(".cart-group");
        let propValue = $(this).prop("id");
        let itemId = propValue.replace("item_", "");
        console.log(propValue)

        let itemName = $(this).attr(propValue+"_name");
        let itemCode = $(this).attr(propValue+"_code");
        let itemQty = $(this).attr(propValue+"_qty");
        let itemPrice = $(this).attr(propValue+"_price");
        let hasPrev = $(".cart-item").hasClass("cart_item_"+itemId);

        let content = '';
        if (hasPrev) {
            let prevQty = $(".cart-item").attr("cart_item_"+itemId+"_qty") + 1;
            let rowTotal = prevQty * itemPrice;

            content += '<div class="cart-row cart-item cart_item_'+itemId+'" cart_item_'+itemId+'_qty="'+prevQty+'">' ;
            content += '<a href="javascript:void(0)">'+itemName+' <span>('+itemCode+')</span></a>';
            content += '<p>'+itemPrice+'</p>';
            content += '<div class="number">';
            content += '<span class="minus">-</span>';
            content += '<input type="text" class="change-qty"  value="'+prevQty+'"/>';
            content += '<span class="plus">+</span>';
            content += '</div>';
            content += '$<p>'+rowTotal+'</p>';
            content += '<button type="button" class="btn btn-lg btn-danger cart-trash"><i data-feather="trash"></i></button>';
            content += '</div>';
            targetArea.append(content);
        } else {
            content += '<div class="cart-row cart-item cart_item_'+itemId+'" cart_item_'+itemId+'_qty="1">' ;
            content += '<a href="javascript:void(0)">'+itemName+' <span>('+itemCode+')</span></a>';
            content += '<p>'+itemPrice+'</p>';
            content += '<div class="number">';
            content += '<span class="minus">-</span>';
            content += '<input type="text" value="1"/>';
            content += '<span class="plus">+</span>';
            content += '</div>';
            content += '$<p>'+itemPrice+'</p>';
            content += '<button type="button" class="btn btn-lg btn-danger cart-trash"><i data-feather="trash"></i></button>';
            content += '</div>';
            targetArea.append(content);
        }


        loader.addClass("d-none");
        return false;
    });


    $('.minus').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 1 : count;
        $input.val(count);
        $input.change();
        return false;
    });
    $('.plus').click(function () {
        var $input = $(this).parent().find('input');
        $input.val(parseInt($input.val()) + 1);
        $input.change();
        return false;
    });
});