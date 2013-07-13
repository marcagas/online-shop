<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmployeePage.aspx.cs" Inherits="Management_EmployeePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>
        Employee Information</h2>
    <p>
        <asp:Button ID="Button1" runat="server" 
            PostBackUrl="~/Reports/ReportEmployee.aspx" Text="Generate Report" 
            Width="172px" />
        </br>
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" AllowPaging="True" ShowFooter="True"
            EnableViewState="False" DataKeyNames="EmpId">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="EmpTitle" HeaderText="EmpTitle" 
                    SortExpression="EmpTitle" />
                <asp:BoundField DataField="TitleOfCourtesy" HeaderText="TitleOfCourtesy" 
                    SortExpression="TitleOfCourtesy" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                    SortExpression="BirthDate" />
                <asp:BoundField DataField="HireDate" HeaderText="HireDate" 
                    SortExpression="HireDate" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" 
                    SortExpression="EmailAddress" />
                <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" 
                    SortExpression="HomePhone" />
                <asp:BoundField DataField="EmpId" HeaderText="EmpId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="EmpId" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployees" 
            TypeName="EmployeesBLL">
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
            
            
            SelectCommand="SELECT [EmpTitle], [TitleOfCourtesy], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [UserName], [Password], [EmailAddress], [HomePhone], [EmpId] FROM [empAccount]" 
            DeleteCommand="DELETE FROM [empAccount] WHERE [EmpId] = @EmpId " 
            InsertCommand="INSERT INTO [empAccount] ([EmpTitle], [TitleOfCourtesy], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [UserName], [Password], [EmailAddress], [HomePhone]) VALUES (@EmpTitle, @TitleOfCourtesy, @FirstName, @LastName, @BirthDate, @HireDate, @Address, @UserName, @Password, @EmailAddress, @HomePhone)" 
            UpdateCommand="UPDATE empAccount SET EmpTitle = @EmpTitle, TitleOfCourtesy = @TitleOfCourtesy, FirstName = @FirstName, LastName = @LastName, BirthDate = @BirthDate, HireDate = @HireDate, Address = @Address, UserName = @UserName, Password = @Password, EmailAddress = @EmailAddress, HomePhone = @HomePhone WHERE (EmpId = @EmpId)">
            <DeleteParameters>
                <asp:Parameter Name="EmpId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmpTitle" Type="String" />
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="HireDate" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmpTitle" Type="String" />
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="HireDate" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
                <asp:Parameter Name="original_EmpId" Type="Int32" />
                <asp:Parameter Name="original_EmpTitle" Type="String" />
                <asp:Parameter Name="original_TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_BirthDate" Type="DateTime" />
                <asp:Parameter Name="original_HireDate" Type="DateTime" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_EmailAddress" Type="String" />
                <asp:Parameter Name="original_HomePhone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;
        <p>
            &nbsp;</p>
</asp:Content>




