<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="PaymentMode.aspx.cs" Inherits="Front_End_PaymentMode" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="menu">
		<ul>
			<li class="first"><a href="LoginHome.aspx"><b>Home</b></a>
            <li class="second"><a href="LoginProducts.aspx"><b>Products</b></a>
            <li class="third"><a href="MyCart.aspx"><b>My Cart</b></a>
              <li><a href="#"><span class="fourth">Accessibility<b></b></span></a>
				    <ul>
					<li><a href="Home.aspx">LogOut</a></li>
                    <li><a href="LoginAccount.aspx">Account</a></li>
                    <li><a href="LoginHelp.aspx">Help</a></li>
					</ul>
                    </li> 
		</ul>
		<br class="clearfix" />
</div>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</br>
    <table style="width: 100%">
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
            </td>
            <td style="text-align: center; height: 30px">

    <asp:Label ID="Label1" runat="server" Text="PAYMENT MODE" ForeColor="Black" 
                    style="font-weight: 700"></asp:Label>
            </td>
            <td style="height: 30px; text-align: left">
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image3" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/images/credit 1.jpg" Width="80px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/Front End/PaymentCREDITCARD.aspx">Credit Card</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image4" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/images/cards_2222752a.jpg" Width="80px" />
            </td>
        </tr>
        </tr>
        </table>
    </asp:Content>

