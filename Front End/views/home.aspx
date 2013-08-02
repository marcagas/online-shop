<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Front_End_views_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="sliderContents" ContentPlaceHolderID="sliderContent" runat="server">
    <div id="products-carousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#products-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#products-carousel" data-slide-to="1" class=""></li>
        <li data-target="#products-carousel" data-slide-to="2" class=""></li>
        <li data-target="#products-carousel" data-slide-to="3" class=""></li>
        <li data-target="#products-carousel" data-slide-to="4" class=""></li>
    </ol>

    <div class="carousel-inner">
        <div class="active item">
            <img src="../../assets/images/banners/slide01.jpg" />
        </div>
        <div class="item">
            <img src="../../assets/images/banners/slide02.jpg" />
        </div>
        <div class="item">
            <img src="../../assets/images/banners/slide03.jpg" />
        </div>
        <div class="item">
            <img src="../../assets/images/banners/slide04.jpg" />
        </div>
        <div class="item">
            <img src="../../assets/images/banners/slide05.jpg" />
        </div>
    </div>  
    <a class="carousel-control left" href="#products-carousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#products-carousel" data-slide="next">&rsaquo;</a>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <form id="form1" runat="server">
    <div id="flash1"></div>
    <p>Get a chance to enjoy our products at limited offers and discount every time you buy! We can also guarantee the fastest and safest way to pay your bills with the help of our partnership with Paypal and other billing companies. </p>
    <p>What are you waiting for? Sign up now and enjo our exclusive promors to our registered members. Get to know more about our products as we want to have our valued customers to enjoy our services.</p>
    <div id="featured-products">
        <h3>Featured Products</h3>
        
        <ul class="products-list">
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">AVG</span>
                    <span class="product-category">Anti-Virus</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Kaspersky</span>
                    <span class="product-category">Anti-Virus</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Microsoft Office 2010</span>
                    <span class="product-category">Professional</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Sony</span>
                    <span class="product-category">Headset</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">McAfee</span>
                    <span class="product-category">Anti-Virus</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">MSI Optical</span>
                    <span class="product-category">Mouse</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Linksys</span>
                    <span class="product-category">Wifi Router</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Asus Monitor</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">AMD Sempron</span>
                    <span class="product-category">Microprocessor</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Hewlett Packard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Kingston</span>
                    <span class="product-category">External Driver</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="#" width="100px" height="100px" />
                    <span class="product-name">Maxtor</span>
                    <span class="product-category">External Driver</span>
                </a>
            </li>

        </ul>
    </div>
    <div id="flash2"></div>
    </form>
</asp:Content>

<asp:Content ID="jsContent" ContentPlaceHolderID="pageSpecificJavaScript" Runat="server">
    <script>
        $(document).ready(function () {
            $('#main-menu').find('li.home').addClass('active');
        });
    </script>    
</asp:Content>