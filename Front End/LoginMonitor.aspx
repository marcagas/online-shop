<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="LoginMonitor.aspx.cs" Inherits="Front_End_LoginMonitor" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="menu">
		<ul>
			<<li class="first"><a href="LoginHome.aspx"><b>Home</b></a>
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
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Label ID="Label1" runat="server" Text="Monitor"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" DataKeyField="CategoryID" DataSourceID="SqlDataSource1" 
        ForeColor="Black" GridLines="Both" RepeatColumns="3" 
        RepeatDirection="Horizontal" Width="875px">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="White" />
        <ItemTemplate>
            ProductName:
            <asp:Label ID="ProductNameLabel" runat="server" 
                Text='<%# Eval("ProductName") %>' />
<br />
            UnitPrice:
            <asp:Label ID="UnitPriceLabel" runat="server" 
                Text='<%# Eval("UnitPrice") %>' />
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Front End/img/detail.jpg" 
                PostBackUrl='<%#"Details.aspx?pName="+Eval("ProductName") %>' />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        SelectCommand="SELECT [ProductName], [CategoryID], [UnitPrice], [UnitsInStock] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DataList1" DefaultValue="7" Name="CategoryID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Front End/LoginProducts.aspx">Back</asp:HyperLink>


 <br />
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="PicID" DataSourceID="SqlDataSource2" Width="875px" 
        AllowPaging="True" PageSize="5">
        <Columns>
            <asp:BoundField DataField="PicID" HeaderText="PicID" InsertVisible="False" 
                ReadOnly="True" SortExpression="PicID" Visible="False" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                SortExpression="CategoryName" Visible="False" />
            <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
            <asp:Image ID="img" runat="server" Height= '100px' Width='100px' ImageUrl='<%# "Handler.ashx?PicID=" +Eval("PicID") %>'></asp:Image>
                     </ItemTemplate>
           </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        SelectCommand="SELECT * FROM [ProductImage] WHERE ([CategoryName] = @CategoryName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView4" DefaultValue="Monitor" 
                Name="CategoryName" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />


    <asp:GridView ID="GridView3" runat="server" Visible="False" 
        onselectedindexchanged="GridView3_SelectedIndexChanged">
    </asp:GridView>

    </asp:Content>

