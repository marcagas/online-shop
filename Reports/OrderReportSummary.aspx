<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrderReportSummary.aspx.cs" Inherits="Reports_OrderReportSummary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="From"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="To"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Filter" onclick="Button1_Click" />
    </div>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="458px" 
        Width="994px">
        <LocalReport ReportPath="Reports\OrderReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="orderdetailssource" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="orderdetailssource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        SelectCommand="SELECT UDetail.*, Products.*, OrderDetails.*, Orders.*, @emp as employee FROM OrderDetails INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN UDetail ON Orders.UserId = UDetail.ID">
        <SelectParameters>
            <asp:Parameter Name="emp"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>

