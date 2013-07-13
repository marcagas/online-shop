<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UpdatingAndDeleting.aspx.cs" Inherits="BinaryData_UpdatingAndDeleting" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Add a Category</h2>
    <p>
        <asp:DetailsView ID="NewCategory" runat="server" AutoGenerateRows="False" DataKeyNames="CategoryID"
            DataSourceID="CategoriesDataSource" DefaultMode="Insert" 
            OnItemInserting="NewCategory_ItemInserting" 
            OnItemInserted="NewCategory_ItemInserted" Height="76px" Width="246px">
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
            DataSourceID="CategoriesDataSource" EnableViewState="False" OnRowDeleted="Categories_RowDeleted" OnRowDeleting="Categories_RowDeleting" OnRowUpdating="Categories_RowUpdating" OnRowUpdated="Categories_RowUpdated">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Brochure">
                    <ItemTemplate>
                        <%# GenerateBrochureLink(Eval("BrochurePath")) %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="BrochureOptions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BrochureOptions_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="1">Use current brochure</asp:ListItem>
                            <asp:ListItem Value="2">Remove current brochure</asp:ListItem>
                            <asp:ListItem Value="3">Upload new brochure</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:FileUpload ID="BrochureUpload" runat="server" Visible="False" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <span style="font-size: 10pt; color: black; font-family: Verdana; mso-fareast-font-family: 'Times New Roman';
                            mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US;
                            mso-bidi-language: AR-SA">To change the category’s picture, specify a new picture.
                            To keep the category’s picture the same, leave the field empty.<br />
                            <asp:FileUpload ID="PictureUpload" runat="server" /></span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("CategoryID", "DisplayCategoryPicture.aspx?CategoryID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="CategoriesDataSource" runat="server" OldValuesParameterFormatString="{0}"
            SelectMethod="GetCategories" TypeName="CategoriesBLL" InsertMethod="InsertWithPicture" DeleteMethod="DeleteCategory" UpdateMethod="UpdateCategory">
            <InsertParameters>
                <asp:Parameter Name="categoryName" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="brochurePath" Type="String" />
                <asp:Parameter Name="picture" Type="Object" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="categoryID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="categoryName" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="brochurePath" Type="String" />
                <asp:Parameter Name="picture" Type="Object" />
                <asp:Parameter Name="categoryID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </p>
</asp:Content>

