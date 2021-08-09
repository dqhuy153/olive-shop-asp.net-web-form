using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADMNAdminAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT ID_ACCOUNT, USERNAME, PASSWORD, FIRST_NAME + ' ' + LAST_NAME AS FULLNAME, EMAIL, AD_ADDRESS, PHONE, CASE STATUS WHEN 1 THEN N'Open' ELSE N'Close' END AS STATUS FROM ACCOUNT WHERE ID_ACCOUNT_TYPE = 1";
            cmd.Connection = dataAccess.getConnection();
            SqlDataReader dr = cmd.ExecuteReader();

            StringBuilder table = new StringBuilder();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    table.Append("<tr class=\"table-tr\">");

                    table.Append("<td class=\"table-td \">" + dr["ID_ACCOUNT"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["USERNAME"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["PASSWORD"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["FULLNAME"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["EMAIL"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["PHONE"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["AD_ADDRESS"] + "</td>");
                    table.Append("<td class=\"table-td \">" + dr["STATUS"] + "</td>");
                    table.Append("<td class=\"table-td\"><a href=\"/Admin/ADUpdateAccount.aspx?idAcc=" + dr["ID_ACCOUNT"] + "\" class=\"qltk-btnCapNhat\">Edit</a> </td>");
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