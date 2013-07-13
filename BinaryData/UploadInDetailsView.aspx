<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UploadInDetailsView.aspx.cs" Inherits="BinaryData_UploadInDetailsView" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Add a Category with a Picture and Brochure</h2>
    <p>
        <asp:DetailsView ID="NewCategory" runat="server" AutoGenerateRows="False" DataKeyNames="CategoryID"
            DataSourceID="CategoriesDataSource" DefaultMode="Insert" OnItemInserting="NewCategory_ItemInserting" OnItemInserted="NewCategory_ItemInserted">
            <Fields>
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False"
                    ReadOnly="True" SortExpression="CategoryID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Brochure" SortExpression="BrochurePath">
                    <InsertItemTemplate>
                        <asp:FileUpload ID="BrochureUpload" runat="server" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Picture">
                    <InsertItemTemplate>
                        <asp:FileUpload ID="PictureUpload" runat="server" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:Label ID="UploadWarning" runat="server" CssClass="Warning" EnableViewState="False"
            Visible="False"></asp:Label></p>
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
            SelectMethod="GetCategories" TypeName="CategoriesBLL" InsertMethod="InsertWithPicture">
            <InsertParameters>
                <asp:Parameter Name="categoryName" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="brochurePath" Type="String" />
                <asp:Parameter Name="picture" Type="Object" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </p>
</asp:Content>

