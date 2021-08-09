<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADHome.aspx.cs" Inherits="fashionShop.Admin.ADHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Olive - Admin Dashboard</title>
    <link href="../Assets/css/Admin/table.css" rel="stylesheet">
    <link href="../Assets/css/Admin/ADHome.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="adtrangchu-container">
        <section class="section-thongKe">
            <div class="adtrangchu-datHang-container">
                <p class="section-item-header header-choDuyet">Pending Orders</p>
                <table class="table" border="1">
                <tr  class="table-tr">
                    <th class="table-th">ID</th>
                    <th class="table-th">Date</th>
                    <th class="table-th">Quantity</th>
                    <th class="table-th">Total</th>
                    <th class="table-th"  style="min-width: 80px">Detail</th>
                </tr>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </table>
            </div>
            <div class="adtrangchu-doanhThu-container">
                <div class="section-item doanhthu">
                    <p class="section-item-header">Total Revenue</p>
                    <div class="section-item-number">
                        <asp:Label ID="lbTongDoanhThu" runat="server" Text=""></asp:Label>
                        <table>
                            <tr>
                                <th></th>
                            </tr>
                        </table>
                    </div>

                </div>
                <div class="section-item tongsp-daBan">
                    <p class="section-item-header">Total number of products sold</p>
                    <div class="section-item-number">
                        <asp:Label ID="lbSPDaBan" runat="server" Text="100000"></asp:Label>

                    </div>
                </div>
                <div class="section-item tongsp-ton">
                    <p class="section-item-header">Total number of products in stock</p>
                    <div class="section-item-number">
                        <asp:Label ID="lbSPTon" runat="server" Text="100000"></asp:Label>

                    </div>
                </div>
            </div>
        </section>
        </div>
</asp:Content>
