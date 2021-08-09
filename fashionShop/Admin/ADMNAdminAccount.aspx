<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADMNAdminAccount.aspx.cs" Inherits="fashionShop.Admin.ADMNAdminAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/Admin/table.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/css/Admin/navRoute.css" />

    <style>
        .qltk-container {
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-top: 4rem;
        }

        .qltk-header {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 1rem;
        }

        .qltk-btnThemMoi-container {
            position: absolute;
            right: 40px;
            background: #031a43;
            padding: 11px 13px;
            border-radius: 5px;
            top: 10rem;
        }

            .qltk-btnThemMoi-container:hover {
                background: var(--color-primary);
                transition: all 0.2s ease-in;
            }

            .qltk-btnThemMoi-container a {
                display: flex;
                align-items: center;
            }

            .qltk-btnThemMoi-container i,
            .qltk-btnThemMoi-container span {
                display: block;
                color: white;
            }

            .qltk-btnThemMoi-container i {
                font-size: 12px;
            }

            .qltk-btnThemMoi-container span {
                font-size: 16px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                margin-left: 10px;
            }

        .table {
            width: 80%;
            margin: 0 auto;
        }

        .qltk-btnCapNhat {
            color: #0654a9;
            font-weight: bold;
            font-size: 14px;
            text-align: center;
            display: block;
        }

            .qltk-btnCapNhat:hover {
                color: #0094ff;
            }

        .qltk-btnXoa {
            color: tomato;
            font-weight: bold;
            text-align: center;
            display: block;
            font-size: 14px;
        }

            .qltk-btnXoa:hover {
                color: #f62d2d;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qltk-container">
        <div class="account__map">
            <a href="ADHome.aspx">Home</a>
            <span class="account__map--separate">|</span>

            <span>Admins List</span>
        </div>
        <p class="account__title">Admin Account Management</p>
        <div class="qltk-header">

            <div class="qltk-btnThemMoi-container">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/AdRegister.aspx" Target="_blank">
                    <i class="fas fa-user-plus"></i>
                    <span>Register new Admin</span>
                </asp:HyperLink>
            </div>
        </div>
        <table class="table" border="1">
            <tr class="table-tr">
                <th class="table-th">ID</th>
                <th class="table-th">Username</th>
                <th class="table-th">Password</th>
                <th class="table-th">Fullname</th>
                <th class="table-th">Email</th>
                <th class="table-th">Phone number</th>
                <th class="table-th">Address</th>
                <th class="table-th">Status</th>
                <th class="table-th">Edit</th>
                <th class="table-th">Delete</th>
            </tr>
            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
        </table>
    </div>
</asp:Content>
