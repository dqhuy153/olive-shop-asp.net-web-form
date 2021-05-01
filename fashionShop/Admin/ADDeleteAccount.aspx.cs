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
    public partial class ADDeleteAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["usernameAD"] == null)
            {
                Response.Redirect("~/Admin/ADLogin.aspx");
            }

            string idAcc = Request.QueryString.Get("idAcc");
            if (!IsPostBack)
            {

                DataAccess data = new DataAccess();
                data.MoKetNoiCSDL();

                string sql = "SELECT * FROM ACCOUNT A, ACCOUNT_TYPE AT WHERE A.ID_ACCOUNT_TYPE = AT.ID_ACCOUNT_TYPE AND ID_ACCOUNT = " + idAcc;

                DataTable dt = data.LayBangDuLieu(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    lbTenDangNhap.Text = dt.Rows[0]["USERNAME"].ToString();
                    lbLoaiTK.Text = dt.Rows[0]["ACCOUNT_TYPE"].ToString();
                    txtTen.Text = dt.Rows[0]["FULLNAME"].ToString();
                    txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                    txtDiaChi.Text = dt.Rows[0]["ADDRESS"].ToString();
                    txtSDT.Text = dt.Rows[0]["PHONE"].ToString();
                }
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idAcc = Request.QueryString.Get("idAcc");

            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            string sql = "SELECT * FROM ACCOUNT WHERE ID_ACCOUNT =" + idAcc;
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string loaiTK = dt.Rows[0]["ID_ACCOUNT_TYPE"].ToString();

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DELETE ACCOUNT " +
                "WHERE ID_ACCOUNT =" + idAcc;
            cmd.Connection = dataAccess.getConnection();//Gán connection cho command

            cmd.ExecuteNonQuery();
            lbThongBao.Text = "Successfully deleted";

            dataAccess.DongKetNoiCSDL();
            //Cap nhat xong ve trang ql tk
            if (int.Parse(loaiTK) == 1)
            {
                Response.Redirect("ADMNAdminAccount.aspx");
            }
            if (int.Parse(loaiTK) == 2)
            {
                Response.Redirect("ADMNCustomerAccount.aspx");
            }
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            string idAcc = Request.QueryString.Get("idAcc");
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            string sql = "SELECT * FROM ACCOUNT WHERE ID_ACCOUNT =" + idAcc;
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string loaiTK = dt.Rows[0]["ID_ACCOUNT_TYPE"].ToString();
            if (int.Parse(loaiTK) == 1)
            {
                Response.Redirect("ADMNAdminAccount.aspx");
            }
            if (int.Parse(loaiTK) == 2)
            {
                Response.Redirect("ADMNCustomerAccount.aspx");
            }
            dataAccess.DongKetNoiCSDL();
        }
    }
}