<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReportEmployee.aspx.cs" Inherits="Reports_ReportEmployee" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server" enablepagemethods="true" />

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\Report3.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="EmployeeDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/Management/EmployeePage.aspx">Cancel</asp:HyperLink>
    </br>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        SelectCommand="SELECT [EmpId], [EmpTitle], [TitleOfCourtesy], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [HomePhone], [UserName], [Password], [EmailAddress] FROM [empAccount]">
    </asp:SqlDataSource>
</asp:Content>

