etrade.products = function () {
    var self;

    return {
        init: function () {
            self = this;

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
                        dialog.find('#item-num').val(1);

                        self.computeTotal();
                    }
                });

                return false;
            });

            $('#item-num').on('keyup', self.computeTotal);
            $('#item-num').on('blur', self.checkTotal);

            $('.btn-add').on('click', self.addToCart);
        },

        addToCart: function (e) {
            var products = $.cookie('products');
            var productId = $('#add-to-cart-dialog').data('product-id');
            var num = $('#item-num').val();

            if (num == NaN || productId == null) {
                return false;
            } else if (products == null || products == "") {
                $.cookie('products', self.stringifyItem(productId, num));
            } else {
                console.log('else>>>');
                var list = $.cookie('products').split('&');
                var exist = false;

                products = "";

                window.list = list;
                console.log('list', list);
                $(list).each(function (i, item) {
                    var list_id = item.split('=')[0];
                    var list_num = item.split('=')[1];

                    if (list_id == productId) {
                        //override count of existing cookie
                        list_num = num;
                        exist = true;
                    }

                    if (products == "") {
                        products = self.stringifyItem(list_id, list_num);
                    } else {
                        products = products + "&" + self.stringifyItem(list_id, list_num);
                    }
                    console.log('item', item);
                });

                if (!exist) {
                    products = products + "&" + self.stringifyItem(productId, num);
                }
                console.log('products >>>>>>>>', products);
                $.cookie('products', products);
            }

            $('#add-to-cart-dialog').find('.add-success-msg').removeClass('hide');
        },

        stringifyItem: function (id, num) {
            return id + "=" + num;
        },

        computeTotal: function () {
            var num = parseFloat($('#item-num').val());
            var price = parseFloat($('span.unit-price').text());
            var total = num * price;

            $('li.total-price span').html(total);
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