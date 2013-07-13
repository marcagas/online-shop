<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="AOperatingSystem.aspx.cs" Inherits="Front_End_AOperatingSystem" %>

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


    Printer<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="ProductID" 
        DataSourceID="ObjectDataSource1" PageSize="5" Width="862px">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                SortExpression="UnitPrice" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" 
                SortExpression="UnitsInStock" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                ReadOnly="True" SortExpression="CategoryName" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="DeleteProduct" InsertMethod="AddProduct" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetProductsByCategoryID" TypeName="ProductsBLL" 
        UpdateMethod="UpdateProduct">
        <DeleteParameters>
            <asp:Parameter Name="productID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productName" Type="String" />
            <asp:Parameter Name="supplierID" Type="Int32" />
            <asp:Parameter Name="categoryID" Type="Int32" />
            <asp:Parameter Name="quantityPerUnit" Type="String" />
            <asp:Parameter Name="unitPrice" Type="Decimal" />
            <asp:Parameter Name="unitsInStock" Type="Int16" />
            <asp:Parameter Name="unitsOnOrder" Type="Int16" />
            <asp:Parameter Name="reorderLevel" Type="Int16" />
            <asp:Parameter Name="discontinued" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="6" Name="categoryID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="productName" Type="String" />
            <asp:Parameter Name="supplierID" Type="Int32" />
            <asp:Parameter Name="categoryID" Type="Int32" />
            <asp:Parameter Name="quantityPerUnit" Type="String" />
            <asp:Parameter Name="unitPrice" Type="Decimal" />
            <asp:Parameter Name="unitsInStock" Type="Int16" />
            <asp:Parameter Name="unitsOnOrder" Type="Int16" />
            <asp:Parameter Name="reorderLevel" Type="Int16" />
            <asp:Parameter Name="discontinued" Type="Boolean" />
            <asp:Parameter Name="productID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Front End/Products.aspx">Back</asp:HyperLink>


     <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="PicID" DataSourceID="SqlDataSource1" 
        PageSize="5" Width="872px">
        <Columns>
            <asp:BoundField DataField="PicID" HeaderText="PicID" InsertVisible="False" 
                ReadOnly="True" SortExpression="PicID" Visible="False" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                SortExpression="CategoryName" Visible="False" />
        <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                 <asp:Image ID="img" runat="server" Height= '150px' Width='150px' ImageUrl='<%# "Handler.ashx?PicID=" +Eval("PicID") %>'></asp:Image>
                     </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        SelectCommand="SELECT * FROM [ProductImage] WHERE ([CategoryName] = @CategoryName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" DefaultValue="OS" 
                Name="CategoryName" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />


    <asp:GridView ID="GridView3" runat="server" Visible="False" 
        onselectedindexchanged="GridView3_SelectedIndexChanged">
    </asp:GridView>


    </asp:Content>




