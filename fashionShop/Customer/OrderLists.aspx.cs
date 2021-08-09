using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Customer
{
    public partial class OrderLists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("OrderLists.aspx");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string sql = "SELECT *, DBO.SUM_ORDER_QUANTITY(ID_ORDER) AS QUANTITY, DBO.TOTAL_ORDER(ID_ORDER) AS TOTAL, DBO.STATUS_ORDER_TEXT(ORDER_STATUS) AS STATUS_TEXT " +
                "FROM ORDERS OD, ACCOUNT AC, COUNTRY C " +
                "WHERE OD.ID_ACCOUNT = AC.ID_ACCOUNT " +
                    "AND OD.ID_COUNTRY = C.ID_COUNTRY " +
                    "AND USERNAME='" + Session["username"].ToString() + "' ORDER BY ID_ORDER DESC";
            DataTable dtOrder = dataAccess.LayBangDuLieu(sql);

            if(dtOrder != null && dtOrder.Rows.Count > 0)
            {
                orderListContent.Visible = true;
                emptyOrderWarning.Visible = false;

                StringBuilder tableBody = new StringBuilder();

                foreach (DataRow dr in dtOrder.Rows)
                {
                    int status = int.Parse(dr["ORDER_STATUS"].ToString());

                    tableBody.Append("<tr class=\"table-tr\">");

                    tableBody.Append("<td class=\"table-td \">" + dr["ID_ORDER"] + "</td>");
                    tableBody.Append("<td class=\"table-td  table-th-date\">" + dr["ORDER_DATE"] + "</td>");
                    tableBody.Append("<td class=\"table-td \">" + dr["QUANTITY"] + "</td>");
                    tableBody.Append($"<td class=\"table-td shipping-address-item\">" +
                        $"<p>{dr["ORDER_FULL_NAME"]}</p>" +
                        $"<p>{dr["ORDER_PHONE"]}</p>" +
                        $"<p>{dr["ORDER_STREET"]}</p>" +
                        $"<p>{dr["ORDER_CITY"]}, {dr["ORDER_ZIP_CODE"]} / {dr["NAME_CAP"]}</p>" +
                        $"</td>");
                    tableBody.Append("<td class=\"table-td \">$" + String.Format("{0:N2}", Decimal.Parse(dr["TOTAL"].ToString())) + "</td>");
                    tableBody.Append("<td class=\"table-td \">" + dr["STATUS_TEXT"] + "</td>");
                    tableBody.Append("<td class=\"table-td \"><a href=\"OrderDetail.aspx?idOrder=" + dr["ID_ORDER"] + "\" id=\"btnDetail\">Detail</a> </td>");
                    if (status == 0)
                    {
                        tableBody.Append("<td class=\"table-td \"><i class=\"fas fa-times-circle x-icon\"></i></td>");
                    }
                    else if (status == 1)
                    {
                        tableBody.Append("<td class=\"table-td \"><a href=\"OrderDetail.aspx?idOrder=" + dr["ID_ORDER"] + "\" id=\"btnCancel\">Cancel Order</a> </td>");
                    }
                    else if(status == 2)
                    {
                        tableBody.Append("<td class=\"table-td \"><a href=\"#\"><i class=\"fas fa-truck deli-icon\"></i><br/> Tracking delivery</a></td>");
                    }
                    else if (status == 10)
                    {
                        //tableBody.Append("<td class=\"table-td \"><a href=\"DonHangThanhCong.aspx?idDH=" + dr["ID_DONHANG"] + "\"><i class=\"fas fa-check-circle v-icon\"></i><br/> Đánh giá</a></td>");
                        tableBody.Append("<td class=\"table-td \"><a href=\"#\"><i class=\"fas fa-check-circle v-icon\"></i><br/> Rate & Comment</a></td>");
                    }
                    tableBody.Append("</tr>");
                }

                pannelOrders.Controls.Add(new Label { Text = tableBody.ToString() });

                dataAccess.DongKetNoiCSDL();
            }
        
            else
            {
                emptyOrderWarning.Visible = true;
                orderListContent.Visible = false;    
            }
        }
    }
}