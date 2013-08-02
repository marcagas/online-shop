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

</asp:Content>

<asp:Content ID="jsContent" ContentPlaceHolderID="pageSpecificJavaScript" Runat="server">
    <script>
        $(document).ready(function () {
            $('#main-menu').find('li.home').addClass('active');
        });
    </script>    
</asp:Content>