<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateAddress.aspx.cs" Inherits="fashionShop.Customer.UpdateAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Update Address</title>
    <link rel="stylesheet" href="../Assets/css/Customer/UpdateAddress.css"/>
    <link rel="stylesheet" href="../Assets/css/Customer/navRoute.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <a href="AddressBook.aspx">Address book</a>
            <span class="account__map--separate">|</span>
            <span>Address form</span>
        </div>
        <p class="account__title">Update Addresses</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item">
                    <a href="OrderLists.aspx">Orders</a>
                </li>
                <li class="account__nav--item account__item-selected">
                    <a href="#">Address</a>
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
        <div class="account__content update__content">

            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>First Name</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your first name'
                    ControlToValidate="txtFirstName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>

            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>Last Name</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your last name'
                    ControlToValidate="txtLastName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>Country</p>
                    <p>Required</p>
                </div>
                <asp:DropDownList ID="ddlCountry" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator10"
                    runat="server"
                    ControlToValidate="ddlCountry"
                    InitialValue="-1"
                    ErrorMessage='<i class="fas fa-times"></i> Country is required.'
                    CssClass="txt__error"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>Address</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your address'
                    ControlToValidate="txtAddress"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>City & State</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your city & state'
                    ControlToValidate="txtCity"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>

            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>Zip/Postcode</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtZipCode" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your zip code'
                    ControlToValidate="txtZipCode"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>

            <div class="update__content--item">
                <div class="update__content--item-header">
                    <p>Phone Number</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your phone number'
                    ControlToValidate="txtFirstName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="update__footer">
            <div>
                <asp:Button ID="btnUpdate" runat="server" Text="Save address" class="update__btn" OnClick="btnUpdate_Click" />
                <a href="AddressBook.aspx" class="cancel__btn">Cancel</a>
            </div>
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
