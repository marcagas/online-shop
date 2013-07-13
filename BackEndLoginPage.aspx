<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackEndLoginPage.aspx.cs" Inherits="BACKEND_BackEndLoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>E-Trade Enterprise</title>
    <link href="Styles1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            font-family: "Courier New", Courier, monospace;
            text-align: left;
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
            
            <div id="navigation" class="style1">
                <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" 
                    BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                    Font-Size="0.8em" ForeColor="#333333" Height="239px" 
                    style="text-align: center; margin-left: 0px" TextLayout="TextOnTop" 
                    Width="362px" onauthenticate="Login1_Authenticate">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" 
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" 
                        ForeColor="White" />
                </asp:Login>
                <div class="style2">
                </br>
                
                    <span class="style3">Don&#39;t have an account?<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Register&nbsp;
                    <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="BackEndRegister.aspx">here</asp:HyperLink>&nbsp;

 
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink9" runat="server" 
                        NavigateUrl="~/Front End/Home.aspx">Back to Home Page</asp:HyperLink>

 
                    </span>
                </div>
                
 
            </div></br>
        </form>
     </div>
</body>
</html>
