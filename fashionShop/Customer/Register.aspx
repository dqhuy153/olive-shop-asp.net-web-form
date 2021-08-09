<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="fashionShop.Customer.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Register</title>
    <link rel="stylesheet" href="../Assets/css/Customer/Register.css" />
    <script src="../Assets/js/Customer/Register.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="register__nav">
            <a href="Home.aspx">Home</a>
            <span>|</span>
            <span>Register</span>
        </div>
        <p class="register__title">New account</p>
        <div class="register__content">
            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Email Address</p>
                    <p>Required</p>

                </div>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You have to enter a username'
                    ControlToValidate="txtUsername"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtUsername"
                    ErrorMessage='<i class="fas fa-times"></i> You must enter a valid email.'
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                    CssClass="txt__error"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
                <span class="warning"><i class="fas fa-times"></i> You must enter a valid email.</span>
                <asp:Label ID="lbNotify" runat="server" Text="" CssClass="content--lbNotify"></asp:Label>
            </div>

            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> You must enter a password.'
                    ControlToValidate="txtPassword"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage='<i class="fas fa-times"></i> Minimum password length is 6'
                    ValidationExpression=".{6}.*"
                    Display="Dynamic"
                    CssClass="txt__error" />
                <span class="warning"><i class="fas fa-times"></i> You must enter a password.</span>
            </div>
            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Confirm Password</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> Comfirm password does not match your password'
                    ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirmPassword"
                    Display="Dynamic" CssClass="txt__error">
                </asp:CompareValidator>
                <span class="warning"><i class="fas fa-times"></i> You must enter a password.</span>
            </div>
            <div class="register__content--item require">
                <p>Collection Preference</p>
                <div class="register__content--radioList">
                    <div class="register__content--radio">
                        <input
                            type="radio"
   
                            name="collection"
                            value="womenswear" />
                        <label for="male">Womenswear</label><br />
                    </div>
                    <div class="register__content--radio">
                        <input
                            type="radio"
 
                            name="collection"
                            value="menswear" />
                        <label for="male">Menswear</label><br />
                    </div>
                    <div class="register__content--radio">
                        <input
                            type="radio"
        
                            name="collection"
                            value="both"
                            class="register__content--radio" />
                        <label for="male">Both</label><br />
                    </div>
                </div>
            </div>
            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>First Name</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> The "First Name" field cannot be blank.'
                    ControlToValidate="txtFirstName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <span class="warning"><i class="fas fa-times"></i> The "First Name" field cannot be blank.</span>
            </div>

            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Last Name</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> The "Last Name" field cannot be blank.'
                    ControlToValidate="txtLastName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <span class="warning"><i class="fas fa-times"></i> The "Last Name" field cannot be blank.</span>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
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
            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Address</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> The "Address" field cannot be blank'
                    ControlToValidate="txtAddress"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <span class="warning"><i class="fas fa-times"></i> The "Address" field cannot be blank.</span>
            </div>
            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>City & State</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> The "City & State" field cannot be blank.'
                    ControlToValidate="txtCity"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <span class="warning"><i class="fas fa-times"></i> The "City & State" field cannot be blank.</span>
            </div>

            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Zip / Postcode</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtZipCode" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> The "Zip / Postcode" field cannot be blank.'
                    ControlToValidate="txtZipCode"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <span class="warning"><i class="fas fa-times"></i> The "Zip / Postcosde" field cannot be blank.</span>
            </div>
            <div class="register__content--item">
                <div class="register__content--item-header">
                    <span style="font-size: 1.2rem;">Company name / House name</span>         
                </div>
                <asp:TextBox ID="txtHouseName" runat="server"></asp:TextBox> 
            </div>
            <%--<div class="register__content--item">
                <div class="register__content--item-header">
                    <p>Email</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
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
            </div>--%>
            <div class="register__content--item require">
                <div class="register__content--item-header">
                    <p>Phone Number</p>
                    <p>Required</p>
                </div>
                <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage='<i class="fas fa-times"></i> The "Phone Number" field cannot be blank.'
                    ControlToValidate="txtFirstName"
                    Display="Dynamic"
                    CssClass="txt__error">
                </asp:RequiredFieldValidator>
                <span class="warning"><i class="fas fa-times"></i> The "Phone Number" field cannot be blank.</span>
            </div>
            <div class="register__content--item content--item-confirmLetter">
                <div class="register__content--item-header item__header--last">
                    <p>Sign Up To Our Newsletter</p>
                    <p></p>
                </div>
                <div class="register__content--radio content--radio-last">
                    <input
                        type="checkbox"
                        id="confirmSignUpNewsletter"
                        value="yes" />
                    <label for="male">Yes</label><br />
                </div>
            </div>
            <div class="register__content--item">
                    <p>Remember Me After Register</p>
                <div class="content-checkbox">
                    <asp:CheckBox ID="cbRemember" runat="server" />
                    <p>Yes</p>
                </div>

            </div>
            
        </div>
        <div class="register__footer">
            <asp:Button ID="btnRegister" runat="server" Text="Create account" class="register__btn" OnClick="btnRegister_Click" />
            <a href="#">
                <p>Back To Top <i class="fas fa-chevron-up"></i></p>
            </a>
        </div>
    </div>
</asp:Content>
