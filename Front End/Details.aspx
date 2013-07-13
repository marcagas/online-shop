<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Front_End_Details" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table id="dl">
   <tr><td>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" 
        DataSourceID="SqlDataSource1" onitemdatabound="use" BackColor="White" 
           BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
           GridLines="Horizontal" RepeatColumns="1">
        <AlternatingItemStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <ItemTemplate>
            ProductName:
             <asp:Label ID="ProductNameLabel" runat="server" 
                Text='<%# Eval("ProductName") %>' />
            <br />
            UnitPrice:
            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
            <br />
            UnitsInStock:
            <asp:Label ID="UnitsInStockLabel" runat="server" 
                Text='<%# Eval("UnitsInStock") %>' />
            <br />
            <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="250px" Width="200px" />
            <br />--%>
            <asp:ImageButton ID="ImageButton1" CausesValidation="false" runat="server" ImageUrl="~/Front End/img/buy_now.png" PostBackUrl='<%#"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=wd.pra_1317033108_biz@gmail.com&image_url=http://www.gravatar.com/avatar/6329074fd4edc72597a688f2c65ff44c.png&item_name="+Eval("ProductName")+"&item_number=132&amount="+Eval("UnitPrice")%>' />
            
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:DataList>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>"
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [CategoryID] FROM [Products] WHERE ([ProductName] = @ProductName)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductName" QueryStringField="pName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td><td class="style2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</br></br>
    <%--<asp:Button ID="Button1" runat="server" Text="Add to Cart" OnClick="Button1_Click" />--%>
    QUANTITY<br /><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ControlToValidate="TextBox1" ErrorMessage="must fill some value"></asp:RequiredFieldValidator>
           <asp:RangeValidator ID="RangeValidator1" runat="server" 
               ControlToValidate="TextBox1" ErrorMessage="must fill value 1-1000" 
               MaximumValue="1000" MinimumValue="1" Display="Dynamic" Type="Integer"></asp:RangeValidator>
           <br />
    <asp:ImageButton ID="ImageButton2" runat="server"   
        ImageUrl="~/Front End/img/AddToCart.gif" onclick="ImageButton2_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
   
    </td></tr></table>

    <br />
</asp:Content>


