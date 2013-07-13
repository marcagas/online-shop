<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ErrorHandling.aspx.cs" Inherits="EditDeleteDataList_ErrorHandling" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Gracefully Handling DAL- and BLL-Level Exceptions</h2>
    <p>
        <asp:Label ID="ExceptionDetails" runat="server" EnableViewState="False" CssClass="Warning"></asp:Label>
    </p>
    <p>
        <asp:DataList ID="Products" runat="server" DataKeyField="ProductID" DataSourceID="ProductsDataSource" RepeatColumns="2" OnEditCommand="Products_EditCommand" OnCancelCommand="Products_CancelCommand" OnUpdateCommand="Products_UpdateCommand">
            <ItemTemplate>
                <h5><asp:Label runat="server" ID="ProductNameLabel" Text='<%# Eval("ProductName") %>'></asp:Label></h5>
                Price: <asp:Label runat="server" ID="Label1" Text='<%# Eval("UnitPrice", "{0:C}") %>'></asp:Label>
                <br />
                <asp:Button runat="server" id="EditProduct" CommandName="Edit" Text="Edit" />
                <br />
                <br />
            </ItemTemplate>
            <EditItemTemplate>
                Product name:
                <asp:TextBox ID="ProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:TextBox><br />
                Price:
                <asp:TextBox ID="UnitPrice" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>'></asp:TextBox><br />
                <br />
                <asp:Button ID="UpdateProduct" runat="server" CommandName="Update" Text="Update" />&nbsp;<asp:Button
                    ID="CancelUpdate" runat="server" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
        </asp:DataList>
        
        <asp:ObjectDataSource ID="ProductsDataSource" runat="server"
            SelectMethod="GetProducts" TypeName="ProductsBLL" OldValuesParameterFormatString="original_{0}">
        </asp:ObjectDataSource>
    </p>
</asp:Content>