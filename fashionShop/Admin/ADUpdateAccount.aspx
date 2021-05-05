<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADUpdateAccount.aspx.cs" Inherits="fashionShop.Admin.ADUpdateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .cntk-container {
            display: flex;
            flex-direction: column;
            padding: 40px 0;
        }
        .cntk-table-container{
            display: flex;
            width: 50%;
            margin: 0 auto;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        h3 {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .cntk-username{
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .cntk-username .img {
            font-size: 60px;
            margin-bottom: 10px;
        }
        .cntk-username span {
            display: block;
            font-weight: bold;
            font-size: 18px;
            text-align: center;
        }
        .cntk-table-container img {
            height: 200px;
            object-fit: cover;
            position: absolute;
            right: 80px;
        }
        table.cntk-table {
            width: 100%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }
            table.cntk-table tbody {
                width: 100%;
                display: block;
            }
                table.cntk-table tbody tr {
                    margin: 25px 0;
                    display: flex;
                    align-items: center;
                }
                    table.cntk-table tbody tr td:first-child {
                        width: 25%;
                        min-width: 150px;
                        font-weight: bold;
                    }
                    table.cntk-table tbody tr td:last-child:not(.cntk-rblTrangThai tbody tr td:last-child) {
                        width: 100%;
                        display: block;
                    }
                    table.cntk-table tbody tr input,
                    table.cntk-table tbody tr textarea,
                    table.cntk-table tbody tr select {
                        display: block;
                        width: 100%;
                        padding: 10px;
                        border-radius: 4px;
                        border: 1px #eeeeee solid;
                        background-color: #fffdfd;
                        font-size: 14px;
                    }
                        table.cntk-table tbody tr input:hover,
                        table.cntk-table tbody tr input:focus,
                        table.cntk-table tbody tr textarea:hover,
                        table.cntk-table tbody tr textarea:focus,
                        table.cntk-table tbody tr select:hover,
                        table.cntk-table tbody tr select:focus {
                            background-color: #f0f7fe;
                            transition: all 0.2s ease-in;
                        }
                    table.cntk-table tbody tr textarea {
                        resize: none;
                        height: 100px;
                        max-height: 300px;
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                    }
                    table.cntk-table tbody tr select {
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
        .cntk-table-tensp {
            font-weight: bold;
        }
        .cntk-rblTrangThai tbody tr td {
            display: flex;
        }
            .cntk-rblTrangThai tbody tr td input {
                margin: 0;
                margin-top: 2px;
                margin-right: 10px;
                width: 10px;
            }
            .cntk-rblTrangThai tbody tr td label {
                font-weight: normal;
            }
            .cntk-rblTrangThai tbody tr td:last-child {
                display: flex
            }
        .cntk-btns {
            margin: 0 auto;
            display: flex;
        }
        .cntk-btn {
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
        .cntk-btn-CapNhat {
            background: #2768c3;
        }
            .cntk-btn-CapNhat:hover {
                background: #0c2876;
                transition: all 0.2s ease-in;
            }
        .cntk-btn-Huy {
            background: #726f6f;
        }
            .cntk-btn-Huy:hover {
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
        .validationSumary{
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cntk-container">
        <h3>Update Account
            <asp:Label ID="lbLoaiTK" runat="server" Text=""></asp:Label></h3>
        <div class="cntk-username">
            <i class="fas fa-user-circle img"></i>
            <asp:Label ID="lbTenDangNhap" runat="server" Text=""></asp:Label>
        </div>
        <div class="cntk-table-container">
            <asp:Table ID="Table1" runat="server" CssClass="cntk-table">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">First Name <span class="dauSao">(*)</span></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First name is required" ControlToValidate="txtFirstName" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Last Name <span class="dauSao">(*)</span></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Last name is required" ControlToValidate="txtLastName" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Email <span class="dauSao">(*)</span></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is invalid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Phone number <span class="dauSao">(*)</span></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Phone number is required" ControlToValidate="txtSDT" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server" ID="rowDiaChi">
                    <asp:TableCell runat="server">Address <span class="dauSao">(*)</span></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDiaChi" runat="server" ErrorMessage="Address is required" ControlToValidate="txtDiaChi" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                    Status
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" CssClass="cntk-rblTrangThai">
                            <asp:ListItem Value="1" Selected="True">Open</asp:ListItem>
                            <asp:ListItem Value="0">Close</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" ColumnSpan="2" HorizontalAlign="Center" CssClass="doiMatKhauText">Change Password</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Old password</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtMatKhauCu" runat="server" TextMode="Password"></asp:TextBox>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">New password</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtMatKhauMoi" runat="server" TextMode="Password"></asp:TextBox>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Confirm password</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtNhapLai" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Repeat password doesn't not match new password" ControlToValidate="txtNhapLai" ControlToCompare="txtMatKhauMoi" Type="String" CssClass="txterror" Display="Dynamic"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
        <div class="cnsp-btns">
            <asp:Button ID="btncapnhat" runat="server" Text="Save" OnClick="btncapnhat_Click" CssClass="cntk-btn cntk-btn-CapNhat"/>
            <asp:Button ID="btnHuy" CssClass="cntk-btn cntk-btn-Huy" runat="server" Text="Cancel" OnClick="btnHuy_Click" />
        </div>
        </div>
    </div>
</asp:Content>
