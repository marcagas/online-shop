<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="PaymentCREDITCARD.aspx.cs" Inherits="Front_End_PaymentCREDITCARD" %>

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
                <asp:Label ID="Label1" runat="server" 
                    style="font-weight: 700; color: #003366; font-size: larger" Text="PAYMENT"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
                <asp:Label ID="Label6" runat="server" style="color: #000000" Text="Name:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                <asp:TextBox ID="TextBox4" runat="server" BorderColor="#CCCCCC" Width="215px"></asp:TextBox>
                                <span style="color: #000000; text-align: left;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
                <asp:Label ID="Label7" runat="server" style="color: #000000" Text="Address:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                                <span style="color: #000000; text-align: left;">
                                        <asp:TextBox ID="TextBox5" runat="server" BorderColor="#CCCCCC" 
                                            Font-Bold="True" ForeColor="Red" Height="64px" TextMode="MultiLine" 
                                            Width="213px" style="color: #000000"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
                <asp:Label ID="Label8" runat="server" style="color: #000000" Text="City:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                <asp:TextBox ID="TextBox9" runat="server" BorderColor="#CCCCCC" Width="215px"></asp:TextBox>
                                <span style="color: #000000; text-align: left;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="TextBox9" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
                <asp:Label ID="Label9" runat="server" style="color: #000000" Text="Region:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                <asp:TextBox ID="TextBox10" runat="server" BorderColor="#CCCCCC" Width="215px"></asp:TextBox>
                                <span style="color: #000000; text-align: left;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="TextBox10" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
                <asp:Label ID="Label10" runat="server" style="color: #000000" 
                    Text="Postal Code:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                                <span style="color: #000000">
                                    <asp:TextBox ID="TextBox11" runat="server" Width="210px" 
                                    BorderColor="#CCCCCC"></asp:TextBox>
                                <span style="color: #000000; text-align: left;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ControlToValidate="TextBox11" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="TextBox11" ErrorMessage="Wrong Format" 
                                        ValidationExpression="\d+$"></asp:RegularExpressionValidator>
                                    </span>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
                <asp:Label ID="Label2" runat="server" style="color: #000000" Text="Credit Card"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px" colspan="2">

                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="211px">
                    <asp:ListItem Selected="True"></asp:ListItem>
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>MasterCard</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="*"></asp:RequiredFieldValidator>

                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; height: 31px; width: 236px;">
                <asp:Label ID="Label3" runat="server" style="color: #000000" 
                    Text="Issuing Bank:"></asp:Label>
            </td>
            <td style="text-align: left; height: 31px" colspan="2">
                                <span style="color: #000000; text-align: left;">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="210px" 
                                    BorderColor="#CCCCCC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                <asp:Label ID="Label4" runat="server" style="color: #000000" 
                    Text="Bank Number:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px;" colspan="2">
                                <span style="color: #000000">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="210px" 
                                    BorderColor="#CCCCCC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="Please Enter Numbers Only" 
                                        ValidationExpression="\d+$"></asp:RegularExpressionValidator>
                                    </span></td>
        </tr>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                <asp:Label ID="Label5" runat="server" style="color: #000000" 
                    Text="Validation Number:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px;" colspan="2">
                                <span style="color: #000000">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="210px" 
                                    BorderColor="#CCCCCC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="Please Enter Numbers Only" 
                                        ValidationExpression="\d+$"></asp:RegularExpressionValidator>
                                    </span></td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                <asp:Label ID="Label11" runat="server" style="color: #000000" 
                    Text="Date:"></asp:Label>
            </td>
            <td style="text-align: left; height: 30px;" colspan="2">
                                <span style="color: #000000; text-align: left;">
                                    <asp:TextBox ID="TextBox12" runat="server" Width="210px" 
                                    BorderColor="#CCCCCC"></asp:TextBox>
                                <span style="color: #000000">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                <asp:Label ID="Label12" runat="server" Text="(DD/MM/YYYY)"></asp:Label>
                                    </span>
                                    </span>
                                </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px; height: 30px;">
                &nbsp;</td>
            <td style="text-align: left; height: 30px;">
                <asp:Button ID="Button1" runat="server" Text="Accept" Width="101px" 
                    onclick="Button1_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" 
                    Width="105px" />
            </td>
            <td style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
        </table>
    </asp:Content>


