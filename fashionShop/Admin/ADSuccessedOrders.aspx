<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADSuccessedOrders.aspx.cs" Inherits="fashionShop.Admin.ADSuccessedOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .qldh-container{
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
           padding-bottom: 80px;
           
        }
        .qldh-container h4 {
            margin: 0 auto;
            font-size: 30px;
            font-weight: bold; 
            color: #262626;
        }
        .qldh-header {
             display: flex;
             justify-content: center;
             align-items: center;
             margin: 40px 0;
        }
        .qldh-btnThemMoi-container {
            position: absolute;
            right: 40px;
            background: #031a43;
            padding: 11px 13px;
            border-radius: 5px;
        }
        .qldh-btnThemMoi-container:hover {
            background: #155e98;
            transition : all 0.2s ease-in;
        }
        .qldh-btnThemMoi-container a {
            display: flex;
            align-items: center;
        }
        .qldh-btnThemMoi-container i,
        .qldh-btnThemMoi-container span {
            display: block;
            color: white;
            
        }
        .qldh-btnThemMoi-container i {
            font-size: 12px;
        }
        .qldh-btnThemMoi-container span{
            font-size: 16px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-left: 10px;
        }
        .table {
            width: 80%;
            margin: 0 auto;
        }
        .table,
        .table-th,
        .table-tr,
        .table-item {
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }
        .table-th{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background: #ffe4da
        }
        .table-td {
            text-align: center;
            font-size: 14px;
            font-weight: 500;
        }
        .table-item {
            padding: 10px;
        }
        .table-tr:nth-child(even){
            background: #fff9f9;
        }
        #table-item-tensp a {
            font-weight: bold;
            color: #031a43
        }
        #table-item-tensp a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .qldh-btnCapNhat {
            color: #0654a9;
            font-weight: bold;
            font-size: 14px;
            text-align: center;
            display: block;
        }
        .qldh-btnCapNhat:hover{
            color: #0094ff;
        }
        .qldh-btnHuy {
            color: tomato;
            font-weight: bold;
            text-align: center;
            display: block;
            font-size: 14px;
        }
        .qldh-btnHuy:hover{
            color: #f62d2d;
        }
        .x-icon {
            color: #666666;
        }
        .v-icon {
            color: #0094ff;
        }
        .dh-notLogin {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 60px
        }
        .dh-notLogin a{
            display: block;
            background: #e77f67;
            padding: 10px 25px;
            margin-top: 20px;
            color: white;
            border-radius: 5px;
        }
        .qldh-btnXem{
           color: cornflowerblue;
           font-weight: bold;
       }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="qldh" runat="server" class="qldh-container">
            <div class="qldh-header">
                   <h4>Pending Orders</h4>
                <div class="qldh-btnThemMoi-container">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/ADHome.aspx">
                        <i class="fas fa-chevron-left"></i>
                        <span>Admin Home</span>
                    </asp:HyperLink>
                </div>
            </div>
            <table class="table" border="1">
                <tr  class="table-tr">
                    <th class="table-th">ID</th>
                    <th class="table-th">Date</th>
                    <th class="table-th">Order quantity</th>
                    <th class="table-th">Information</th>
                    <th class="table-th">Total</th>
                    <th class="table-th" style="min-width: 110px">Status</th>
                    <th class="table-th"  style="min-width: 80px">Detail</th>           
                </tr>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </table>

        </div>
</asp:Content>
