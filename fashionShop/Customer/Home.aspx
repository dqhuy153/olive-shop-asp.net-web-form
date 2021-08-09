<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="fashionShop.Customer.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Home</title>
    <link rel="stylesheet" href="../Assets/css/Customer/Home.css" />
    <script defer>
        //xử lí header
        document.addEventListener('scroll', e => {
            if (window.scrollY > 150) {
                document.getElementById("header").classList.add("header__scroll");
            }
            else {
                document.getElementById("header").classList.remove("header__scroll");
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Begin: slider -->
    <!-- use for mobile -->
    <div class="cotainer ">
        <!-- Begin: slider -->
        <!-- use for mobile -->
        <div id="slider--main">
        </div>
        <div class="slider__mobile  ">
            <%--<img class="mySlides img--main" src="../Images/sl_1__97970.jpg" alt="">
            <img class="mySlides img--main" src="../Images/sl_2__81936.jpg" alt="">--%>
            <img class="mySlides img--main" src="../Images/homeBGMB.jpg" alt="">
            <img class="mySlides img--main" src="../Images/homeBGMB1.jpg" alt="">

        </div>
        <div id="slider">
            <div class="text-content">
                <h2 class="text-heading">OLIVE | CONTEMPORARY LIFESTYLE</h2>
                <div class="text-decription">Official site of the contemporary lifestyle brand from the United Kingdom.
                </div>
            </div>
        </div>
        <!-- End: slider -->
        <div class="section-name">
            <div class="content-section">
                <!-- Places -->
                <div class="place-list">
                    <div class="place-item ">
                        <div class="place-body ">
                            <div class="icon"><i class="fas fa-paper-plane"></i></div>
                            <p class="place-time">WORLDWIDE DELIVERY</p>
                            <p class="place-decription ">See our Delivery page for details</p>
                        </div>
                    </div>
                    <div class="place-item  ">
                        <div class="place-body">
                            <div class="icon"> <i class="fas fa-lock"></i> </div>
                            <p class="place-time">SECURE PAYMENTS</p>
                            <p class="place-decription ">PCI DSS Compliant Checkout</p>
                        </div>
                    </div>
                    <div class="place-item ">
                        <div class="place-body">
                            <div class="icon"><i class="fas fa-exchange-alt"></i></div>
                            <p class="place-time">SIMPLE RETURNS</p>
                            <p class="place-decription">Free returns for UK order</p>
                        </div>
                    </div>
        

                </div>
            </div>
        </div>
        <script>
            "use strict"
            let myIndex = 0;
            carousel();

            function carousel() {
                let i;
                const x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none ";
                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1
                }
                x[myIndex - 1].style.display = "block ";
                setTimeout(carousel, 2000); // Change image every 2 seconds
            }
        </script>
        </div>
</asp:Content>
