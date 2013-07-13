<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SortingWithCustomPaging.aspx.cs" Inherits="PagingSortingDataListRepeater_SortingWithCustomPaging" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Sorting and Paging Data in a Repeater</h2>
    <h3>Custom Paging</h3>
    <p style="text-align:center;">
        <asp:Button runat="server" id="SortByProductName" Text="Sort by Product Name" OnClick="SortByProductName_Click" />
        <asp:Button runat="server" id="SortByCategoryName" Text="Sort by Category" OnClick="SortByCategoryName_Click" />
        <asp:Button runat="server" id="SortBySupplierName" Text="Sort by Supplier" OnClick="SortBySupplierName_Click" />
    </p>
    <p>
        <asp:Repeater ID="Products" runat="server" DataSourceID="ProductsDataSource" EnableViewState="False">
            <ItemTemplate>
                <h4><asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>'>
                </asp:Label></h4>
                Category:
                <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>'>
                </asp:Label><br />
                Supplier:
                <asp:Label ID="SupplierNameLabel" runat="server" Text='<%# Eval("SupplierName") %>'>
                </asp:Label><br />
                <br />
                <br />
            </ItemTemplate>
        </asp:Repeater>
        
        <asp:ObjectDataSource ID="ProductsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetProductsPagedAndSorted" TypeName="ProductsBLL" OnSelecting="ProductsDataSource_Selecting">
            <SelectParameters>
                <asp:Parameter Name="sortExpression" Type="String" />
                <asp:Parameter Name="startRowIndex" Type="Int32" />
                <asp:Parameter Name="maximumRows" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>        
    </p>
    <p style="text-align:center;">
        <asp:Button runat="server" ID="FirstPage" Text="<< First" OnClick="FirstPage_Click" />
        <asp:Button runat="server" ID="PrevPage" Text="< Prev" OnClick="PrevPage_Click" />
        <asp:Button runat="server" ID="NextPage" Text="Next >" OnClick="NextPage_Click" />
        <asp:Button runat="server" ID="LastPage" Text="Last >>" OnClick="LastPage_Click" />
    </p>
    <p style="text-align:center;">
        <asp:Label runat="server" ID="CurrentPageNumber"></asp:Label>
    </p>
</asp:Content>

