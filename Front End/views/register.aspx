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
                    <asp:TextBox ID="passwordTxt" runat="server" class="form-control widthAuto" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="inputConfirmPassword" class="col-lg-2 control-label">Confirm Password</label>
                <div class="col-lg-5">
                    <asp:TextBox ID="confirmPasswordTxt" runat="server" class="form-control widthAuto" TextMode="Password"></asp:TextBox>
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
                </div>
            </div>
            <div class="form-group terms-and-conditions">
                <div class="col-lg-6 control-label">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="terms"> I Agree to the Etrade Enterprises <a href="#" id="terms-of-service" data-toggle="modal" data-target="#terms">Terms of Service</a>
                        </label>
                    </div>
                    <div class="marginTop10">
                        <asp:Button ID="registerBtn" class="btn btn-primary" runat="server" 
                            Text="Register" onclick="registerBtn_Click" />                        
                    </div>
                </div>

                <div class="modal fade" id="terms" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-height="300px">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Terms and Conditions</h4>
                      </div>
                      <div class="modal-body">
                        <div>
                            <h3>Welcome to E-trade Enterprise website.</h3>
                            <p>You confirm your understanding of the Terms and Conditions by accessing this Site. You shall not use this 
                            website if you disagree with the Terms and Conditions of use. </p>
                        </div>
                        <div>
                            <h3>USE OF THE SITE</h3>
                            <p>You must be at least 18 years of age or access the Site under the supervision of a parent or legal guardian.</p>
                            <p>
                                Content provided on this site is solely for informational purposes. Product representations expressed on this Site are those of the vendor and are not made by us. 
                            </p>
                            <p>
                                Should you choose to register for the purchase of any product, you agree to provide accurate and current information about yourself, and to promptly update such information if there are any changes. Every user of the Site is solely responsible for keeping passwords and other account identifiers safe and secure. The account owner is entirely responsible for all activities that occur under such password or account. Furthermore, you must notify us of any unauthorized use of your password or account. The Site shall not be responsible or liable, directly or indirectly, in any way for any loss or damage of any kind incurred as a result of, or in connection with, your failure to comply with this section.
                            </p>
                        </div>
                        <div>
                            <h3>ORDER AND ACCEPTANCE</h3>
                            <p>You may place an order for product(s) online.  The placing of an order by you represents your offer to buy subject to these Terms and Conditions.</p>
                            <p>The Contract between you and E-trade shall commence once settlement is made via PayPal.</p>
                            <p>An email notification shall be posted to your registered email account which details Product(s) purchased.</p>
                        </div>

                        <div>
                            <h3>DELIVERY, OWNERSHIP AND RISK</h3>
                            <p>The place of delivery shall be based on the address indicated in the Customer Registration Form.   Shipping cost is free.</p>
                            <h5>Estimated delivery date of the Product(s) shall be as follows:</h5>
                            <ul>
                                <li>Within 5 days for those with delivery address in Metro Manila and within Calabarzon area.</li>
                                <li>Within 10 days for those in Luzon (outside Metro Manila and Calabarzon area).</li>
                                <li>Within 15 days for those in VisMin area.</li>
                            </ul>
                            <p>If delivery is not made within 30 days from the original date of your order and you have not subsequently accepted delivery or agreed to a delivery date outside the 30 days, you may cancel your order without charge and obtain a full refund.</p>
                            <p>
                            It is important that you examine the Product(s) carefully upon delivery. If you discover that anything listed in your Order Receipt is missing, incorrect or damaged, you will promptly notify E-trade in writing or by email. This will give E-trade the opportunity to suggest an appropriate solution, which may include a price refund, replacement, or repair services.
                            </p>
                            <p>Once E-trade delivers Product(s) to you (or your representative) you will take on risk of damage to or loss of the Product(s).  Ownership of Product(s) will pass on to you after delivery is made.</p>

                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
                </div>
            </div>
        </form>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageSpecificJavaScript" Runat="Server">
    <script src="../../assets/javascripts/register.js" type="text/javascript"></script>
</asp:Content>

