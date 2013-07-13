<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerPage.aspx.cs" Inherits="Management_CustomerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>
        Customer Information</h2>
    <p>
        <asp:Button ID="Button1" runat="server" 
            PostBackUrl="~/Reports/ReportCustomer.aspx" Text="Generate Report" 
            Width="174px" />
        </br>
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" AllowPaging="True" ShowFooter="True"
            EnableViewState="False" DataKeyNames="ID">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" 
                    SortExpression="UserId" />
                <asp:BoundField DataField="Pwd" HeaderText="Pwd" SortExpression="Pwd" />
                <asp:BoundField DataField="Adress" HeaderText="Adress" 
                    SortExpression="Adress" />
                <asp:BoundField DataField="Mob" HeaderText="Mob" SortExpression="Mob" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
            SelectCommand="SELECT * FROM [UDetail]" 
            DeleteCommand="DELETE FROM [UDetail] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [UDetail] ([FirstName], [LastName], [UserId], [Pwd], [Adress], [Mob], [Email]) VALUES (@FirstName, @LastName, @UserId, @Pwd, @Adress, @Mob, @Email)" 
            UpdateCommand="UPDATE UDetail SET FirstName = @FirstName, LastName = @LastName, UserId = @UserId, Pwd = @Pwd, Adress = @Adress, Mob = @Mob, Email = @Email WHERE (ID = @ID)">
            <DeleteParameters>
                <asp:Parameter Name="ID" />
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
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="Pwd" Type="String" />
                <asp:Parameter Name="Adress" Type="String" />
                <asp:Parameter Name="Mob" Type="Decimal" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_UserId" Type="String" />
                <asp:Parameter Name="original_Pwd" Type="String" />
                <asp:Parameter Name="original_Adress" Type="String" />
                <asp:Parameter Name="original_Mob" Type="Decimal" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;
        </asp:Content>
        


