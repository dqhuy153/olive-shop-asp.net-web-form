<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="fashionShop.Customer.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Products</title>
    <link rel="stylesheet" href="../Assets/css/base.css" />
    <link rel="stylesheet" href="../Assets/css/Customer/Products.css" />
    <script src="../Assets/js/Customer/Products.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Body -->

    <!-- result title from search -->
    <asp:Label ID="lbResultSearch" ClientIDMode="Static" runat="server" Text=""></asp:Label>

    <!-- location -->
    <div class="location">
        <div class="location__home--dir"><a id="home" href="Home.aspx">Home  </a></div>
        <div class="location__home--child" id="locationMainCategory" runat="server">
            <asp:HyperLink ID="hplinkMainCategory" runat="server"></asp:HyperLink>
        </div>
        <div class="location__home--child" id="locationGender" runat="server">
            <asp:HyperLink ID="hplGender" runat="server"></asp:HyperLink>
        </div>
        <div class="location__home--child" id="locationCategory" runat="server">
            <asp:HyperLink ID="hplinkCategory" runat="server"></asp:HyperLink>
        </div>
    </div>
    <!--condition  -->
    <div class="menu--condition">
        <div class="filter-tablet-container">
            <div class="filter--tablet-header">
                <asp:Label ID="lbNotiyFilter" runat="server" Text="Browse by Availability, Size & more"></asp:Label>
                <span class="filter--tablet-header-indicator">
                    <span class="indicator-on">Show Filters <i class="ti-angle-down"></i></span>
                    <span class="indicator-off">Hide Filters <i class="ti-angle-up"></i></span>
                </span>
            </div>
            <ul id="filter-items-tablet-container" class="menu--condition__items-tablet">
            </ul>
        </div>

        <ul class="menu--condition__items ">
            <li class="menu--item menu--left" id="available">
                <div class="menu--header">
                    <span>AVAILABILITY </span>
                    <span>
                        <asp:HyperLink ID="hplClearFeatured" ClientIDMode="Static" CssClass="menu__clear--btn" runat="server">CLEAR</asp:HyperLink>
                        <span class="filter-icons">
                            <i class="ti-angle-down"></i>
                            <i class="ti-angle-up"></i>
                        </span>

                    </span>

                </div>
                <div class="menu--child menu--child-left">
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
            <li class="menu--item menu--left margin-left-32" id="size">
                <div class="menu--header">
                    <span>SIZE</span>
                    <span>

                        <asp:HyperLink ID="hlpClearSize" ClientIDMode="Static" CssClass="menu__clear--btn" runat="server">CLEAR</asp:HyperLink>
                        <span class="filter-icons">
                            <i class="ti-angle-down"></i>
                            <i class="ti-angle-up"></i>
                        </span>
                    </span>
                </div>
                <div class="menu--child menu--child-left">
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
                            <span class="checkmark">Oversize / No Size</span>

                        </asp:HyperLink>
                    </asp:Label>

                </div>
            </li>
            <li class="menu--item menu--right" id="sortBy">
                <span id="sort-by-text">SORT BY: </span>
                <asp:Label ID="lbSort" ClientIDMode="Static" runat="server" Text="Featured Items"></asp:Label>
                <i class="ti-angle-down"></i>
                <div class="menu--child">
                    <asp:Label ID="Label10" runat="server" Text="" AssociatedControlID="cbNewest">
                        <asp:HyperLink ID="hplNewest" runat="server">
                            <input type="radio" name="sort" id="cbNewest" runat="server">
                            <span class="checkmark">Newest Items</span>
                        </asp:HyperLink>
                    </asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="" AssociatedControlID="cbOrderFeatured">
                        <asp:HyperLink ID="hplOrderFeatured" runat="server">
                            <input type="radio" name="sort" id="cbOrderFeatured" runat="server">
                            <span class="checkmark">Feartured Items</span>
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
                    <div class="img--product">
                        <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[0]%>" alt="">
                        <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|').Length > 1 ? Eval("IMAGES").ToString().Split('|')[1] : Eval("IMAGES").ToString().Split('|')[0] %>" alt="">
                    </div>
                    <p class="name--product"><%# Eval("PRODUCT_NAME") %></p>
                    <p class="cost--product">£<%# Eval("PRICE") %></p>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>
