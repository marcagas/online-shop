﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="mycart.aspx.cs" Inherits="Front_End_views_mycart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../assets/stylesheets/mycart.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <section class="my-cart-wrapper">
        
        <%
            if (!HttpContext.Current.Request.Cookies.AllKeys.Contains("products"))
            {
                

        %>
                <div class="empty-cart">
                    <p>You have no items in your cart yet. Visit our <a href="products.aspx">product</a> page to buy items. </p>
                </div>
        <%
}
            else
            {

                /*string s = "INSERT into Sample values (" + "'elena_parse'" + ", 'just now')";
                Response.Write(Request.QueryString["name"]);
                Response.Write(s);*/
        %>  
                <form id="Form1" runat="server" action="https://www.paypal.com/cgi-bin/webscr" class="hide">
                    <asp:GridView ID="cartGrid" runat="server">
                    </asp:GridView>
                </form>

                <form id="mycartForm" class="form-horizontal" action="https://www.sandbox.paypal.com/cgi-bin/webscr?CURRENCYCODE=USD">
                    <input id="cmd" type="hidden" name="cmd" value="_cart" />
                    <input id="upload" type="hidden" name="upload" value="1" />
                    <input id="business" type="hidden" name="business" value="nikkiongbusiness2@gmail.com" />
                    <input type="hidden" name="currency_code" value="PHP" />
                    <input type="hidden" name="custom" value="<%= Request.Cookies["UserId"].Value %>" />
                    <input type="hidden" name="callback_url" value="" />
                    <input type="hidden" name="callback_timeout" value="3">
                    <input type="hidden" name="callback_version" value="1"><!--Required! -->


                    <ul class="cart-list">
                        <li class="products-list-header-wrapper">
                            <ul>
                                <li class="image-wrapper">
                                    <label>Product</label>
                                </li>
                                <li class="count-wrapper">
                                    <label>Number of Items</label>
                                </li>
                                <li class="product-price-wrapper">
                                    <label>Unit Price</label>
                                </li>
                                <li class="total-price-wrapper">
                                    <label>Total Price</label>
                                </li>
                            </ul>
                        </li>
                        <li class="product-list-wrapper product-list-template hide">
                            <ul>
                                <li class="image-wrapper">
                                    <a href="#" class="fancybox">
                                        <img src="#" width="100px" height="100px" />
                                    </a>
                                    <label>AVG Product</label>
                                </li>
                                <li class="count-wrapper">
                                    <div class="row">
                                        <input type="number" value=1 class="count" min="1"/>
                                        </div>
                                    <!--<span class="count">1</span>-->
                                </li>
                                <li class="product-price-wrapper">
                                    <span class="product-price">12, 000.00</span>
                                </li>
                                <li class="total-price-wrapper">
                                    <span class="total-price">12, 000.00</span>
                                    <a href="#" class="delete-item">
                                        Delete
                                    </a>
                                </li>
                            </ul>
                    
                        
                        </li>
                    </ul>
                    <!--<input id="item1" type="hidden" name="item_name_1" value="CDR-King Mouse" />
                    <input id="amount1" type="hidden" name="amount_1" value="100.00" />
                    <input id="shipping1" type="hidden" name="shipping_1" value="5.00" />

                    <input id="item2" type="hidden" name="item_name_2" value="LG Monitor" />
                    <input id="amount2" type="hidden" name="amount_2" value="1399.00" />
                    <input id="shipping2" type="hidden" name="shipping_2" value="50.00" />-->
                    <a href="products.aspx">
                        <i class="icon-plus-sign"></i>
                        Add Another Product
                    </a>
                    <button type="submit" class="btn btn-danger">Checkout</button>
                </form>

                <div class="paypal-cart-details">
                    <!-- Sample template generated by javascript to send to paypal -->
                    <input id="item1" type="hidden" name="item_name_1" value="CDR-King Mouse" />
                    <input id="item_number1" type="hidden" name="item_number_1" value="001" />
                    <input id="amount1" type="hidden" name="amount_1" value="100.00" />
                    <input id="shipping1" type="hidden" name="shipping_1" value="5.00" />
                </div>
        <% } %>

        
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script>
        $(document).ready(function () {
            $('li.my-cart').addClass('active');
        });
    </script>
    <script src="../../assets/javascripts/mycart.js" type="text/javascript"></script>
</asp:Content>

