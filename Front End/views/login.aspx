<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Front_End_views_login" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <link href="../../assets/stylesheets/login.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContent" Runat="Server">
    <section id="login-wrapper">
        <%
            if (alertLabel.Text != "" && alertLabel.Text != null)
            {
        %>
            <div class="alert">
                <asp:Label ID="alertLabel" runat="server"></asp:Label>
            </div>
        <%
            }
        %>
        
        <form runat="server" class="form-horizontal">
            <div class="form-group">
                <label for="inputUsername" class="col-lg-2 control-label">Username</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputUsername" class="col-lg-2 control-label">Password</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="password" runat="server" CssClass="form-control"></asp:TextBox>
                    <div class="marginTop10">
                        <asp:Button ID="submitButton" class="btn btn-primary" runat="server" 
                            Text="Login" onclick="submitButton_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </form>
    </section>
</asp:Content>

