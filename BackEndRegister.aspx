<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackEndRegister.aspx.cs" Inherits="BACKEND_BackEndRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>E-Trade Enterprise</title>
    <link href="Styles1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 42px;
        }
    </style>
</head>
<body>
    <div id="wrapper">

        <form id="form1" runat="server">
        
            <div id="header">
                <span class="title">E-Trade Administration</span>
                <span class="breadcrumb">
                    <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" 
                    Font-Size="0.8em" PathSeparator=" : ">
                        <CurrentNodeStyle ForeColor="#333333" />
                        <NodeStyle Font-Bold="True" ForeColor="#284E98" />
                        <PathSeparatorStyle Font-Bold="True" ForeColor="#507CD1" />
                        <RootNodeStyle Font-Bold="True" ForeColor="#507CD1" />
                    </asp:SiteMapPath>
                </span>
            </div>
        
            <div id="content">
            </div>
            
            <div id="navigation">
              <table width="800px" cellpadding="3" ForeColor="#4A3C8C" style="height: 307px" >
                                
                                    <td>
                                        Title
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList2" runat="server" Height="24px" Width="186px">
                                            <asp:ListItem Selected="True"></asp:ListItem>
                                            <asp:ListItem>Owner</asp:ListItem>
                                            <asp:ListItem>Manager</asp:ListItem>
                                            <asp:ListItem>Assistant Manager</asp:ListItem>
                                            <asp:ListItem>Branch Manager</asp:ListItem>
                                            <asp:ListItem>Supply Checker</asp:ListItem>
                                            <asp:ListItem>Technician</asp:ListItem>
                                            <asp:ListItem>Contractual Employee</asp:ListItem>
                                            <asp:ListItem>Full Time Employee</asp:ListItem>
                                            <asp:ListItem>System Administrator</asp:ListItem>
                                            <asp:ListItem>Data Entry Operator</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="TextBox10" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" 
                                            ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <tr>
                                    <td>
                                        Title of Courtesy
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="187px">
                                            <asp:ListItem Selected="True"></asp:ListItem>
                                            <asp:ListItem>Mr.</asp:ListItem>
                                            <asp:ListItem>Ms.</asp:ListItem>
                                            <asp:ListItem>Mrs.</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="DropDownList1" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" 
                                            ForeColor="#FF3300"></asp:RequiredFieldValidator>
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
                                    <td class="style1">
                                        Birth Date
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="TextBox8" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="TextBox8" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" 
                                            ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="Label1" runat="server" Text="(MM/DD/YYYY)"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Hire Date
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox9" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="TextBox9" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" 
                                            ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="(MM/DD/YYYY)"></asp:Label>
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
                                        User Name
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
                                        <asp:TextBox ID="TextBox10" runat="server" BorderColor="#CC3300" 
                                            EnableViewState="true" Font-Bold="True" ForeColor="Red" Height="22px" 
                                            Width="189px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="TextBox4" ControlToValidate="TextBox10" 
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
                <asp:Button ID="Button1" runat="server" Text="Register" onclick="Button1_Click" 
                    Width="143px" />
            </div>
        </form>
     </div>
</body>
</html>

