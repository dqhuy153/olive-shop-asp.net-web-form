<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="AddressBook.aspx.cs" Inherits="fashionShop.Customer.AddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Your Address Book</title>
    <link rel="stylesheet" href="../Assets/css/Customer/AddressBook.css" />
    <link rel="stylesheet" href="../Assets/css/Customer/navRoute.css" />
    <script type="text/javascript">
        function Confirm() {
            //tao hiden input
            let confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            //hien thi confirm dialog
            if (confirm("Are you sure you want to delete this address? (This action cannot be undone!)")) {
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
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <span>Address book</span>
        </div>
        <p class="account__title">Addresses</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item account__item-selected">
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
        <div class="account__content addresses__content">
            <div class="address__items">
                <asp:Repeater ID="rptAddress" runat="server">
                    <ItemTemplate>
                        <div class="address__item">
                            <p class="address__item--header"><%# Eval("FIRST_NAME") %> <%# Eval("LAST_NAME") %></p>
                            <p class="address__item--content"><%# Eval("STREET") %></p>
                            <p class="address__item--content"><%# Eval("CITY") %> <%# Eval("ZIP_CODE") %></p>
                            <p class="address__item--content"><%# Eval("NAME_CAP") %></p>
                            <p class="address__item--phone">
                                <span>Phone: </span><%# Eval("PHONE") %>
                            </p>
                            <p style="display: none" id="idAddress" runat="server"><%# Eval("ID_ADDRESS") %></p>
                            <div class="address__item--btns">                                
                                <a href="UpdateAddress.aspx?idAddress=<%# Eval("ID_ADDRESS") %>" class="address__item--btn edit">Edit</a>
                                <asp:Button
                                    ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    class="address__item--btn delete"
                                    OnClick="btnDelete_Click"
                                    OnClientClick = "return Confirm()"
                                    />                     
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:HyperLink ID="hplNewAddress" runat="server" class="address__item address__addNew">
                    <i class="fas fa-plus"></i>
                    <p>New Address</p>
                </asp:HyperLink>
                
            </div>
        </div>
        <div class="account__footer">
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
