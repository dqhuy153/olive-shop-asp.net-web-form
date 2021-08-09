<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="fashionShop.Customer.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Sign in</title>
    <link rel="stylesheet" href="../Assets/css/Customer/SignIn.css" />
    <script src="../Assets/js/Customer/SignIn.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <section id="newCustomers" class="section__container new-customers">
            <div class="section__header">
                <p>New Customers</p>
                <hr />
            </div>
            <div class="section__content section__newCustomer">
                <p class="newCustomer__content--header">
                    Create an account with us and you'll be able to:
                </p>
                <ul class="newCustomer__content--items">
                    <li class="newCustomer__content--item">Check out faster
                    </li>
                    <li class="newCustomer__content--item">Save multiple shipping addresses
                    </li>
                    <li class="newCustomer__content--item">Access your order history
                    </li>
                    <li class="newCustomer__content--item">Track new orders
                    </li>
                    <li class="newCustomer__content--item">Save items to your wish list
                    </li>
                </ul>
            </div>
            <div class="section__footer">
                <a href="Register.aspx" class="section__btn newCustomer__btn">New account</a>
            </div>
        </section>
        <section id="signIn" class="section__container section__signIn">
            <asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnSignIn">
                <div class="section__header">
                    <p>Sign In</p>
                    <hr />
                </div>
                <div class="section__content section__signIn--content">
                    <div class="input">
                        <p class="singIn__p">Email Address:</p>
                        <asp:TextBox ID="txtUsername" runat="server" class="signIn__input"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage='<i class="fas fa-times"></i> You must enter a email address.'
                            ControlToValidate="txtUsername"
                            Display="Dynamic" 
                            CssClass="txt__error"
                            >
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtUsername"
                            ErrorMessage='<i class="fas fa-times"></i> Please use a valid email address, such as user@example.com'
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                            CssClass="txt__error"
                            Display="Dynamic"
                        >
                        </asp:RegularExpressionValidator>
                        <span class="warning"><i class="fas fa-times"></i> You must enter a email address.</span>
                    </div>

                    <div class="input">
                        <p class="singIn__p">Password:</p>
                        <asp:TextBox ID="txtPassword" runat="server" class="signIn__input" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server" 
                            ErrorMessage='<i class="fas fa-times"></i> You must enter a password' 
                            ControlToValidate="txtPassword" 
                            Display="Dynamic" 
                            CssClass="txt__error" 
                        >
                        </asp:RequiredFieldValidator>
                        <span class="warning"><i class="fas fa-times"></i> You must enter a password.</span>
                    </div>
                    <div class="content-checkbox">
                        <asp:CheckBox ID="cbRemember" runat="server" />
                        <p>Remember me</p>
                    </div>
                    <asp:Label ID="lbWarning" runat="server" Text="" CssClass="content--lbWarning"></asp:Label>
                </div>
                <div class="section__footer">
                    <asp:Button ID="btnSignIn" runat="server" Text="Sign in" CssClass="section__btn signIn__btn" OnClick="btnSignIn_Click" />
                    <a href="#" class="signIn__a">Forgot your password?</a>
                </div>
            </asp:Panel>
        </section>
    </div>

</asp:Content>
