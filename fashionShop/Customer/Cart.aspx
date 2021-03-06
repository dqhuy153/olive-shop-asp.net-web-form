<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="fashionShop.Customer.Cart" %>

<%@ MasterType VirtualPath="~/Customer/CustomerMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/css/base.css" />
    <!-- custom style for this page -->
    <link rel="stylesheet" href="../Assets/css/Customer/cart.css">
    <!-- jquey 3.6 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" defer></script>
    <!-- js for this page -->
    <script src="../Assets/js/Customer/Cart.js" defer></script>
    <script type="text/javascript">
        function ConfirmDelete() {
            //tao hiden input
            let confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            //hien thi confirm dialog
            if (confirm("Are you sure you want to delete this product?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
                return false;
            }

            //gan hiden iput vao trang
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="cart__wrapper">
            <div class="cart">
                <div class="cart__header">
                    <ul class="breadcrumbs">
                        <li class="breadcrumb p1">
                            <a href="Home.aspx" class="head__title-link">Home</a>
                        </li>
                        <li class="breadcrumb p1">
                            <a href="Cart.aspx" class="head__title-link">Your cart</a>
                        </li>
                    </ul>
                    <asp:Label ID="lbEmptyCart" ClientIDMode="Static" runat="server" Text=""></asp:Label>
                </div>
                <div id="cartBody" runat="server" class="cart__main">
                    <div class="cartContent">
                        <table>
                            <thead>
                                <tr class="cartRow cart__head">
                                    <th class=" item__img ">CART ITEMS</th>
                                    <th class=" item__info"></th>
                                    <th class=" item__price">ITEM PRICE</th>
                                    <th class=" item__amount">QTY</th>
                                    <th class=" item__total">TOTAL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptProducts" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="item__img">
                                                <img src="../Uploads/<%# Eval("IMAGE") %>" alt="">
                                            </td>
                                            <td class="item__info">
                                                <a href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>"><%# Eval("PRODUCT_NAME") %></a>
                                                <p>Size: <%# Eval("SIZE") %></p>
                                            </td>
                                            <td  id="item-price-label" style="display: none">
                                                <p>Item Price</p>
                                            </td>
                                            <td class="item__price">
                                                
                                                <p>$<span class="item--price"><%# String.Format("{0:n2}",Eval("PRICE")) %></span></p>
                                            </td>
                                            <td id="quantity-label" style="display: none">
                                                <p>Quantity</p>
                                            </td>
                                            <td class="item__amount">
                                                <div>                                      
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:LinkButton ID="btnIncrease" class="inscrease" OnClick="btnIncrease_Click" runat="server" CausesValidation="false" Text='<i class="fas fa-chevron-up"></i>' />
                                                            <input class="quality" type="number" value="<%# Eval("QUANTITY") %>" min="1">
                                                            <asp:LinkButton ID="btnDescrease" class="descrease" OnClick="btnDescrease_Click" runat="server" CausesValidation="false" Text='<i class="fas fa-chevron-down"></i>' />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnIncrease" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnDescrease" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </td>
                                            <td id="total-label" style="display: none">
                                                <p>Total</p>
                                            </td>
                                            <td class="item__total">
                                                
                                                <span>$<span class="item--totalPrice"><%# String.Format("{0:n2}",(Decimal.Parse(Eval("PRICE").ToString()) * int.Parse(Eval("QUANTITY").ToString()))) %></span></span>
                                                <asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" OnClientClick="return ConfirmDelete()" runat="server"><i class="fas fa-minus-circle remove__item"></i></asp:LinkButton>

                                                <%--<asp:Label ID="lbTotal" runat="server" Text="" CssClass="total--text"></asp:Label>--%>
                                                <asp:Label ID="lbID" runat="server" Text="" Style="display: none"></asp:Label>
                                                <asp:Label ID="lbSize" runat="server" Text="" Style="display: none"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                               
                            </tbody>
                        </table>
                        <ul>
                            <li class="cart__total">
                                <div class="cart__total-head">
                                    <div class="cart__total-label">
                                        <p>Subtotal before Delivery Charges:</p>
                                    </div>
                                    <div class="cart__total-value">
                                        <p>$<asp:Label ID="lbTotalCart" runat="server" Text="" ClientIDMode="Static"></asp:Label></p>
                                    </div>
                                </div>
                            </li>

                            <li class="cart__total">
                                <div class="cart__total-head">
                                    <div class="cart__total-label">
                                        <p>Gift Certificate:</p>
                                    </div>
                                    <div class="cart__total-value">
                                        <span class="cartValue-open">add coupon</span>
                                        <span class="cartValue-close" style="display: none;">Cancel</span>
                                    </div>
                                </div>
                                <div class="cart__total-form" style="display: none;">
                                    <input type="text" placeholder="enter your coupon">
                                    <button>Apply</button>
                                </div>
                            </li>

                            <li class="cart__total">
                                <div class="cart__total-head">
                                    <div class="cart__total-label">
                                        <p>Subtotal before Delivery Charges:</p>
                                    </div>
                                    <div class="cart__total-value">
                                        <span class="cartValue-open">add certificate</span>
                                        <span class="cartValue-close" style="display: none;">Cancel</span>
                                    </div>
                                </div>
                                <div class="cart__total-form" style="display: none;">
                                    <input type="text" placeholder="add certificate">
                                    <button>Apply</button>
                                </div>
                            </li>
                            <li class="cart__checkout">
                            <a href="Home.aspx" class="cartHome-btn">continue shopping</a>
                            <a href="Checkout.aspx" class="checkout-btn">Checkout</a>
                        </li>
                        </ul>
                    </div>
                    <div class="cartAbout__wrapper">
                        <h4>Frequently Asked Questions</h4>
                        <div class="cartAbout">
                            <div class="aboutBox">
                                <h5>Delivery: UK</h5>
                                <div class="aboutBox-content" style="display: block;">
                                    <p>
                                        Free delivery for orders of £95 or more. Otherwise, Standard Delivery: £3.85 (3
                                    working days), Next Working Day: £6.50 (DPD Courier).
                                    </p>
                                </div>
                            </div>

                            <div class="aboutBox">
                                <h5>Delivery: International</h5>
                                <div class="aboutBox-content" style="display: none;">
                                    <p>
                                        We offer free worldwide shipping for certain cart totals. See our Delivery page for
                                    further details.
                                    </p>
                                </div>
                            </div>

                            <div class="aboutBox">
                                <h5>Returns: UK</h5>
                                <div class="aboutBox-content" style="display: none;">
                                    <p>
                                        Free UK returns. Dispatch your unsuitable item using our prepaid shipping label
                                    within 14 days of delivery for immediate refund. See our Returns page for FAQ.
                                    </p>
                                </div>
                            </div>

                            <div class="aboutBox">
                                <h5>Returns: International</h5>
                                <div class="aboutBox-content" style="display: none;">
                                    <p>
                                        Dispatch your unsuitable item within 14 days of delivery for immediate refund. See
                                    our Returns page for FAQ.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
