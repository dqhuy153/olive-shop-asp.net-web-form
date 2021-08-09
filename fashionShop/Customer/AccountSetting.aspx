<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="AccountSetting.aspx.cs" Inherits="fashionShop.Customer.AccountSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Account Setting</title>
    <link rel="stylesheet" href="../Assets/css/Customer/AccountSetting.css"/>
    <link rel="stylesheet" href="../Assets/css/Customer/navRoute.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="account__map">
            <a href="Home.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="OrderLists.aspx">Your account</a>
            <span class="account__map--separate">|</span>
            <span>Account Details</span>
        </div>
        <p class="account__title">Account Settings</p>
        <nav class="account__nav">
            <ul class="account__nav--items">
                <li class="account__nav--item ">
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
                <li class="account__nav--item  account__item-selected">
                    <a href="AccountSetting.aspx">Account Settings</a>
                </li>
            </ul>
        </nav>
        <div class="updateAccount__content">
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
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

            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
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
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>Email</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtEmail" runat="server" Enabled="false"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your email'
                    ControlToValidate="txtEmail"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter invalid email'
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                    CssClass="txt__error"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>Phone Number</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter your phone number'
                    ControlToValidate="txtPhoneNumber"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="updateAccount__content--item content--item-confirmLetter">
                <div class="updateAccount__content--item-header item__header--last">
                    <p>Sign Up To Our Newsletter</p>
                    <p></p>
                </div>
                <div class="updateAccount__content--radio content--radio-last">
                    <input
                        type="checkbox"
                        id="confirmSignUpNewsletter"
                        value="yes" />
                    <label for="male">Yes</label><br />
                </div>
            </div>

            <div class="updatePassword">
                <p>Update Password</p>
                <hr />
            </div>

            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>New Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox> 
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtNewPassword"
                    ErrorMessage='<i class="fas fa-times"></i> Minimum password length is 6'
                    ValidationExpression=".{6}.*"
                    Display="Dynamic"
                    CssClass="txt__error" />
            </div>
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>Confirm Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> Comfirm password does not match your password'
                    ControlToCompare="txtNewPassword"
                    ControlToValidate="txtConfirmPassword"
                    Display="Dynamic" CssClass="txt__error">
                </asp:CompareValidator>
            </div>
            <div class="updateAccount__content--item">
                <div class="updateAccount__content--item-header">
                    <p>Current Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                
            </div>
            <div class="updateAccount__content--item">
                <p>Collection Preference</p>
                <div class="updateAccount__content--radioList">
                    <div class="updateAccount__content--radio">
                        <input
                            type="radio"
                            
                            name="collection"
                            value="womenswear" />
                        <label for="male">Womenswear</label><br />
                    </div>
                    <div class="updateAccount__content--radio">
                        <input
                            type="radio"

                            name="collection"
                            value="menswear" />
                        <label for="male">Menswear</label><br />
                    </div>
                    <div class="updateAccount__content--radio">
                        <input
                            type="radio"
                          
                            name="collection"
                            value="both"
                            class="updateAccount__content--radio" />
                        <label for="male">Both</label><br />
                    </div>
                </div>
            </div>
        <asp:Label ID="lbNotify" runat="server" Text="" CssClass="content--lbNotify"></asp:Label>
        </div>
        <div class="updateAccount__footer">
            <asp:Button ID="btnUpdate" runat="server" Text="Update details" class="updateAccount__btn" OnClick="btnUpdate_Click" />
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
