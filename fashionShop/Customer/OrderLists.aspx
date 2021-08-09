<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderLists.aspx.cs" Inherits="fashionShop.Customer.OrderLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Orders Status</title>
    <link rel="stylesheet" href="../Assets/css/Customer/OrderLists.css" />
    <link rel="stylesheet" href="../Assets/css/Customer/navRoute.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <span>Your orders</span>
        </div>
        <p class="account__title">Orders</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item account__item-selected">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item">
                    <a href="AddressBook.aspx">Address</a>
                </li>
                <li class="account__nav--item">
                    <a href="WishLists.aspx">Wish Lists</a>
                </li>
                <li class="account__nav--item">
                    <a href="RecentlyViewed.aspx">Recently Viewed</a>
                </li>
                <li class="account__nav--item">
                    <a href="AccountSetting.aspx">Account Settings</a>
                </li>
            </ul>
        </nav>
        <div class="account__content orders__content">
            <div class="order__table"></div>
            <div class="orders__note">
                <i class="fas fa-envelope"></i>
                <p>
                    If you have a question about your order, please click on
                        the Help button at the bottom of the screen, and
                        complete the contact form. You will receive a response
                        from us by email. Please include your Order Number in
                        your message.
                </p>
            </div>
            <div id="emptyOrderWarning" runat="server" class="orders__note orders__note--warning" visible="false">
                <i class="fas fa-exclamation-circle"></i>
                <p>
                    YOU HAVEN'T PLACED ANY ORDERS WITH US. WHEN YOU DO,
                        THEIR STATUS WILL APPEAR ON THIS PAGE.
                </p>
            </div>
            <div id="orderListContent" runat="server" visible="false">
                
                <table class="table" border="1">
                    <tr class="table-tr">
                        <th class="table-th">ID ORDER</th>
                        <th class="table-th table-th-date">DATE</th>
                        <th class="table-th">QTY</th>
                        <th class="table-th">SHIPPING ADDRESS</th>
                        <th class="table-th">TOTAL</th>
                        <th class="table-th">STATUS</th>
                        <th class="table-th">DETAIL</th>
                        <th class="table-th">NOTE</th>
                    </tr>
                    <asp:Panel ID="pannelOrders" runat="server"></asp:Panel>
                </table>
            </div>
        </div>
        <div class="account__footer">
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
