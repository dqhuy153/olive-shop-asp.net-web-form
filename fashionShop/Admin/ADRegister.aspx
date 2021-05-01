<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADRegister.aspx.cs" Inherits="fashionShop.Admin.ADRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            color: #2b2b2b;
        }
        .khdangki-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            padding: 70px 0;
        }
        .content-container {
            box-shadow: rgba(0,0,0,0.2) 0px 6px 10px;
            width: 50%;
            max-width: 500px;
            border-radius: 0 0 6px 6px;
        }
        .content-header {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 17px;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
        }
            .content-header p {
                width: 50%;
                text-align: center;
                margin: 0;
                padding: 15px 0;
            }
            .content-header a {
                display: block;
                width: 50%;
                text-decoration: none;
                background: #f7faff;
                box-shadow: rgba(0,0,0,0.2) -2px -2px 5px inset;
                height: 100%;
                text-align: center;
                padding: 15px 0;
                color: #171717;
            }
        .content-body {
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
            .content-body .img {
                font-size: 100px;
                text-align: center;
                display: block;
                color: #2f3542;
                justify-content: center;
            }
        .content-body-header p {
            text-align: center;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
            font-weight: bold;
            margin: 15px;
        }
        .content-body-items {
            width: 70%;
            margin: 0px auto 20px;
        }
        .content-item {
            display: flex;
            align-items: center;
        }
        .content-txt {
            margin: 10px;
        }
        .content-item i {
            margin-right: 8px;
            width: 8%;
        }
        .content-item div {
            width: 92%
        }
        .content-txt input {
            width: 100%;
            padding: 7px;
        }
            .content-txt input:hover {
                background: #fffaf7;
            }
            .content-txt input:focus {
                background: #fffaf7;
                transition: all 0.2s ease-in;
                border: 1.1px solid #aaaaaa;
            }
        .content-checkbox {
            margin-left: 10px;
        }
            .content-checkbox input {
                margin-right: 8px;
                display: block;
                width: 15px;
                height: 15px;
            }
            .content-checkbox p {
                font-size: 14px;
            }
        .txtDiaChi {
            width: 100%;
            resize: none;
            overflow-y: scroll;
            height: 80px;
            padding: 7px;
        }
            .txtDiaChi:hover {
                background: #fffaf7;
            }
            .txtDiaChi:focus {
                background: #fffaf7;
                transition: all 0.2s ease-in;
                border: 1.1px solid #aaaaaa;
            }
        .btnDangKi {
            background: #e77f67;
            padding: 10px 15px;
            border: none;
            color: white;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            margin: 0 auto;
            cursor: pointer;
        }
            .btnDangKi:hover {
                background: tomato;
                transition: all 0.2s ease-in;
            }
        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }
        .lbThongBao {
            text-align: center;
        }
        .dauSao {
            font-size: 13px;
            color: tomato;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khdangki-container">
        <!--<p style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Đăng nhập dành cho Admin</p>
            -->
        <div class="content-container">
            <div class="content-header">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" ToolTip="Đăng xuất trước khi đăng nhập">Login</asp:HyperLink>
                <p>Register</p>
            </div>
            <div class="content-body">
                <div class="content-body-header">
                    <i class="fas fa-user-circle img"></i>
                    <p>ADMIN</p>
                </div>
                <div class="content-body-items">
                    <div class="content-item content-txt">
                        <i class="fas fa-user"></i>
                        <div>
                            <asp:TextBox ID="txtTenDangNhap" runat="server" placeholder="Username (*)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is requird" ControlToValidate="txtTenDangNhap" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-lock"></i>
                        <div>
                            <asp:TextBox ID="txtMatKhau" runat="server" placeholder="Password (*)" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ControlToValidate="txtMatKhau" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-lock"></i>
                        <div>
                            <asp:TextBox ID="txtNhapLaiMatKhau" runat="server" placeholder="Comfirm password (*)" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Comfirm password doesn't match" ControlToValidate="txtNhapLaiMatKhau" ControlToCompare="txtMatKhau" Type="String" CssClass="txterror" Display="Dynamic"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-user-circle"></i>
                        <div>
                            <asp:TextBox ID="txtHoTen" runat="server" placeholder="Fullname (*)"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Fullname is required" ControlToValidate="txtHoTen" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-envelope"></i>
                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email (*)" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-phone"></i>
                        <div>
                            <asp:TextBox ID="txtSDT" runat="server" placeholder="Phone number (*)" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phone number is required" ControlToValidate="txtSDT" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-map-marker-alt"></i>
                        <div>
                            <asp:TextBox ID="txtDiaChi" runat="server" placeholder="Address (*)" TextMode="MultiLine" CssClass="txtDiaChi"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address is required" ControlToValidate="txtDiaChi" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-checkbox">
                        <asp:CheckBox ID="cbGhiNho" runat="server" />
                        <p>Remember your account</p>
                    </div>
                    <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror lbThongBao"></asp:Label>
                </div>
                <asp:Button ID="btnDangKi" runat="server" Text="Register" OnClick="btnDangKi_Click" CssClass="btnDangKi" />
            </div>

        </div>
    </div>
</asp:Content>
