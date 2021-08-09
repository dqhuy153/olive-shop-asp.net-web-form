<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="fashionShop.Customer.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Order detail</title>
    <link href="../Assets/css/Customer/OrderDetail.css" rel="stylesheet" />
    <script type="text/javascript" defer>
        function cancelOrderConfirm() {
            //tao hiden input
            let confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            //hien thi confirm dialog
            if (confirm("Are you sure you want to cancel this order? (This action cannot be undone!)")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
                return false;
            }

            //gan hiden iput vao trang
            document.forms[0].appendChild(confirm_value);
        }
        function trackingOrder() {
            alert("This function will update when cooperating with a real delivery company.");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your orders</a>
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

                    <a target="_blank" href="mailto:olivednvn@gmail.com" class="primary-btn btn">Contact us
                    </a>
                    <asp:Button 
                        ID="btnCancelOrder"
                        class="danger-btn btn" 
                        runat="server" 
                        Text="Cancel order" 
                        OnClick="btnCancelOrder_Click"
                        OnClientClick="return cancelOrderConfirm()"
                        Visible="false"
                    />

                    <%--Tracking button (update here)--%>
                    <asp:Button 
                        ID="btnTrackingOrder"
                        class="success-btn btn" 
                        runat="server" 
                        Text="Tracking order" 
                        OnClientClick="return trackingOrder()"
                        Visible="false"
                    />
                    <%--Tracking button (update here)--%>
                    <asp:Button 
                        ID="btnRating"
                        class="success-btn btn" 
                        runat="server" 
                        Text="Rating & Reviews" 
                        OnClientClick="return ratingOrder()"
                        Visible="false"
                    />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
