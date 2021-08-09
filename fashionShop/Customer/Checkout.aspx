<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="fashionShop.Customer.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Checkout</title>
    <link href="../Assets/css/Customer/checkout.css" rel="stylesheet" />
    <link href="../Assets/css/base.css" rel="stylesheet" />
    <script src="../Assets/js/Customer/Checkout.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container grid">
        <div class="two-col">
            <div class="check-info">
                <%--authentication section--%>
                <section class="customer" runat="server" id="authSection">
                    <div class="num-check">
                        <div class="name-check">
                            <div class="header-items">
                                <h3>Customer</h3>
                                <%--Add--%>
                                <div class="child-info-customer" runat="server" id="customerAuthSection">
                                    <asp:Label ID="lbCustomerEmail" runat="server" Text=""></asp:Label>
                                    <asp:Button
                                        ID="btnLogoutCustomerAuth"
                                        Visible="false"
                                        OnClick="btnLogoutCustomerAuth_Click"
                                        runat="server"
                                        Text="Logout" />
                                    <asp:Button
                                        ID="btnEditVistorEmailAuth"
                                        CausesValidation="false"
                                        Visible="false"
                                        runat="server"
                                        Text="Edit"
                                        OnClick="btnEditVistorEmailAuth_Click" />
                                </div>
                                <%--end add--%>
                            </div>
                            <!-- vistor auth section -->
                            <div class="child-info" runat="server" id="visitorAuthSection">
                                <span>Checking out as a <strong>Guest</strong>? You'll be able to save your details to create an account with us later.</span>

                                <div>
                                    <label for="email">Email Address</label>
                                    <div class="form-control">
                                        <asp:TextBox
                                            ID="txtVistorEmail"
                                            class="email"
                                            TextMode="Email"
                                            placeholder="Your email address"
                                            runat="server"
                                            ClientIDMode="Static"
                                            required>
                                        </asp:TextBox>
                                        <asp:Button
                                            ID="btnContinueVistorAuth"
                                            OnClick="btnContinueVistorAuth_Click"
                                            runat="server"
                                            Text="CONTINUE AS GUEST"
                                            OnClientClick="return checkVisitorEmail()" />
                                    </div>
                                    <asp:Label ID="txtEmailWarning" runat="server" Text=""></asp:Label>
                                    <div class="form-checkbox">
                                        <input type="checkbox">
                                        <label for="require">Subscribe to our newsletter</label>
                                    </div>
                                    <span id="required">Already have an account? <a id="signIn" href="SignIn.aspx?pp=Checkout.aspx">Sign in now</a></span>
                                </div>

                            </div>

                        </div>
                    </div>
                </section>
                <hr />
                <section class="shipping">
                    <div class="num-check">
                        <div class="name-check">
                            <div class="header-items">
                                <h3>Shipping Address</h3>
                                <div id="addressShippingInformation" visible="false" runat="server">
                                    <p>
                                        <asp:Label ID="lbFullNameShipping" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lbPhoneShipping" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lbStreetShipping" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lbAddressShipping" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                                <asp:Button
                                    ID="btnEditShippingSection"
                                    OnClick="btnEditShippingSection_Click"
                                    Visible="false"
                                    runat="server"
                                    Text="Edit"
                                    CausesValidation="false" />
                            </div>

                            <!-- vistor shipping section -->
                            <div class="child-info" id="vistorShippingSection" runat="server">
                                <span>Shipping Address</span>
                                <%--<form class="check-form" action="https://">--%>
                                <div class="name-customer">
                                    <div class="name-customer-first-name required">
                                        <label for="first-name">First Name</label>
                                        <div class="name-customer padding-top-bottom">
                                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ErrorMessage='<i class="fas fa-times"></i> The "First Name" field cannot be blank.'
                                            ControlToValidate="txtFirstName"
                                            Display="Dynamic"
                                            CssClass="txt__error">
                                        </asp:RequiredFieldValidator>
                                        <span class="warning"><i class="fas fa-times"></i>The "First Name" field cannot be blank.</span>
                                    </div>
                                    <div class="name-customer-last-name required">
                                        <label for="last-name">Last Name</label>
                                        <div class="name-customer padding-top-bottom">
                                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                            ErrorMessage='<i class="fas fa-times"></i> The "Last Name" field cannot be blank.'
                                            ControlToValidate="txtLastName"
                                            Display="Dynamic"
                                            CssClass="txt__error">
                                        </asp:RequiredFieldValidator>
                                        <span class="warning"><i class="fas fa-times"></i>The "Last Name" field cannot be blank.</span>
                                    </div>
                                </div>
                                <!-- Binding data from Databases -->
                                <div class="country">
                                    <label for="country-name">Country</label>
                                    <div class="customer-select full-width padding-top-bottom">
                                        <asp:DropDownList
                                            ID="ddlCountry"
                                            runat="server"
                                            class="full-width padding-top-bottom">
                                        </asp:DropDownList>
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

                                </div>
                                <!-- Address -->
                                <div class="address-customer">
                                    <label for="">Address Search</label>
                                    <div class="address padding-top-bottom">
                                        <asp:TextBox
                                            ID="txtAddressSearch"
                                            runat="server"
                                            class="full-width"
                                            placeholder="State with post/zip code or street">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="address-customer-info-add">
                                    <label for="">Address</label>
                                    <div class="address padding-top-bottom required">
                                        <asp:TextBox
                                            ID="txtAddress"
                                            runat="server"
                                            class="full-width">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ErrorMessage='<i class="fas fa-times"></i> The "Address" field cannot be blank'
                                            ControlToValidate="txtAddress"
                                            Display="Dynamic"
                                            CssClass="txt__error">
                                        </asp:RequiredFieldValidator>
                                        <span class="warning"><i class="fas fa-times"></i>The "Address" field cannot be blank.</span>
                                    </div>
                                </div>

                                <div class="address-customer-info-option">
                                    <label for="">Company Name (Optional)</label>
                                    <div class="address padding-top-bottom">
                                        <input class="full-width" type="text" placeholder="">
                                    </div>
                                </div>

                                <div class="location--address">
                                    <div class="width-50 city-name">
                                        <label for="first-name">City</label>
                                        <div class="location--address__city padding-top-bottom width-90 required">
                                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                ErrorMessage='<i class="fas fa-times"></i> The "City & State" field cannot be blank.'
                                                ControlToValidate="txtCity"
                                                Display="Dynamic"
                                                CssClass="txt__error">
                                            </asp:RequiredFieldValidator>
                                            <span class="warning"><i class="fas fa-times"></i>The "City & State" field cannot be blank.</span>
                                        </div>
                                    </div>
                                    <div class="width-50 state-name">
                                        <label for="first-name">State/Province (Optional)</label>
                                        <div class="location--address__city--diff padding-top-bottom">
                                            <asp:TextBox ID="txtState" class="full-width" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="contact">
                                    <div class="width-35">
                                        <label for="first-name">Postal Code</label>
                                        <div class="post-code-location padding-top-bottom required">
                                            <asp:TextBox ID="txtZipCode" class="full-width" runat="server" TextMode="Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                                ErrorMessage='<i class="fas fa-times"></i> The "Zip / Postcode" field cannot be blank.'
                                                ControlToValidate="txtZipCode"
                                                Display="Dynamic"
                                                CssClass="txt__error">
                                            </asp:RequiredFieldValidator>
                                            <span class="warning"><i class="fas fa-times"></i>The "Zip / Postcosde" field cannot be blank.</span>
                                        </div>
                                    </div>

                                    <div class="width-60">
                                        <label for="first-name">Phone number</label>
                                        <div class="location--address__city--diff padding-top-bottom required">
                                            <asp:TextBox ID="txtPhoneNumber" class="full-width" runat="server" TextMode="Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                                ErrorMessage='<i class="fas fa-times"></i> The "Phone Number" field cannot be blank.'
                                                ControlToValidate="txtFirstName"
                                                Display="Dynamic"
                                                CssClass="txt__error">
                                            </asp:RequiredFieldValidator>
                                            <span class="warning"><i class="fas fa-times"></i>The "Phone Number" field cannot be blank.</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="add-info-require">
                                    <div class="padding-top-bottom">Sign Up To Our Newsletter (Optional)</div>
                                    <div class="add-info-require__def">
                                        <input type="radio">
                                        <label for="">Yes</label>
                                    </div>
                                    <div class="add-info-require__addinfo">
                                        <input type="checkbox" checked>
                                        <label for="">My Billing address is the same as my Shipping address</label>
                                    </div>
                                </div>

                                <%--register--%>
                                <div>
                                    <span>To able to manage your order & save time for your next purchase, please register an account with us.</span>
                                    <div class="register-customer">
                                    </div>
                                    <div class="register-customer">
                                        <label for="">Email Address</label>
                                        <asp:Label ID="lbEmailRegister" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="register-customer">
                                        <label for="">Password</label>
                                        <div class="address padding-top-bottom required">
                                            <asp:TextBox ID="txtPassword" runat="server" class="full-width" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ErrorMessage='<i class="fas fa-times"></i> You must enter a password.'
                                                ControlToValidate="txtPassword"
                                                Display="Dynamic"
                                                CssClass="txt__error"
                                                ValidationGroup="registerAccount">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                ControlToValidate="txtPassword"
                                                ErrorMessage='<i class="fas fa-times"></i> Minimum password length is 6'
                                                ValidationExpression=".{6}.*"
                                                Display="Dynamic"
                                                CssClass="txt__error"
                                                ValidationGroup="registerAccount" />
                                            <%--<span class="warning"><i class="fas fa-times"></i>You must enter a password.</span>--%>
                                        </div>
                                    </div>
                                    <div class="register-customer">
                                        <label for="">Comfirm Password</label>
                                        <div class="address padding-top-bottom required">
                                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                ErrorMessage='<i class="fas fa-times"></i> Comfirm password does not match your password'
                                                ControlToCompare="txtPassword"
                                                ControlToValidate="txtConfirmPassword"
                                                Display="Dynamic" CssClass="txt__error"
                                                ValidationGroup="registerAccount">
                                            </asp:CompareValidator>
                                            <%--<span class="warning"><i class="fas fa-times"></i>You must enter a password.</span>--%>
                                        </div>
                                    </div>
                                    <asp:Label ID="lbNotify" runat="server" Text="" CssClass="txt__error"></asp:Label>
                                    <asp:Button
                                        ID="txtRegisterVisitorShipping"
                                        OnClick="txtRegisterVisitorShipping_Click"
                                        runat="server"
                                        Text="Register & Continue"
                                        ValidationGroup="registerAccount" />
                                </div>
                                <br />
                                <%--<asp:Button
                                    ID="txtContinueVisitorShipping"
                                    OnClick="txtContinueVisitorShipping_Click"
                                    runat="server"
                                    Text="Continue without register" />--%>
                            </div>
                            <%--customer shipping section--%>
                            <div id="customerShippingSection" runat="server">
                                <p>Select your address</p>
                                <ul>
                                    <asp:Repeater ID="rptCustomerAddress" runat="server">
                                        <ItemTemplate>
                                            <li style="display: flex">
                                                <input
                                                    type="radio"
                                                    name="customerAddress"
                                                    value="<%# Eval("ID_ADDRESS") %>"
                                                    id="<%# Eval("ID_ADDRESS") %>"
                                                    <%# Container.ItemIndex == 0 ? "checked" : "" %> />
                                                <div>
                                                    <p><%# Eval("FIRST_NAME") %> <%# Eval("LAST_NAME") %></p>
                                                    <p><%# Eval("PHONE") %></p>
                                                    <p><%# Eval("STREET") %></p>
                                                    <p><%# Eval("CITY") %>, <%# Eval("ZIP_CODE") %> / <%# Eval("NAME_CAP") %></p>
                                                </div>
                                            </li>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                                <a href="AddressBook.aspx">Manage Address & Add New Address</a>
                                <asp:Button ID="btnChooseAddress" runat="server" Text="Continue" OnClick="btnChooseAddress_Click" />
                            </div>

                        </div>
                    </div>
                </section>
                <hr />
                <!-- billing section -->
                <div class="billing" id="billingSection" runat="server">
                    <div class="num-check">
                        <div class="name-check">
                            <div class="header-items">
                                <h3>Billing</h3>
                                <!-- info here -->
                                <div id="billingInformationSection" runat="server" visible="false">
                                    <p>
                                        <asp:Label ID="lbShippingMethod" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lbShippingFee" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lbOrderComments" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                                <asp:Button
                                    ID="btnEditBillingSection"
                                    runat="server"
                                    Visible="false"
                                    OnClick="btnEditBillingSection_Click"
                                    Text="Edit"
                                    CausesValidation="false" />
                            </div>
                            <div id="customerBillingSection" runat="server">
                                <!-- shipping fee section -->
                                <div class="padding-top-bottom">
                                    <p class="padding-top-bottom">
                                        Outbound Shipping (order by 4pm GMT Mon-Fri for same day despatch)
                                    </p>
                                    <div class="shipping-method">
                                        <div class="shipping-method--radioactive">
                                            <input type="radio" value="1" name="idShippingFee" checked id="postalService">
                                        </div>
                                        <div class="shipping-method-name">
                                            <p>Postal Service (Express 3-10 Days)</p>
                                        </div>
                                        <div class="shipping-cost"><b>$1.9</b></div>
                                    </div>
                                    <div class="shipping-method">
                                        <div class="shipping-method--radioactive">
                                            <input type="radio" value="2" name="idShippingFee" id="fastShipping">
                                        </div>
                                        <div class="shipping-method-name">
                                            <p>DHL Courier (Express 1-2 Days, Monday - Friday)</p>
                                        </div>
                                        <div class="shipping-cost"><b>$6.5</b></div>
                                    </div>
                                    <div class="shipping-method">
                                        <div class="shipping-method--radioactive">
                                            <input type="radio" value="3" name="idShippingFee" id="weekendShipping">
                                        </div>
                                        <div class="shipping-method-name">
                                            <p>DHL Courier (Express - Weekend Delivery)</p>
                                        </div>
                                        <div class="shipping-cost"><b>$10</b></div>
                                    </div>
                                </div>
                                <div class="box-info">
                                    <div class="padding-top-bottom">
                                        Please enter a shipping address in order to see
                                            shipping quotes
                                    </div>
                                </div>

                                <!-- order comment -->
                                <div class="padding-top-bottom">Order Comments</div>
                                <div class="comment-fun padding-top-bottom">
                                    <asp:TextBox
                                        ID="txtOrderComments"
                                        class="full-width"
                                        runat="server"
                                        TextMode="MultiLine">
                                    </asp:TextBox>
                                </div>
                                <asp:Button ID="btnContinueBillingSection" OnClick="btnContinueBillingSection_Click" runat="server" Text="Continue" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <%--Payment section--%>
                <div class="payment" id="paymentSection" runat="server">
                    <div class="num-check">
                        <div class="name-check">
                            <div class="header-items padding-top-bottom">
                                <h3>Payment</h3>
                                <!-- info here -->
                                <span class="email-scribe"></span>
                                <%--<asp:Button ID="btnEditPaymentSection" runat="server" Text="Edit" />--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-container--radioactive" id="customerPaymentSection" runat="server">
                        <div class="payment-method">
                            <div class="payment-method-details width-70">
                                <input type="radio" checked>
                                <label>Debit or Credit Cart</label>
                            </div>
                            <div class="payment-method-details-logo">
                                <img class="icon-cart" src="../Images/visa.png" alt="Visa">
                                <img class="icon-cart" src="../Images/mastercard.png"
                                    alt="mastercard">
                                <img class="icon-cart" src="../Images/discover.png" alt="Discover">
                            </div>
                        </div>
                        <div class="addition-form">
                            <div class="form-container-add">
                                <div class="credit-card-number padding-top-bottom required">
                                    <div class="padding-top-bottom">
                                        <label for="">Credit Card Number</label>
                                    </div>
                                    <i class="fas fa-lock"></i>
                                    <%--<input class="width-90" type="password">--%>
                                    <asp:TextBox ID="txtCreditCardNumber"
                                        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                        TextMode="Number"
                                        class="width-90"
                                        runat="server"
                                        MaxLength="16">

                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ErrorMessage='<i class="fas fa-times"></i> Please enter a valid creadit card number.'
                                        ControlToValidate="txtCreditCardNumber"
                                        Display="Dynamic"
                                        CssClass="txt__error">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="txtCreditCardNumber"
                                        ErrorMessage='<i class="fas fa-times"></i> Please enter a valid creadit card number'
                                        ValidationExpression=".{16}.*"
                                        Display="Dynamic"
                                        CssClass="txt__error" />
                                    <span class="warning"><i class="fas fa-times"></i>Please enter a valid creadit card number.</span>

                                </div>
                                <div class="credit-card-expiry padding-top-bottom required">
                                    <div class="padding-top-bottom">
                                        <label for="">Expiration</label>
                                    </div>
                                    <%--<input class="width-90" type="date" min="2017-12" max="2021-12" step="7"
                                        placeholder="MM/YY">--%>
                                    <asp:TextBox
                                        ID="txtDateExpiration"
                                        runat="server"
                                        TextMode="Month"
                                        ClientIDMode="Static">

                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ErrorMessage='<i class="fas fa-times"></i> Please enter the expiration date of your credit card.'
                                        ControlToValidate="txtDateExpiration"
                                        Display="Dynamic"
                                        CssClass="txt__error">
                                    </asp:RequiredFieldValidator>
                                    <span class="warning"><i class="fas fa-times"></i>Please enter the expiration date of your credit card.</span>
                                </div>
                            </div>
                            <div class="form-group-add">
                                <div class="form-group-add__password--input full-width required">
                                    <label for="">Name on card</label>
                                    <div class="form-group__password padding-top-bottom width-90">
                                        <%--<input class="full-width" type="password">--%>
                                        <asp:TextBox ID="txtNameCreditCard" class="full-width" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                            ErrorMessage='<i class="fas fa-times"></i> Please enter the credit card&rsquo;s name.'
                                            ControlToValidate="txtNameCreditCard"
                                            Display="Dynamic"
                                            CssClass="txt__error">
                                        </asp:RequiredFieldValidator>
                                        <span class="warning"><i class="fas fa-times"></i>Please enter the credit card&rsquo;s name.</span>
                                    </div>
                                </div>
                                <div class="form-group-add__ccv--input required">
                                    <label for="">CCV <i class="far fa-question-circle"></i></label>
                                    <div class="form-group__ccv--input__add padding-top-bottom">
                                        <%--input type="password">--%>
                                        <asp:TextBox ID="txtCCVCreditCard" runat="server" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                            ErrorMessage='<i class="fas fa-times"></i> Please enter the credit card&rsquo;s CCV.'
                                            ControlToValidate="txtCCVCreditCard"
                                            Display="Dynamic"
                                            CssClass="txt__error">
                                        </asp:RequiredFieldValidator>
                                        <span class="warning"><i class="fas fa-times"></i>Please enter the credit card&rsquo;s CCV.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cer-add"><a href="#">Promo/Gift Certificate</a></div>
                        <div class="certificate padding-top-bottom">
                            <input class="full-width" type="text">
                            <button class="padding-top-bottom button-primary-apply">APPLY</button>
                        </div>

                        <%--<button class="confirmed-order full-width">PLACE ORDER</button>--%>
                        <asp:Button
                            ID="txtConfirmPayment"
                            runat="server"
                            Text="PLACE ORDER"
                            class="confirmed-order full-width"
                            OnClick="txtConfirmPayment_Click" />
                        <%-- </form>--%>
                    </div>
                </div>
            </div>
            <div class="order-summary ">
                <div class="name-order ">
                    <div>Order Summary</div>
                    <div class="edit-button">
                        <a href="Cart.aspx">Edit cart</a>
                    </div>
                </div>
                <hr>
                <div class="quantity">
                    <p>
                        <asp:Label
                            class="quantity-num padding-top-bottom"
                            ID="lbTotalItemInCart"
                            runat="server">
                        </asp:Label>
                    </p>
                    <ul>
                        <asp:Repeater ID="rptPreviewCart" runat="server">
                            <ItemTemplate>
                                <li class="product--show">
                                    <div class="img--product__show">
                                        <%--<img id="product-in-order"
                                            src="../Uploads/jacket_mint1.webp" alt="">--%>
                                        <img class="product-in-order" src="../Uploads/<%# Eval("IMAGE") %>" alt="">
                                    </div>
                                    <div class="add-info-name-items">
                                        <%--<p class="name-item">1 x Menswear | Oversized Boxy Tee, Clay</p>--%>
                                        <a
                                            class="name-item"
                                            href="ProductDetail.aspx?id=<%# Eval("ID_PRODUCT") %>">
                                            <%# Eval("QUANTITY") %> x <%# Eval("PRODUCT_NAME") %>
                                        </a>
                                        <p>Size: <%# Eval("SIZE") %></p>
                                    </div>
                                    <div class="cost-item">
                                        <%--<p class="cost">$67</p>--%>
                                        <p class="cost">$<%# String.Format("{0:n2}",(Decimal.Parse(Eval("PRICE").ToString()) * int.Parse(Eval("QUANTITY").ToString()))) %></p>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </div>
                <div class="total--cart-section">
                    <hr>

                    <div class="flex-item padding-top-bottom">
                        <p>Subtotal</p>
                        <p>
                            $<asp:Label ID="lbSubTotalCart" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <hr>
                    <div class="flex-item padding-top-bottom">
                        <p>Shipping</p>
                        <p>
                            <asp:Label ID="lbShippingFeeCart" runat="server" Text="--"></asp:Label>
                        </p>
                    </div>
                    <hr>
                    <div class="flex-item total padding-top-bottom">
                        <p><b>Total (USD)</b></p>
                        <p>$<asp:Label ID="lbTotalCart" runat="server" Text="0"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
