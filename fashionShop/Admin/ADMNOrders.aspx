<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADMNOrders.aspx.cs" Inherits="fashionShop.Admin.ADPendingOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/Admin/table.css" rel="stylesheet">
    <link href="../Assets/css/Admin/ADMNOrders.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="qldh" runat="server" class="qldh-container">
        
            <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>

            <span>
                <asp:Label ID="lbOrderStatus" runat="server" Text=""></asp:Label></span>
        </div>
        <p class="account__title">
            <asp:Label ID="lbOrderStatusTitle" runat="server" Text=""></asp:Label></p>
            
       
        <table class="table" border="1">
            <tr class="table-tr">
                <th class="table-th">ID</th>
                <th class="table-th">Date</th>
                <th class="table-th">Order quantity</th>
                <th class="table-th">Information</th>
                <th class="table-th">Total</th>
                <th class="table-th" style="min-width: 110px">Status</th>
                <th class="table-th" style="min-width: 80px">Detail</th>
            </tr>
            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
        </table>

    </div>
</asp:Content>
