<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="fashionShop.Customer.CTMProductDetail" %>

<%@ MasterType VirtualPath="~/Customer/CustomerMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title id="pageTitle" runat="server"></title>
    <!-- owl-carousel css-->
    <link rel="stylesheet" href="../Assets/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="../Assets/owl-carousel/owl.theme.default.min.css">
    <!-- base css -->
    <link rel="stylesheet" href="../Assets/css/base.css">
    <!-- custom style for this page -->
    <link rel="stylesheet" href="../Assets/css/Customer/ProductDetail.css">
    <!-- jquey 3.6 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" defer></script>
    <!-- owl-carousel js -->
    <script src="../Assets/owl-carousel/owl.carousel.min.js" defer></script>
    <!-- js for this page -->
    <script src="../Assets/js/Customer/ProductDetail.js" defer></script>

    <script type="text/javascript" defer>

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

    <div class="product__wrapper">
        <div class="product c-70 p1">
            <div class="product__header p1">
                <ul class="breadcrumbs">
                    <li class="breadcrumb p1">
                        <a href="Home.aspx" class="head__title-link">Home</a>
                    </li>
                    <li class="breadcrumb p1">
                        <asp:HyperLink ID="hplMainCategory" runat="server"></asp:HyperLink>
                    </li>
                    <li class="breadcrumb p1">
                        <asp:HyperLink ID="hplGender" runat="server"></asp:HyperLink>
                    </li>
                    <li class="breadcrumb p1">
                        <asp:HyperLink ID="hplCategory" runat="server"></asp:HyperLink>
                    </li>
                    <li class="breadcrumb p1">
                        <asp:Label ID="lbNameRoute" runat="server" Text=""></asp:Label>
                    </li>
                </ul>

            </div>
            <div class="product__detail">
                <div class="product__detail-imgs owl-carousel owl-theme">

                    <asp:PlaceHolder ID="PlaceHolderImages" runat="server"></asp:PlaceHolder>

                </div>
                <div class="product__detail-content">
                    <div class="productName">
                        <h2>
                            <asp:Label ID="lbProductName" runat="server" Text=""></asp:Label></h2>
                    </div>
                    <div class="productInfo">
                        <p class="productInfo-price">$<asp:Label ID="lbPrice" runat="server" Text=""></asp:Label></p>
                        <div class="productInfo-select">
                            <div class="productInfo-selection">
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
                            </div>
                            <div class="productInfo-selectAsk">
                                <p onclick="changeTab(1)">Will it fit me?</p>
                            </div>
                        </div>
                        <div class="productAddCart">
                            <div class="addCart">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button
                                            ID="btnAddToCart"
                                            OnClick="btnAddToCart_Click"
                                            runat="server"
                                            Text="ADD TO CART"
                                            OnClientClick="handleAddToCart()"
                                            class="addCart-btn" />

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <%--<button class="addCart-btn">add to cart</button>--%>
                            </div>
                            <div class="productAddCart-ask">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Button
                                            ID="btnAddToWishList"
                                            OnClick="btnAddToWishList_Click"
                                            runat="server"
                                            CausesValidation="false"
                                            Text="Add to wish list"
                                            OnClientClick="handleAddToWishList()" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <%--<a href="">ADD TO WISH LIST<i class="fas fa-chevron-down"></i></a>
                                <ul class="" style="display: none;">
                                    <li>
                                        <a href="">add to my wish list</a>
                                    </li>
                                    <li>
                                        <a href="">create new wish list</a>
                                    </li>
                                </ul>--%>
                            </div>
                        </div>
                    </div>
                    <div class="productAbout">
                        <ul class="aboutTabs">
                            <li class="aboutTab activeTab" onclick="changeTab(0)">INFORMATION</li>
                            <li class="aboutTab" onclick="changeTab(1)">SIZE & FIT</li>
                            <li class="aboutTab" onclick="changeTab(2)">DELIVERY & RETURNS</li>
                        </ul>
                        <div class="aboutTab-content">
                            <div class="aboutTab-contentItem" style="display: block;">
                                <%--<p>Half sleeve t-shirt made from dense cotton.</p>
                                <p>One Size: Length: 64cm, Across Width (Chest): 67cm, Sleeve: 14cm.</p>
                                <p>100% Cotton.</p>
                                <p>Model Height: 185cm.</p>--%>
                                <textarea id="lbProductInfo" disabled runat="server">                                   
                             </textarea>
                                <%--<asp:Label ID="lbProductInfo" runat="server" Text=""></asp:Label>--%>
                            </div>
                            <div class="aboutTab-contentItem content__size" style="display: none;">
                                <h3 class="content__size-header">Separate colours. Lay flat to dry. Do not wring. Press
                                    reverse side only. Press while damp</h3>
                                <div class="content__size-more">
                                    <p>Fabric and styling</p>
                                    <table>
                                        <tr>
                                            <td class="item-left">LIGHT</td>
                                            <td class="circle-option circle-optionSelected"></td>
                                            <td class="circle-option"></td>
                                            <td class="circle-option"></td>
                                            <td class="circle-option"></td>
                                            <td class="item-right">HEAVY</td>
                                        </tr>
                                        <tr>
                                            <td class="item-left">TRANSPARENT</td>
                                            <td class="circle-option"></td>
                                            <td class="circle-option"></td>
                                            <td class="circle-option circle-optionSelected"></td>
                                            <td class="circle-option"></td>
                                            <td class="item-right">TRANSPARENT</td>
                                        </tr>
                                        <tr>
                                            <td class="item-left">SLIMFIT</td>
                                            <td class="circle-option"></td>
                                            <td class="circle-option circle-optionSelected"></td>
                                            <td class="circle-option"></td>
                                            <td class="circle-option"></td>
                                            <td class="item-right">LOOSEFIT</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="aboutTab-contentItem" style="display: none;">
                                <p>
                                    <span>United Kingdom:</span>Delivery is free to UK addresses for orders of £95 or
                                    more. Next working day & Saturday delivery available. See our Delivery page for
                                    details. UK returns are free of charge. See our returns page for details.
                                </p>
                                <p>
                                    <span>International:</span>We offer free worldwide shipping for certain basket
                                    totals. See our Delivery page for details. You can return to us for a full refund
                                    easily. See our Returns page for details.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__related c-70 p1">
            <h2>Related Products</h2>
            <div class=" owl-carousel owl-theme product__related-slides">
                <asp:Repeater ID="rptRelatedProduct" runat="server">
                    <ItemTemplate>
                        <a href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>" class="blockItem">
                            <div class="item__imgs">
                                <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[0] %>" alt="">
                                <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[1] %>" alt="">
                            </div>
                            <div class="item__info p1">
                                <h4 class="item__infoName">
                                    <%# Eval("PRODUCT_NAME") %>
                                </h4>
                                <span class="item__infoPrice">$<%# Eval("PRICE") %></span>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
