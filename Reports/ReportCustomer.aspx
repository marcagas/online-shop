<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReportCustomer.aspx.cs" Inherits="Reports_ReportCustomer" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="552px" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1029px">
        <localreport reportpath="Reports\CustomerReport.rdlc">
            <datasources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </datasources>
        </localreport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="CustomerTableAdapters.UDetailTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Pwd" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="Mob" Type="Decimal" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="FirstName" Name="emp" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Pwd" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="Mob" Type="Decimal" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    </br>
    </asp:Content>

