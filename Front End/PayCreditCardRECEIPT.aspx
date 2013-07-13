<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="PayCreditCardRECEIPT.aspx.cs" Inherits="Front_End_PayCreditCardRECEIPT" %>

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
                &nbsp;</td>
            <td style="text-align: center; height: 30px">

                <asp:Label ID="Label1" runat="server" 
                    style="font-weight: 700; font-size: x-large; color: #000000" Text="RECEIPT"></asp:Label>
            </td>
            <td style="text-align: center; height: 30px" colspan="2">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
            </td>
            <td style="text-align: center; height: 30px">

                <asp:Label ID="Label2" runat="server" style="font-weight: 700; color: #000000" 
                    Text="Thank you for purchasing from E-trade Enterprise"></asp:Label>

                <br />
            </td>
            <td style="text-align: center; height: 30px" colspan="2">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; height: 31px; width: 236px;">
                <asp:Label ID="Label3" runat="server" style="color: #000000" Text="Order No.:"></asp:Label>
            </td>
            <td style="text-align: center; height: 31px">
                &nbsp;</td>
            <td style="text-align: center; height: 31px" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                <asp:Label ID="Label4" runat="server" style="color: #000000" Text="Quantity"></asp:Label>
            </td>
            <td style="text-align: center; height: 30px;">
                <asp:Label ID="Label5" runat="server" style="color: #000000" Text="Name"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px;" colspan="2">
                <asp:Label ID="Label6" runat="server" style="color: #000000" 
                    Text="Total Amount:"></asp:Label>
            </td>
        </tr>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;" colspan="2">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
        </table>
    </asp:Content>





