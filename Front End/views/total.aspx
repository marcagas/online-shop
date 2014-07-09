<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="total.aspx.cs" Inherits="Front_End_views_TotalInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <link href="../../assets/stylesheets/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="../../assets/javascripts/jquery.js" type="text/javascript"></script>
    <link href="../../assets/stylesheets/bootstrap_custom.css" rel="stylesheet" type="text/css" />

    <div class="col-5">
    <form role="form">
        <div class="form-group">
            <label class="control-label">SM Dasmarinas Branch Url: </label>
            <input type="text" class="form-control txt-branch"/>
        </div>
        <div class="form-group">
            <label class="control-label">SM Rosario Branch Url: </label>
            <input type="text" class="form-control txt-branch"/>
        </div>
        <div class="form-group">
            <label class="control-label">Waltermart Carmona Branch Url: </label>
            <input type="text" class="form-control txt-branch"/>
        </div>

        <button type="submit" id="reset-report" class="btn btn-reset btn-default">Reset Report</button>
        <button type="submit" id="generate-report" class="btn btn-generate btn-default">Generate Report</button>
        
        <img src="../../assets/images/ajax-loader.gif" class="hide" id="generate-loader"/>
        <br />
        <br />
        <a href="total_inventory.aspx">View Total Report</a>
    </form>
    </div>

    <script type="text/javascript">
        var com = {};
        com = {
            data: [],
            saved_data: [],
            urls: [],
            init: function () {
                $('form').submit(function () {
                    return false;
                });

                $('#reset-report').on('click', this.resetCallback);
                $('#generate-report').on('click', this.generateReport);
            },

            generateReport: function (e) {
                e.preventDefault();
                com.urls = [];
                com.data = [];

                $('.txt-branch').each(function () {
                    com.urls.push($(this).val());
                });

                // get product lists

                for (var i = 0; i < com.urls.length; i++) {
                    $.ajax({
                        url: com.urls[i],
                        dataType: 'json',
                        type: 'GET',
                        beforeSend: function () {
                            com.showLoader();
                        },
                        success: function (data, status, xhr) {
                            console.log('data', data);

                            if (this.url.match('dasma')) {
                                com.data[0] = data;
                            } else if (this.url.match('rosar')) {
                                com.data[1] = data;
                            } else if (this.url.match('carmona')) {
                                com.data[2] = data;
                            } else {
                                com.data.push(data);
                            }
                            //com.setInventory(data);

                            if (com.data.length == 3) {
                                merged_data = com.sumInventory();
                                com.saved_data = [];
                                com.setInventory(merged_data);
                            }
                        },
                        complete: function () {
                        }
                    });
                }

            },

            sumInventory: function () {
                com.merged_obj = [];
                com.merged_obj = $.extend([], com.data[0], com.data[1], com.data[2]);
                for (var i = 0; i < com.merged_obj.length; i++) {
                    com.merged_obj[i].UnitsInStock = com.data[0][i].UnitsInStock + com.data[1][i].UnitsInStock + com.data[2][i].UnitsInStock;
                    com.merged_obj[i].branch1 = com.data[0][i].UnitsInStock;
                    com.merged_obj[i].branch1_name = 'paco';

                    com.merged_obj[i].branch2 = com.data[1][i].UnitsInStock;
                    com.merged_obj[i].branch2_name = 'tamo';

                    com.merged_obj[i].branch3 = com.merged_obj[i].UnitsInStock - (com.merged_obj[i].branch1 + com.merged_obj[i].branch2);
                    console.log('merging >>>', com.merged_obj[i].branch3);
                    com.merged_obj[i].branch3_name = 'zapots';

                }

                return com.merged_obj;
            },

            setInventory: function (data) {
                var len = 0, i = 0;
                len = data.length;

                for (i = 0; i < len; i++) {
                    productId = data[i].ProductID;
                    total = data[i].UnitsInStock;
                    branch1 = data[i].branch1;
                    branch1_name = data[i].branch1_name;
                    branch2 = data[i].branch2;
                    branch2_name = data[i].branch2_name;
                    branch3 = data[i].branch3;
                    branch3_name = data[i].branch3_name;

                    console.log('data', productId);
                    console.log('units', total);
                    console.log('branch1', branch1);
                    console.log('branch2', branch2);
                    console.log('branch3', branch3);

                    $.ajax({
                        url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                        type: 'GET',
                        data: { id: productId, total: total, branch1: branch1, branch2: branch2, branch3: branch3 },
                        success: function (data) {
                            com.saved_data.push(data);
                        }, complete: function () {
                            if (com.saved_data.length == com.merged_obj.length) {
                                alert('done');
                                com.hideLoader();
                            }
                        }
                    });
                }
            },

            resetCallback: function (e) {
                e.preventDefault();
                com.urls = [];

                $('.txt-branch').each(function () {
                    com.urls.push($(this).val());
                });

                // get product lists
                $.ajax({
                    url: com.urls[0],
                    dataType: 'json',
                    type: 'GET',
                    beforeSend: function () {
                        com.showLoader();
                    },
                    success: function (data) {
                        n = data.length;
                        for (var x = 0; x < n; x++) {
                            for (var y = 0; y < n - 1; y++) {
                                if (data[y].ProductID > data[y + 1].ProductID) {
                                    var tmp = data[y + 1];
                                    data[y + 1] = data[y];
                                    data[y] = tmp;
                                }
                            }
                        }
                        console.log('data', data);
                        com.resetInventory(data);
                    },

                    complete: function () {
                    }
                });

            },

            resetInventory: function (data) {
                var len;
                var i = 0;
                len = data.length;
                for (i = 0; i < len; i++) {
                    $.ajax({
                        url: "/online-shop/Front%20End/views/total_reset.aspx",
                        type: 'GET',
                        data: { id: data[i].ProductID, total: 0 },
                        success: function (d) {
                            window.d = d;
                        },
                        complete: function () {
                            if (i == len) {
                                com.hideLoader();
                            }
                        }
                    });
                }
            },

            showLoader: function () {
                //$('btn').attr('disabled', 'disabled');
                $('#generate-loader').removeClass('hide');
            },

            hideLoader: function () {
                //$('btn').removeAttr('disabled', 'disabled');
                $('#generate-loader').addClass('hide');
            }
        };

        $(document).ready(function () {
            com.init();
            window.ctr = 0;
            window.ctr_obj_len = 0;
            window.branch1 = [];
            window.branch2 = [];
            window.branch3 = [];

            $('#gsenerate-report').on('click', function (e) {
                e.preventDefault();

                $(this).attr('disabled', 'disabled');
                // show loader
                $('#generate-loader').removeClass('hide');

                var url;
                var reset_done = false;
                //url = $('.txt-branch').val();
                //url = url || "/online-shop/Front%20End/views/branch_inventory.aspx";

                $('.txt-branch').each(function () {
                    url = $(this).val();

                    //if (url == "") { return };

                    console.log("send ajax now .>>>");
                    $.ajax({
                        url: url,
                        dataType: 'json',
                        type: 'GET',
                        success: function (data) {
                            window.data = data;
                            var i = 0;
                            window.ctr_obj_len = len = data.length;
                            for (i = 0; i < len; i++) {
                                // post to save the data
                                console.log('product id', data[i].ProductID);
                                console.log('product units stock', data[i].UnitsInStock);
                                id = data[i].ProductID;
                                total = data[i].UnitsInStock;

                                var post_interval = setInterval(function () {

                                    if (window.ctr >= window.ctr_obj_len) {
                                        clearInterval(post_interval);
                                        post_interval = null;
                                    } else {
                                        id = window.data[window.ctr].ProductID;
                                        total = window.data[window.ctr].UnitsInStock;

                                        $.ajax({
                                            url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                                            type: 'GET',
                                            data: { id: id, total: total },
                                            success: function (data) {
                                                console.log('success post to consolidate branch', window.ctr);
                                            }
                                        });

                                        console.log("after interval.......");
                                        window.ctr++;
                                    }



                                }, 2000);

                                //}, 10000);
                                /*$.ajax({
                                url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                                type: 'GET',
                                data: { id: data[i].ProductID, total: data[i].UnitsInStock },
                                success: function (data) {

                                }
                                });*/
                            }
                        },
                        beforeSend: function () {
                        }
                    });

                });


                return false;
            });
        });
</script>


</asp:Content>