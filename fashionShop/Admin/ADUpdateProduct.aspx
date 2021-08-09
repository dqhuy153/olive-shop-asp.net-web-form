<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADUpdateProduct.aspx.cs" Inherits="fashionShop.Admin.ADUpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/Admin/ADUpdateProduct.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cnsp-container">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="ADMNProduct.aspx">Products list</a>
            <span class="account__map--separate">|</span>
            <span>Update product</span>
        </div>
        <p class="account__title">Update product</p>
        <%--<h3 class="header-text">Update Product</h3>--%>
        <div class="cnsp-content">
            <div class="cnsp-imgs">
                <asp:Panel ID="PanelImage" runat="server"></asp:Panel>
            </div>
            <div class="cnsp-table-btns">
                <asp:Table ID="Table1" runat="server" CssClass="cnsp-table">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Product Name <span class="dauSao">(*)</span>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="txtTenSP" runat="server" CssClass="cnsp-table-tensp"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được trống" ControlToValidate="txtTenSP" CssClass="cnsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Gender
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="lblGender" runat="server" Text="" CssClass="gender-text"></asp:Label>

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Category <span class="dauSao">(*)</span>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <div class="edit-container">
                                <asp:DropDownList ID="ddlCategories" runat="server"></asp:DropDownList>
                                <!--<i class="far fa-edit"></i>-->
                            </div>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="ddlCategories"
                                InitialValue="-1"
                                ErrorMessage="Category name is required."
                                CssClass="cnsp-error"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Size <span class="dauSao">(*)</span>
                        </asp:TableCell>
                        <asp:TableCell runat="server" CssClass="size__box--container">
                            <div class="size__box">
                                <p>S</p>
                                <div class="size__box--input">

                                    <asp:TextBox ID="txtS" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtS" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="size__box">
                                <p>M</p>
                                <div class="size__box--input">

                                    <asp:TextBox ID="txtM" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtM" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>

                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    
                        </asp:TableCell>
                        <asp:TableCell runat="server" CssClass="size__box--container">
                            <div class="size__box">
                                <p>L</p>
                                <div class="size__box--input">

                                    <asp:TextBox ID="txtL" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtL" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="size__box">
                                <p>XL</p>
                                <div class="size__box--input">

                                    <asp:TextBox ID="txtXL" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtXL" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>

                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    
                        </asp:TableCell>
                        <asp:TableCell runat="server" CssClass="size__box--container">
                            <div class="size__box">
                                <p>Oversize</p>
                                <div class="size__box--input">

                                    <asp:TextBox ID="txtOversize" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtOversize" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="size__box">
                                <p>XXL</p>
                                <div class="size__box--input">

                                    <asp:TextBox ID="txtXXL" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtXXL" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>

                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Information
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="txtInfo" runat="server" TextMode="MultiLine"></asp:TextBox>

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Images
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:FileUpload ID="FileUploadImg" runat="server" AllowMultiple="true" accept=".png,.jpg,.jpeg,.gif,.webp" />

                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Price <span class="dauSao">(*)</span>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="txtGia" TextMode="Number" min="0" step="0.01" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Price is required" ControlToValidate="txtGia" CssClass="cnsp-error" Display="Dynamic"></asp:RequiredFieldValidator>

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Sold Quantity
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="txtSLDaBan" TextMode="Number" runat="server" Text="0"></asp:TextBox>

                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Sold quantity must greater than or equal to 0." ControlToValidate="txtSLDaBan" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                    Status
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:RadioButtonList ID="rblTinhTrang" runat="server" RepeatDirection="Horizontal" CssClass="cnsp-rblTrangThai">
                                <asp:ListItem Value="1" Selected="True">Open</asp:ListItem>
                                <asp:ListItem Value="0">Close</asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <div class="cnsp-btns">
                    <asp:Button ID="btnUpdateProduct" CssClass="cnsp-btn cnsp-btn-ThemMoi" runat="server" Text="Save" OnClick="btnUpdateProduct_Click" />
                    <asp:Button ID="btnCancel" CssClass="cnsp-btn cnsp-btn-Huy" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" CssClass="validationSumary" />
            </div>
        </div>
    </div>
</asp:Content>
