// ***************************************************
// Shopping Cart functions

// Cart
jQuery('#demo_changer .demo-icon').click(function() {

    if (jQuery('.demo_changer').hasClass("active")) {
        jQuery('.demo_changer').animate({
            "right": "-300px"
        }, function() {
            jQuery('.demo_changer').toggleClass("active");
        });
    } else {
        jQuery('.demo_changer').animate({
            "right": "0px"
        }, function() {
            jQuery('.demo_changer').toggleClass("active");
        });
    }
});

//////////////////////////

var shoppingCart = (function () {
    // Private methods and properties
    var cart = [];

    function Item(name, price, count, image, productcode) {
        this.name = name
        this.price = price
        this.count = count
        this.image = image
        this.productcode = productcode
    }

    function saveCart() {
        localStorage.setItem("shoppingCart", JSON.stringify(cart));
        }

    function loadCart() {
        cart = JSON.parse(localStorage.getItem("shoppingCart"));
        if (cart === null) {
            cart = []
        }
    }

    loadCart();



    // Public methods and properties
    var obj = {};

    obj.addItemToCart = function (name, price, count, image, productcode) {
        for (var i in cart) {
            if (cart[i].productcode === productcode) {
                cart[i].count += count;
                saveCart();
                return;
            }
        }

        console.log("addItemToCart:", name, price, count, image, productcode);

        var item = new Item(name, price, count, image, productcode);
        cart.push(item);
        saveCart();
    };

    obj.setCountForItem = function (productcode, count) {
        for (var i in cart) {
            if (cart[i].productcode === productcode) {
                cart[i].count = count;
                break;
            }
        }
        saveCart();
    };


    obj.removeItemFromCart = function (productcode) { // Removes one item
        for (var i in cart) {
            if (cart[i].productcode === productcode) { // "3" === 3 false
                cart[i].count--; // cart[i].count --
                if (cart[i].count === 0) {
                    cart.splice(i, 1);
                }
                break;
            }
        }
        saveCart();
    };


    obj.removeItemFromCartAll = function (productcode) { // removes all item name
        for (var i in cart) {
            if (cart[i].productcode === productcode) {
                cart.splice(i, 1);
                break;
            }
        }
        saveCart();
    };


    obj.clearCart = function () {
        cart = [];
        saveCart();
    }


    obj.countCart = function () { // -> return total count
        var totalCount = 0;
        for (var i in cart) {
            totalCount += cart[i].count;
        }

        return totalCount;
    };

    obj.totalCart = function () { // -> return total cost
        var totalCost = 0;
        for (var i in cart) {
            totalCost += cart[i].price * cart[i].count;
        }
        return totalCost.toFixed(0);
    };

    obj.listCart = function () { // -> array of Items
        var cartCopy = [];
        console.log("Listing cart");
        console.log(cart);
        for (var i in cart) {
            console.log(i);
            var item = cart[i];
            var itemCopy = {};
            for (var p in item) {
                itemCopy[p] = item[p];
            }
            itemCopy.total = (item.price * item.count).toFixed(0);
            cartCopy.push(itemCopy);
        }
        return cartCopy;
    };

    // ----------------------------
    return obj;
})();

// execute JQuery
$(".add-item-to-cart").click(function (event) {
    event.preventDefault();
    var name = $(this).attr("data-name");
    var price = Number($(this).attr("data-price"));
    var nameimages = $(this).attr("data-image");
    var productcode = $(this).attr("data-product-code");

    shoppingCart.addItemToCart(name, price, 1, nameimages, productcode );
    displayCart();
    displayCartPageCart();
});

$("#clear-cart").click(function (event) {
    shoppingCart.clearCart();
    displayCart();
    displayCartPageCart();
});

