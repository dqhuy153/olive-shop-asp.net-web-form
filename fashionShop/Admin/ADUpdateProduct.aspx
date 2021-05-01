<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADUpdateProduct.aspx.cs" Inherits="fashionShop.Admin.ADUpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cnsp-container {
            display: flex;
            flex-direction: column;
            padding: 35px 0;
        }

       
        .cnsp-content {
            display: flex;
            flex-direction: row-reverse;
            width: 80%;
            margin: 0 auto;
            align-items: flex-start;
        }
        .cnsp-table-btns {
            width: 70%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .cnsp-table {
             width: 85%;
        }
        .cnsp-imgs {
            width: 20%;
            object-fit: cover;
            
        }
        .cnsp-imgs img {
            width: 250px;
        }

        @media only screen and (max-width: 1100px) {
            .cnsp-content {
                display: flex;
                flex-direction: column-reverse;
                  
            }
            .cnsp-imgs {
                width: 100%;
            }
            .cnsp-table {
                width: 100%;
            }
        }

        table.cnsp-table tbody {
            width: 100%;
            display: block;
        }

            table.cnsp-table tbody tr {
                margin: 25px 0;
                display: flex;
                align-items: center;
            }

                table.cnsp-table tbody tr td:first-child {
                    width: 25%;
                    min-width: 150px;
                    font-weight: bold;
                }

                table.cnsp-table tbody tr td:last-child:not(.cnsp-rblTrangThai tbody tr td:last-child) {
                    width: 100%;
                    display: block;
                }

                table.cnsp-table tbody tr input,
                table.cnsp-table tbody tr textarea,
                table.cnsp-table tbody tr select {
                    display: block;
                    width: 100%;
                    padding: 10px;
                    border-radius: 4px;
                    border: 1px #cccccc solid;
                    background-color: #fffdfd;
                    font-size: 14px;
                }

                    table.cnsp-table tbody tr input:hover,
                    table.cnsp-table tbody tr input:focus,
                    table.cnsp-table tbody tr textarea:hover,
                    table.cnsp-table tbody tr textarea:focus,
                    table.cnsp-table tbody tr select:hover,
                    table.cnsp-table tbody tr select:focus {
                        background-color: #f0f7fe;
                        transition: all 0.2s ease-in;
                    }

                table.cnsp-table tbody tr textarea {
                    resize: none;
                    height: 100px;
                    max-height: 300px;
                    font-family: Arial, sans-serif;
                    font-size: 14px;
                }

                table.cnsp-table tbody tr select {
                    width: 104%
                }

        .cnsp-error {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
        }

        .cnsp-table-tensp {
            font-weight: bold;
        }

        .cnsp-rblTrangThai tbody tr td {
            display: flex;
        }

            .cnsp-rblTrangThai tbody tr td input {
                margin: 0;
                margin-top: 2px;
                margin-right: 10px;
                width: 10px;
              
                
            }

            .cnsp-rblTrangThai tbody tr td label {
                font-weight: normal;
            }

            .cnsp-rblTrangThai tbody tr td:last-child {
                display: flex
            }

        .cnsp-btns {
            margin: 0px auto 50px;
            display: flex;
        }

        .cnsp-btn {
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

        .cnsp-btn-ThemMoi {
            background: #2768c3;
        }

            .cnsp-btn-ThemMoi:hover {
                background: #0c2876;
                transition: all 0.2s ease-in;
            }

        .cnsp-btn-Huy {
            background: #726f6f;
        }

            .cnsp-btn-Huy:hover {
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
            justify-content: space-between;
            width: 35%;
            align-items: center;
        }

            .size__box p {
                width: 60%;
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
    <div class="cnsp-container">
        <h3 style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Update Product</h3>
        <div class="cnsp-content">
            <div class="cnsp-imgs">
                <asp:Panel ID="PanelImage" runat="server"></asp:Panel>
            </div>
            <div class="cnsp-table-btns">
            <asp:Table ID="Table1" runat="server" CssClass="cnsp-table">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                    Product name <span class="dauSao">(*)</span>
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
                        <asp:TextBox ID="txtGia" TextMode="Number"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Price is required" ControlToValidate="txtGia" CssClass="cnsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Price must greater than or equal to 0." ControlToValidate="txtGia" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                    Sold quantity
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
</asp:Content>
