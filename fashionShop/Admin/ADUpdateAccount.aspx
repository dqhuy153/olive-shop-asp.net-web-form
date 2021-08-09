<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADUpdateAccount.aspx.cs" Inherits="fashionShop.Admin.ADUpdateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../Assets/css/Admin/ADUpdateAccount.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cntk-container">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>
            <a href="ADMNCustomerAccount.aspx">Customers list</a>
            <span class="account__map--separate">|</span>
            <span>Account setting</span>
        </div>
        <p class="account__title">Account
            <asp:Label ID="lbLoaiTK" runat="server" Text=""></asp:Label></p>
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
                        <asp:TextBox ID="txtEmail" Enabled="false" runat="server"></asp:TextBox>

                        
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtMatKhauMoi"
                    ErrorMessage='Minimum password length is 6'
                    ValidationExpression=".{6}.*"
                    Display="Dynamic"
                    CssClass="txterror" />
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
            <asp:Button ID="btnHuy" CssClass="cntk-btn cntk-btn-Huy" runat="server" CausesValidation="false"  Text="Cancel" OnClick="btnHuy_Click" />
        </div>
        </div>
    </div>
</asp:Content>
