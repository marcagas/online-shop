<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="Front_End_views_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../assets/stylesheets/products.css" rel="stylesheet" type="text/css" />
    <script src="../../assets/javascripts/products.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <section class="products-index">
        <p class="lead">Categories</p>
        <ul class="categories-list">
            <%
                while (categories.Read())
                {
            %>
                    <li class="fade-category" 'data-category-id'="<% Response.Write(categories[0].ToString()); %>">
                        <a href="products_show.aspx?category=<% Response.Write(categories[0].ToString()); %>">
                            <img src="<% Response.Write("data:image/jpg;base64," + Convert.ToBase64String((byte[])categories[3])); %>" />
                        </a>
                        <span class="name"><% Response.Write(categories[1].ToString()); %></span>
                        <span class="desc"><% Response.Write(categories[2].ToString()); %></span>
                    </li>
            <%
                }
            %>        
        </ul>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script>
        $('li.products').addClass('active');
    </script>
</asp:Content>

