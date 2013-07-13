<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="ContactUS.aspx.cs" Inherits="ContactUS" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="menu">
		<ul>
			<li class="first"><a href="Home.aspx"><b>Home</b></a>
            <li class="second"><a href="Products.aspx"><b>Products</b></a>
            <%--<li class="third"><a href="MyCart.aspx"><b>My Cart</b></a>--%>
              <li><a href="#"><span class="fourth">Accessibility<b></b></span></a>
				    <ul>
					<li><a href="Login.aspx">Login</a></li>
					<li><a href="Register.aspx">Register</a></li>
                    <li><a href="Help.aspx">Help</a></li>
					</ul>
                    </li> 
		</ul>
		<br class="clearfix" />
</div>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
	    <div id="page">
				<h2>Contact US</h2>
				<p >Main Branch:</br><B>Crosspoint Computers, Inc.</B></br>Rm.204 Cityland 8 Condo. Sen Gil Puyat Ave. Makati City</p> 
                <p>Tel. No. (02) 894-0118</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(02) 892-7149</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(02) 812-3835</br>Fax No. (02) 894-3063 </br>Email Add: <i>crosspointc@yahoo.com</i></p>
                <p>Other Branches:</p>
                <p><B>SM Dasmarinas</B></br>Dasmarinas Cavite</p>
                <p>Tel. No. (02) 359-6731</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(046) 489-7823</br>Email Add: <i>etrade_smdasma@yahoo.com</i></p>
                <p><B>SM Rosario</B></br>Rosario Cavite</p>
                <p>Tel. No. (02) 703-6236</br>Email Add: <i>etrade_smrosario@yahoo.com</i></p>
                <p><B>WalterMart Carmona</B></br>Carmona Cavite</p>
                <p>Tel. No. (02) 703-6236</p>
        </div>
    </asp:Content>