function displayCart() {
    var cartArray = shoppingCart.listCart();
    console.log(cartArray);
    var output = "";
    if (cartArray.length <= 0) {
        output = "<p style='padding-left: 20px;'>Chưa có sản phẩm nào</p>"
    }
    else {
        for (var i in cartArray) {
            output += "<tr class='cart_item'>"
                + "<td class='product-remove'>"
                + "<div class='bt_remove_product left' data-product-code='" + cartArray[i].productcode + "'>" + "</div>"
                + "</td>"
                + "<td class='product-name'>"
                + "<b>" + cartArray[i].name + "</b>"
                + "<div class='clr'></div>"
                + "<div class='box_quantity left'>"
                + "<div class='quantity right'>"
                + "<input class='bt_minus' type='button' value='-' data-product-code='" + cartArray[i].productcode + "'>"
                + "<input type='text' disabled='' name='product_cart_qty' value='" + cartArray[i].count + "' title='Qty' class='input-text qty text product_qty' size='4'>"
                + "<input class='bt_plus' type='button' value='+' data-product-code='" + cartArray[i].productcode + "'>"
                + "</div>"
                + "</div>"
                + "</td>"
                + "<td class='product-price' valign='top'>"
                + "<span class='amount'>" + numberWithCommas(cartArray[i].total) + "</span>"
                + "</td>"
                + "</tr>";
        }
    }
    $("#show-cart").html(output);
            $("#count-cart").html( shoppingCart.countCart() );
    $("#total_price").html(numberWithCommas(shoppingCart.totalCart()));
}
//show product in page shoping cart
function displayCartPageCart() {
    var cartArray = shoppingCart.listCart();
    console.log(cartArray);
    var output = "";
    if (cartArray.length <= 0) {
        output = "<tr><td colspan='7' style='text-align: center'><p style='padding-left: 20px;'>Chưa có sản phẩm nào</p></td></tr>"
    }
    else {
        for (var i in cartArray) {
            output
                +="<tr>"
                +"<td class='cart_product'>"
                +"<a href='#'><img src='images/product-detail/"+cartArray[i].image+"' alt='Product'></a>"
                +"</td>"
                +"<td class='cart_description'>"
                +"<p class='product-name'><a href='#'>"+cartArray[i].name+"</a></p>"
                +"<small class='cart_ref'>Product Code : "+cartArray[i].productcode+"</small>"
                +"<br>"
                +"</td>"
                +"<td class='cart_avail'><span class='label label-success'>In stock</span></td>"
                +"<td class='price'><span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].price) + "</span></td>"
                +"<td class='qty'>"
                +"<input class='form-control input-sm' type='text' readonly value='" + cartArray[i].count + "'>"
                +"<a class='plus' data-product-code='" + cartArray[i].productcode + "'><i class='fa fa-caret-up'></i></a>"
                +"<a class='minus' data-product-code='" + cartArray[i].productcode + "'><i class='fa fa-caret-down'></i></a>"
                +"</td>"
                +"<td class='price'>"
                +"<span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].total) + "</span>"
                +"</td>"
                +"<td class='action'>"
                +"<a class='remove_product' data-product-code='" + cartArray[i].productcode + "'>Delete item</a>"
                +"</td>"
                +"</tr>";
        }
    }
    $("#show-item-cart").html(output);
    $("#count-cart").html( shoppingCart.countCart() );
    $("#total_price").html(numberWithCommas(shoppingCart.totalCart()));
}

//show product in page checkout
function displayCartPageCheckOut() {
    var cartArray = shoppingCart.listCart();
    console.log(cartArray);
    var output = "";
    if (cartArray.length <= 0) {
        output = "<tr><td colspan='7' style='text-align: center'><p style='padding-left: 20px;'>Chưa có sản phẩm nào</p></td></tr>"
    }
    else {
        for (var i in cartArray) {
            output
                +="<tr>"
                +"<td class='cart_product'>"
                +"<a href='#'><img src='images/product-detail/"+cartArray[i].image+"' alt='Product'></a>"
                +"</td>"
                +"<td class='cart_description'>"
                +"<p class='product-name'><a href='#'>"+cartArray[i].name+"</a></p>"
                +"<small class='cart_ref'>Product Code : "+cartArray[i].productcode+"</small>"
                +"<br>"
                +"</td>"
                +"<td class='cart_avail'><span class='label label-success'>In stock</span></td>"
                +"<td class='price'><span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].price) + "</span></td>"
                +"<td class='qty'>"
                //+"<input class='form-control input-sm' type='text' readonly value='" + cartArray[i].count + "'>"
                +"<label>" + cartArray[i].count + "</label>"
                +"</td>"
                +"<td class='price'>"
                +"<span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].total) + "</span>"
                +"</td>"
                +"</tr>";
        }
    }
    $("#show-list-order").html(output);
    $("#show-total_price").html(numberWithCommas(shoppingCart.totalCart()));
    $("#total_price_all").html(numberWithCommas(shoppingCart.totalCart()));
}


//function format thousand 1234 => 1,234
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$("#show-cart").on("click", ".bt_remove_product", function (event) {
    var productcode = $(this).attr("data-product-code");
    shoppingCart.removeItemFromCartAll(productcode);
    displayCart();
});

$("#show-cart").on("click", ".bt_minus", function (event) {
    var productcode = $(this).attr("data-product-code");
    shoppingCart.removeItemFromCart(productcode);
    displayCart();
});

$("#show-cart").on("click", ".bt_plus", function (event) {
    var productcode = $(this).attr("data-product-code");
    shoppingCart.addItemToCart(null, 0, 1,null,productcode);
    displayCart();
});

$("#show-cart").on("change", ".item-count", function (event) {
    var productcode = $(this).attr("data-product-code");
    var count = Number($(this).val());
    shoppingCart.setCountForItem(productcode, count);
    displayCart();
});

$("#show-item-cart").on("click", ".remove_product", function (event) {
    var productcode = $(this).attr("data-product-code");
    shoppingCart.removeItemFromCartAll(productcode);
    //localStorage.clear();
    displayCartPageCart();
});

$("#show-item-cart").on("click", ".minus", function (event) {
    var productcode = $(this).attr("data-product-code");
    shoppingCart.removeItemFromCart(productcode);
    displayCartPageCart();
});

$("#show-item-cart").on("click", ".plus", function (event) {
    var productcode = $(this).attr("data-product-code");
    shoppingCart.addItemToCart(null, 0, 1, null, productcode);
    displayCartPageCart();
});

$("#show-item-cart").on("change", ".item-count", function (event) {
    var productcode = $(this).attr("data-product-code");
    var count = Number($(this).val());
    shoppingCart.setCountForItem(productcode, count);
    displayCartPageCart();
});

//$("#btn-remove-all-item").click(function (event) {
//    localStorage.clear();
//    displayCartPageCheckOut();
//});

displayCart();
displayCartPageCart();
displayCartPageCheckOut();



