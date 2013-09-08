etrade.products = function () {
    var self;

    return {
        init: function () {
            self = this;
            $('.fancybox').fancybox();

            $('.add-cart-btn').on('click', function (e) {
                e.preventDefault();
                var $this = $(this);
                $('#add-to-cart-dialog').dialog({
                    width: '675',
                    title: 'Add Item To Cart',
                    draggable: false,
                    resizable: false,
                    modal: true,
                    open: function () {
                        var dialog = $(this);
                        $(this).removeClass('hide');
                        $('li.number-of-items input').focus();

                        $('#add-to-cart-dialog').find('.add-success-msg').addClass('hide');
                        dialog.find('span.name').text($this.data('product-name'));
                        dialog.find('span.unit-price').text($this.data('product-price'));
                        dialog.find('span.available-stocks').text($this.data('available-stocks'));
                        dialog.data('product-id', $this.data('product-id'));
                        dialog.data('available-stocks', $this.data('available-stocks'));
                        dialog.find('#item-num').val(1);

                        self.computeTotal();
                    }
                });

                return false;
            });

            $('#item-num').on('keyup', self.computeTotal);
            $('#item-num').on('blur', self.checkTotal);

            $('.btn-add').on('click', self.addToCart);
            $('.btn-close').on('click', function () {
                $('#add-to-cart-dialog').dialog('destroy');
            });
        },

        addToCart: function (e) {
            var products = $.cookie('products');
            var productId = $('#add-to-cart-dialog').data('product-id');
            var stocks = $('#add-to-cart-dialog').data('available-stocks');
            var num = $('#item-num').val();

            if (!/^\d+$/.test(num)) {
                return false;
            } else if (parseInt(num) > parseInt(stocks)) {
                $('#add-to-cart-dialog').find('.out-of-stock-msg').removeClass('hide');
                return false;
            } else if (products == null || products == "") {
                $.cookie('products', self.stringifyItem(productId, num), { path: '/' });
            } else {
                var list = $.cookie('products').split('&');
                var exist = false;
                var i = 0;
                products = "";

                window.list = list;
                $(list).each(function (i, item) {
                    var list_id = item.split('=')[0];
                    var list_num = item.split('=')[1];


                    if (list_id == productId) {
                        //override count of existing cookie
                        list_num = num;
                        exist = true;
                    }

                    if (parseInt(list_num) <= 0) { return false; }

                    if (products == "") {
                        products = self.stringifyItem(list_id, list_num);
                    } else {
                        products = products + "&" + self.stringifyItem(list_id, list_num);
                    }
                });

                if (!exist) {
                    products = products + "&" + self.stringifyItem(productId, num);
                }
                $.cookie('products', products, { path: '/' });
            }

            window.location.href = 'mycart.aspx';
            //$('#add-to-cart-dialog').find('.add-success-msg').removeClass('hide');

        },

        stringifyItem: function (id, num) {
            return id + "=" + num;
        },

        computeTotal: function () {
            var num = parseFloat($('#item-num').val());
            var price = parseFloat($('span.unit-price').text());
            var total = num * price;

            $('li.total-price span').html("Php " + total);
        },

        checkTotal: function () {
            if ($('#item-num').val() == "") {
                $('#item-num').val(0.00);
            }

            $('#item-num').on('keyup', self.computeTotal);
        }
    }
} ();



$(document).ready(function () {
    etrade.products.init(); 
});