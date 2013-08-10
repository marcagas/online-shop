<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Front_End_views_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../assets/stylesheets/register.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sliderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" Runat="Server">
    <section class="new-user-wrapper">
        <h2>Sign up an account.</h3>
        <form id="newUser" runat="server" class="form-horizontal">
            <div class="form-group">
                <label for="inputFirstname" class="col-lg-2 control-label">First Name</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="firstNameTxt" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputLastName" class="col-lg-2 control-label">Last Name</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="lastNameTxt" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="emailTxt" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputUsername" class="col-lg-2 control-label">Username</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="usernameTxt" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputConfirmPassword" class="col-lg-2 control-label">Confirm Password</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="confirmPasswordTxt" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="fullAddress" class="col-lg-2 control-label">Address</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="addressTxt" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputMobileNum" class="col-lg-2 control-label">Mobile No.</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="mobileNumTxt" runat="server"></asp:TextBox>
                    <div class="marginTop10">
                        <asp:Button ID="registerBtn" class="btn btn-primary" runat="server" 
                            Text="Register" onclick="registerBtn_Click" />                        
                    </div>
                </div>
            </div>
        </form>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script src="../../assets/javascripts/register.js" type="text/javascript"></script>
</asp:Content>

