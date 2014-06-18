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
        $(document).ready(function () {
            $('form').submit(function () {
                return false;
            });

            $('#reset-report').on('click', function (e) {
                e.preventDefault();

                $(this).attr('disabled', 'disabled');
                //show loader
                $('#generate-loader').removeClass('hide');

                var url;
                url = $('.txt-branch').val();

                $.ajax({
                    url: url,
                    dataType: 'json',
                    type: 'GET',
                    success: function (data) {
                        window.data = data;
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
                                        $('#generate-loader').addClass('hide');
                                        $('#reset-report').removeAttr('disabled');
                                    }
                                }
                            });
                        }

                    }
                });

            });

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
                            len = data.length;
                            for (i = 0; i < len; i++) {
                                // post to save the data
                                console.log('product id', data[i].ProductID);
                                console.log('product units stock', data[i].UnitsInStock);
                                $.ajax({
                                    url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                                    type: 'GET',
                                    data: { id: data[i].ProductID, total: data[i].UnitsInStock },
                                    success: function (data) {

                                    }
                                });
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