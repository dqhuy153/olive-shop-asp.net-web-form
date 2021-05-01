<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADMNProduct.aspx.cs" Inherits="fashionShop.Customer.ADQLProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .qlsp-container {
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            padding: 50px 0;
        }
        .qlsp-header {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 50px;
        }
        .qlsp-header h3 {
            font-size: 30px; 
            font-weight: bold; 
            color: #262626;
            margin-right: auto;
            padding-left: 80px;
        }
        .qlsp-btnThemMoi-container {
            position: absolute;
            right: 30px;                 
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
        }
        .qlsp-btnThemMoi{
            min-width: 80px;
            padding: 11px 13px;
            border-radius: 5px;
            margin: 0 15px;
            background: #031a43;
            text-align: center;
        }
            .qlsp-btnThemMoi:hover {
                background: #155e98;
                transition: all 0.2s ease-in;
            }

            .qlsp-btnThemMoi a {
                display: flex;
                align-items: center;
            }
         

            .qlsp-btnThemMoi-container i,
            .qlsp-btnThemMoi-container span {
                display: block;
                color: white;
            }

            .qlsp-btnThemMoi-container i {
                font-size: 12px;
                width: 22%;
            }
            .qlsp-btnThemMoi-container span {
                font-size: 16px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                margin-left: 10px;
                display: block;
                text-align: center;
                width: 78%;
            }
        .table,
        .table-column,
        .table-tr,
        .table-td {
            border: 1px solid #adc9fa;
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }

        .table-column {
            padding: 10px;
            text-align: center;
            vertical-align: middle;
            font-weight: bold;
            background: #ffe4da
        }

        .table-td {
            padding: 10px;
            text-align:center;
        }

        .table-tr:nth-child(even) {
            background: #fff9f9;
        }

        #table-td-tensp a {
            font-weight: bold;
            color: #031a43
        }

            #table-td-tensp a:hover {
                color: #0654a9;
                transition: all 0.1s ease-in;
            }

        .qlsp-btnCapNhat {
            color: #0654a9;
            font-weight: bold;
            font-size: 14px;
        }

            .qlsp-btnCapNhat:hover {
                color: #0094ff;
            }

        .qlsp-btnXoa {
            color: tomato;
            font-weight: bold;
            font-size: 14px;
        }

            .qlsp-btnXoa:hover {
                color: #f62d2d;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qlsp-container">
        <div class="qlsp-header">
            <h3>Products List</h3>
            <div class="qlsp-btnThemMoi-container">
                <div class="qlsp-btnThemMoi">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/ADAddNewProduct.aspx?idGender=1">
                    <i class="fas fa-plus"></i>
                    <span>WOMAN</span>
                    </asp:HyperLink>
                </div>
                <div class="qlsp-btnThemMoi">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/ADAddNewProduct.aspx?idGender=2">
                    <i class="fas fa-plus"></i>
                    <span>MAN</span>
                    </asp:HyperLink>
                </div>
                <div class="qlsp-btnThemMoi">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/ADAddNewProduct.aspx?idGender=3">
                    <i class="fas fa-plus"></i>
                    <span>UNISEX</span>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th class="table-column" style="max-width: 10px; min-width: 10px">ID</th>
                    <th class="table-column" style="max-width: 100px; min-width: 80px">Name</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">Category</th>
                    <th class="table-column" style="max-width: 70px; min-width: 70px">Gender</th>
                    <th class="table-column" style="max-width: 80px; min-width: 80px">Price</th>
                    <th class="table-column" style="max-width: 70px; min-width: 70px">Oversize</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">S</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">M</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">L</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">XL</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">XXL</th>
                    <th class="table-column" style="max-width: 80px; min-width: 80px">Quantity</th>
                    <th class="table-column" style="max-width: 60px; min-width: 50px">Sold</th>
                    <th class="table-column" style="max-width: 80px; min-width: 50px">Status</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">Edit</th>
                    <th class="table-column" style="max-width: 50px; min-width: 50px">Delete</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>
    </div>
</asp:Content>
