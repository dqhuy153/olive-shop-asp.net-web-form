<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="fashionShop.Customer.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Sign in</title>
    <style>
        a,
        p,
        span,
        input,
        li,
        button{
            font-family: "Ubuntu", sans-serif;
            color: #333;
            font-weight: 400;
        }
        .txt__error[style*="inline"] {
            font-size: 1.3rem;
            color: #F19797;
            word-spacing: 0.2rem;
            margin-bottom: 1.5rem;
            display: block !important;
        }
        html {
            font-size: 62.5%;
        }

        .body {
            align-items: flex-start;
            display: flex;
            justify-content: space-between;
            margin: 10rem auto;
            width: 68%;
            min-width: 80rem;
        }

        .section__container {
            width: 48%;
        }

        .section__header {
            
            margin-bottom: 2rem;
        }

            .section__header p {
                font-weight: 600;
                font-style: italic;
                margin-bottom: 3rem;
                font-size: 1.7rem;
                font-family: "Spectral", serif !important;
            }

            .section__header hr {
                border: 1px #eee solid;
            }

        .section__content {
            font-family: "Ubuntu", sans-serif;
            font-weight: 300;
            font-size: 1.35rem;
            word-spacing: 2px;
        }

        .section__newCustomer ul {
            list-style: inside;
            padding: 1.5rem;
        }

        .section__newCustomer li {
            margin: 0.8rem;
            font-size: 1.3rem;
        }

        .section__btn {
            background: none;
            padding: 1.3rem 3.2rem;
            border: 1px solid rgb(133, 130, 130);
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.2rem;
            color: rgb(56, 56, 56);
            font-size: 1.3rem;
            cursor: pointer;
            font-family: "Ubuntu", sans-serif;
            font-weight: 400;
        }

            .section__btn:hover {
                background: #1D1919;
                color: white;
                transition: all 0.2s linear;
            }

        .section__signIn--content p {
            font-size: 1.3rem;
        }

        .section__signIn--content input {
            width: 85%;
            padding: 0.8rem;
            margin: 1.5rem 0;
        }
        .content-checkbox {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: 1.5rem;
            margin-bottom: 3rem;
        }
        .content-checkbox input {
            width: auto !important;
            margin-right: .6rem;
        }
        .content-checkbox p {
            font-size: 1.3rem;

        }
        .section__footer {
            display: flex;
            margin-top: 0.8rem;
        }

        .signIn__a {
            font-size: 1.3rem;
            margin-left: 5rem;
            color: #999;
            font-style: italic;
        }
        .signIn__a:hover{
            color: #222;
            transition: all 0.2s linear;
        }
        .content--lbWarning{
            font-size: 1.3rem;
            color: #F19797;
            word-spacing: 0.2rem;
            margin-bottom: 1.5rem;
            display: block !important;
        }
        @media screen and (max-width: 768px) {
            .body {
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 100%;
                min-width: 50rem;
                margin: 5rem auto;
            }

            .section__container {
                width: 80%;
                margin: 4rem 0;
            }

            .section__signIn--content input {
                width: 100%;
            }
        }
    </style>
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
            <div class="section__header">
                <p>Sign In</p>
                <hr />
            </div>
            <div class="section__content section__signIn--content">
                <p class="singIn__p">Username:</p>
                <asp:TextBox ID="txtUsername" runat="server" class="signIn__input"></asp:TextBox>
                </br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage='<i class="fas fa-times"></i> You have to enter a username' ControlToValidate="txtUsername" Display="Dynamic" CssClass="txt__error"></asp:RequiredFieldValidator>
                <p class="singIn__p">Password:</p>
                <asp:TextBox ID="txtPassword" runat="server" class="signIn__input" TextMode="Password"></asp:TextBox>
                </br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage='<i class="fas fa-times"></i> You havto enter a password' ControlToValidate="txtPassword" Display="Dynamic" CssClass="txt__error"></asp:RequiredFieldValidator>
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
        </section>
    </div>

</asp:Content>
