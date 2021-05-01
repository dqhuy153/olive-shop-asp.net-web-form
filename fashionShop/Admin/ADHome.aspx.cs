﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["usernameAD"] == null)
            {
                Response.Redirect("~/Admin/ADLogin.aspx");
            }


            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //thong ke
            string sql = "SELECT SUM(SOLD_QUANTITY * PRICE) AS TOTAL_REVENUE, SUM(SOLD_QUANTITY) AS TOTAL_SOLD, SUM(DBO.SUM_SIZE_QUANTITY(ID_PRODUCT)) AS TOTAL_IN_STOCK FROM PRODUCT";

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            if (dt.Rows.Count > 0 && dt != null)
            {
                lbTongDoanhThu.Text = String.Format("{0:n0}", dt.Rows[0]["TOTAL_REVENUE"]);
                lbSPDaBan.Text = String.Format("{0:n0}", dt.Rows[0]["TOTAL_SOLD"]);
                lbSPTon.Text = String.Format("{0:n0}", dt.Rows[0]["TOTAL_IN_STOCK"]);
            }

            //don hang cho duyet
            string sqlDHChoDuyet = "SELECT ID_ORDER, ORDER_DATE, DBO.SUM_ORDER_QUANTITY(ID_ORDER) AS SUM_ORDER_QUANTITY, DBO.TOTAL_MONEY_ORDER(ID_ORDER) AS TOTAL_MONEY FROM ORDERS WHERE ORDER_STATUS = 1 ORDER BY ID_ORDER DESC";

            DataTable dtDHChoDuyet = dataAccess.LayBangDuLieu(sqlDHChoDuyet);

            StringBuilder table = new StringBuilder();

            if (dtDHChoDuyet != null && dtDHChoDuyet.Rows.Count > 0)
            {
                foreach (DataRow dr in dtDHChoDuyet.Rows)
                {
                    table.Append("<tr class=\"table-tr\">");

                    table.Append("<td class=\"table-td table-item\">" + dr["ID_ORDER"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["ORDER_DATE"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["SUM_ORDER_QUANTITY"] + "</td>");

                    table.Append("<td class=\"table-td table-item\">" + String.Format("{0:N0}", int.Parse(dr["TOTAL_MONEY"].ToString())) + "</td>");

                    table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/ADOrderDetail.aspx?t=3&idOrder=" + dr["ID_ORDER"] + "\" class=\"qldh-btnXem\">Xem</a> </td>");
                }

                Panel1.Controls.Add(new Label { Text = table.ToString() });

                dataAccess.DongKetNoiCSDL();
            }
        }
    }
}