<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="fashionShop.Customer.CTMProductDetail" %>
<%@ MasterType VirtualPath="~/Customer/CustomerMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- owl-carousel css-->
    <link rel="stylesheet" href="../Assets/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="../Assets/owl-carousel/owl.theme.default.min.css">
    <!-- base css -->
    <link rel="stylesheet" href="./assets/css/base.css">
    <!-- custom style for this page -->
    <link rel="stylesheet" href="../Assets/css/Customer/ChiTiet.css">
    <!-- jquey 3.6 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" defer></script>
    <!-- owl-carousel js -->
    <script src="../Assets/owl-carousel/owl.carousel.min.js" defer></script>
    <!-- js for this page -->
    <script src="../Assets/js/Customer/ChiTiet.js" defer></script>

    <style>
        
        /*Modal Add to Cart*/
        .modalAdd__visible {
            display: flex !important;
        }

        .modalAdd__container {
            width: 100%;
            height: 100vh;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            position: fixed;
            z-index: 99;
            transition: background-color 0.2s ease;
            display: none;
            justify-content: center;
            align-items: center;
        }

        #modalAdd__backdrop {
            width: 100%;
            height: 100vh;
            background-color: rgba(0,0,0,0.8);
        }

        .modalAdd__body {
            background-color: white;
            margin: 0 2rem;
            overflow: auto;
            display: block;
            margin: 0 auto;
            max-height: 100%;
            max-width: 100vh;
            min-height: 240px;
            z-index: 999;
            position: fixed;
        }

        .modalAdd__header {
            display: flex;
            align-items: center;
            background: #f4f4f4;
            padding: 2.2rem 2.5rem;
            overflow: auto;
        }

            .modalAdd__header p {
                width: 98%;
                text-align: center;
                word-spacing: 1.3px;
                font-size: 1.35rem;
            }

            .modalAdd__header button {
                width: 2%;
                font-size: 1.5rem;
                border: none;
                background: none;
                outline: none;
                cursor: pointer;
                padding-left: 3rem;
            }

        .modalAdd__content {
            padding: 2rem;
            display: flex;
            justify-content: space-between;
        }

            .modalAdd__content img {
                width: 25%;
            }

        .modalAdd__content--details {
            width: 35%;
        }

        .modalAdd__content--btns {
            width: 25%;
        }

            .modalAdd__content--btns .btn {
                display: block;
                width: 100%;
                background: #202020;
                border: 1px solid #333;
                text-align: center;
                text-transform: uppercase;
                color: #fff;
                letter-spacing: 1px;
                margin-bottom: 1rem;
                border-radius: 5px;
                font-weight: 400;
                font-size: 1.3rem;
                padding: 1.8rem 0;
            }

                .modalAdd__content--btns .btn:last-of-type {
                    background: #fff;
                    color: #333;
                    border: 1px solid #ccc;
                }

                .modalAdd__content--btns .btn:hover {
                    background: #fff;
                    color: #333;
                    transition: all 0.2s ease;
                }

                .modalAdd__content--btns .btn:last-of-type:hover {
                    border: 1px solid #111;
                    transition: all 0.2s ease;
                }

        .modalAdd__content--details .text {
            text-align: center;
            width: 70%;
            padding: 1.5rem 0 1rem;
            display: block;
        }

        .modalAdd__content--details .productName {
            font-size: 1.5rem;
            border-bottom: 1px solid #d5d5d5;
            font-family: Spectral, Arial, sans-serif;
            font-style: italic;
            font-weight: bold;
            font-size: 1.6rem;
            line-height: 1.5;
        }

        .modalAdd__content--details .x {
            margin: 0 5px;
        }

        @media screen and (max-width: 1240px) {
            .modalAdd__body {
                width: 100%;
            }
        }

        @media screen and (max-width: 850px) {

            .modalAdd__content {
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .modalAdd__header p {
                font-size: 1.2rem;
                line-height: 1.5
            }

            .modalAdd__container img {
                width: 70%;
                margin-top: 5rem;
                margin-bottom: 2rem;
            }

            .modalAdd__content--details {
                width: 100%;
                padding: 0 2rem;
            }

                .modalAdd__content--details .text {
                    width: 100%;
                }

            .modalAdd__content--btns {
                width: 90%;
                margin: 3rem 0;
            }
        }
    </style>
    <script type="text/javascript" defer>

        window.onload = function () {
            const backdrop = document.getElementById("modalAdd__backdrop");
            const modalAddToCart = document.getElementById("modalAdd");

            backdrop.addEventListener("click", () => {
                modalAddToCart.classList.remove("modalAdd__visible");
            });

            /*----------------------------------*/
        }


        function handleAddToCart() {
            const ddlSize = document.getElementById("ddlSize");
            const modalAddToCart = document.getElementById("modalAdd");

            if (ddlSize.value == -1) {
                return false;
            }
            else {
                modalAddToCart.classList.add("modalAdd__visible");
                return false;
            }
        }

        function handleCloseModalAdd() {
            const modalAddToCart = document.getElementById("modalAdd");

            modalAddToCart.classList.remove("modalAdd__visible");
            return false;
        }

        function handleAddToWishList() {
            swal("Successful!", "Your product's already in your wish list!", "success");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="noti__banner">
        <p><i class="fas fa-truck-moving"></i>YOUR SHOPPING CART QUALIFIES FOR FREE SHIPPING WITHIN THE UK.</p>
    </div>
    <!--Add to cart successful modal-->
    <div class="modalAdd__container" id="modalAdd">
        <div id="modalAdd__backdrop">
        </div>
        <div class="modalAdd__body" id="modalAdd__body">
            <div class="modalAdd__header">
                <p>ONLY BASKET TOTALS UNDER $800 ARE DELIVERED TO US ADDRESSES FREE OF TAXES AND DUTIES</p>
                <asp:LinkButton ID="btnCloseModalAdd" runat="server" Text='<i class="fas fa-times"></i>' OnClientClick="return handleCloseModalAdd()" />
            </div>
            <div class="modalAdd__content">
                <asp:Image ID="imgModalAdd" runat="server" />
                <div class="modalAdd__content--details">
                    <asp:Label ID="lbProductNameModalAdd" CssClass="text productName" runat="server" Text=""></asp:Label>
                    <div class="text">
                        <span>Size: </span>
                        <asp:Label ID="lbSizeModalAdd" CssClass="size" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="text">
                        <asp:Label ID="lbQuantityModalAdd" CssClass="quantity" runat="server" Text=""></asp:Label>
                        <span class="x">x</span>
                        <asp:Label ID="lbPriceModalAdd" CssClass="price" runat="server" Text=""></asp:Label>
                    </div>

                </div>
                <div class="modalAdd__content--btns">
                    <a href="Checkout.aspx" class="btn ModalAdd-btn">Checkout</a>
                    <a href="Products.aspx" class="btn ModalAdd-btn">Continue Shopping</a>
                    <a href="Cart.aspx" class="btn ModalAdd-btn">View Cart</a>
                </div>
            </div>
        </div>
    </div>
    <!--end modal-->

    <div class="head__title grid">
        <ul class="head__title-list">
            <li class="head__title-item">
                <a href="Home.aspx" class="head__title-link">Home</a>
            </li>
            <li class="head__title-item">
                <asp:HyperLink ID="hplMainCategory" runat="server" class="head__title-link"></asp:HyperLink>
            </li>
            <li class="head__title-item">
                <asp:HyperLink ID="hplGender" runat="server" class="head__title-link"></asp:HyperLink>
            </li>
            <li class="head__title-item">
                <asp:HyperLink ID="hplCategory" runat="server" class="head__title-link"></asp:HyperLink>
            </li>
            <li class="head__title-item">
                <asp:Label ID="lbNameRoute" runat="server" Text="" class="head__title-link"></asp:Label>
            </li>
        </ul>
    </div>

    <div class="product__view grid" id="product__view">
        <div class="product__view-imgs">
            <asp:Panel ID="PanelImage" runat="server"></asp:Panel>
        </div>
        <div class="product__view-details" id="product__view-details">
            <h2 class="product__name">
                <asp:Label ID="lbProductName" runat="server" Text=""></asp:Label></h2>
            <span class="product__price">$<asp:Label ID="lbPrice" runat="server" Text=""></asp:Label></span>
            <div class="product__size">
                <asp:DropDownList ID="ddlSize" runat="server" ClientIDMode="Static"></asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidatorSize"
                    runat="server"
                    ControlToValidate="ddlSize"
                    InitialValue="-1"
                    ErrorMessage='<i class="fas fa-times"></i> You have to pick a size.'
                    CssClass="txt__error"
                    Display="Dynamic"
                    ClientIDMode="Static">
                </asp:RequiredFieldValidator>

                <a href="#">Will it fit me?</a>
            </div>

            <div class="product__addCart">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="ADD TO CART" OnClientClick="handleAddToCart()" />
                        <asp:Button ID="btnAddToWishList" OnClick="btnAddToWishList_Click" runat="server" CausesValidation="false" Text="Add to wish list" OnClientClick="handleAddToWishList()" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="add-options">
                    <div id="addOptions">
                    </div>
                </div>
            </div>
            <div class="product__more">
                <ul class="PM__select">
                    <li class="option" style="background-color: #fff;" onclick="showtab(0)">Information</li>
                    <li class="option" onclick="showtab(1)">Size & fit</li>
                    <li class="option" onclick="showtab(2)">Delivery & returns</li>
                </ul>
                <div class="PM__content">
                    <div class="product__more-info tab" style="display: block;">
                        <p>
                            <asp:Label ID="lbProductInfo" runat="server" Text=""></asp:Label>
                        </p>
                        <p>One Size: Length: 70cm, Across Width (Bust): 76cm, Sleeve: 45cm.</p>
                        <p>55% Linen, 45% Viscose.</p>
                    </div>

                    <div class="product__more-size tab" style="display: none;">
                        <!-- <p class="CareLabel">HKLrX</p> -->
                        <p>
                            Separate colours. Lay flat to dry. Do not wring. Press reverse side only. Press while damp
                        </p>
                        <div class="info-size">
                            <h3>Will it fit me?</h3>
                            <ul>
                                <li>
                                    <p>UK 6</p>
                                    <p><i class="fas fa-question-circle"></i></p>
                                </li>

                                <li>
                                    <p>UK 8</p>
                                    <p><i class="fas fa-question-circle"></i></p>
                                </li>

                                <li>
                                    <p>UK 12</p>
                                    <p><i class="fas fa-question-circle"></i></p>
                                </li>

                                <li>
                                    <p>UK 14</p>
                                    <p><i class="fas fa-question-circle"></i></p>
                                </li>
                            </ul>
                        </div>
                        <div class="more-info">
                            <h3>Fabric and styling</h3>
                            <table>
                                <tr>
                                    <td class="item-left">Light</td>
                                    <td class="circle-option option-selected"></td>
                                    <td class="circle-option"></td>
                                    <td class="circle-option"></td>
                                    <td class="circle-option"></td>
                                    <td class="item-right">heavy</td>
                                </tr>
                                <tr>
                                    <td class="item-left">TRANSPARENT</td>
                                    <td class="circle-option"></td>
                                    <td class="circle-option"></td>
                                    <td class="circle-option option-selected"></td>
                                    <td class="circle-option"></td>
                                    <td class="item-right">opacque</td>
                                </tr>
                                <tr>
                                    <td class="item-left">SLIMFIT</td>
                                    <td class="circle-option"></td>
                                    <td class="circle-option"></td>
                                    <td class="circle-option option-selected"></td>
                                    <td class="circle-option"></td>
                                    <td class="item-right">losefit</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="product__more-ship tab" style="display: none;">
                        <p>
                            <span style="font-size: 1.5rem!important; font-weight: 600;">United Kingdom</span>: Delivery
                            is free to UK addresses for orders of £95 or more. Next working day & Saturday delivery
                            available. See our Delivery page for details. UK returns are free of charge. See our returns
                            page for details.
                        </p>
                        <p>
                            <span style="font-size: 1.5rem!important; font-weight: 600;">International</span>: We offer
                            free worldwide shipping for certain basket totals. See our Delivery page for details. You
                            can return to us for a full refund easily. See our Returns page for details.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <div class="product__related grid">
        <h2 class="product__related-head">Related Products</h2>

       <div class="owl-carousel owl-theme product__related-slide">
           <asp:Repeater ID="rptRelatedProduct" runat="server">
               <ItemTemplate>
                   <a href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>" class="slide-box">
                       <div class="pts-img">
                           <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[0] %>" alt="">
                           <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[1] %>" alt="">
                       </div>
                       <div class="pts-info">
                           <p><%# Eval("PRODUCT_NAME") %>
                           </p>
                           <span>$<%# Eval("PRICE") %></span>
                       </div>
                   </a>
               </ItemTemplate>
           </asp:Repeater>
        </div>

    </div>
</asp:Content>
