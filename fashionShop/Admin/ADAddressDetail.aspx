<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ADAddressDetail.aspx.cs" Inherits="fashionShop.Admin.ADAddressDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .address__items {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
        }

        .address__item {
            width: 31%;
            min-width: 20rem;
            background: #f1f1f1;
            padding: 2.5rem;
            margin-right: 2rem;
            margin-bottom: 2rem;
        }

        .address__item--header {
            font-weight: bold;
            margin: 0.5rem 0 2.5rem;
        }

        .address__item--content {
            margin: 1rem 0;
        }

        .address__item--phone {
            margin: 2rem 0 4rem;
        }

            .address__item--phone span {
                color: #999;
                font-size: 1.3rem;
                margin-right: 0.2rem;
            }

        .address__item--btn {
            background: #1d1919;
            padding: 1.1rem 2.2rem;
            border: none;
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.2rem;
            color: white;           
            font-size: 1.1rem;
            cursor: pointer;
            border-radius: 0.4rem;
            margin-right: 0.7rem;
            font-family: "Ubuntu", sans-serif;
            font-weight: 400;
        }

            .address__item--btn:hover {
                border: 1px solid #858282;
                color: #383838;
                background: #FFF;
                transition: all 0.2s linear;
                font-weight: 400;
            }

        .delete {
            background: none;
            color: #383838;
            border: 1px solid #ccc;
            font-weight: 400;
        }
        .address__item--btn-first {
            padding: 1.1rem 2.2rem;
            text-transform: uppercase;
            font-weight: 100;
            letter-spacing: 0.1rem;
            font-size: 1.1rem;
            cursor: pointer;
            border-radius: 0.4rem;
            margin-right: 0.7rem;
            background: none;
            color: #383838;
            border: 1px solid #ccc;
            cursor: not-allowed;
            font-family: "Ubuntu", sans-serif;
            font-weight: 400;
        }
        .address__addNew {
            min-height: 25rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

            .address__addNew p {
                margin-top: 1rem;
                font-weight: bold;
            }

            .address__addNew:hover p,
            .address__addNew:hover i {
                color: #aaa;
                transition: all 0.2s linear;
            }
    </style>
    <script type="text/javascript">
        function Confirm() {
            //tao hiden input
            let confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            //hien thi confirm dialog
            if (confirm("Are you sure you want to delete this address?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }

            //gan hiden iput vao trang
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="account__content addresses__content">
            <div class="address__items">
                <asp:Repeater ID="rptAddress" runat="server">
                    <ItemTemplate>
                        <div class="address__item">
                            <p class="address__item--header"><%# Eval("FIRST_NAME") %> <%# Eval("LAST_NAME") %></p>
                            <p class="address__item--content"><%# Eval("STREET") %></p>
                            <p class="address__item--content"><%# Eval("CITY") %> <%# Eval("ZIP_CODE") %></p>
                            <p class="address__item--content"><%# Eval("NAME_CAP") %></p>
                            <p class="address__item--phone">
                                <span>Phone: </span><%# Eval("PHONE") %>
                            </p>
                            <p style="display: none" id="idAddress" runat="server"><%# Eval("ID_ADDRESS") %></p>
                            <div class="address__item--btns">                                
                                <a href="UpdateAddress.aspx?idAddress=<%# Eval("ID_ADDRESS") %>" class="address__item--btn edit">Edit</a>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" class="address__item--btn delete" OnClick="btnDelete_Click" OnClientClick = "Confirm()"/>                     
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <a href="#" class="address__item address__addNew">
                    <i class="fas fa-plus"></i>
                    <p>New Address</p>
                </a>
            </div>
        </div>
</asp:Content>
