<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="LoginAccount.aspx.cs" Inherits="Front_End_LoginAccount" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="menu">
		<ul>
			<li class="first"><a href="LoginHome.aspx"><b>Home</b></a>
            <li class="second"><a href="LoginProducts.aspx"><b>Products</b></a>
            <li class="third"><a href="MyCart.aspx"><b>My Cart</b></a>
              <li><a href="#"><span class="fourth">Accessibility<b></b></span></a>
				    <ul>
					<li><a href="Home.aspx">LogOut</a></li>
                    <li><a href="LoginAccount.aspx">Account</a></li>
                    <li><a href="LoginHelp.aspx">Help</a></li>
					</ul>
                    </li> 
		</ul>
		<br class="clearfix" />
</div>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
	     <div id="page">
             <asp:Label ID="Label1" runat="server" Text="Account Details"></asp:Label>
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                  DataKeyNames="ID" DataSourceID="SqlDataSource1" 
                  BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                  CellPadding="4" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                 Width="922px">
                  <Columns>
                      <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                          SortExpression="FirstName" />
                      <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                          SortExpression="LastName" />
                      <asp:BoundField DataField="UserId" HeaderText="UserId" 
                          SortExpression="UserId" />
                      <asp:BoundField DataField="Pwd" HeaderText="Password" SortExpression="Pwd" />
                      <asp:BoundField DataField="Adress" HeaderText="Address" 
                          SortExpression="Adress" />
                      <asp:BoundField DataField="Mob" HeaderText="Mobile Number" 
                          SortExpression="Mob" />
                      <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                          ReadOnly="True" SortExpression="ID" />
                  </Columns>
                  <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                  <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                  <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                  <RowStyle BackColor="White" ForeColor="#330099" />
                  <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                  <SortedAscendingCellStyle BackColor="#FEFCEB" />
                  <SortedAscendingHeaderStyle BackColor="#AF0101" />
                  <SortedDescendingCellStyle BackColor="#F6F0C0" />
                  <SortedDescendingHeaderStyle BackColor="#7E0000" />
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
                  DeleteCommand="DELETE FROM [UDetail] WHERE [ID] = @ID " 
                  InsertCommand="INSERT INTO [UDetail] ([FirstName], [LastName], [UserId], [Pwd], [Adress], [Mob], [Email]) VALUES (@FirstName, @LastName, @UserId, @Pwd, @Adress, @Mob, @Email)" 
                  SelectCommand="SELECT * FROM [UDetail] WHERE ([ID] = @ID)" 
                  
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
                  <SelectParameters>
                      <asp:ControlParameter ControlID="TextBox8" Name="ID" 
                          PropertyName="Text" />
                  </SelectParameters>
                  <UpdateParameters>
                      <asp:ControlParameter ControlID="TextBox1" Name="FirstName" PropertyName="Text" 
                          Type="String" />
                      <asp:ControlParameter ControlID="TextBox2" Name="LastName" PropertyName="Text" 
                          Type="String" />
                      <asp:ControlParameter ControlID="TextBox7" Name="UserId" PropertyName="Text" 
                          Type="String" />
                      <asp:ControlParameter ControlID="TextBox4" Name="Pwd" PropertyName="Text" 
                          Type="String" />
                      <asp:ControlParameter ControlID="TextBox5" Name="Adress" PropertyName="Text" 
                          Type="String" />
                      <asp:ControlParameter ControlID="TextBox6" Name="Mob" PropertyName="Text" 
                          Type="Decimal" />
                      <asp:ControlParameter ControlID="TextBox3" Name="Email" PropertyName="Text" 
                          Type="String" />
                      <asp:ControlParameter ControlID="TextBox8" Name="ID" PropertyName="Text" />
                  </UpdateParameters>
              </asp:SqlDataSource>
             <asp:Label ID="Label2" runat="server" Text="Edit Details"></asp:Label>
              <table width="800px" cellpadding="3" ForeColor="#4A3C8C" style="height: 307px" >
                                 <tr>
                                     <td>
                                        First Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TextBox1" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Last Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="TextBox2" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email Id</td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                            ErrorMessage="Not in the correct format i.e abc@domain" ForeColor="#FF3300" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        User Id
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" runat="server" BorderColor="#CC3300" 
                                            EnableViewState="true" Font-Bold="True" ForeColor="Red" Height="22px" 
                                            Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="TextBox7" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" BorderColor="#CC3300" 
                                            EnableViewState="true" Font-Bold="True" ForeColor="Red" Height="22px" 
                                            Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr> 
                                <tr>
                                    <td>
                                        Full Address
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="64px" TextMode="MultiLine" 
                                            Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="TextBox5" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Mobile No.
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Width="189px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                            ErrorMessage="It is a mandatory field Can't be left blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                            ControlToValidate="TextBox6" Display="Dynamic" 
                                            ErrorMessage="Not in the correct format" ForeColor="#FF3300" 
                                            MaximumValue="9999999999" MinimumValue="1000000000"></asp:RangeValidator>
                                    </td>
                                </tr>

                                </tr>
                                <tr align="left">
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TextBox8" runat="server" BorderColor="#CC3300" 
                                            Font-Bold="True" ForeColor="Red" Height="22px" Width="189px" 
                                            Visible="False" Enabled="False" ontextchanged="TextBox8_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                </table>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                 OnClientClick="return message('Your account has been updated');" Text="Update" 
                 Width="87px" />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                 Text="Clear" Width="82px" />
                    <br />
        </div>
    </asp:Content>



