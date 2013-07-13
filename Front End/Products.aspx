<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Front_End_Products" %>

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

    </br>
    <table style="width: 100%">
        <tr>
            <td style="height: 30px; text-align: right; width: 236px;">
            </td>
            <td style="text-align: center; height: 30px">

    <asp:Label ID="Label1" runat="server" Text="PRODUCT CATEGORIES" ForeColor="Black"></asp:Label>
            </td>
            <td style="height: 30px; text-align: left">
            </td>
        </tr>
        <tr>
            <td style="text-align: right; height: 90px; width: 236px;">
                <asp:Image ID="Image1" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/AVG.jpg" Width="80px" />
            </td>
            <td style="text-align: center; height: 90px">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Front End/Antivirus.aspx">Antivirus</asp:HyperLink>
            </td>
            <td style="text-align: left; height: 90px">
                <asp:Image ID="Image2" runat="server" Height="100px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/McAfee.JPG" Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image3" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/Seagate.jpg" Width="80px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/Front End/AHardDisk.aspx">Hard Disk Drive</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image4" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/Toshiba.jpg" Width="80px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; height: 30px; width: 236px;">
                <asp:Image ID="Image5" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/HP 2.jpg" Width="80px" />
            </td>
            <td style="text-align: center; height: 30px">
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/Front End/AHeadSet.aspx">Headset</asp:HyperLink>
            </td>
            <td style="text-align: left; height: 30px">
                <asp:Image ID="Image11" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/HP 3.jpg" Width="80px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image6" runat="server" Height="70px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/Bluetooth KB 2.jpg" Width="100px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink4" runat="server" 
                    NavigateUrl="~/Front End/AKeyBoard.aspx">Keyboard</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image12" runat="server" Height="70px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/Multimedia KB 2.jpg" Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image7" runat="server" Height="70px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/Apacer.jpg" Width="100px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink5" runat="server" 
                    NavigateUrl="~/Front End/AMemory.aspx">Memory</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image13" runat="server" Height="70px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/Geil.jpg" Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image8" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/Windows Vista Premium.jpg" Width="70px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink6" runat="server" 
                    NavigateUrl="~/Front End/AOperatingSystem.aspx">Operating System</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image14" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/Windows Vista Ultimate.jpg" Width="70px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image9" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/DELL.jpg" Width="80px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="~/Front End/AMonitor.aspx">Monitor</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image15" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/Samsung.jpg" Width="80px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image10" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/HP Notebook.jpg" Width="100px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="~/Front End/ALapTop.aspx">Laptop</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image16" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/Asus Laptop.jpg" Width="100px" />
            </td>
        </tr>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image21" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/p2.jpg" Width="100px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="~/Front End/APrinter.aspx">Printer</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image22" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/p3.jpg" Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 236px;">
                <asp:Image ID="Image23" runat="server" Height="80px" ImageAlign="Right" 
                    ImageUrl="~/Front End/productimages/m2.jpg" Width="80px" />
            </td>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="~/Front End/AMouse.aspx">Mouse</asp:HyperLink>
            </td>
            <td style="text-align: left">
                <asp:Image ID="Image24" runat="server" Height="80px" ImageAlign="Left" 
                    ImageUrl="~/Front End/productimages/m3.jpg" Width="80px" />
            </td>
        </tr>
    </table>
    </br>

    </asp:Content>

