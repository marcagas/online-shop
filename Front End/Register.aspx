<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
	     <div id="page">
              <table width="800px" cellpadding="3" ForeColor="#4A3C8C" style="height: 307px" >
                                 <tr>
                                     <td>
                                        First Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TextBox1" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Last Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="TextBox2" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email Id</td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                            ErrorMessage="Not in the correct format i.e abc@domain" ForeColor="#FF3300" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        User Id
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" runat="server" BorderColor="#CC3300" 
                                            EnableViewState="true" Font-Bold="True" ForeColor="Red" Height="22px" 
                                            Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="TextBox7" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" BorderColor="#CC3300" 
                                            EnableViewState="true" Font-Bold="True" ForeColor="Red" Height="22px" 
                                            Width="189px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                     Confirm Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox8" runat="server" BorderColor="#CC3300" 
                                            EnableViewState="true" Font-Bold="True" ForeColor="Red" Height="22px" 
                                            Width="189px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="TextBox4" ControlToValidate="TextBox8" 
                                            ErrorMessage="PassWord Doesn't Match"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Full Address
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="64px" TextMode="MultiLine" 
                                            Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="TextBox5" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Mobile No.
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                            ControlToValidate="TextBox6" Display="Dynamic" 
                                            ErrorMessage="Not in the correct format" ForeColor="#FF3300" 
                                            MaximumValue="9999999999" MinimumValue="1000000000"></asp:RangeValidator>
                                    </td>
                                </tr>
                            </table>
                  
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                     ImageUrl="~/Front End/img/submit_blue.png" 
                  onclick="ImageButton1_Click" />
                    <br /><br />
        </div>
    </asp:Content>

