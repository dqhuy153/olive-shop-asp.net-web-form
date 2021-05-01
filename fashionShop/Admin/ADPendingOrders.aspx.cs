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
            if (Session["usernameAD"] == null)
            {
                Response.Redirect("~/Admin/ADLogin.aspx");
            }
            else
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "SELECT ID_ORDER, ORDER_DATE, DBO.SUM_ORDER_QUANTITY(ID_ORDER) AS SUM_ORDER_QUANTITY, DBO.ORDER_INFO(ID_ORDER) AS ORDER_INFO, DBO.TOTAL_MONEY_ORDER(ID_ORDER) AS TOTAL_MONEY_ORDER, DBO.SHOW_STATUS(ORDER_STATUS) AS SHOW_STATUS, ORDER_STATUS FROM ORDERS WHERE ORDER_STATUS = 1 ORDER BY ID_ORDER DESC";

                DataTable dtDH = dataAccess.LayBangDuLieu(sql);

                StringBuilder table = new StringBuilder();

                if (dtDH != null && dtDH.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtDH.Rows)
                    {
 
                        table.Append("<tr class=\"table-tr\">");

                        table.Append("<td class=\"table-td table-item\">" + dr["ID_ORDER"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["ORDER_DATE"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["SUM_ORDER_QUANTITY"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["ORDER_INFO"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + String.Format("{0:N0}", int.Parse(dr["TOTAL_MONEY_ORDER"].ToString())) + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["SHOW_STATUS"] + "</td>");
                        table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/ADOrderDetail.aspx?p=1&idOrder=" + dr["ID_ORDER"] + "\" class=\"qldh-btnXem\">Detail</a> </td>");

                    }

                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
                dataAccess.DongKetNoiCSDL();
            }
        }
    }
}