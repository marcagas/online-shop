﻿etrade.mycart = function () {
    var self;
    return {
        init: function () {
            self = this;

            self.displayCart();
            $('a.delete-item').on('click', self.deleteItem);
            $('.fancybox').fancybox();

            $('input.count').on('change', self.updateProductQuantity);
        },

        displayCart: function () {
            var cartList = $('.cart-list');
            var template;
            var item_id_prefix = "item",
                amount_id_prefix = "amount",
                shipping_id_prefix = "shipping",
                quantity_id_prefix = "quantity",
                item_name_prefix = "item_name_",
                item_number_prefix = "item_number_",
                amount_name_prefix = "amount_",
                shipping_name_prefix = "shipping_",
                quantity_name_prefix = "quantity_",
                item, item_number, amount, shipping, quantity;

            $('#aspnetForm table tr:not(.HeaderStyle)').each(function (index, item) {
                var productId = $(item).find('td').eq(0).text();
                var name = $(item).find('td').eq(1).text();
                var num = $(item).find('td').eq(2).text();
                var price = $(item).find('td').eq(3).text();
                var img = $(item).find('td').eq(4).text();
                var total = self.computeTotal(num, price);
                template = cartList.find('.product-list-template').clone();

                template.removeClass('product-list-template');
                template.find('.image-wrapper .fancybox').attr('href', img);
                template.find('.image-wrapper img').attr('src', img);
                template.find('.image-wrapper label').text(name);
                template.find('.count-wrapper .count').val(num);
                template.find('.product-price-wrapper .product-price').text("Php " + price);
                template.find('.total-price-wrapper .total-price').text("Php " + total);
                template.find('.delete-item').data('product-id', productId);
                template.removeClass('hide');

                item = document.createElement("input");
                item.id = item_id_prefix + (index + 1);
                item.name = item_name_prefix + (index + 1);
                item.type = "hidden";
                item.value = name;

                item_number = document.createElement("input");
                item_number.id = item_number_prefix + (index + 1);
                item_number.name = item_number_prefix + (index + 1);
                item_number.type = "hidden";
                item_number.value = productId;

                amount = document.createElement("input");
                amount.id = amount_id_prefix + (index + 1);
                amount.name = amount_name_prefix + (index + 1);
                amount.type = "hidden";
                amount.value = price;
                amount.className = "amount";

                quantity = document.createElement("input");
                quantity.id = quantity_id_prefix + (index + 1);
                quantity.name = quantity_name_prefix + (index + 1);
                quantity.type = "hidden";
                quantity.value = num;
                quantity.className = "quantity";

                template.append(item);
                template.append(item_number);
                template.append(amount);
                template.append(quantity);
                cartList.append(template);
            });
        },

        updateProductQuantity: function(e) {
            e.preventDefault();
            
            var $this = $(this);
            if ($this.val() < 0) {
                $this.val(1);
            }

            var $wrapper = $this.closest('.product-list-wrapper');
            $wrapper.find('input.quantity').val($this.val());

            var price = $this.closest('.product-list-wrapper').last().find('span.product-price').text().split(' ')[1];
            console.log('price', price);
            var newPrice = parseFloat(price) * parseInt($this.val());
            console.log('new price', newPrice);
            $wrapper.find('span.total-price').text("Php " + newPrice.toString());            

            return false;
        },

        computeTotal: function (num, amount) {
            return parseInt(num) * parseFloat(amount);
        },

        deleteItem: function (e) {
            e.preventDefault();
            var list = $.cookie('products').split('&');
            var products = "";
            var list_id, list_num;
            var productId = $(this).data('product-id');


            $(list).each(function (i, item) {
                list_id = item.split('=')[0];
                list_num = item.split('=')[1];

                if (list_id != productId) {
                    if (products == "") {
                        products = self.stringifyItem(list_id, list_num);
                    } else {
                        products = products + "&" + self.stringifyItem(list_id, list_num);
                    }
                }
            });

            if (products == "") {
                $.removeCookie("products");
            } else {
                $.cookie('products', products, { path: '/' });
            }
            
            $(this).closest('.product-list-wrapper').fadeOut(function() {
                $(this).remove();
            });
            return false;
        },

        stringifyItem: function (id, num) {
            return id + "=" + num;
        },
    }
} ();

$(document).ready(function () {
    etrade.mycart.init();
});