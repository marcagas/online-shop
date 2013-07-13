<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CheckBoxField.aspx.cs" Inherits="EnhancedGridView_CheckBoxField" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Selection Via a Column of Checkboxes</h2>
    <p>
        <asp:Button ID="CheckAll" runat="server" Text="Check All" OnClick="CheckAll_Click" />
        &nbsp;
        <asp:Button ID="UncheckAll" runat="server" Text="Uncheck All" OnClick="UncheckAll_Click" /></p>
    <p>
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
            DataSourceID="ProductsDataSource" AllowPaging="True" EnableViewState="False">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="ProductSelector" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" ReadOnly="True" SortExpression="CategoryName" />
                <asp:BoundField DataField="UnitPrice" DataFormatString="{0:c}" HeaderText="Price"
                    HtmlEncode="False" SortExpression="UnitPrice" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ProductsDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProducts"
            TypeName="ProductsBLL">            
        </asp:ObjectDataSource>
    </p>
    <p>
        <asp:Button ID="DeleteSelectedProducts" runat="server" Text="Delete Selected Products" OnClick="DeleteSelectedProducts_Click" />
    </p>
    <p>
        <asp:Label ID="DeleteResults" runat="server" EnableViewState="False" Visible="False"></asp:Label>
    </p>
</asp:Content>