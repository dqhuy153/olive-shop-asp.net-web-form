<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADOrderDetail.aspx.cs" Inherits="fashionShop.Admin.ADOrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
            color: #0a4fa4;
        }
        a:hover{
            text-decoration: none;
        }
        .ctdh-Giohang {
            display: block;
            width: 100%;
            height: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        #Table1 {
            height: auto;
                width: 650px;
        }
        .ctdh-head-text {
            width: 630px;
            padding-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .ctdh-text {
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
        .ctdh-back {
            margin-right: 50px;
        }

        .ctdh-cart {
            width: 650px;
            box-shadow: 0 0 18px rgb(0 0 0 / 12%);
            margin-top: 30px;
        }
        .ctdh-table {
            width: 620px;
            height: 800px;
        }
        .ctdh-tr-item {
            border-bottom: 1px solid #dedede;
            width: 640px;
            display: flex;
            padding-top: 10px;
            padding-left: 10px;
            justify-content: space-between;
        }
        .ctdh-tr-item a {
            color: #333333;
        }
        .ctdh-left, .ctdh-left1 {
            height: auto;
            width: 500px;
            
        }
        .ctdh-left a:first-child {
            display: flex;
            padding-top: 10px;
        }
        .ctdh-img-sp {
            width: 80px;
            margin-right: 10px;
        }
        .ctdh-left{
            margin-left: 5px;
            margin-bottom: 10px;
        }
        .ctdh-btnXoa {
            border: none;
            cursor: pointer;
            background: none;
            font-weight: 500;
            display: block;
            margin-left: 33px;
        }
            .ctdh-btnXoa i {
                color: #e77f67;
                font-size: 15px;
            }
        .ctdh-left h5 {           
            margin: 10px;
            font-size: 16px;
            font-weight: bold;
        }
        .ctdh-left p {
            font-size: 13px;
            margin-left: 10px;
        }
        .ctdh-right {
            margin-bottom: 50px;
            padding-right: 25px;
        }
            .ctdh-right p {
                color: #e77f67;
                margin-left: 35px;
                padding-top: 15px;
                font-size: 18px;
                text-align: center;
                font-weight: 500;
            }
            .ctdh-right ul {
                display: flex;
                margin-top: 18px;
                margin-left: 30px;
            }
            .ctdh-right span {
                display: block;
                float: right;
                margin-top: 10px;
                font-weight: 500;
                font-size: 14px;
                margin-right: 5px;
            }
        .ctdh-left1 p, .ctdh-left1 h5 {
            padding-left: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            padding-top: 15px;
        }
        .ctdh-left1 h5 {
            padding-left: 30px;
            padding-top: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            color: #e77f67;
            padding-top: 17px;
            font-weight: 600;
        }
        .ctdh-right1 span {
            padding-top: 10px;
            display: block;
            font-size: 18px;
            font-weight: bold;
            color: tomato;
            text-align: center;
        }
            
        .ctdh-right1 h5 {
            
            padding-left: 40px;
            color: #e77f67;
        }
        .ctdh-text-box {
            margin-left: 20px;
        }
        .ctdh-request {
            margin-left: 20px;
            padding-right: 100px;
        }
        #rq1, #rq2 {
            color: red;
        }
        #rq1 {
            margin-right: 90px
        }
        .ctdh-left2 h5 {
            padding-left: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            font-weight: 600;
        }
        .ctdh-right2 p {
            padding-top: 0px;
            padding-left: 10px;
            color: #e77f67;
            font-weight: bold;
        }
        .ctdh-btnHuy {
            width: 600px;
            height: 70px;
            border-radius: 5px;
            background-color: #e77f67;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
        }
        .ctdh-btnLogin {
            width: 600px;
            padding: 20px;
            border-radius: 5px;
            background-color: #20489b;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
            text-align: center;
            vertical-align: middle;
        }
        .ctdh-btnLogin:hover {
            color: white;
            background: #0b2976;
            text-decoration: none;
        }
        .ctdh-btnHuy:hover {
            color: white;
            background: tomato;
        }
        .ctdh-btnHuy {
            width: 45%;
            padding: 20PX;
            text-align: center;
            border-radius: 5px;
            background-color: #c82f09;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
           cursor: pointer;
        }
        .ctdh-btnXacNhan {
            width: 45%;
            height: 70px;
            border-radius: 5px;
            background-color: #20489b;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
            cursor: pointer;
        }
        .ctdh-btnXacNhan:hover{
            background: #036194;
        }
        .ctdh-ttkh-table {
            width: 90%;
            margin-left: 20px;
            margin-top: 20px;
            border: none;
            padding: 10px 0;
        }
        .ctdh-ttkh-table tr {
            display: flex;
            width: 100%;
            margin: 15px 0;
            align-items: center;
            justify-content:center;
        }
            .ctdh-ttkh-table tr td:first-child {
                width: 25%;
                font-weight: bold;
            }
            .ctdh-ttkh-table tr td:last-child {
                width: 50%;
            }
            .ctdh-ttkh-table input, .ctdh-ttkh-table textarea {
                width: 100%;
                resize: none;
                padding: 10px;
                border-radius: 6px;
                border: 1px solid #808080;
            }

            .ctdh-ttkh-table textarea {
                height: 80px;
                overflow-y: scroll;
            }
                .ctdh-ttkh-table input:hover,
                .ctdh-ttkh-table textarea:hover,
                .ctdh-ttkh-table input:focus,
                .ctdh-ttkh-table textarea:focus {
                    background: #f0fdff;
                }
        .ctdh-txterror {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }
        .ctdh-btnCho{
            
            width: 100%;
            height: 70px;
            border-radius: 5px;
            background-color: #656870;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
            cursor: pointer;
        }
        .ctdh-btnCho:hover{
            background: #2f3542;
        }
        .ctdh-askLogin p {
            text-align: center;
        }
        .ctdh-askLogin a {
            text-align: center;
            color: tomato;
            display: block;
        }
        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }
        .ctdh-tr-tongTien{
            display: flex;
            padding: 20px 0 30px;
        }
        .ctdh-btns {
            margin-top: 50px;
            padding-bottom: 80px;
            display: flex;
            width: 640px;
            justify-content: space-around;
            
        }
        .lbDaGiao {
            width: 600px;
            padding: 25px;
            text-align: center;
            border-radius: 5px;
            background-color: #82b2fa;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
            cursor: not-allowed;
        }
        .table-row3 h6{
            font-size: 17px;
            text-align: center;
            padding: 50px 0 15px 0;
            font-weight: bold;
            color: tomato;
            border-top: 1px solid #d3d3d3;
            margin-top: 15px;
        }
        .ctdt-ttkh-table-container tr {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ctdh-Giohang">
            <div class="ctdh-head-text">
                <div class="ctdh-text">
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="back" NavigateUrl="~/Admin/ADTrangChu.aspx"><i class="fas fa-chevron-left"></i> Dashboard</asp:HyperLink>
                    <p>Thông tin đơn hàng</p>
                </div>
            </div>
            <div class="ctdh-cart">
                <table id="Table1" class="ctdh-table">
                    <asp:Repeater ID="rptSP" runat="server">
                        <ItemTemplate>
                            <tr class="ctdh-tr-item" style="height: 100px;">
                                <td class="ctdh-left">
                                    <a href="../KH/TrangChiTietSP.aspx?idSP=<%# Eval("ID_SP") %>">
                                        <img alt="phone-img" src="/Uploads/<%# Eval("HINH") %>" class="ctdh-img-sp" />
                                        <div class="ctdh-left-head">
                                            <h5><%# Eval("TENSP") %></h5>
                                            <p>Xem sản phẩm</p>
                                        </div>
                                    </a>
                                </td>
                                <td class="ctdh-right">
                                    <p><%# Eval("DONGIA","{0:n0}") %></p>
                                    <span>x <%# Eval("SOLUONG") %></span>
                                    
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr class="ctdh-tr-tongTien">
                        <td class="ctdh-left1">
                            
                            <h5>Tổng tiền:</h5>
                        </td>
                        <td class="ctdh-right1">
                            <asp:Label ID="lblTong" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr id="trTT" class="table-row3" runat="server">
                        <td colspan="2">
                            <h6>THÔNG TIN KHÁCH HÀNG</h6>
                            <div class="ctdh-ttkh-table-container">
                                <asp:Table ID="Table2" runat="server" CssClass="ctdh-ttkh-table">
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Họ tên (*)</asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Họ tên không được bỏ trống" ControlToValidate="txtTen" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Email</asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>


                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Số điện thoại <span class="dauSao">(*)</span></asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Số điện thoại không được bỏ trống" ControlToValidate="txtSDT" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Địa chỉ <span class="dauSao">(*)</span></asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Địa chỉ không được bỏ trống" ControlToValidate="txtDiaChi" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </td>
                    </tr>
                    <tr id="trHuy" runat="server">
                        <td colspan="2" class="ctdh-btns">
                            <asp:Button ID="btnHuy" runat="server" Text="Hủy đơn hàng" OnClick="btnChoSangHuy_Click" CssClass="ctdh-btnHuy" />
                            <asp:Button ID="btnHuySangCho" runat="server" Text="Chuyển sang chờ duyệt" OnClick="btnHuySangCho_Click" CssClass="ctdh-btnCho" />
                            <asp:Button ID="btnDuyetSangCho" runat="server" Text="Chuyển sang chờ duyệt" OnClick="btnDuyetSangCho_Click" CssClass="ctdh-btnCho" />                            
                            <asp:Button ID="btnDuyet" runat="server" Text="Xác nhận giao hàng" OnClick="btnChoSangDuyet_Click" CssClass="ctdh-btnXacNhan" />
                            <asp:Label ID="lbDaGiao" runat="server" Text="Đơn hàng đã giao thành công" CssClass="lbDaGiao"></asp:Label>
                        </td>
                    </tr>
                    </table>
                </div>
        </div>
</asp:Content>
