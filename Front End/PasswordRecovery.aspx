<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="Front_End_PasswordRecovery" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="menu">
		<ul>
			<li class="first"><a href="Home.aspx"><b>Home</b></a>
            <li class="second"><a href="Products.aspx"><b>Products</b></a>
            <%--<li class="third"><a href=""><b>My Cart</b></a>--%>
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

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table><tr><td>Enter your email Id:</td><td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    <td><asp:ImageButton ID="ImageButton3" runat="server" 
        AlternateText="Click to get password" onclick="ImageButton3_Click" 
        ImageUrl="~/Front End/img/btn_send.png" />
      </td> </tr>
 </table>
    <br />

    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>