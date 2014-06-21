<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="total.aspx.cs" Inherits="Front_End_views_TotalInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <link href="../../assets/stylesheets/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="../../assets/javascripts/jquery.js" type="text/javascript"></script>
    <link href="../../assets/stylesheets/bootstrap_custom.css" rel="stylesheet" type="text/css" />

    <div class="col-5">
    <form role="form">
        <div class="form-group">
            <label class="control-label">Branch Url: </label>
            <input type="text" class="form-control txt-branch"/>
        </div>
        <div class="form-group">
            <label class="control-label">Branch Url: </label>
            <input type="text" class="form-control txt-branch"/>
        </div>
        <div class="form-group">
            <label class="control-label">Branch Url: </label>
            <input type="text" class="form-control txt-branch"/>
        </div>

        <button type="submit" id="reset-report" class="btn btn-reset btn-default">Reset Report</button>
        <button type="submit" id="generate-report" class="btn btn-generate btn-default">Generate Report</button>

        <img src="../../assets/images/ajax-loader.gif" class="hide" id="generate-loader"/>
    </form>
    </div>

    <script type="text/javascript">
        var com = {};
        com = {
            urls: [],
            init: function () {
                $('form').submit(function () {
                    return false;
                });

                $('#reset-report').on('click', this.resetCallback);
                $('#generate-report').on('click', this.generateReport);
            },

            generateReport: function(e) {
                
            },

            resetCallback: function (e) {
                e.preventDefault();

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
                            if (i == len) { com.hideLoader(); }
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
            window.ctr = 0;
            window.ctr_obj_len = 0;
            window.branch1 = [];
            window.branch2 = [];
            window.branch3 = [];

            $('#generate-report').on('click', function (e) {
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