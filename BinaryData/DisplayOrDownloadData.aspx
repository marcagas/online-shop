<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DisplayOrDownloadData.aspx.cs" Inherits="BinaryData_DisplayOrDownloadData" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Display / Download Binary Data</h2>
    <p>
        <asp:GridView ID="Categories" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID"
            DataSourceID="CategoriesDataSource" EnableViewState="False">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Brochure">
                    <ItemTemplate>
                        <%# GenerateBrochureLink(Eval("BrochurePath")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="CategoryID" DataImageUrlFormatString="DisplayCategoryPicture.aspx?CategoryID={0}">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="CategoriesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetCategories" TypeName="CategoriesBLL"></asp:ObjectDataSource>
    </p>
</asp:Content>

