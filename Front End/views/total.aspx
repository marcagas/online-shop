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
        <button type="submit" id="generate-report" class="btn btn-generate btn-default">Generate Report</button>
        <img src="../../assets/images/ajax-loader.gif" class="hide" id="generate-loader"/>
    </form>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('form').submit(function () {
                return false;
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

                    $.ajax({
                        url: url,
                        dataType: 'json',
                        type: 'GET',
                        success: function (data) {
                            window.data = data;
                            var allow_save = false;
                            var posted = false;

                            // reset database
                            if (!reset_done) {
                                reset_done = true;
                                $.ajax({
                                    url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                                    type: 'GET',
                                    data: { reset: 'true' },
                                    success: function (data) {
                                    }
                                });
                            }

                            setTimeout(function () {
                                $.ajax({
                                    url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                                    type: 'GET',
                                    data: { id: data[0].ProductID, total: data[0].UnitsInStock },
                                    success: function (d) {                                        
                                        len = data.length;
                                        for (var i = 1; i<=len; i++) {
                                            // post to save the data
                                            $.ajax({
                                                url: "/online-shop/Front%20End/views/consolidate_branch.aspx",
                                                type: 'GET',
                                                data: { id: data[i].ProductID, total: data[i].UnitsInStock },
                                                success: function (data) {
                                                    console.log(data);
                                                }
                                            });
                                        }
                                    }
                                });

                            }, 2000);

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