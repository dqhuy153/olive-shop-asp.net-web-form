<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="fashionShop.Customer.CTMProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .header {
            height: 5rem;
            z-index: 11;
            background-color: #fff;
        }

        .noti__banner {
            height: 4.8rem;
            background-color: #f4f4f4;
            width: 100%;
            position: fixed;
            top: 5rem;
            left: 0;
            z-index: 10;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            .noti__banner p {
                font-size: 1.1rem !important;
                font-weight: 500;
                letter-spacing: 0.2rem;
                color: #202020;
            }

        .head__title {
            max-width: 95%;
            margin-top: calc(2rem + 9.8rem);
            margin-bottom: 2rem;
        }

        .head__title-list {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

            .head__title-list .head__title-item {
                padding: 1rem 1.5rem 1rem 0;
                margin-left: 1rem;
                border-right: 0.1rem solid #a1a1a1;
            }

                .head__title-list .head__title-item:last-child {
                    border-right: 0;
                }

                    .head__title-list .head__title-item:last-child .head__title-link {
                        color: #000;
                    }

                .head__title-list .head__title-item .head__title-link {
                    font-size: 1.3rem !important;
                    font-weight: 500;
                    text-transform: uppercase;
                    color: #a1a1a1;
                }

                .head__title-list .head__title-item:hover .head__title-link {
                    color: #000;
                }

        .product__view {
            max-width: 95%;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

            .product__view .product__view-imgs {
                width: 50%;
                z-index: 1;
            }

                .product__view .product__view-imgs .product__view-img {
                    width: 100%;
                    height: auto;
                }

                    .product__view .product__view-imgs .product__view-img img {
                        width: 100%;
                        height: 100%;
                    }

            .product__view .product__view-details {
                width: 50%;
                padding-left: 3rem;
                padding-top: 5rem;
                position: sticky;
                top: 10rem;
            }

                .product__view .product__view-details .product__name {
                    font-size: 1.7rem !important;
                    font-weight: 600;
                    padding-bottom: 3rem;
                    margin-bottom: 1rem;
                    border-bottom: 1px solid #dfdedeb0;
                }

                .product__view .product__view-details .product__price {
                    font-size: 1.5rem !important;
                    font-weight: 500;
                }

                .product__view .product__view-details .product__size {
                    margin: 2rem 0;
                }

                    .product__view .product__view-details .product__size > select {
                        padding: 0.5rem;
                        margin-right: 2rem;
                        border: 1px solid #a1a1a1;
                        border-radius: 0.5rem;
                        outline: none;
                        font-size: 1.3rem !important;
                        font-weight: 400;
                        color: #202020;
                    }

                    .product__view .product__view-details .product__size a {
                        font-size: 1.5rem !important;
                        font-weight: 500;
                        letter-spacing: 1.3px;
                        text-decoration: underline;
                        transition: 0.3s all ease;
                    }

                        .product__view .product__view-details .product__size a:hover {
                            color: #a1a1a1;
                        }

                .product__view .product__view-details .product__addCart {
                    display: flex;
                    justify-content: flex-start;
                    align-items: center;
                }

                    .product__view .product__view-details .product__addCart > button {
                        padding: 1rem 2rem;
                        font-size: 1.4rem !important;
                        font-weight: 500;
                        color: #fff;
                        background-color: #000;
                        outline: none;
                        border: 0.15rem solid #000;
                        border-radius: 0.5rem;
                        transition: all ease 0.2s;
                        margin-right: 3rem;
                    }

                        .product__view .product__view-details .product__addCart > button:hover {
                            background-color: #fff;
                            color: #000;
                        }

                .product__view .product__view-details .product__more {
                    margin-top: 4rem;
                    border: 1px solid #dfdedeb0;
                }

                    .product__view .product__view-details .product__more .PM__select {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        background-color: #f4f4f4;
                        margin-bottom: 0.5rem;
                    }

                        .product__view .product__view-details .product__more .PM__select > li {
                            padding: 1.5rem 0;
                            width: 30%;
                            margin: 0.3rem 1rem;
                            text-align: center;
                            color: #000;
                            font-size: 1.5rem !important;
                            font-weight: 500;
                            text-transform: uppercase;
                            letter-spacing: 0.1rem;
                            border-radius: 0.3rem;
                            cursor: pointer;
                        }

                    .product__view .product__view-details .product__more .PM__content .product__more-info p,
                    .product__view .product__view-details .product__more .PM__content .product__more-size p,
                    .product__view .product__view-details .product__more .PM__content .product__more-ship p {
                        font-size: 1.5rem !important;
                        font-weight: 500;
                        letter-spacing: 0.05rem;
                        line-height: 1.2;
                        margin-top: 1rem;
                    }

                    .product__view .product__view-details .product__more .PM__content .product__more-size > p {
                        font-size: 1.3rem !important;
                        font-weight: 600;
                        padding: 1rem 0 2rem 1rem;
                        border-bottom: 1px solid #dfdedeb0;
                    }

                    .product__view .product__view-details .product__more .PM__content .product__more-size .info-size h3 {
                        width: 100%;
                        text-align: center;
                        margin: 1rem 0;
                        font-size: 1.2rem !important;
                    }

                    .product__view .product__view-details .product__more .PM__content .product__more-size .info-size > ul {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }

                        .product__view .product__view-details .product__more .PM__content .product__more-size .info-size > ul li {
                            padding: 0.5rem 1rem;
                            margin: 0 1rem;
                            text-align: center;
                        }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .info-size > ul li p {
                                font-size: 1.2rem !important;
                            }

                    .product__view .product__view-details .product__more .PM__content .product__more-size .more-info {
                        padding-top: 2rem;
                    }

                        .product__view .product__view-details .product__more .PM__content .product__more-size .more-info h3 {
                            font-size: 1.2rem !important;
                            width: 100%;
                            text-align: center;
                            margin-bottom: 2rem;
                        }

                        .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table {
                            width: 60%;
                            margin: 0 auto;
                        }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .circle-option {
                                position: relative;
                            }

                                .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .circle-option::before {
                                    content: "";
                                    position: absolute;
                                    top: 50%;
                                    left: 50%;
                                    transform: translate(-50%, -50%);
                                    width: 1rem;
                                    height: 1rem;
                                    border: 1px solid #000;
                                    border-radius: 200rem;
                                }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .option-selected::before {
                                background-color: #000;
                            }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .item-left {
                                text-align: right;
                            }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .item-right {
                                text-align: left;
                            }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .item-left,
                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table .item-right {
                                font-size: 1.6rem !important;
                            }

                            .product__view .product__view-details .product__more .PM__content .product__more-size .more-info > table tr td {
                                width: 2rem;
                                height: 2rem;
                            }

        /* owl carousel custom style*/
        .owl-dots {
            display: none;
        }

        .owl-prev,
        .owl-next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }

            .owl-prev:hover,
            .owl-next:hover {
                background: none !important;
            }

        .owl-next {
            right: -5rem;
        }

        .owl-prev {
            left: -5rem;
        }

            .owl-prev > span,
            .owl-next > span {
                font-size: 2rem !important;
                padding: 0 1rem;
                border-radius: 50%;
                border: 1px solid #202020;
            }

                .owl-prev > span:hover,
                .owl-next > span:hover {
                    background: #202020;
                    color: white;
                }

        /**/
        .product__related {
            width: 110rem;
            max-width: 95%;
        }

            .product__related .product__related-head {
                width: 100%;
                height: 4rem;
                text-align: center;
                line-height: 4rem;
                border-bottom: 1px solid #f4f4f4;
                border-top: 1px solid #f4f4f4;
                margin: 0.5rem 0;
                font-size: 1.8rem !important;
                font-weight: 500;
                letter-spacing: 0.2rem;
                color: #000;
            }

            .product__related .product__related-slide {
                margin-bottom: 2rem;
            }

                .product__related .product__related-slide .slide-box .pts-img > img:last-child {
                    display: none;
                    transition: all ease 0.3s;
                }

                .product__related .product__related-slide .slide-box .pts-img:hover > img:first-child {
                    display: none;
                }

                .product__related .product__related-slide .slide-box .pts-img:hover > img:last-child {
                    display: block;
                }

                .product__related .product__related-slide .slide-box .pts-info {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                }

                    .product__related .product__related-slide .slide-box .pts-info a, .product__related .product__related-slide .slide-box .pts-info p {
                        font-size: 1.8rem !important;
                        color: #202020;
                        font-weight: 500;
                    }

                    .product__related .product__related-slide .slide-box .pts-info a {
                        padding: 1rem 0;
                        font-size: 1.6rem !important;
                    }

        .txt__error {
            font-size: 1.3rem;
            color: #F19797;
            word-spacing: 0.2rem;
        }

        @media screen and (max-width: 1240px) {
            .owl-nav {
                display: none;
            }
        }

        @media screen and (max-width: 800px) {
            .product__view {
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

                .product__view .product__view-imgs {
                    width: 80%;
                }

                .product__view .product__view-details {
                    width: 80%;
                    padding-top: 2rem;
                }

                .product__view .PM__select {
                    flex-direction: column;
                }

                    .product__view .PM__select > li {
                        width: 95% !important;
                    }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="noti__banner">
        <p><i class="fas fa-truck-moving"></i>YOUR SHOPPING CART QUALIFIES FOR FREE SHIPPING WITHIN THE UK.</p>
    </div>
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
            <h2 class="product__name">Oversized Linen Shirt, Mustard</h2>
            <span class="product__price">$90.00</span>
            <div class="product__size">
                <%--<select name="product-size" id="">
                    <option value="">--Please Choose an Option--</option>
                    <option value="" title="Size S"></option>
                    <option value="">size L</option>
                </select>--%>
                <asp:DropDownList ID="ddlSize" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="ddlSize"
                        InitialValue="-1"
                        ErrorMessage='<i class="fas fa-times"></i> You have to pick a size.'
                        CssClass="txt__error"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>

                <a href="#">Will it fit me?</a>
            </div>

            <div class="product__addCart">
                <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="ADD TO CART" />
                <!--<div class="add-options">
                    <p class="btn-addOption">Add to wish list</p>
                    <div id="addOptions">
                        <a href="">Add to wish list</a>
                        <a href="">Create new wish list</a>
                    </div>
                </div> -->
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
                            Oversized linen blend shirt with a full button up front and a rounded hemline. Finished with
                            dropped shoulder sleeves for a slouchy silhouette. Wear as a cover-up, unbuttoned and
                            layered over a cami top with sleeves rolled or tucked into denim. A UK size 8 - 10 can
                            expect a oversized boyfriend style fit whilst a UK size 16 will wear more tapered.
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
            <div class="slide-box">
                <div class="pts-img">
                    <img src="./assets/image/ChiTiet/1.1.webp" alt="">
                    <img src="./assets/image/ChiTiet/slider1.1.webp" alt="">
                </div>
                <div class="pts-info">
                    <a href="">Rina Pintuck Linen Short, Beige
                    </a>
                    <span>$65.00</span>
                </div>
            </div>

            <div class="slide-box">
                <div class="pts-img">
                    <img src="./assets/image/ChiTiet/slider12.webp" alt="">
                    <img src="./assets/image/ChiTiet/slider12.1.webp" alt="">
                </div>
                <div class="pts-info">
                    <a href="">Rina Pintuck Linen Short, Beige
                    </a>
                    <span>$65.00</span>
                </div>
            </div>

            <div class="slide-box">
                <div class="pts-img">
                    <img src="./assets/image/ChiTiet/slider2.webp" alt="">
                    <img src="./assets/image/ChiTiet/slider2.1.webp" alt="">
                </div>
                <div class="pts-info">
                    <a href="">Rina Pintuck Linen Short, Beige
                    </a>
                    <span>$65.00</span>
                </div>
            </div>

            <div class="slide-box">
                <div class="pts-img">
                    <img src="./assets/image/ChiTiet/slider3.1.webp" alt="">
                    <img src="./assets/image/ChiTiet/slider2.1.webp" alt="">
                </div>
                <div class="pts-info">
                    <a href="">Rina Pintuck Linen Short, Beige
                    </a>
                    <span>$65.00</span>
                </div>
            </div>

            <div class="slide-box">
                <div class="pts-img">
                    <img src="./assets/image/ChiTiet/slider12.webp" alt="">
                    <img src="./assets/image/ChiTiet/slider12.1.webp" alt="">
                </div>
                <div class="pts-info">
                    <a href="">Rina Pintuck Linen Short, Beige
                    </a>
                    <span>$65.00</span>
                </div>
            </div>

            <div class="slide-box">
                <div class="pts-img">
                    <img src="./assets/image/ChiTiet/slider2.webp" alt="">
                    <img src="./assets/image/ChiTiet/slider2.1.webp" alt="">
                </div>
                <div class="pts-info">
                    <a href="">Rina Pintuck Linen Short, Beige
                    </a>
                    <span>$65.00</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
