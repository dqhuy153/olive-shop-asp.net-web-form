using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADDeleteProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();

            string idSP = Request.QueryString.Get("idProduct").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT ID_PRODUCT, PRODUCT_NAME, CATEGORY_NAME, GENDER_NAME, DBO.SUM_SIZE_QUANTITY(ID_PRODUCT) AS QUANTITY, IMAGES, PRICE, SOLD_QUANTITY FROM PRODUCT P, CATEGORY C, GENDER G WHERE C.ID_GENDER = G.ID_GENDER AND P.ID_CATEGORY = C.ID_CATEGORY AND ID_PRODUCT ="+idSP;

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            lbTenSP.Text = dt.Rows[0]["PRODUCT_NAME"].ToString();
            lbGender.Text = dt.Rows[0]["GENDER_NAME"].ToString();
            lbLoai.Text = dt.Rows[0]["CATEGORY_NAME"].ToString();
            lbSL.Text = dt.Rows[0]["QUANTITY"].ToString();
            lbGia.Text = "$" + String.Format("{0:N0}", dt.Rows[0]["PRICE"]);
            lbSLDaBan.Text = dt.Rows[0]["SOLD_QUANTITY"].ToString();

            string[] arrImages = dt.Rows[0]["IMAGES"].ToString().Split('|');

            imgSP.ImageUrl = "~/Uploads/" + arrImages[0].ToString();

            dataAccess.DongKetNoiCSDL();

        }

        protected void btnDongTT_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idProduct").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "UPDATE PRODUCT SET PRODUCT_STATUS = 0 WHERE ID_PRODUCT = " + idSP;

            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("ADMNProduct.aspx");

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idProduct").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "DELETE FROM PRODUCT WHERE ID_PRODUCT = " + idSP;

            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("ADMNProduct.aspx");

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADMNProduct.aspx");
        }
    }
}