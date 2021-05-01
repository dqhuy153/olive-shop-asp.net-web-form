<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADDeleteProduct.aspx.cs" Inherits="fashionShop.Admin.ADDeleteProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .xoasp-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 70vh;
            padding: 35px 0;
        }
        .xoasp-header {
            font-size: 22px;
            color: tomato;
            font-weight: bold;
            margin-bottom: 40px;
        }
        .xoasp-content-container {
            display: flex;
            align-items: center;
            justify-content:space-around;
            width: 48%;
        }
        .xoasp-img-container{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items:center;
        }
            .xoasp-content-container img {
                height: 300px;
                object-fit: cover;
            }
        .xoasp-content {
            margin-left: 25px;
        }
            .xoasp-content span {
                font-weight: normal;
            }
        .xoasp-tensp {
            display: block;
            font-size: 20px;
            font-weight: bold;
            color: #0a368b;
            max-width: 300px;
            text-align: center;
            line-height: 1.3;
            margin-top: 25px;
        }
        .xoasp-content p {
            font-weight: bold;
            margin: 5px 0;
            width: 100px;
        }
        .xoasp-content-item {
            display: flex;
            align-items: center;
        }
        #xoasp-goiy {
            font-size: 14px;
            font-weight: normal;
            color: #313131;
            width: 200px;
            line-height: 1.2;
            margin-top: 10px;   
        }
        .xoasp-btn {
            padding: 10px 15px;
            min-width: 85px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            
        }
        .xoasp-btn-xoa {
            background: tomato;
            color: white;
            margin-right: 10px;
        }
        .xoasp-btn-xoa:hover{
            background: #cc330d;
            transition: all 0.2s ease-in;
        }
        .xoasp-btn-huy {
            background: #726f6f;
            color: white;
        }
        .xoasp-btn-huy:hover{
            background: #1a1a1a;
            transition: all 0.2s ease-in;
        }
        .xoasp-btn-dong {
            background: #2768c3;
            color: white;
        }
        .xoasp-btn-dong:hover{
            background: #0c2876;
            transition: all 0.2s ease-in;
        }
        .xoasp-btns {
            margin: 20px 0;     
        }
        .xoasp-btn-goiy{
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="xoasp-container">
        <p class="xoasp-header">Are you sure you want to delete the product?</p>
        <div class="xoasp-content-container">
            <div class="xoasp-img-container">
                <asp:Image ID="imgSP" runat="server" />
                <asp:Label ID="lbTenSP" runat="server" Text="" CssClass="xoasp-tensp"></asp:Label>
            </div>
            <div class="xoasp-content">
                <div>
                <div class="xoasp-content-item">
                    <p>
                        Category:
                    </p>
                    <asp:Label ID="lbLoai" runat="server" Text="" CssClass="xoasp-loai"></asp:Label>

                </div>
                    <div class="xoasp-content-item">
                    <p>
                        Gender:
                    </p>
                    <asp:Label ID="lbGender" runat="server" Text="" CssClass="xoasp-gender"></asp:Label>

                </div>
                <div class="xoasp-content-item">
                    <p>
                        Quantity:
                    </p>
                    <asp:Label ID="lbSL" runat="server" Text="" CssClass="xoasp-sl"></asp:Label>

                </div>
                <div class="xoasp-content-item">

                    <p>
                        Price:
                    </p>
                    <asp:Label ID="lbGia" runat="server" Text="" CssClass="xoasp-gia"></asp:Label>
                </div>
                <div class="xoasp-content-item">

                    <p>
                        Sold:
                    </p>
                    <asp:Label ID="lbSLDaBan" runat="server" Text="" CssClass="xoasp-sldb"></asp:Label>
                </div>
                    </div>
                <div class="xoasp-btns">
                    <asp:Button ID="btnXoa" runat="server" Text="Delete" OnClick="btnXoa_Click" class="xoasp-btn xoasp-btn-xoa"/>
                    <asp:Button ID="btnHuy" runat="server" Text="Cancel" OnClick="btnHuy_Click" class="xoasp-btn xoasp-btn-huy"/>

                </div>
                <div class="xoasp-btn-goiy">
                    <asp:Button ID="btnDongTT" runat="server" Text="Close product" OnClick="btnDongTT_Click" class="xoasp-btn xoasp-btn-dong"/>
                    <p id="xoasp-goiy">Note: You can close the status to retain product data, but don't show the product on the sales page</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
