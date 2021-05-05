<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateAddress.aspx.cs" Inherits="fashionShop.Customer.UpdateAddress" %>

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
            margin: 5rem auto;
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

        .update__content {
            width: 80%;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .update__content--item {
            width: 48%;
            margin: 1.5rem 0;
        }

        .item__header--last {
            margin-bottom: 1rem;
        }

        .update__content--item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

            .update__content--item-header p:last-of-type {
                text-transform: uppercase;
                font-size: 0.95rem;
                color: #ccc;
            }

        .update__content--item input,
        .update__content--item select {
            width: 100%;
            padding: 1rem;
            margin: 1.2rem 0;
            border: 1px solid #bbb;
            border-radius: 0.3rem;
            color: #111;
        }

        .update__content--radioList {
            margin-top: 0.7rem;
        }

        .update__content--radio {
            display: flex;
            align-items: center;
        }

            .update__content--radio input {
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
        
        .update__footer {
            display: flex;
            width: 80%;
            margin: 5rem auto;
            justify-content: space-between;
            align-items: flex-end;
        }

        .update__btn {
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

            .update__btn:hover {
                border: 1px solid #858282;
                color: #383838;
                background: none;
                transition: all 0.2s linear;
            }

        .cancel__btn {
            background: none;
            padding: 1.3rem 3.2rem;
            border: 1px solid #aaa;
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.2rem;
            color: #111;
            letter-spacing: 0.3rem;
            font-size: 1.3rem;
            cursor: pointer;
            border-radius: 0.4rem;
            margin-left: 3rem;
        }

            .cancel__btn:hover {
                border: 1px solid #111;
                background: white;
                transition: all 0.2s linear;
            }

        .update__footer p {
            font-size: 1.3rem;
            position: relative;
            left: 9rem;
        }


        .update__footer i {
            margin-left: 0.6rem;
        }

        @media screen and (max-width: 1080px) {
            .update__content {
                width: 100%;
            }

            .update__footer {
                width: 100%;
            }

                .update__footer p {
                    position: initial;
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

            .update__content--item {
                width: 100%;
            }

            .update__title {
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
            <a href="AddressBook.aspx">Address book</a>
            <span class="account__map--separate">|</span>
            <span>Address form</span>
        </div>
        <p class="account__title">Update Addresses</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item account__item-selected">
                    <a href="#">Address</a>
                </li>
                <li class="account__nav--item">
                    <a href="WishLists.aspx">Wish Lists (0)</a>
                </li>
                <li class="account__nav--item">
                    <a href="RecentlyViewed.aspx">Recently Viewed</a>
                </li>
                <li class="account__nav--item">
                    <a href="AccountSetting.aspx">Account Settings</a>
                </li>
            </ul>
        </nav>
        <div class="account__content update__content">

            <div class="update__content--item">
                <div class="update__content--item-header">
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

            <div class="update__content--item">
                <div class="update__content--item-header">
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
            <div class="update__content--item">
                <div class="update__content--item-header">
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
            <div class="update__content--item">
                <div class="update__content--item-header">
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
            <div class="update__content--item">
                <div class="update__content--item-header">
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

            <div class="update__content--item">
                <div class="update__content--item-header">
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

            <div class="update__content--item">
                <div class="update__content--item-header">
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
        </div>
        <div class="update__footer">
            <div>
                <asp:Button ID="btnUpdate" runat="server" Text="Save address" class="update__btn" OnClick="btnUpdate_Click" />
                <a href="AddressBook.aspx" class="cancel__btn">Cancel</a>
            </div>
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
