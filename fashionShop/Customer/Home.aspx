<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="fashionShop.Customer.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* phan slider */

        #slider {
            margin-top: 32px;
        }

            #slider .text-content {
                bottom: 48px;
                color: #000;
                text-align: center;
                right: 0;
                left: 0;
            }

            #slider .text-heading {
                font-weight: 500;
                font-size: 24px;
            }

            #slider .text-decription {
                font-size: 15px;
                margin-top: 25px;
                text-shadow: 0 0 1px #fff;
            }

        #slider--main {
            position: relative;
            padding-top: 50%;
            background: url("../Images/homeBackground.jpeg") top center / cover no-repeat;
        }
        /*  */

        .place-list {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        .icon {
            display: flex;
            justify-content: center;
            padding-bottom: 10px
        }

        .tour-section {
            background-color: #fff;
        }

        .ticket-list {
            margin-top: 40px;
            list-style: none;
            background-color: #fff;
        }
        /* footer */
        /* map-section */

        .map-section img {
            width: 100%;
        }

        .form > form input {
            border: none;
        }
        /* Place */

        .tour-section {
            margin: 0 160px;
        }

        .place-item {
            height: 85px;
            width: 325px;
            border: 0.3px solid rgba(0, 0, 0, 0.3);
            align-items: center;
            margin: 0 50px;
            display: flex;
            justify-content: center;
        }

            .place-item:hover {
                background-color: #f4f4f4f4;
                cursor: pointer;
            }

        .place-body {
            align-items: center;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Begin: slider -->
    <!-- use for mobile -->
    <div class="home">
        <div id="slider--main">
            <!-- <img src="./assets/image/TrangChu/background.jpeg" alt=""> -->
        </div>
        <div id="slider">
            <div class="text-content">
                <h2 class="text-heading">OLIVE | CONTEMPORARY LIFESTYLE</h2>
                <div class="text-decription">Official site of the contemporary lifestyle brand from the United Kingdom.</div>
            </div>
        </div>
        <!-- End: slider -->
        <div id="tour" class="tour-section">
            <div class="content-section">
                <!-- Places -->
                <div class="place-list">
                    <div class="place-item s-col-full">
                        <div class="place-body">
                            <div class="icon"><i class="ti-heart"></i></div>
                            <p class="place-time">WORLDWIDE DELIVERY</p>
                            <p class="place-decription">See our Delivery page for details</p>
                        </div>
                    </div>
                    <div class="place-item s-col-full">
                        <div class="place-body">
                            <div class="icon"><i class="ti-lock"></i></div>
                            <p class="place-time">SECURE PAYMENTS</p>
                            <p class="place-decription">PCI DSS Compliant Checkout</p>
                        </div>
                    </div>
                    <div class="place-item s-col-full">
                        <div class="place-body">
                            <div class="icon"><i class="ti-reload"></i></div>
                            <p class="place-time">SIMPLE RETURNS</p>
                            <p class="place-decription">Free returns for UK order</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
