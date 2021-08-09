using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADPendingOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();

            if (Request.QueryString["status"] != null)
            {

                string idStatus = Request.QueryString["status"].ToString();

                if(int.Parse(idStatus) == 0)
                {
                    lbOrderStatus.Text = "Canceled orders";
                    lbOrderStatusTitle.Text = "Canceled orders";
                }
                else if (int.Parse(idStatus) == 1)
                {
                    lbOrderStatus.Text = "Pending orders";
                    lbOrderStatusTitle.Text = "Pending orders";
                }
                else if (int.Parse(idStatus) == 2)
                {
                    lbOrderStatus.Text = "Delivering orders";
                    lbOrderStatusTitle.Text = "Delivering orders";
                }
                else if (int.Parse(idStatus) == 10)
                {
                    lbOrderStatus.Text = "Sussecced orders";
                    lbOrderStatusTitle.Text = "Sussecced orders";
                }

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sqlPendingOrder = "SELECT *, DBO.SUM_ORDER_QUANTITY(ID_ORDER) AS SUM_ORDER_QUANTITY, DBO.TOTAL_ORDER(ID_ORDER) AS TOTAL, DBO.STATUS_ORDER_TEXT(ORDER_STATUS) AS STATUS " +
                    "FROM ORDERS O, COUNTRY C WHERE O.ID_COUNTRY = C.ID_COUNTRY AND ORDER_STATUS = " + idStatus +" ORDER BY ID_ORDER DESC";

                DataTable dtPendingOrder = dataAccess.LayBangDuLieu(sqlPendingOrder);

                StringBuilder tableBody = new StringBuilder();

                if (dtPendingOrder != null && dtPendingOrder.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtPendingOrder.Rows)
                    {
                        tableBody.Append("<tr class=\"table-tr\">");

                        tableBody.Append("<td class=\"table-td \">" + dr["ID_ORDER"] + "</td>");
                        tableBody.Append("<td class=\"table-td table-td-date\">" + dr["ORDER_DATE"] + "</td>");
                        tableBody.Append("<td class=\"table-td \">" + dr["SUM_ORDER_QUANTITY"] + "</td>");
                        tableBody.Append($"<td class=\"table-td table-td-address\">" +
                            $"<p>{dr["ORDER_FULL_NAME"]}</p>" +
                            $"<p>{dr["ORDER_PHONE"]}</p>" +
                            $"<p>{dr["ORDER_STREET"]}</p>" +
                            $"<p>{dr["ORDER_CITY"]}, {dr["ORDER_ZIP_CODE"]} / {dr["NAME_CAP"]}</p>" +
                            $"</td>");
                        tableBody.Append("<td class=\"table-td \">$" + String.Format("{0:N2}", double.Parse(dr["TOTAL"].ToString())) + "</td>");
                        tableBody.Append("<td class=\"table-td \">" + dr["STATUS"] + "</td>");
                        tableBody.Append("<td class=\"table-td \"><a href=\"/Admin/ADOrderDetail.aspx?p=1&idOrder=" + dr["ID_ORDER"] + "\" class=\"btnDetail\">Detail</a> </td>");

                    }

                }
                Panel1.Controls.Add(new Label { Text = tableBody.ToString() });
                dataAccess.DongKetNoiCSDL();
            }

        }
    }
}