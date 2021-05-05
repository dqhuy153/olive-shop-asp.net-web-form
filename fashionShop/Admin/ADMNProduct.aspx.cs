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
    public partial class ADQLProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();

            //Tao connection
            DataAccess dataAccess = new DataAccess();

            //Mo connection
            dataAccess.MoKetNoiCSDL();

            //Lay du lieu tu dtb luu vao dataTable
            string sql = "SELECT ID_PRODUCT, PRODUCT_NAME, CATEGORY_NAME, GENDER_NAME, OVERSIZE, S, M, L, XL, XXL, DBO.SUM_SIZE_QUANTITY(ID_PRODUCT) AS QUANTITY, INFORMATION, IMAGES, PRICE, SOLD_QUANTITY, CASE PRODUCT_STATUS WHEN 1 THEN N'Open' ELSE N'Close' END AS STATUS FROM PRODUCT P, CATEGORY C, GENDER G WHERE C.ID_GENDER = G.ID_GENDER AND P.ID_CATEGORY = C.ID_CATEGORY";

            DataTable dtSP = dataAccess.LayBangDuLieu(sql);

            //Tao html dong duoi dang string de tao bang show du lieu
            if (dtSP != null && dtSP.Rows.Count > 0)
            {

                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dtSP.Rows)
                {
                    sb.Append("<tr class=\"table-tr\">");

                    sb.Append("<td class=\"table-td\">" + dr["ID_PRODUCT"] + "</td>");
                    sb.Append("<td class=\"table-td\"><a href=\"/Customer/CTMProductDetail.aspx?idSP=" + dr["ID_PRODUCT"] + "\">" + dr["PRODUCT_NAME"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["CATEGORY_NAME"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["GENDER_NAME"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["PRICE"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["OVERSIZE"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["S"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["M"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["L"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["XL"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["XXL"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["QUANTITY"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["SOLD_QUANTITY"] + "</td>");
                    sb.Append("<td class=\"table-td\">" + dr["STATUS"] + "</td>");
                    sb.Append("<td class=\"table-td\"><a href=\"/Admin/ADUpdateProduct.aspx?idProduct=" + dr["ID_PRODUCT"] + "\" class=\"qlsp-btnCapNhat\">Edit</a> </td>");
                    sb.Append("<td class=\"table-td\"><a href=\"/Admin/ADDeleteProduct.aspx?idProduct=" + dr["ID_PRODUCT"] + "\" class=\"qlsp-btnXoa\">Delete</a> </td>");

                    sb.Append("</tr>");
                }

                //Ket noi string html vao trang asp
                Panel1.Controls.Add(new Label { Text = sb.ToString() });

                dataAccess.DongKetNoiCSDL();
            }
        }
    }
}