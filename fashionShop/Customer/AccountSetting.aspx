<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="AccountSetting.aspx.cs" Inherits="fashionShop.Customer.AccountSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a,
        p,
        span,
        label,
        button {
            font-family: "Ubuntu", sans-serif;
            color: #555;
            font-size: 1.4rem;
        }

        html {
            font-size: 62.5%;
        }

        .body {
            max-width: 125rem;
            width: 90%;
            margin: 3rem auto;
            padding: 3rem;
        }

        .account__map {
            font-size: 1.2rem;
            text-transform: uppercase;
        }

            .account__nav a,
            .account__map a,
            .account__map--separate {
                color: #bbb;
            }

                .account__nav a:hover,
                .account__map a:hover {
                    color: #555;
                    transition: all 0.2s linear;
                }

        .account__map--separate {
            margin: 0 0.8rem;
        }

        .account__nav span:first-of-type {
            margin: 0.5rem;
        }

        .account__title {
            text-align: center;
            font-size: 1.7rem;
            font-weight: 100;
            text-transform: uppercase;
            letter-spacing: 0.7rem;
            word-spacing: 0.3rem;
            margin: 2rem 0 4rem;
            margin-top: 4rem;
        }

        .account__nav {
            width: 50%;
            min-width: 55rem;
            margin: 2rem auto;
        }

        .account__nav--items {
            display: flex;
            justify-content: space-between;
            letter-spacing: 0.5px;
        }

        .account__item-selected a {
            color: #555;
            padding-bottom: 0.3rem;
            border-bottom: 1px solid #555;
        }

        .account__content {
            width: 80%;
            margin: 5rem auto;
        }

        .updateAccount__content {
            width: 80%;
            margin: 5rem auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .updateAccount__content--item {
            width: 48%;
            margin: 1.5rem 0;
        }

        .updateAccount__content--item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

            .updateAccount__content--item-header p:last-of-type {
                text-transform: uppercase;
                font-size: 0.95rem;
                color: #ccc;
            }

        .updateAccount__content--item input {
            width: 100%;
            padding: 1rem;
            margin: 1.2rem 0;
            border: 1px solid #bbb;
            border-radius: 0.3rem;
        }

        .updateAccount__content--radioList {
            margin-top: 0.7rem;
        }

        .content--radio-last {
            margin-top: 1rem;
        }

            .content--radio-last input {
                width: 3%;
            }

        .updateAccount__content--radio {
            display: flex;
            align-items: center;
        }

            .updateAccount__content--radio input {
                width: 7% !important;
                height: 2rem;
                margin-right: 0.5rem;
            }

        .updateAccount__error {
            font-size: 1.3rem;
            color: rgb(241, 151, 151);
            word-spacing: 0.2rem;
        }

        .updateAccount__footer {
            display: flex;
            width: 80%;
            margin: 5rem auto;
            justify-content: space-between;
            align-items: flex-end;
        }

        .updateAccount__btn {
            background: rgb(29, 25, 25);
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

            .updateAccount__btn:hover {
                border: 1px solid rgb(133, 130, 130);
                color: rgb(56, 56, 56);
                background: none;
                transition: all 0.2s linear;
            }

        .updateAccount__footer p {
            font-size: 1.3rem;
            position: relative;
            left: 9rem;
        }

        .updatePassword {
            width: 100%;
            margin: 4.5rem 0 5rem;
        }

            .updatePassword p {
                font-size: 1.6rem;
                font-family: "Spectral", sans-serif;
                font-style: italic;
                text-align: center;
                margin-bottom: 2rem;
            }

            .updatePassword hr {
                border: 1px solid #eee;
            }

        .updateAccount__error {
            font-size: 1.3rem;
            color: rgb(241, 151, 151);
            word-spacing: 0.2rem;
        }

        .updateAccount__footer i {
            margin-left: 0.6rem;
        }

        .content--lbNotify {
            font-size: 1.4rem;
            color: #F19797;
            word-spacing: 0.2rem;
            margin-bottom: 1.5rem;
            display: block !important;
        }
        .txt__error {
            font-size: 1.3rem;
            color: #F19797;
            word-spacing: 0.2rem;
            margin-bottom: 1.5rem;
        }

        @media screen and (max-width: 1080px) {
            .updateAccount__content {
                width: 100%;
            }

            .updateAccount__footer {
                width: 100%;
            }

                .updateAccount__footer p {
                    position: initial;
                }
        }

        @media screen and (max-width: 1200px) {
            .address__items {
                justify-content: space-between;
            }

            .address__item {
                width: 48%;
                margin-right: 0;
            }
        }

        @media screen and (max-width: 768px) {
            .body {
                padding: 1rem;
            }

            .account__nav--items {
                flex-wrap: wrap;
                width: 100%;
                justify-content: center;
            }

            .account__nav {
                width: 90%;
                min-width: auto;
            }

            .account__nav--item {
                width: 30%;
                padding: 1rem;
            }

            .account__content {
                width: 100%;
            }

            .address__item {
                width: 100%;
            }

            .updateAccount__content--item {
                width: 100%;
            }

            .updateAccount__title {
                margin-top: 4rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <span>Account Details</span>
        </div>
        <p class="account__title">Account Settings</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item ">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item">
                    <a href="AddressBook.aspx">Address</a>
                </li>
                <li class="account__nav--item">
                    <a href="WishLists.aspx">Wish Lists (0)</a>
                </li>
                <li class="account__nav--item">
                    <a href="RecentlyViewed.aspx">Recently Viewed</a>
                </li>
                <li class="account__nav--item  account__item-selected">
                    <a href="AccountSetting.aspx">Account Settings</a>
                </li>
            </ul>
        </nav>
        <div class="updateAccount__content">
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
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

            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
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
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
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
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
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
            <div class="updateAccount__content--item content--item-confirmLetter">
                <div class="updateAccount__content--item-header item__header--last">
                    <p>Sign Up To Our Newsletter</p>
                    <p></p>
                </div>
                <div class="updateAccount__content--radio content--radio-last">
                    <input
                        type="checkbox"
                        id="confirmSignUpNewsletter"
                        value="yes" />
                    <label for="male">Yes</label><br />
                </div>
            </div>

            <div class="updatePassword">
                <p>Update Password</p>
                <hr />
            </div>

            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>New Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox> 
            </div>
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>Confirm Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> Comfirm password does not match your password'
                    ControlToCompare="txtNewPassword"
                    ControlToValidate="txtConfirmPassword"
                    Display="Dynamic" CssClass="txt__error">
                </asp:CompareValidator>
            </div>
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>Current Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                
            </div>
            <div class="updateAccount__content--item">
                <p>Collection Preference</p>
                <div class="updateAccount__content--radioList">
                    <div class="updateAccount__content--radio">
                        <input
                            type="radio"
                            id="Womanswear"
                            name="collection"
                            value="womenswear" />
                        <label for="male">Womenswear</label><br />
                    </div>
                    <div class="updateAccount__content--radio">
                        <input
                            type="radio"
                            id="Womanswear"
                            name="collection"
                            value="menswear" />
                        <label for="male">Menswear</label><br />
                    </div>
                    <div class="updateAccount__content--radio">
                        <input
                            type="radio"
                            id="Womanswear"
                            name="collection"
                            value="both"
                            class="updateAccount__content--radio" />
                        <label for="male">Both</label><br />
                    </div>
                </div>
            </div>
        <asp:Label ID="lbNotify" runat="server" Text="" CssClass="content--lbNotify"></asp:Label>
        </div>
        <div class="updateAccount__footer">
            <asp:Button ID="btnUpdate" runat="server" Text="Update details" class="updateAccount__btn" OnClick="btnUpdate_Click" />
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
