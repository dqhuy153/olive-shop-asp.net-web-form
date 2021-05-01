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
    public partial class ADRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("INSERT_AD", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@USERNAME", txtTenDangNhap.Text);
            cmd.Parameters.AddWithValue("@PASSWORD", txtMatKhau.Text);
            cmd.Parameters.AddWithValue("@FULLNAME", txtHoTen.Text);
            cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
            cmd.Parameters.AddWithValue("@ADDRESS", txtDiaChi.Text);
            cmd.Parameters.AddWithValue("@PHONE", txtSDT.Text);
            cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            int a = cmd.ExecuteNonQuery();

            //co the thu int a = cmd.ExecuteNonQuery(); de check so row effected
            if (a > 0)
            {
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();

                if (cbGhiNho.Checked)
                {
                    Response.Cookies["usernameAD"].Value = txtTenDangNhap.Text;
                    Response.Cookies["passwordAD"].Value = txtMatKhau.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["usernameAD"].Expires = DateTime.Now.AddMinutes(15);
                    Response.Cookies["passwordAD"].Expires = DateTime.Now.AddMinutes(15);

                }
                else
                {
                    Response.Cookies["usernameAD"].Expires = DateTime.Now;
                    Response.Cookies["passwordAD"].Expires = DateTime.Now;
                }

                Session["usernameAD"] = txtTenDangNhap.Text;
                Response.Redirect("ADHome.aspx");
            }
            else
            {
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
            }

        }
    }
}