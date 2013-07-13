<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="PaymentCASH.aspx.cs" Inherits="Front_End_PaymentCASH" %>

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

                &nbsp;</td>
            <td style="height: 30px; text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
            </td>
            <td style="text-align: center; height: 30px">

                <br />
            </td>
            <td style="height: 30px; text-align: left">
            </td>
        </tr>
        <tr>
            <td style="text-align: right; height: 31px; width: 236px;">
                &nbsp;</td>
            <td style="text-align: center; height: 31px">
                &nbsp;</td>
            <td style="text-align: left; height: 31px">
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: center; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Cancel" />
            </td>
            <td style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
        </table>
    </asp:Content>



