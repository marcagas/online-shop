<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%--<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="menu">
		    <ul>
			    <li class="first"><a href="Home.aspx"><b>Home</b></a>
                <li class="second"><a href="Products.aspx"><b>Products</b></a>
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
</asp:Content>--%>   

<asp:Content ID="loginContent" runat="server" contentplaceholderid="bodycontent">
    
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    
	    <div id="page">
             <%--<asp:Login ID="Login1" runat="server" 
                     BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                 <TextBoxStyle Font-Size="0.8em" />
                 <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                     ForeColor="White" />
            </asp:Login>--%>

  
    User Name
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="TextBox1" ErrorMessage="fill usename "></asp:RequiredFieldValidator>
<br />

Password<br />
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="TextBox2" ErrorMessage="fill password"></asp:RequiredFieldValidator>
<asp:ImageButton ID="ImageButton3" runat="server" AlternateText="sign in" 
    onclick="ImageButton3_Click" ImageUrl="~/Front End/img/sign in.bmp" />
<asp:Label ID="Label1" runat="server"></asp:Label>
    <a href="PasswordRecovery.aspx" style={color:red;} >Forgot password</a>?
Don&#39;t have an Account<br />
                    Register
                    <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="Register.aspx">here</asp:HyperLink>
                   .</div>
 </asp:Content>