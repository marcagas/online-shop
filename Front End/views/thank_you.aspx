<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="thank_you.aspx.cs" Inherits="Front_End_views_thank_you" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
THANK YOU!
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script src="../../assets/javascripts/thankyou.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $.removeCookie('products');
        });
    </script>    
</asp:Content>

