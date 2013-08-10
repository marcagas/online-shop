<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="products_show.aspx.cs" Inherits="Front_End_views_products_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../assets/stylesheets/products.css" rel="stylesheet" type="text/css" />
    <script src="../../assets/javascripts/products.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <section class="products-categories-show">
        <div class="header">
            <p class="lead">
                <% 
                    Response.Write(category_name);
                %>
            </p>
            <!--<a href="mycart.aspx" class="view-my-cart">
                <i class="icon-eye-open"></i>
                View My Cart
            </a>-->
        </div>
        
        <ul class="products-list">
            <%
                while (products.Read())
                {
                    string productId = products[0].ToString();
                    string productName = products[1].ToString();
                    string productPrice = products[5].ToString();
                    string productStocks = products[6].ToString();
            %>
                    <li class="product-details-wrapper clearfix">
                        <img class="product-img" width="150px" height="150px" src="<% Response.Write("data:image/jpg;base64," + Convert.ToBase64String((byte[])products[10])); %>" />
                        <div class="product-info">
                            <p>Name: <span class="product-name"><% Response.Write(productName); %></span></p>
                            <p>Price: <span class="product-price">Php <% Response.Write(productPrice); %></span></p>
                            <p>Stocks: <span class="product-stocks"><% Response.Write(productStocks); %></span></p>
                        </div>                        
                        <div class="add-to-cart-wrapper">
                            <a href="#" class="btn btn-danger add-cart-btn" data-product-id="<% Response.Write(productId); %>" data-product-name="<% Response.Write(productName); %>" data-product-price="<% Response.Write(productPrice); %>" data-available-stocks="<% Response.Write(productStocks); %>">Add To Cart</a>
                            <!--<form target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
                                <input type="hidden" name="cmd" value="_s-xclick">
                                <input type="hidden" name="hosted_button_id" value="TADAJRT6W5CBS">
                                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_cart_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                                </form>-->

                        </div>
                    </li>    
            <%
                }
            %>
        </ul>
    </section>

    <div id="add-to-cart-dialog" class="hide">
        <%
            if (Session["logged_in_info"] == null)
            {
                
        %>  
            <p class="lead">You must be logged in to purchase this item! Click <a href="login.aspx">here to login.</a></p>
            
        <%  }
            else
            { 
        %>
            <section class="item-info-wrapper">
                <div class="item-info">
                    <ul>
                        <li>
                            <label>Item: </label>
                            <span class="name">AVG</span>
                        </li>
                        <li>
                            <label>Unit Price: </label>
                            <span class="unit-price">12000</span>        
                        </li>
                        <li>
                            <label>Available Stocks: </label>
                            <span class="available-stocks">12000</span>        
                        </li>
                    </ul>
                    
                </div>

                <div class="item-pricing">
                    <ul>
                        <li class="number-of-items">
                            <label>Number of Items:</label>
                            <input type="text" value="1" id="item-num" />
                        </li>
                        <li class="total-price">
                            <label>Total Price: </label>
                            <span>12000</span>
                        </li>
                    </ul>
                    
                    
                </div>
                <div class="dialog-footer">
                    <a href="mycart.aspx" class="view-my-cart">
                        <i class="icon-eye-open"></i>
                        View My Cart
                    </a>
                    <div class="action">
                        <p class="add-success-msg hide"><i class="icon-check"></i> Successfully Added Item to Cart!</p>
                        <button type="button" class="btn btn-primary btn-add">
                            Add
                        </button>
                    </div>
                    
                </div>
                        
            </section>
        <% } %>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script>
        $('li.products').addClass('active');
    </script>
</asp:Content>

