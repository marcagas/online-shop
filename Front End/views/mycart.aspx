<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="mycart.aspx.cs" Inherits="Front_End_views_mycart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <%
    %>
    <form id="mycartForm" class="form-horizontal" action="https://www.paypal.com/cgi-bin/webscr">
        <input id="cmd" type="hidden" name="cmd" value="_cart" />
        <input id="upload" type="hidden" name="upload" value="1" />
        <input id="business" type="hidden" name="business" value="certified_azzztig@yahoo.com" />
        <input id="item1" type="hidden" name="item_name_1" value="CDR-King Mouse" />
        <input id="amount1" type="hidden" name="amount_1" value="100.00" />
        <input id="shipping1" type="hidden" name="shipping_1" value="5.00" />

        <input id="item2" type="hidden" name="item_name_2" value="LG Monitor" />
        <input id="amount2" type="hidden" name="amount_2" value="1399.00" />
        <input id="shipping2" type="hidden" name="shipping_2" value="50.00" />
        <input type="submit" value="Checkout" />
    </form>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script>
        $(document).ready(function () {
            $('li.my-cart').addClass('active');
        });
    </script>
</asp:Content>

