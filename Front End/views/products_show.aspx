<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="products_show.aspx.cs" Inherits="Front_End_views_products_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../assets/stylesheets/products.css" rel="stylesheet" type="text/css" />
    <script src="../../assets/javascripts/products.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <section class="products-categories-show">
        <p class="lead">
            <% 
                Response.Write(category_name);
            %>
        </p>
        <ul class="products-list">
            <%
                while (products.Read())
                {
            %>
                    <li class="product-details-wrapper clearfix">
                        <img class="product-img" width="150px" height="150px" src="<% Response.Write("data:image/jpg;base64," + Convert.ToBase64String((byte[])products[10])); %>" />
                        <div class="product-info">
                            <p>Name: <span class="product-name"><% Response.Write(products[1].ToString()); %></span></p>
                            <p>Price: <span class="product-price">Php <% Response.Write(products[5].ToString()); %></span></p>
                            <p>Stocks: <span class="product-stocks"><% Response.Write(products[6].ToString()); %></span></p>
                        </div>                        
                        <div class="add-to-cart-wrapper">
                            <a href="#" class="btn btn-danger">Add To Cart</a>
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
            
        <%  }
            else
            { %>

        <% } %>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script>
        $('li.products').addClass('active');
    </script>
</asp:Content>

