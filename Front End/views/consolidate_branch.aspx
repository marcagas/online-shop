<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="consolidate_branch.aspx.cs" Inherits="Front_End_views_consolidate_branch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <label>Url: </label>
    <input type="text" class="branch"/>
    <a href="#" id="new-url">New Url</a>
    <a href="#" id="generate-report">Generate Report</a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

            $('#generate-report').on('click', function (e) {
                e.preventDefault();
                var url = "http://localhost:3000/online-shop/Front%20End/views/branch_inventory.aspx";
                url = $('.branch').val();

                $.ajax({
                    url: url,
                    dataType: 'json',
                    type: 'GET',
                    success: function (data) {
                        window.data = data;

                        // post to save the data

                    },
                    beforeSend: function () {
                    }
                });

                return false;
            });
        });
    </script>
</asp:Content>

