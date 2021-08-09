<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADMNProduct.aspx.cs" Inherits="fashionShop.Customer.ADQLProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/Admin/table.css" rel="stylesheet">
    <link href="../Assets/css/Admin/ADMNProduct.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qlsp-container">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>

            <span class="account__map--separate">|</span>
            <span>Products list</span>
        </div>
        <div class="qlsp-header">
            <p class="account__title">Products list </p>
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
                    <span>BOTH</span>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th class="table-th" style="max-width: 10px; min-width: 10px">ID</th>
                    <th class="table-th" style="max-width: 100px; min-width: 80px">Name</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">Category</th>
                    <th class="table-th" style="max-width: 70px; min-width: 70px">Gender</th>
                    <th class="table-th" style="max-width: 80px; min-width: 80px">Price</th>
                    <th class="table-th" style="max-width: 70px; min-width: 70px">Oversize</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">S</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">M</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">L</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">XL</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">XXL</th>
                    <th class="table-th" style="max-width: 80px; min-width: 80px">Quantity</th>
                    <th class="table-th" style="max-width: 60px; min-width: 50px">Sold</th>
                    <th class="table-th" style="max-width: 80px; min-width: 50px">Status</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">Edit</th>
                    <th class="table-th" style="max-width: 50px; min-width: 50px">Delete</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>
    </div>
</asp:Content>
