<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="WishLists.aspx.cs" Inherits="fashionShop.Customer.WishLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Wish List</title>
    <link href="../Assets/css/Customer/wishList.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Assets/css/Customer/navRoute.css" />
    <link href="../Assets/css/base.css" rel="stylesheet" />
     <script type="text/javascript">
        function Confirm() {
            //tao hiden input
            let confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            //hien thi confirm dialog
            if (confirm("Are you sure you want to delete this item?")) {
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
            <span>Wish lists</span>
        </div>
        <p class="account__title">Wish lists</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item ">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item">
                    <a href="AddressBook.aspx">Address</a>
                </li>
                <li class="account__nav--item account__item-selected">
                    <a href="WishLists.aspx">Wish Lists <asp:Label ID="lbQuantityWishList" runat="server" Text="(0)"></asp:Label></a>
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
        </div>
    </div>
    <div class="product">
        <asp:Repeater ID="rptProducts" runat="server">
            <ItemTemplate>
                <div class="product--show">
                    <a href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>">
                        <div class="img--product">
                            <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|')[0]%>" alt="">
                            <img src="../Uploads/<%# Eval("IMAGES").ToString().Split('|').Length > 1 ? Eval("IMAGES").ToString().Split('|')[1] : Eval("IMAGES").ToString().Split('|')[0] %>" alt="">
                        </div>
                        <p class="name--product"><%# Eval("PRODUCT_NAME") %></p>
                        <p class="cost--product">£<%# Eval("PRICE") %></p>
                    </a>

                    <p style="display: none" id="idProduct" runat="server"><%# Eval("ID_PRODUCT") %></p>
                    <asp:Button
                        ID="btnDelete"
                        OnClick="btnDelete_Click"
                        runat="server"
                        CssClass="btn-delete"
                        Text="Remove item"
                        OnClientClick = "return Confirm()"
                        />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
