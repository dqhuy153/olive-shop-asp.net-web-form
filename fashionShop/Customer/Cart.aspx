<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="fashionShop.Customer.Cart" %>
<%@ MasterType VirtualPath="~/Customer/CustomerMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./assets/css/base.css">
    <!-- custom style for this page -->
    <link rel="stylesheet" href="../Assets/css/Customer/GioHang.css">
    <!-- jquey 3.6 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" defer></script>
    <!-- js for this page -->
    <script src="../Assets/js/Customer/GioHang.js" defer></script>
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
        <asp:Label ID="lbEmptyCart" runat="server" Text=""></asp:Label>
        
        <div class="noti__banner">
            <p><i class="fas fa-truck-moving"></i>YOUR SHOPPING CART QUALIFIES FOR FREE SHIPPING WITHIN THE UK.</p>
        </div>

        <div class="head__title grid">
            <ul class="head__title-list">
                <li class="head__title-item"><a href="#" class="head__title-link">Home</a></li>
                <li class="head__title-item"><a href="#" class="head__title-link">Your Cart</a></li>
            </ul>
        </div>

        <div class="cartSection grid">
            <div class="cart__wrapper">
                <div class="cart__noti">
                    <i class="fas fa-exclamation-circle"></i>
                    <p>THE INVENTORY LEVEL FOR THE FOLLOWING PRODUCT IS BELOW WHAT YOU ORDERED, SO WE COULD NOT PROCEED WITH THE CHECKOUT: RIBBED MINI CARDIGAN, MINT</p>
                </div>
                <div class="cart__main">
                    <table>
                        <thead>
                            <tr class="cartRow cart__head">
                                <th class="cart__headItem item__img ">CART ITEMS</th>
                                <th class="cart__headItem item__info"></th>
                                <th class="cart__headItem item__price">ITEM PRICE</th>
                                <th class="cart__headItem item__amount">QTY</th>
                                <th class="cart__headItem item__total">TOTAL</th>
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
                                        <td class="item__price">
                                            <p>$<span class="item--price"><%# String.Format("{0:n2}",Eval("PRICE")) %></span></p>
                                        </td>
                                        <td class="item__amount">
                                            <div>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:LinkButton ID="btnIncrease" class="inscrease" OnClick="btnIncrease_Click"  runat="server" CausesValidation="false" Text='<i class="fas fa-chevron-up"></i>' />
                                                        <%--<button class="inscrease">
                                                        <i class="fas fa-chevron-up"></i>
                                                    </button>--%>
                                                        <input class="quality" type="number" value="<%# Eval("QUANTITY") %>" min="1">
                                                        <asp:LinkButton ID="btnDescrease" class="descrease" OnClick="btnDescrease_Click"  runat="server" CausesValidation="false" Text='<i class="fas fa-chevron-down"></i>' />
                                                        <%--<button class="descrease">
                                                        <i class="fas fa-chevron-down"></i>
                                                    </button>--%>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnIncrease" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnDescrease" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </td>
                                        <td class="item__total">
                                            <span>$<span class="item--totalPrice"><%# String.Format("{0:n2}",(Decimal.Parse(Eval("PRICE").ToString()) * int.Parse(Eval("QUANTITY").ToString()))) %></span></span>
                                            <asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" OnClientClick = "return ConfirmDelete()" runat="server"><i class="fas fa-minus-circle remove__item"></i></asp:LinkButton>
                                            
                                            <%--<asp:Label ID="lbTotal" runat="server" Text="" CssClass="total--text"></asp:Label>--%>
                                            <asp:Label ID="lbID" runat="server" Text="" style="display: none"></asp:Label>
                                            <asp:Label ID="lbSize" runat="server" Text="" style="display: none"></asp:Label>
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
            </div>

            <div class="cart__more">
                <h4>Frequently Asked Questions</h4>
                <div class="cart__more-contents">
                    <div class="cart__more-box" onclick="clickBox(0)">
                        <h5>Delivery: UK</h5>
                        <div class="box-content" style="display: block;">
                            <p>Free delivery for orders of £95 or more. Otherwise, Standard Delivery: £3.85 (3 working days), Next Working Day: £6.50 (DPD Courier).</p>
                        </div>
                    </div>

                    <div class="cart__more-box" onclick="clickBox(1)">
                        <h5>Delivery: International</h5>
                        <div class="box-content" style="display: none;">
                            <p>We offer free worldwide shipping for certain cart totals. See our Delivery page for further details.</p>
                        </div>
                    </div>

                    <div class="cart__more-box" onclick="clickBox(2)">
                        <h5>Returns: UK</h5>
                        <div class="box-content" style="display: none;">
                            <p>Free UK returns. Dispatch your unsuitable item using our prepaid shipping label within 14 days of delivery for immediate refund. See our Returns page for FAQ.</p>
                        </div>
                    </div>

                    <div class="cart__more-box" onclick="clickBox(3)">
                        <h5>Returns: International</h5>
                        <div class="box-content" style="display: none;">
                            <p>Dispatch your unsuitable item within 14 days of delivery for immediate refund. See our Returns page for FAQ.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
