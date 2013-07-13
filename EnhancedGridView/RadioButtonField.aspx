<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RadioButtonField.aspx.cs" Inherits="EnhancedGridView_RadioButtonField" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Selection Via a Column of Radio Buttons</h2>
    <h3>
        Pick a Supplier</h3>
    <asp:Label ID="ChooseSupplierMsg" runat="server" CssClass="Warning" EnableViewState="False"
        Text="Please choose a supplier from the grid." Visible="False"></asp:Label>
    <asp:GridView ID="Suppliers" runat="server" AutoGenerateColumns="False"
        DataKeyNames="SupplierID" DataSourceID="SuppliersDataSource" EnableViewState="False" OnRowCreated="Suppliers_RowCreated">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Literal ID="RadioButtonMarkup" runat="server"></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CompanyName" HeaderText="Supplier" SortExpression="CompanyName" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="SuppliersDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetSuppliersByCountry" TypeName="SuppliersBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="USA" Name="country" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Button ID="ListProducts" runat="server" Text="Show Products on Page" OnClick="ListProducts_Click" />
    <asp:Button ID="SendToProducts" runat="server" Text="Show Products on Separate Page >>" OnClick="SendToProducts_Click" /><br />
    <br />
    <asp:Panel runat="server" ID="ProductsBySupplierPanel" Visible="False">
        <h3>
            Products for the Selected Supplier</h3>
        <p>
            <asp:GridView ID="ProductsBySupplier" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                DataSourceID="ProductsBySupplierDataSource" EnableViewState="False">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" ReadOnly="True" SortExpression="CategoryName" />
                    <asp:BoundField DataField="UnitPrice" DataFormatString="{0:c}" HeaderText="Price"
                        HtmlEncode="False" SortExpression="UnitPrice" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ProductsBySupplierDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetProductsBySupplierID" TypeName="ProductsBLL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Suppliers" Name="supplierID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </p>
    </asp:Panel>
</asp:Content>

