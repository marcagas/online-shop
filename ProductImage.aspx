<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductImage.aspx.cs" Inherits="ProductImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Add an Image</h2>
    <p>
        <table style="width: 100%; height: 168px;">
            <tr>
                <td style="width: 115px; height: 33px;" height="10">
                    Product Name:</td>
                <td style="height: 33px" height="10">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 115px; height: 28px;" bgcolor="#FFCCFF" headers="10">
                    Category Name:</td>
                <td bgcolor="#FFCCFF" style="height: 28px" headers="10">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="ObjectDataSource1" DataTextField="CategoryName" 
                        DataValueField="CategoryName" Height="20px" Width="130px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 25px; width: 115px" height="10">
                    Picture:</td>
                <td style="height: 25px" height="10">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Label ID="Label18" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 25px; width: 115px" bgcolor="#FFCCFF" height="10">
                    </td>
                <td style="height: 25px" bgcolor="#FFCCFF" height="10">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Insert" 
                        Width="113px" />
                </td>
            </tr>
        </table>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        DeleteMethod="DeleteCategory" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetCategories" TypeName="CategoriesBLL" 
                        UpdateMethod="UpdateCategory">
                        <DeleteParameters>
                            <asp:Parameter Name="categoryID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="categoryName" Type="String" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="brochurePath" Type="String" />
                            <asp:Parameter Name="categoryID" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
        <asp:Label ID="UploadWarning" runat="server" CssClass="Warning" EnableViewState="False"
            Visible="False"></asp:Label></p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PicID"
            
            DataSourceID="SqlDataSource1" 
            EnableViewState="False" Width="234px" AllowPaging="True" PageSize="5">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="PicID" HeaderText="PicID" 
                    SortExpression="PicID" ReadOnly="True" InsertVisible="False" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                    SortExpression="ProductName" />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                    SortExpression="CategoryName" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                 <asp:Image ID="img" runat="server" Height= '100px' Width='100px' ImageUrl='<%# "Handler.ashx?ID=" +Eval("PicID") %>'></asp:Image>
                     </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
            DeleteCommand="DELETE FROM [ProductImage] WHERE [PicID] = @PicID" 
            InsertCommand="INSERT INTO [ProductImage] ([Picture], [ProductName], [CategoryName]) VALUES (@Picture, @ProductName, @CategoryName)" 
            SelectCommand="SELECT * FROM [ProductImage]" 
            
            
            
            UpdateCommand="UPDATE ProductImage SET Picture = @Picture, ProductName = @ProductName, CategoryName = @CategoryName WHERE (PicID = @PicID) OR (Picture IS NULL) AND (@original_Picture IS NULL)">
            <DeleteParameters>
                <asp:Parameter Name="PicID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Picture" Type="Object" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Picture" Type="Object" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="PicID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" Visible="False" Width="269px">
        </asp:GridView>
    </p>
</asp:Content>


