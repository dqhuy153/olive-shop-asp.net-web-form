﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADMNAccountCustomer : System.Web.UI.Page
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

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT ID_ACCOUNT, USERNAME, PASSWORD, FULLNAME, EMAIL, ADDRESS, PHONE, CASE STATUS WHEN 1 THEN N'Open' ELSE N'Close' END AS STATUS FROM ACCOUNT WHERE ID_ACCOUNT_TYPE = 2";
            cmd.Connection = dataAccess.getConnection();
            SqlDataReader dr = cmd.ExecuteReader();

            StringBuilder table = new StringBuilder();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    table.Append("<tr class=\"table-tr\">");

                    table.Append("<td class=\"table-td table-item\">" + dr["ID_ACCOUNT"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["USERNAME"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["PASSWORD"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["FULLNAME"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["EMAIL"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["ADDRESS"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["PHONE"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["STATUS"] + "</td>");
                    table.Append("<td class=\"table-td\" style=\"border: 1px solid #adc9fa\"><a href=\"/Admin/ADUpdateAccount.aspx?idAcc=" + dr["ID_ACCOUNT"] + "\" class=\"qltk-btnCapNhat\">Edit</a> </td>");
                    table.Append("<td class=\"table-td\"><a href=\"/Admin/ADDeleteAccount.aspx?idAcc=" + dr["ID_ACCOUNT"] + "\" class=\"qltk-btnXoa\">Delete</a> </td>");

                    table.Append("</tr>");
                }

            }
            table.Append("</table>");
            PlaceHolder2.Controls.Add(new Literal { Text = table.ToString() });
            dr.Close();
        }
    
    }
}