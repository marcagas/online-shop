<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="LoginHome.aspx.cs" Inherits="Front_End_LoginHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
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
<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
                <table style="width:100%; height: 848px;">
                    <tr>
                        <td>
                            <table style="width: 871px; height: 807px; margin-top: 0px;">
                                <tr>
                                    <td class="style4" colspan="6" style="height: 96px; text-align: left">
        <div id="flashcontent1" align="center">
             <object align="middle" style="height: 315px; width: 420px;">
                 <param name="movie" value="Products.swf" />
                 <embed height="240" 
                     src="http://localhost:52545/Special%20Problem%201%20(System)/Products.swf" 
                     width="890"></embed> </embed>
    </object>
                                        </div>
                                        <br />
                                        Get a chance to enjoy our products at limited offers and discount every time you 
                                        buy!<br />
                                        We can also guarantee the fastest and safest way to pay your bills with the help 
                                        of our partnership with Paypal and other billing companies.&nbsp;
                                        <br />
                                        <br />
                                        What are you waiting for? Sign up now and enjo our exclusive promors to our 
                                        registered members.<br />
                                        Get to know more about our products as we want to have our valued customers to 
                                        enjoy our services.<br />

                                        <div id="flashcontent2" align="center">
                                            <object align="middle" style="height: 315px; width: 420px;">
                                                <param name="movie" value="MSOS.swf" />
                                                <embed height="240" 
                                                    src="http://localhost:52545/Special%20Problem%201%20(System)/MSOS.swf" 
                                                    width="890"></embed> </embed>
    </object>
        </div>

                                        <br />
                                        Our Featured Products:</td>
                                </tr>
                                <tr>
                                    <td style="height: 173px; width: 144px; text-align: center">
                                        <asp:Image ID="Image2" runat="server" Height="100px" 
                                            ImageUrl="~/CD-R KING Products/Antivirus License/AVG.jpg" 
                                            style="margin-left: 1px" Width="95px" />
                                        <br />
                                        AVG
                                        <br />
                                        Anti-Virus<br />
                                    </td>
                                    <td style="width: 145px; height: 173px; text-align: center">
                                        <asp:Image ID="Image3" runat="server" Height="100px" 
                                            ImageUrl="~/CD-R KING Products/Antivirus License/Kaspersky.jpg" 
                                            style="margin-left: 0px" Width="106px" />
                                        <br />
&nbsp;&nbsp;&nbsp; Kaspersky<br />
&nbsp; Anti-Virus<br />
                                    </td>
                                    <td style="height: 173px; width: 145px; text-align: center">
                                        <asp:Image ID="Image4" runat="server" Height="99px" 
                                            ImageUrl="~/CD-R KING Products/Microsoft Office 2007/Microsoft Office Home Student.jpg" 
                                            style="margin-left: 2px" Width="91px" />
                                        <br />
                                        Miscrosoft Office 2010<br />
                                        Professional</td>
                                    <td style="height: 173px; width: 145px; text-align: center">
                                        <asp:Image ID="Image6" runat="server" Height="108px" 
                                            ImageUrl="~/CD-R KING Products/Headset/HP 6.jpg" style="margin-left: 2px" 
                                            Width="89px" />
                                        <br />
                                        Sony
                                        <br />
                                        Headset<br />
                                    </td>
                                    <td style="width: 145px; height: 173px; text-align: center">
                                        <asp:Image ID="Image19" runat="server" Height="110px" 
                                            ImageUrl="~/CD-R KING Products/Antivirus License/McAfee.JPG" 
                                            style="margin-left: 0px" Width="106px" />
                                        <br />
                                        McAfee<br />
                                        Anti-Virus<br />
                                    </td>
                                    <td style="width: 145px; height: 173px; text-align: center">
                                        <asp:Image ID="Image17" runat="server" Height="102px" 
                                            ImageUrl="~/CD-R KING Products/Mouse/MSI Optical.jpg" style="margin-left: 0px" 
                                            Width="101px" />
                                        <br />
                                        MSI Optical<br />
                                        Mouse</td>
                                </tr>
                                <tr>
                                    <td style="height: 174px; text-align: center; width: 144px">
                                        <asp:Image ID="Image10" runat="server" Height="95px" 
                                            ImageUrl="~/CD-R KING Products/Wifi Router/Linksys.jpg" 
                                            style="margin-left: 0px" Width="110px" />
                                        <br />
                                        Linksys<br />
                                        Wifi Router</td>
                                    <td style="width: 145px; height: 174px; text-align: center">
                                        <asp:Image ID="Image18" runat="server" Height="110px" 
                                            ImageUrl="~/CD-R KING Products/System Images/pic01.jpg" 
                                            style="margin-left: 0px" Width="108px" />
                                        <br />
                                        Asus Monitor<br />
                                    </td>
                                    <td style="height: 174px; width: 145px; text-align: center">
                                        <asp:Image ID="Image12" runat="server" Height="89px" 
                                            ImageUrl="~/CD-R KING Products/Processor/AMD Sempron.jpg" 
                                            style="margin-left: 0px" Width="91px" />
                                        <br />
                                        AMD Sempron<br />
                                        Microprocessor</td>
                                    <td style="height: 174px; width: 145px; text-align: center">
                                        <asp:Image ID="Image14" runat="server" Height="100px" 
                                            ImageUrl="~/CD-R KING Products/Monitor/HP.jpg" style="margin-left: 0px" 
                                            Width="95px" />
                                        <br />
                                        Hewlett Packard</td>
                                    <td style="width: 145px; height: 174px; text-align: center">
                                        <asp:Image ID="Image15" runat="server" Height="95px" 
                                            ImageUrl="~/CD-R KING Products/Back up/Kingston External.jpg" 
                                            style="margin-left: 0px" Width="96px" />
                                        <br />
                                        Kingston<br />
                                        External Drive</td>
                                    <td style="width: 145px; height: 174px; text-align: center">
                                        <asp:Image ID="Image16" runat="server" Height="101px" 
                                            ImageUrl="~/CD-R KING Products/Back up/Maxtor External.jpg" 
                                            style="margin-left: 0px" Width="95px" />
                                        <br />
                                        Maxtor<br />
                                        External Drive</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 199px">
        <div id="flashcontent" align="center">
            <object align="middle" style="height: 315px; width: 420px;">
                <param name="movie" value="LaptopNotebook.swf" />
                <embed height="240" 
                    src="http://localhost:52545/Special%20Problem%201%20(System)/LaptopNotebook.swf" 
                    width="890"></embed> </embed>
    </object>
        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
</asp:Content>
