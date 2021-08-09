<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADAddNewProduct.aspx.cs" Inherits="fashionShop.Admin.AddNewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />
    <style>
        .header-text {
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            color: #262626;
            margin: 5rem 0 3rem;
        }

        .tmsp-container {
            display: flex;
            flex-direction: column;
            padding: 35px 0;
        }

        table.tmsp-table {
            width: 50%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            table.tmsp-table tbody {
                width: 100%;
                display: block;
            }

                table.tmsp-table tbody tr {
                    margin: 25px 0;
                    display: flex;
                    align-items: center;
                }

                    table.tmsp-table tbody tr td:first-child {
                        width: 25%;
                        min-width: 150px;
                        font-weight: bold;
                        font-size: 1.3rem;
                    }

                    table.tmsp-table tbody tr td:last-child:not(.tmsp-rblTrangThai tbody tr td:last-child) {
                        width: 100%;
                        display: block;
                    }

                    table.tmsp-table tbody tr input,
                    table.tmsp-table tbody tr textarea,
                    table.tmsp-table tbody tr select {
                        display: block;
                        width: 100%;
                        padding: 10px;
                        border-radius: 4px;
                        border: 1px #cccccc solid;
                        background-color: #fffdfd;
                        font-size: 14px;
                    }

                        table.tmsp-table tbody tr input:hover,
                        table.tmsp-table tbody tr input:focus,
                        table.tmsp-table tbody tr textarea:hover,
                        table.tmsp-table tbody tr textarea:focus,
                        table.tmsp-table tbody tr select:hover,
                        table.tmsp-table tbody tr select:focus {
                            background-color: #f0f7fe;
                            transition: all 0.2s ease-in;
                        }

                    table.tmsp-table tbody tr textarea {
                        resize: none;
                        height: 100px;
                        max-height: 300px;
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                    }

                    table.tmsp-table tbody tr select {
                        width: 96%;
                        font-size: 1.2rem;
                    }

        .tmsp-error {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
        }

        .tmsp-table-tensp {
            font-weight: bold;
        }

        .tmsp-rblTrangThai tbody tr td {
            display: flex;
        }

            .tmsp-rblTrangThai tbody tr td input {
                margin: 0;
                margin-top: 2px;
                margin-right: 10px;
                width: 10px;
            }

            .tmsp-rblTrangThai tbody tr td label {
                font-weight: normal;
            }

            .tmsp-rblTrangThai tbody tr td:last-child {
                display: flex
            }

        .tmsp-btns {
            margin: 0 auto;
            display: flex;
        }

        .tmsp-btn {
            padding: 8px;
            width: 90px;
            font-size: 13.5px;
            font-weight: 500;
            background: #2768c3;
            color: white;
            outline: none;
            box-shadow: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 10px;
        }

        .tmsp-btn-ThemMoi {
            background: #2768c3;
        }

            .tmsp-btn-ThemMoi:hover {
                background: #0c2876;
                transition: all 0.2s ease-in;
            }

        .tmsp-btn-Huy {
            background: #726f6f;
        }

            .tmsp-btn-Huy:hover {
                background: #1a1a1a;
                transition: all 0.2s ease-in;
            }

        .dauSao {
            font-size: 13px;
            color: tomato;
        }

        .validationSumary {
            display: none;
        }

        .edit-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 104%;
        }

            .edit-container i {
                font-size: 20px;
                margin-left: 20px;
            }

        .size__box--container {
            display: flex !important;
            justify-content: space-between;
        }

        .size__box {
            display: flex;
            justify-content: flex-start;
            width: 44%;
            align-items: center;
        }

            .size__box p {
                width: 30%;
                text-align: right;
                margin: 0 15px 0 0;
                font-weight: bold;
            }


        .gender-text {
            display: block;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px #cccccc solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tmsp-container">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="ADMNProduct.aspx">Products list</a>
            <span class="account__map--separate">|</span>
            <span>Add new product</span>
        </div>
        <p class="account__title">Add new product</p>
        <%--<h3 class="header-text">Add new product</h3>--%>
        <asp:Table ID="Table1" runat="server" CssClass="tmsp-table">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Product name <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtTenSP" runat="server" CssClass="tmsp-table-tensp"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product name is required" ControlToValidate="txtTenSP" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        CssClass="tmsp-error"
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
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtS" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="size__box">
                        <p>M</p>
                        <div class="size__box--input">

                            <asp:TextBox ID="txtM" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtM" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
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
                            <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtL" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="size__box">
                        <p>XL</p>
                        <div class="size__box--input">

                            <asp:TextBox ID="txtXL" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator7" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtXL" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
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
                            <asp:CompareValidator ID="CompareValidator8" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtOversize" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="size__box">
                        <p>XXL</p>
                        <div class="size__box--input">

                            <asp:TextBox ID="txtXXL" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtXXL" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
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
                    <asp:TextBox ID="txtGia" TextMode="Number" step="0.1" min="0" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Price is required" ControlToValidate="txtGia" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Sold quantity
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtSLDaBan" TextMode="Number" runat="server" Text="0"></asp:TextBox>

                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Sold quantity must greater than or equal to 0." ControlToValidate="txtSLDaBan" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Status
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:RadioButtonList ID="rblTinhTrang" runat="server" RepeatDirection="Horizontal" CssClass="tmsp-rblTrangThai">
                        <asp:ListItem Value="1" Selected="True">Open</asp:ListItem>
                        <asp:ListItem Value="0">Close</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <div class="tmsp-btns">
            <asp:Button ID="btnAddProduct" CssClass="tmsp-btn tmsp-btn-ThemMoi" runat="server" Text="Add" OnClick="btnAddProduct_Click" />
            <asp:Button ID="btnCancel" CssClass="tmsp-btn tmsp-btn-Huy" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" CssClass="validationSumary" />
    </div>
</asp:Content>
