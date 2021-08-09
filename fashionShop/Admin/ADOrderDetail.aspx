<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADOrderDetail.aspx.cs" Inherits="fashionShop.Admin.ADOrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Order detail</title>
    <link href="../Assets/css/Admin/ADOrderDetail.css" rel="stylesheet">
    <link href="../Assets/css/Customer/OrderDetail.css" rel="stylesheet" />
    <script src="../Assets/js/Admin/ADOrderDetail.js" defer></script>
    <style>
        .account__title {
            text-align: center;
            font-size: 1.5rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <asp:HyperLink ID="hplPreviousOrderPage" runat="server"></asp:HyperLink>
            <span class="account__map--separate">|</span>
            <span>Order detail</span>
        </div>
        <p class="account__title">Order Detail</p>
        <div runat="server" id="orderDetailContainer" class="orderDetail__container">
            <ul class="order__product">
                <asp:Repeater ID="rptOrderDetail" runat="server">
                    <ItemTemplate>
                        <li class="productItem">
                            <div class="productItem-img">
                                <img src="../Uploads/<%# Eval("IMAGE") %>" alt="<%# Eval("PRODUCT_NAME") %>">
                            </div>
                            <div class="productItem-info">
                                <a href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>"><%# Eval("PRODUCT_NAME") %></a>
                                <span class="productItem-info-quantity">x <%# Eval("QUANTITY") %></span>
                                <div class="productItem-info-content">
                                    <p>Size: <%# Eval("SIZE") %></p>
                                    <span>$<span class="item--price"><%# String.Format("{0:n2}",(Decimal.Parse(Eval("PRICE").ToString()) * int.Parse(Eval("QUANTITY").ToString()))) %></span></span>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="order__content">
                <div class="order__content--body">
                    <div class="order__content--address order__content--item">
                        <p class="order__content--header">Shipping Address</p>
                        <div class="order__content--main">
                            <p>
                                <asp:Label ID="lbFullName" runat="server" Text=""></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="lbPhone" runat="server" Text=""></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="lbStreet" runat="server" Text=""></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="lbAddressDetail" runat="server" Text=""></asp:Label>
                            </p>

                        </div>
                    </div>

                    <div class="order__content--total order__content--item">
                        <p class="order__content--header">Payment</p>
                        <div class="order__content--main">
                            <div class="order__content--main-item">
                                <p>
                                    Subtotal:
                                </p>
                                <p>
                                    <asp:Label ID="lbSubtotal" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                            <div class="order__content--main-item">
                                <p>
                                    Shipping:
                                </p>
                                <p>
                                    <asp:Label ID="lbShippingFee" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                            <div class="order__content--main-item">
                                <p>
                                    Total:
                                </p>
                                <p>
                                    <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="order__content--note order__content--item">
                        <p class="order__content--header">More information</p>
                        <div class="order__content--main">
                            <div class="order__content--main-item">
                                <p>
                                    ID:
                                </p>
                                <p>
                                    <asp:Label ID="lbIdOrder" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                            <div class="order__content--main-item">
                                <p>
                                    Date:
                                </p>
                                <p>
                                    <asp:Label ID="lbDate" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                            <div class="order__content--main-item">
                                <p>
                                    Note:
                                </p>
                                <p>
                                    <asp:Label ID="lbNote" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                            <div class="order__content--main-item">
                                <p>
                                    Status:
                                </p>
                                <p>
                                    <asp:Label ID="lbStatus" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="order__footer">
                    <%--Approve pending order btn--%>
                    <asp:Button
                        ID="btnApprovePendingOrder"
                        class="primary-btn btn"
                        runat="server"
                        Text="Approve order"
                        OnClick="btnApprovePendingOrder_Click"
                        OnClientClick="return approvePendingOrderConfirm()"
                        Visible="false" />

                    <%--Cancel pending order btn--%>
                    <asp:Button
                        ID="btnCancelPendingOrder"
                        class="danger-btn btn"
                        runat="server"
                        Text="Cancel order"
                        OnClick="btnCancelPendingOrder_Click"
                        OnClientClick="return cancelPendingOrderConfirm()"
                        Visible="false" />


                    <%--Re-pending canceled order btn--%>
                    <asp:Button
                        ID="btnRependingCenceledOrder"
                        class="primary-btn btn"
                        runat="server"
                        Text="Re-pending order"
                        OnClick="btnRependingCenceledOrder_Click"
                        OnClientClick="return rependingCanceledOrderConfirm()"
                        Visible="false" />
                    <div class="delivery-btns">
                        <%--Succesfully delivery order--%>
                        <asp:Button
                            ID="btnSuccessedDeliveryOrder"
                            class="primary-btn btn"
                            runat="server"
                            Text="Delivery successfully"
                            OnClick="btnSuccessedDeliveryOrder_Click"
                            OnClientClick="return successedDeliveryOrderConfirm()"
                            Visible="false" />

                        <%--Cancel Failed delivery order--%>
                        <asp:Button
                            ID="btnCancelFailDeliveryOrder"
                            class="danger-btn btn"
                            runat="server"
                            Text="Delivery failed - Cancel Order"
                            OnClick="btnCancelFailDeliveryOrder_Click"
                            OnClientClick="return cancelFailedDeliveryOrderConfirm()"
                            Visible="false" />

                        <%--Re-pending Failed delivery order--%>
                        <asp:Button
                            ID="btnRependingFailDeliveryOrder"
                            class="danger-btn btn"
                            runat="server"
                            Text="Delivery failed - Re-pending Order"
                            OnClick="btnRependingFailDeliveryOrder_Click"
                            OnClientClick="return rependingFailedDeliveryOrderConfirm()"
                            Visible="false" />
                    </div>

                    <a 
                        href="ADHome.aspx" 
                        id="btnViewAnalytics" 
                        runat="server"
                        visible="false"
                        class="primary-btn btn"
                        >View Analytics</a>
                    <%--Tracking button (update here)--%>
                    <asp:Button
                        ID="btnCancelSuccessedOrder"
                        class="danger-btn btn"
                        runat="server"
                        Text="Returned Order"
                        OnClick="btnCancelSuccessedOrder_Click"
                        OnClientClick="return returnedOrderConfirm()"

                        Visible="false" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
