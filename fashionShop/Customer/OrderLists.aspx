<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderLists.aspx.cs" Inherits="fashionShop.Customer.OrderLists" %>

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

        .orders__note {
            display: flex;
            padding: 2rem;
            background: rgb(248, 248, 248);
            border-left: 5px solid #333;
            margin-bottom: 5rem;
            align-items: center;
        }

            .orders__note i {
                font-size: 2rem;
                padding-right: 2rem;
            }

            .orders__note p {
                line-height: 1.4;
                word-spacing: 0.25rem;
            }

        .orders__note--warning {
            width: 90%;
            margin: 0 auto;
        }

        .account__footer {
            float: right;
            margin: 1rem 0 5rem;
        }

        @media screen and (max-width: 1080px) {
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderList.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <span>Your orders</span>
        </div>
        <p class="account__title">Orders</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item account__item-selected">
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
                <li class="account__nav--item">
                    <a href="AccountSetting.aspx">Account Settings</a>
                </li>
            </ul>
        </nav>
        <div class="account__content orders__content">
            <div class="order__table"></div>
            <div class="orders__note">
                <i class="fas fa-envelope"></i>
                <p>
                    If you have a question about your order, please click on
                        the Help button at the bottom of the screen, and
                        complete the contact form. You will receive a response
                        from us by email. Please include your Order Number in
                        your message.
                </p>
            </div>
            <div class="orders__note orders__note--warning">
                <i class="fas fa-exclamation-circle"></i>
                <p>
                    YOU HAVEN'T PLACED ANY ORDERS WITH US. WHEN YOU DO,
                        THEIR STATUS WILL APPEAR ON THIS PAGE.
                </p>
            </div>
        </div>
        <div class="account__footer">
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
