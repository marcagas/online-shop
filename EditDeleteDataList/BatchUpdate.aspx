<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BatchUpdate.aspx.cs" Inherits="EditDeleteDataList_BatchUpdate" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Suppliers Batch Update</h2>
    <p>
        <asp:Button ID="UpdateAll1" runat="server" Text="Update All" OnClick="UpdateAll1_Click" />
    </p>
    <p>
        <asp:DataList ID="Suppliers" runat="server" DataKeyField="SupplierID" DataSourceID="SuppliersDataSource">
            <ItemTemplate>
                <h4><asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>'>
                </asp:Label></h4>
                
                <table border="0">
                    <tr>
                        <td class="SupplierPropertyLabel">Address:</td>
                        <td class="SupplierPropertyValue"><asp:TextBox ID="Address" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="SupplierPropertyLabel">City:</td>
                        <td class="SupplierPropertyValue"><asp:TextBox ID="City" runat="server" Text='<%# Eval("City") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="SupplierPropertyLabel">Country:</td>
                        <td class="SupplierPropertyValue"><asp:TextBox ID="Country" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox></td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
        
        <asp:ObjectDataSource ID="SuppliersDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetSuppliers" TypeName="SuppliersBLL">
        </asp:ObjectDataSource>
    </p>
    <p>
        <asp:Button ID="UpdateAll2" runat="server" Text="Update All" OnClick="UpdateAll2_Click" />
    </p>
</asp:Content>

