etrade.mycart = function () {
    var self;
    return {
        init: function () {
            self = this;

            self.displayCart();
        },

        displayCart: function () {
            var cartList = $('.cart-list');
            var template;
            var item_id_prefix = "item",
                amount_id_prefix = "amount",
                shipping_id_prefix = "shipping",
                quantity_id_prefix = "quantity",
                item_name_prefix = "item_name_",
                amount_name_prefix = "amount_",
                shipping_name_prefix = "shipping_",
                quantity_name_prefix = "quantity_",
                item, amount, shipping, quantity;

            $('#aspnetForm table tr:not(.HeaderStyle)').each(function (index, item) {
                var name = $(item).find('td').eq(1).text();
                var num = $(item).find('td').eq(2).text();
                var price = $(item).find('td').eq(3).text();
                var img = $(item).find('td').eq(4).text();
                var total = self.computeTotal(num, price);
                template = cartList.find('.product-list-template').clone();

                template.removeClass('product-list-template');
                template.find('.image-wrapper img').attr('src', img);
                template.find('.image-wrapper label').text(name);
                template.find('.count-wrapper .count').text(num);
                template.find('.product-price-wrapper .product-price').text("Php " + price);
                template.find('.total-price-wrapper .total-price').text("Php " + total);
                template.removeClass('hide');

                item = document.createElement("input");
                item.id = item_id_prefix + (index + 1);
                item.name = item_name_prefix + (index + 1);
                item.type = "hidden";
                item.value = name;

                amount = document.createElement("input");
                amount.id = amount_id_prefix + (index + 1);
                amount.name = amount_name_prefix + (index + 1);
                amount.type = "hidden";
                amount.value = price;

                quantity = document.createElement("input");
                quantity.id = quantity_id_prefix + (index + 1);
                quantity.name = quantity_name_prefix + (index + 1);
                quantity.type = "hidden";
                quantity.value = num;

                template.append(item);
                template.append(amount);
                template.append(quantity);
                cartList.append(template);
            });
        },

        computeTotal: function (num, amount) {
            return parseInt(num) * parseFloat(amount);
        },

        deleteItem: function () {
        }
    }
} ();

$(document).ready(function () {
    etrade.mycart.init();
});