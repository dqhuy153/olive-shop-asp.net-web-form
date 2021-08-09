<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="RecentlyViewed.aspx.cs" Inherits="fashionShop.Customer.RecentlyViewed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/css/Customer/navRoute.css" />
    <style>
        .body {
    max-width: 125rem;
    width: 90%;
    margin: 3rem auto;
    padding: 3rem;
    font-family: "Ubuntu", sans-serif;
    color: #555;
    font-size: var(--font-size-content);
}

/*.account__map {
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
    margin: 2rem auto;
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
    margin: 5rem auto;
}*/

       @media screen and (max-width: 768px) {
    .body {
        padding: 1rem 2rem 0rem;
        width: 100%;
    }

    /*.account__nav--items {
        flex-wrap: wrap;
        width: 100%;
        justify-content: center;
    }

    .account__nav {
        width: 100%;
        min-width: auto;
    }

    .account__nav--item {
        
        padding: 1rem;
    }

    .account__content {
        width: 100%;
    }*/

}
@media screen and (max-width: 414px){
    .body{
        padding-left: 1rem;
        padding-right: 1rem;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <span>Recently Viewed</span>
        </div>
        <p class="account__title">Recently Viewed</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item ">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item">
                    <a href="AddressBook.aspx">Address</a>
                </li>
                <li class="account__nav--item ">
                    <a href="WishLists.aspx">Wish Lists</a>
                </li>
                <li class="account__nav--item account__item-selected">
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
</asp:Content>
