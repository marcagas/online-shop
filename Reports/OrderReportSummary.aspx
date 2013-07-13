<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrderReportSummary.aspx.cs" Inherits="Reports_OrderReportSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Button ID="Button1" runat="server" 
        PostBackUrl="~/Reports/ReportSales.aspx" Text="Generate Report" Width="164px" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="OrderID" 
        DataSourceID="SqlDataSource1" PageSize="7">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                SortExpression="CustomerID" />
            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                SortExpression="EmployeeID" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                SortExpression="OrderDate" />
            <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" 
                SortExpression="RequiredDate" />
            <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" 
                SortExpression="ShippedDate" />
            <asp:BoundField DataField="ShipVia" HeaderText="ShipVia" 
                SortExpression="ShipVia" />
            <asp:BoundField DataField="Freight" HeaderText="Freight" 
                SortExpression="Freight" />
            <asp:BoundField DataField="ShipName" HeaderText="ShipName" 
                SortExpression="ShipName" />
            <asp:BoundField DataField="ShipAddress" HeaderText="ShipAddress" 
                SortExpression="ShipAddress" />
            <asp:BoundField DataField="ShipCity" HeaderText="ShipCity" 
                SortExpression="ShipCity" />
            <asp:BoundField DataField="ShipRegion" HeaderText="ShipRegion" 
                SortExpression="ShipRegion" />
            <asp:BoundField DataField="ShipPostalCode" HeaderText="ShipPostalCode" 
                SortExpression="ShipPostalCode" />
            <asp:BoundField DataField="ShipCountry" HeaderText="ShipCountry" 
                SortExpression="ShipCountry" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID " 
        InsertCommand="INSERT INTO [Orders] ([CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)" 
        SelectCommand="SELECT * FROM [Orders]" 
        UpdateCommand="UPDATE Orders SET CustomerID = @CustomerID, EmployeeID = @EmployeeID, OrderDate = @OrderDate, RequiredDate = @RequiredDate, ShippedDate = @ShippedDate, ShipVia = @ShipVia, Freight = @Freight, ShipName = @ShipName, ShipAddress = @ShipAddress, ShipCity = @ShipCity, ShipRegion = @ShipRegion, ShipPostalCode = @ShipPostalCode, ShipCountry = @ShipCountry WHERE (OrderID = @OrderID)">
        <DeleteParameters>
            <asp:Parameter Name="OrderID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
            <asp:Parameter Name="ShipVia" Type="Int32" />
            <asp:Parameter Name="Freight" Type="Decimal" />
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipAddress" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipRegion" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
            <asp:Parameter Name="ShipVia" Type="Int32" />
            <asp:Parameter Name="Freight" Type="Decimal" />
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipAddress" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipRegion" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="original_OrderID" Type="Int32" />
            <asp:Parameter Name="original_CustomerID" Type="String" />
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_OrderDate" Type="DateTime" />
            <asp:Parameter Name="original_RequiredDate" Type="DateTime" />
            <asp:Parameter Name="original_ShippedDate" Type="DateTime" />
            <asp:Parameter Name="original_ShipVia" Type="Int32" />
            <asp:Parameter Name="original_Freight" Type="Decimal" />
            <asp:Parameter Name="original_ShipName" Type="String" />
            <asp:Parameter Name="original_ShipAddress" Type="String" />
            <asp:Parameter Name="original_ShipCity" Type="String" />
            <asp:Parameter Name="original_ShipRegion" Type="String" />
            <asp:Parameter Name="original_ShipPostalCode" Type="String" />
            <asp:Parameter Name="original_ShipCountry" Type="String" />
            <asp:Parameter Name="OrderID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

