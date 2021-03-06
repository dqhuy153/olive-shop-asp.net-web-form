<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADDeleteAccount.aspx.cs" Inherits="fashionShop.Admin.ADDeleteAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />

    <style>
        .xoatk-container {
            display: flex;
            flex-direction: column;
            padding: 40px 0;
        }

        .xoatk-table-container {
            display: flex;
            width: 50%;
            margin: 0 auto;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        
        .account__title span {
        font-size: 1.7rem !important;
    }

        .xoatk-username {
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

            .xoatk-username .img {
                font-size: 60px;
                margin-bottom: 10px;
            }

            .xoatk-username span {
                display: block;
                font-weight: bold;
                font-size: 18px;
                text-align: center;
            }

        .xoatk-table-container img {
            height: 200px;
            object-fit: cover;
            position: absolute;
            right: 80px;
        }

        @media only screen and (max-width: 1100px) {
            .xoatk-table-container img {
                display: none
            }
        }

        table.xoatk-table {
            width: 100%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            table.xoatk-table tbody {
                width: 100%;
                display: block;
            }

                table.xoatk-table tbody tr {
                    margin: 25px 0;
                    display: flex;
                    align-items: center;
                }

                    table.xoatk-table tbody tr td:first-child {
                        width: 25%;
                        min-width: 150px;
                        font-weight: bold;
                    }

                    table.xoatk-table tbody tr td:last-child:not(.xoatk-rblTrangThai tbody tr td:last-child) {
                        width: 100%;
                        display: block;
                    }

                    table.xoatk-table tbody tr input,
                    table.xoatk-table tbody tr textarea,
                    table.xoatk-table tbody tr select {
                        display: block;
                        width: 100%;
                        padding: 10px;
                        border-radius: 4px;
                        border: 1px #eeeeee solid;
                        background-color: #fffdfd;
                        font-size: 14px;
                    }

                        table.xoatk-table tbody tr input:hover,
                        table.xoatk-table tbody tr input:focus,
                        table.xoatk-table tbody tr textarea:hover,
                        table.xoatk-table tbody tr textarea:focus,
                        table.xoatk-table tbody tr select:hover,
                        table.xoatk-table tbody tr select:focus {
                            background-color: #f0f7fe;
                            transition: all 0.2s ease-in;
                        }

                    table.xoatk-table tbody tr textarea {
                        resize: none;
                        height: 100px;
                        max-height: 300px;
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                    }

                    table.xoatk-table tbody tr select {
                        width: 104%
                    }

        .txterror {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }

        .xoatk-table-tensp {
            font-weight: bold;
        }

        .xoatk-rblTrangThai tbody tr td {
            display: flex;
        }

            .xoatk-rblTrangThai tbody tr td input {
                margin: 0;
                margin-top: 2px;
                margin-right: 10px;
                width: 10px;
            }

            .xoatk-rblTrangThai tbody tr td label {
                font-weight: normal;
            }

            .xoatk-rblTrangThai tbody tr td:last-child {
                display: flex
            }

        .xoatk-btns {
            margin: 0 auto;
            display: flex;
        }

        .xoatk-btn {
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

        .xoatk-btn-CapNhat {
            background: #e52a0c;
        }

            .xoatk-btn-CapNhat:hover {
                background: tomato;
                transition: all 0.2s ease-in;
            }

        .xoatk-btn-Huy {
            background: #726f6f;
        }

            .xoatk-btn-Huy:hover {
                background: #1a1a1a;
                transition: all 0.2s ease-in;
            }

        .dauSao {
            font-size: 13px;
            color: tomato;
        }

        .doiMatKhauText {
            font-size: 20px;
            padding: 10px 0;
        }

        .validationSumary {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="xoatk-container">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="ADMNCustomerAccount.aspx">Customers list</a>
            <span class="account__map--separate">|</span>
            <span>Account setting</span>
        </div>
        <p class="account__title">Delete Account
            <asp:Label ID="lbLoaiTK" runat="server" Text=""></asp:Label></p>

        <div class="xoatk-username">
            <i class="fas fa-user-circle img"></i>
            <asp:Label ID="lbTenDangNhap" runat="server" Text=""></asp:Label>
        </div>
        <div class="xoatk-table-container">
            <asp:Table ID="Table1" runat="server" CssClass="xoatk-table">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">First name</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtFirstName" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Last name</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtLastName" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Email</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtEmail" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Phone number</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Account type</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtAccountType" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>

            <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
            <div class="cnsp-btns">
                <asp:Button ID="btnXoa" runat="server" Text="Delete" OnClick="btnXoa_Click" CssClass="xoatk-btn xoatk-btn-CapNhat" />
                <asp:Button ID="btnHuy" CssClass="xoatk-btn xoatk-btn-Huy" runat="server" Text="Cancel" OnClick="btnHuy_Click" />
            </div>
        </div>
    </div>
</asp:Content>
