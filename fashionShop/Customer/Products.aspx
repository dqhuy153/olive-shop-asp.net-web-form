<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="fashionShop.Customer.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div,
        li,
        a,
        span {
            font-family: 'Ubuntu', sans-serif;
            color: #000;
        }

        .banner {
            display: flex;
            margin-top: 68px;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
            height: 48px;
        }

        .ti-shopping-cart-full {
            width: 32px;
        }

        .location {
            /* float: left; */
            display: flex;
            padding: 4px 64px;
        }

        .location__home--dir::after {
            content: "";
            display: block;
            position: absolute;
            height: 1px;
            border-left: 10px solid #f4f4f4;
            top: 50%;
            transform: translateY(-50%);
        }

        .location.location__home--dir::before {
            position: absolute;
            left: 0;
            top: -16px;
            width: 100;
            height: 20%;
            counter-reset: "";
            display: block;
        }

        .location__home--first__child,
        .location__home--dir,
        .location__home--last__child {
            padding: 0 8px;
            display: flex;
            align-items: center;
        }

        .location__home--first__child {
            padding: 0 8px;
            border-left: 1px solid rgba(0, 0, 0, 0.3);
            border-right: 1px solid rgba(0, 0, 0, 0.3);
        }


        /* condition */

        .menu--condition {
            width: 100%;
            height: 67px;
            background-color: #fff;
            margin-top: 12px;
            padding: 0 64px;
        }

            .menu--condition .menu--left,
            .menu--condition .menu--right {
                display: inline-block;
                margin: 0 auto;
            }

        .menu--condition__items .menu--item {
            cursor: pointer;
            line-height: 32px;
        }

        .menu--left {
            float: left;
        }

        .menu--right {
            float: right;
        }

        .margin-left-32 {
            margin-left: 32px !important;
        }


        /*phan menu con */

        .menu--child {
            display: none;
            width: 160px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            position: absolute;
        }

        .menu--item:hover .menu--child {
            display: block;
            animation: headerNotifyGrowth ease-in 0.4s;
            transform-origin: top center;
        }

        .menu--child a {
            padding-left: 12px;
            cursor: context-menu;
        }

            .menu--child a:hover {
                background-color: #f4f4f4f4;
            }

        input[type=checkbox] {
            cursor: pointer;
            border-style: normal;
        }


        /* product */

        .product {
            display: flex;
            flex-wrap: wrap;
            margin-top: 12px;
            padding: 0 64px;
        }

        .product--show {
            height: 724px;
            width: 33.333%;
        }

        img {
            height: 631px;
            width: 397px;
            ;
        }

        .name--product {
            align-items: center;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 8px 0;
        }

        .cost--product {
            align-items: center;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 8px 0;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body -->
    <div class="banner">
        <i class="ti-shopping-cart-full"></i>
        <p>FREE UK SHIPPING FOR ORDERS OF £95 OR MORE. ADD £36.00 TO YOUR ORDER TO QUALIFY FOR FREE SHIPPING WITHIN THE UK.</p>

    </div>
    <!-- result title from search -->
    <asp:Label ID="lbResultSearch" runat="server" Text=""></asp:Label>

    <!-- location -->
    <div class="location">
        <div class="location__home--dir"><a id="home" href="Home.aspx">Home  </a></div>
        <div class="location__home--first__child" id="locationMainCategory" runat="server">
            <asp:HyperLink ID="hplinkMainCategory" runat="server"></asp:HyperLink>
        </div>
        <div class="location__home--first__child" id="locationGender" runat="server">
            <asp:HyperLink ID="hplGender" runat="server"></asp:HyperLink>
        </div>
        <div class="location__home--first__child" id="locationCategory" runat="server">
            <asp:HyperLink ID="hplinkCategory" runat="server"></asp:HyperLink>
        </div>
    </div>
    <!--condition  -->
    <div class="menu--condition">
        <ul class="menu--condition__items ">
            <li class="menu--item menu--left" id="available">AVAILABILITY
                    <i class="fas fa-chevron-down"></i>
                <div class="menu--child">
                    <asp:Label ID="Label1" runat="server" Text="" AssociatedControlID="cbIsFeatured">
                        <asp:HyperLink ID="hplIsFeatured" runat="server">
                            <input type="checkbox" id="cbIsFeatured" runat="server">
                            <span class="checkmark">Is Featured</span>
                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="" AssociatedControlID="cbInStock">
                        <asp:HyperLink ID="hplInStock" runat="server">
                            <input type="checkbox" id="cbInStock" runat="server">
                            <span class="checkmark">In Stock</span>
                        </asp:HyperLink>
                    </asp:Label>
                </div>
            </li>
            <li class="menu--item menu--left margin-left-32" id="size">SIZE
                    <i class="fas fa-chevron-down"></i>
                <div class="menu--child">
                    <asp:Label ID="Label3" runat="server" Text="" AssociatedControlID="cbS">
                        <asp:HyperLink ID="hplS" runat="server">
                            <input type="checkbox" id="cbS" runat="server">
                            <span class="checkmark">S</span>

                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="" AssociatedControlID="cbM">
                        <asp:HyperLink ID="hplM" runat="server">
                            <input type="checkbox" id="cbM" runat="server">
                            <span class="checkmark">M</span>

                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="" AssociatedControlID="cbL">
                        <asp:HyperLink ID="hplL" runat="server">
                            <input type="checkbox" id="cbL" runat="server">
                            <span class="checkmark">L</span>

                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="" AssociatedControlID="cbXL">
                        <asp:HyperLink ID="hplXL" runat="server">

                            <input type="checkbox" id="cbXL" runat="server">
                            <span class="checkmark">XL</span>
                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="" AssociatedControlID="cbXXL">
                        <asp:HyperLink ID="hplXXL" runat="server">
                            <input type="checkbox" id="cbXXL" runat="server">
                            <span class="checkmark">XXL</span>

                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="" AssociatedControlID="cbOverSize">
                        <asp:HyperLink ID="hplOverSize" runat="server">
                            <input type="checkbox" id="cbOverSize" runat="server">
                            <span class="checkmark">Over Size / No Size</span>

                        </asp:HyperLink>
                    </asp:Label>

                </div>
            </li>
            <li class="menu--item menu--right" id="feature">
                <asp:Label ID="lbSort" runat="server" Text="Featured Items"></asp:Label>
                <i class="fas fa-chevron-down"></i>
                <div class="menu--child">
                    <asp:Label ID="Label9" runat="server" Text="" AssociatedControlID="cbOrderFeatured">
                        <asp:HyperLink ID="hplOrderFeatured" runat="server">
                            <input type="radio" name="sort" id="cbOrderFeatured" runat="server">
                            <span class="checkmark">Feartured Items</span>
                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="" AssociatedControlID="cbNewest">
                        <asp:HyperLink ID="hplNewest" runat="server">
                            <input type="radio" name="sort" id="cbNewest" runat="server">
                            <span class="checkmark">Newest Items</span>
                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="" AssociatedControlID="cbPriceAsc">
                        <asp:HyperLink ID="hplPriceAsc" runat="server">
                            <input type="radio" name="sort" id="cbPriceAsc" runat="server">
                            <span class="checkmark">Prices: Ascendings</span>
                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label12" runat="server" Text="" AssociatedControlID="cbPriceDesc">
                        <asp:HyperLink ID="hplPriceDesc" runat="server">
                            <input type="radio" name="sort" id="cbPriceDesc" runat="server">
                            <span class="checkmark">Prices: Descendings</span>
                        </asp:HyperLink>
                    </asp:Label>
                </div>
            </li>
        </ul>
    </div>
    <div class="product" id="show" onscroll="checkScroll()">
        <asp:Repeater ID="rptProducts" runat="server">
            <ItemTemplate>
                <a href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>" class="product--show">
                    <div class="img">
                        <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[0]%>" alt="">
                    </div>
                    <p class="name--product"><%# Eval("PRODUCT_NAME") %></p>
                    <p class="cost--product">£<%# Eval("PRICE") %></p>
                </a>
            </ItemTemplate>
        </asp:Repeater>

    </div>


</asp:Content>
