<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="AddNewAddress.aspx.cs" Inherits="fashionShop.Customer.AddAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Add New Address</title>
    <style>
        a,
        p,
        span,
        label,
        button,
        select,
        input {
            font-family: "Ubuntu", sans-serif;
            color: #555;
            font-size: 1.4rem;
        }

        html {
            font-size: 62.5%;
        }

        .body {
            max-width: 108rem;
            width: 90%;
            margin: 3rem auto;
            padding: 3rem;
        }

        .register__nav {
            font-size: 1.4rem;
            text-transform: uppercase;
        }

            .register__nav a {
                color: #bbb;
            }

                .register__nav a:hover {
                    color: #555;
                    transition: all 0.2s linear;
                }

            .register__nav span:first-of-type {
                margin: 0.5rem;
            }

        .register__title {
            text-align: center;
            font-size: 1.7rem;
            font-weight: 100;
            text-transform: uppercase;
            letter-spacing: 0.7rem;
            word-spacing: 0.3rem;
            margin: 2rem 0 4rem;
        }

        .register__content {
            width: 80%;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .register__content--item {
            width: 48%;
            margin: 1.5rem 0;
        }

        .item__header--last {
            margin-bottom: 1rem;
        }

        .register__content--item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

            .register__content--item-header p:last-of-type {
                text-transform: uppercase;
                font-size: 0.95rem;
                color: #ccc;
            }

        .register__content--item input,
        .register__content--item select {
            width: 100%;
            padding: 1rem;
            margin: 1.2rem 0;
            border: 1px solid #bbb;
            border-radius: 0.3rem;
            color: #111;
        }

        .register__content--radioList {
            margin-top: 0.7rem;
        }

        .register__content--radio {
            display: flex;
            align-items: center;
        }

            .register__content--radio input {
                width: 10% !important;
                height: 2rem;
                margin-right: 0.5rem;
            }

        .content--radio-last input {
            width: 5% !important;
        }

        .content--item-confirmLetter {
            width: 100%;
        }

        .content-checkbox {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: 1.5rem;
            margin-top: 2.4rem;
             margin-bottom: 3rem;
             margin-left: 1rem;
        }

            .content-checkbox input {
                width: 2rem !important;
                height: 2rem;
                margin-right: 1.4rem;
                
            }

            .content-checkbox p {
                font-size: 1.5rem;
            }

        .content--lbNotify {
            font-size: 1.3rem;
            color: #F19797;
            word-spacing: 0.2rem;
            margin-bottom: 1.5rem;
            display: block !important;
        }

        .txt__error {
            font-size: 1.3rem;
            color: #F19797;
            word-spacing: 0.2rem;
        }
        
        .register__footer {
            display: flex;
            width: 80%;
            margin: 5rem auto;
            justify-content: space-between;
            align-items: flex-end;
        }

        .register__btn {
            background: #1D1919;
            padding: 1.3rem 3.2rem;
            border: none;
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.2rem;
            color: white;
            letter-spacing: 0.3rem;
            font-size: 1.3rem;
            cursor: pointer;
            border-radius: 0.4rem;
        }

            .register__btn:hover {
                border: 1px solid #858282;
                color: #383838;
                background: none;
                transition: all 0.2s linear;
            }

        .register__footer p {
            font-size: 1.3rem;
            position: relative;
            left: 9rem;
        }

        .register__footer i {
            margin-left: 0.6rem;
        }

        @media screen and (max-width: 1080px) {
            .register__content {
                width: 100%;
            }

            .register__footer {
                width: 100%;
            }

                .register__footer p {
                    position: initial;
                }
        }

        @media screen and (max-width: 768px) {
            .register__content--item {
                width: 100%;
            }

            .register__title {
                margin-top: 4rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="register__nav">
            <a href="Home.aspx">Home</a>
            <span>|</span>
            <span>Register</span>
        </div>
        <p class="register__title">New account</p>
        <div class="register__content">
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Username</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter a username'
                    ControlToValidate="txtUsername"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="valPassword" runat="server"
                    ControlToValidate="txtUsername"
                    ErrorMessage='<i class="fas fa-times"></i> Minimum username length is 3'
                    ValidationExpression=".{3}.*"
                    Display="Dynamic"
                    CssClass="txt__error" />
                <asp:Label ID="lbNotify" runat="server" Text="" CssClass="content--lbNotify"></asp:Label>
            </div>

            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter a password'
                    ControlToValidate="txtPassword"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage='<i class="fas fa-times"></i> Minimum password length is 3'
                    ValidationExpression=".{3}.*"
                    Display="Dynamic"
                    CssClass="txt__error" />
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Confirm Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> Comfirm password does not match your password'
                    ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirmPassword"
                    Display="Dynamic" CssClass="txt__error">
                </asp:CompareValidator>
            </div>
            <div class="register__content--item">
                <p>Collection Preference</p>
                <div class="register__content--radioList">
                    <div class="register__content--radio">
                        <input
                            type="radio"
                            id="Womanswear"
                            name="collection"
                            value="womenswear" />
                        <label for="male">Womenswear</label><br />
                    </div>
                    <div class="register__content--radio">
                        <input
                            type="radio"
                            id="Womanswear"
                            name="collection"
                            value="menswear" />
                        <label for="male">Menswear</label><br />
                    </div>
                    <div class="register__content--radio">
                        <input
                            type="radio"
                            id="Womanswear"
                            name="collection"
                            value="both"
                            class="register__content--radio" />
                        <label for="male">Both</label><br />
                    </div>
                </div>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>First Name</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your first name'
                    ControlToValidate="txtFirstName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>

            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Last Name</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your last name'
                    ControlToValidate="txtLastName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Country</p>
                    <p>Required</p>
                </div>
                <asp:DropDownList ID="ddlCountry" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator10"
                        runat="server"
                        ControlToValidate="ddlCountry"
                        InitialValue="-1"
                        ErrorMessage='<i class="fas fa-times"></i> Country is required.'
                        CssClass="txt__error"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Address</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your address'
                    ControlToValidate="txtAddress"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>City & State</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your city & state'
                    ControlToValidate="txtCity"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>

            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Zip/Postcode</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtZipCode" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your zip code'
                    ControlToValidate="txtZipCode"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Email</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your email'
                    ControlToValidate="txtEmail"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter invalid email'
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                    CssClass="txt__error"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Phone Number</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your phone number'
                    ControlToValidate="txtFirstName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="register__content--item content--item-confirmLetter">
                <div class="register__content--item-header item__header--last">
                    <p>Sign Up To Our Newsletter</p>
                    <p></p>
                </div>
                <div class="register__content--radio content--radio-last">
                    <input
                        type="checkbox"
                        id="confirmSignUpNewsletter"
                        value="yes" />
                    <label for="male">Yes</label><br />
                </div>
            </div>
            <div class="register__content--item">
                    <p>Remember Me After Register</p>
                <div class="content-checkbox">
                    <asp:CheckBox ID="cbRemember" runat="server" />
                    <p>Yes</p>
                </div>

            </div>
            
        </div>
        <div class="register__footer">
            <asp:Button ID="btnRegister" runat="server" Text="Create account" class="register__btn" OnClick="btnRegister_Click" />
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
