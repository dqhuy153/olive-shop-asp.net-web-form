<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="AddressBook.aspx.cs" Inherits="fashionShop.Customer.AddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Your Address Book</title>
    <style>
        a,
        p,
        span,
        label,
        button {
            font-family: "Ubuntu", sans-serif;
            color: #555;
            font-size: 1.4rem;
        }

        html {
            font-size: 62.5%;
        }

        .body {
            max-width: 125rem;
            width: 90%;
            margin: 3rem auto;
            padding: 3rem;
        }

        .account__map {
            font-size: 1.2rem;
            text-transform: uppercase;
        }

            .account__nav a,
            .account__map a,
            .account__map--separate {
                color: #bbb;
            }

                .account__nav a:hover,
                .account__map a:hover {
                    color: #555;
                    transition: all 0.2s linear;
                }

        .account__map--separate {
            margin: 0 0.8rem;
        }

        .account__nav span:first-of-type {
            margin: 0.5rem;
        }

        .account__title {
            text-align: center;
            font-size: 1.7rem;
            font-weight: 100;
            text-transform: uppercase;
            letter-spacing: 0.7rem;
            word-spacing: 0.3rem;
            margin: 2rem 0 4rem;
            margin-top: 4rem;
        }

        .account__nav {
            width: 50%;
            min-width: 55rem;
            margin: 5rem auto;
        }

        .account__nav--items {
            display: flex;
            justify-content: space-between;
            letter-spacing: 0.5px;
        }

        .account__item-selected a {
            color: #555;
            padding-bottom: 0.3rem;
            border-bottom: 1px solid #555;
        }

        .account__content {
            width: 80%;
            margin: 8rem auto;
        }

        .address__items {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
        }

        .address__item {
            width: 31%;
            min-width: 20rem;
            background: #f1f1f1;
            padding: 2.5rem;
            margin-right: 2rem;
            margin-bottom: 2rem;
        }

        .address__item--header {
            font-weight: bold;
            margin: 0.5rem 0 2.5rem;
        }

        .address__item--content {
            margin: 1rem 0;
        }

        .address__item--phone {
            margin: 2rem 0 4rem;
        }

            .address__item--phone span {
                color: #999;
                font-size: 1.3rem;
                margin-right: 0.2rem;
            }

        .address__item--btn {
            background: #1d1919;
            padding: 1.1rem 2.2rem;
            border: none;
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.2rem;
            color: white;           
            font-size: 1.1rem;
            cursor: pointer;
            border-radius: 0.4rem;
            margin-right: 0.7rem;
            font-family: "Ubuntu", sans-serif;
            font-weight: 400;
        }

            .address__item--btn:hover {
                border: 1px solid #858282;
                color: #383838;
                background: #FFF;
                transition: all 0.2s linear;
                font-weight: 400;
            }

        .delete {
            background: none;
            color: #383838;
            border: 1px solid #ccc;
            font-weight: 400;
        }
        .address__item--btn-first {
            padding: 1.1rem 2.2rem;
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.1rem;
            font-size: 1.1rem;
            cursor: pointer;
            border-radius: 0.4rem;
            margin-right: 0.7rem;
            background: none;
            color: #383838;
            border: 1px solid #ccc;
            cursor: not-allowed;
            font-family: "Ubuntu", sans-serif;
            font-weight: 400;
        }
        .address__addNew {
            min-height: 25rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

            .address__addNew p {
                margin-top: 1rem;
                font-weight: bold;
            }

            .address__addNew:hover p,
            .address__addNew:hover i {
                color: #aaa;
                transition: all 0.2s linear;
            }

        .account__footer {
            float: right;
            margin: 1rem 0 5rem;
        }

        @media screen and (max-width: 1200px) {
            .address__items {
                justify-content: space-between;
            }

            .address__item {
                width: 48%;
                margin-right: 0;
            }
        }

        @media screen and (max-width: 768px) {
            .body {
                padding: 1rem;
            }

            .account__nav--items {
                flex-wrap: wrap;
                width: 100%;
                justify-content: center;
            }

            .account__nav {
                width: 90%;
                min-width: auto;
            }

            .account__nav--item {
                width: 30%;
                padding: 1rem;
            }

            .account__content {
                width: 100%;
            }

            .address__item {
                width: 100%;
            }
        }
    </style>
    <script type="text/javascript">
        function Confirm() {
            //tao hiden input
            let confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            //hien thi confirm dialog
            if (confirm("Are you sure you want to delete this address?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
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
                    <a href="WishLists.aspx">Wish Lists (0)</a>
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
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" class="address__item--btn delete" OnClick="btnDelete_Click" OnClientClick = "Confirm()"/>                     
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
