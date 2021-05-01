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
    public partial class ADLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["usernameAD"] != null && Request.Cookies["passwordAD"] != null)
                {
                    txtTenDangNhap.Text = Request.Cookies["usernameAD"].Value;
                    txtMatKhau.Attributes["value"] = Request.Cookies["passwordAD"].Value;

                    cbGhiNho.Checked = true;
                }
            }
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //thuc thi proc nho sqlcommand cmd
            SqlCommand cmd = new SqlCommand("CHECK_LOGIN_ADMIN", dataAccess.getConnection());
            cmd.Parameters.AddWithValue("@USERNAME", txtTenDangNhap.Text);
            cmd.Parameters.AddWithValue("@PASSWORD", txtMatKhau.Text);
            cmd.CommandType = CommandType.StoredProcedure;

            //show data lay duoc trong datatable
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            //lay ket qua trong dt de doi chieu
            if (dt.Rows.Count > 0)
            {
                //Ghi nho dang nhap
                if (cbGhiNho.Checked)
                {
                    //Dung cookies
                    Response.Cookies["usernameAD"].Value = txtTenDangNhap.Text;
                    Response.Cookies["passwordAD"].Value = txtMatKhau.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["usernameAD"].Expires = DateTime.Now.AddMinutes(60);
                    Response.Cookies["passwordAD"].Expires = DateTime.Now.AddMinutes(60);

                }
                else
                {
                    Response.Cookies["usernameAD"].Expires = DateTime.Now;
                    Response.Cookies["passwordAD"].Expires = DateTime.Now;
                }

                Session["usernameAD"] = txtTenDangNhap.Text;
                Response.Redirect("ADHome.aspx");
                Session.RemoveAll();
            }
            else
            {
                lbThongBao.Text = "The username or password is incorrect";
            }

        }
        protected void btnDangKi_Click(object sender, EventArgs e)
        {

        }

    }
}