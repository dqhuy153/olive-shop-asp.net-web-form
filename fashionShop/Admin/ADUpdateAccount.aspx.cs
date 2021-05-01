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
    public partial class ADUpdateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["usernameAD"] == null)
            {
                Response.Redirect("~/Admin/ADLogin.aspx");
            }

            if (!IsPostBack)
            {
                //Lay id kh tu duoi website
                string idAcc = Request.QueryString.Get("idAcc");


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

                data.DongKetNoiCSDL();

            }
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            string idAcc = Request.QueryString.Get("idAcc");

            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();

            string strTen = txtTen.Text;
            string stremail = txtEmail.Text;
            string strsdt = txtSDT.Text;
            string strdiachi = txtDiaChi.Text;
            string strPassCu = txtMatKhauCu.Text;
            string strPassMoi = txtMatKhauMoi.Text;
            string strNhapLai = txtNhapLai.Text;

            string sql = "SELECT * FROM ACCOUNT WHERE ID_ACCOUNT =" + idAcc;
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string loaiTK = dt.Rows[0]["ID_ACCOUNT_TYPE"].ToString();

            //Khởi tạo 1 đối tượng command để thực thi lệnh Insert
            SqlCommand cmd;

            if (strPassCu == "" || strPassCu == null)
            {
                cmd = new SqlCommand();
                cmd.CommandText = "UPDATE ACCOUNT " +
                    "SET FULLNAME=N'" + strTen + "'," +
                    "EMAIL= N'" + stremail + "'," +
                    "ADDRESS = N'" + txtDiaChi.Text + "'," +
                    "PHONE = '" + txtSDT.Text + "' " +
                    "WHERE ID_ACCOUNT =" + idAcc;

                cmd.Connection = dataAccess.getConnection();//Gán connection cho command

                cmd.ExecuteNonQuery();
                lbThongBao.Text = "Successfully updated";

                dataAccess.DongKetNoiCSDL();
                if (int.Parse(loaiTK) == 1)
                {
                    Response.Redirect("ADMNAdminAccount.aspx");
                }
                if (int.Parse(loaiTK) == 2)
                {
                    Response.Redirect("ADMNCustomerAccount.aspx");
                }

            }
            else if (strPassCu != "" && strPassMoi == "")
            {
                lbThongBao.Text = "New password is required";
            }
            else
            {
                cmd = new SqlCommand("UPDATE_ACCOUNT_CHANGE_PASSWORD", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@OLD_PASSWORD", strPassCu);
                cmd.Parameters.AddWithValue("@FULLNAME", strTen);
                cmd.Parameters.AddWithValue("@EMAIL", stremail);
                cmd.Parameters.AddWithValue("@ADDRESS", strdiachi);
                cmd.Parameters.AddWithValue("@PHONE", strsdt);
                cmd.Parameters.AddWithValue("@NEW_PASSWORD", strPassMoi);
                cmd.Parameters.AddWithValue("@ID_ACCOUNT", idAcc);

                cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    lbThongBao.Text = "Successfully updated";

                    dataAccess.DongKetNoiCSDL();
                    if (int.Parse(loaiTK) == 1)
                    {
                        Response.Redirect("ADMNAdminAccount.aspx");
                    }
                    if (int.Parse(loaiTK) == 2)
                    {
                        Response.Redirect("ADMNCustomerAccount.aspx");
                    }
                }
                else
                {
                    lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                }

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