<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReportCriticalLevel.aspx.cs" Inherits="Reports_ReportCriticalLevel" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server" enablepagemethods="true" />

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\Report2.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/CustomFormatting/CustomColors.aspx">Cancel</asp:HyperLink>
    </br>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="DeleteProduct" InsertMethod="AddProduct" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetProducts" 
        TypeName="ProductsBLL" UpdateMethod="UpdateProduct">
        <DeleteParameters>
            <asp:Parameter Name="productID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productName" Type="String" />
            <asp:Parameter Name="supplierID" Type="Int32" />
            <asp:Parameter Name="categoryID" Type="Int32" />
            <asp:Parameter Name="quantityPerUnit" Type="String" />
            <asp:Parameter Name="unitPrice" Type="Decimal" />
            <asp:Parameter Name="unitsInStock" Type="Int16" />
            <asp:Parameter Name="unitsOnOrder" Type="Int16" />
            <asp:Parameter Name="reorderLevel" Type="Int16" />
            <asp:Parameter Name="discontinued" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="productName" Type="String" />
            <asp:Parameter Name="supplierID" Type="Int32" />
            <asp:Parameter Name="categoryID" Type="Int32" />
            <asp:Parameter Name="quantityPerUnit" Type="String" />
            <asp:Parameter Name="unitPrice" Type="Decimal" />
            <asp:Parameter Name="unitsInStock" Type="Int16" />
            <asp:Parameter Name="unitsOnOrder" Type="Int16" />
            <asp:Parameter Name="reorderLevel" Type="Int16" />
            <asp:Parameter Name="discontinued" Type="Boolean" />
            <asp:Parameter Name="productID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

