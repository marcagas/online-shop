<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SortingWithDefaultPaging.aspx.cs" Inherits="PagingSortingDataListRepeater_SortingWithDefaultPaging" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Sorting and Paging Data in a DataList</h2>
    <h3>Default Paging</h3>
    <p style="text-align:center;">
        <asp:Button runat="server" id="SortByProductName" Text="Sort by Product Name" OnClick="SortByProductName_Click" />
        <asp:Button runat="server" id="SortByCategoryName" Text="Sort by Category" OnClick="SortByCategoryName_Click" />
        <asp:Button runat="server" id="SortBySupplierName" Text="Sort by Supplier" OnClick="SortBySupplierName_Click" />
    </p>
    <p>
        <asp:DataList ID="ProductsDefaultPaging" runat="server" Width="100%" DataKeyField="ProductID" RepeatColumns="2" DataSourceID="ProductsDefaultPagingDataSource" EnableViewState="False">
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
            <ItemStyle Width="50%" />
        </asp:DataList>
        
        <asp:ObjectDataSource ID="ProductsDefaultPagingDataSource" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetProductsSortedAsPagedDataSource"
            TypeName="ProductsBLL" OnSelected="ProductsDefaultPagingDataSource_Selected">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="ProductName" Name="sortExpression" QueryStringField="sortExpression"
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="0" Name="pageIndex" QueryStringField="pageIndex"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="4" Name="pageSize" QueryStringField="pageSize"
                    Type="Int32" />
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