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
            CheckAuth.CheckAdmin();

            if (!IsPostBack)
            {
                string idAcc = "";
                if(Request.QueryString["idAcc"] != null){
                    idAcc = Request.QueryString.Get("idAcc");
                }
                else if (Request.QueryString["user"] != null)
                {
                    string usernameAD = Session["usernameAD"].ToString();
                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    string sqlAcc = "SELECT ID_ACCOUNT FROM ACCOUNT WHERE USERNAME = '" + usernameAD + "'";

                    DataTable dtAcc = dataAccess.LayBangDuLieu(sqlAcc);

                    idAcc = dtAcc.Rows[0]["ID_ACCOUNT"].ToString();
                }
                else
                {
                    return;
                }

                DataAccess data = new DataAccess();
                data.MoKetNoiCSDL();

                string sql = "SELECT * FROM ACCOUNT A, ACCOUNT_TYPE AT WHERE A.ID_ACCOUNT_TYPE = AT.ID_ACCOUNT_TYPE AND ID_ACCOUNT = " + idAcc;

                DataTable dt = data.LayBangDuLieu(sql);

                int idAccountType = int.Parse(dt.Rows[0]["ID_ACCOUNT_TYPE"].ToString());
                if(idAccountType == 2)
                {
                    rowDiaChi.Style.Add("display", "none");
                    RequiredFieldValidatorDiaChi.Enabled = false;
                }

                if (dt != null && dt.Rows.Count > 0)
                {
                    lbTenDangNhap.Text = dt.Rows[0]["USERNAME"].ToString();
                    lbLoaiTK.Text = dt.Rows[0]["ACCOUNT_TYPE"].ToString();
                    txtFirstName.Text = dt.Rows[0]["FIRST_NAME"].ToString();
                    txtLastName.Text = dt.Rows[0]["LAST_NAME"].ToString();
                    txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                    txtDiaChi.Text = dt.Rows[0]["AD_ADDRESS"].ToString();
                    txtSDT.Text = dt.Rows[0]["PHONE"].ToString();

                    rblStatus.Items.FindByValue(dt.Rows[0]["STATUS"].ToString()).Selected = true;
                }

                data.DongKetNoiCSDL();
            }
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            string idAcc = Request.QueryString.Get("idAcc");

            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();

            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtSDT.Text;
            string address = txtDiaChi.Text;
            string oldPassword = txtMatKhauCu.Text;
            string newPassword = txtMatKhauMoi.Text;

            string sql = "SELECT * FROM ACCOUNT WHERE ID_ACCOUNT =" + idAcc;
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            dataAccess.DongKetNoiCSDL();

            string loaiTK = dt.Rows[0]["ID_ACCOUNT_TYPE"].ToString();

            SqlCommand cmd;

            if (String.IsNullOrEmpty(oldPassword) && String.IsNullOrEmpty(newPassword))
            {
                dataAccess.MoKetNoiCSDL();

                cmd = new SqlCommand();
                cmd.CommandText = "UPDATE ACCOUNT " +
                    "SET FIRST_NAME= @FIRST_NAME, " +
                    "LAST_NAME= @LAST_NAME, " +
                    "EMAIL= @EMAIL," +
                    "AD_ADDRESS = @ADDRESS," +
                    "PHONE = @PHONE, " +
                    "STATUS = @STATUS " +
                    "WHERE ID_ACCOUNT =" + idAcc;
                cmd.Connection = dataAccess.getConnection();

                cmd.Parameters.AddWithValue("@FIRST_NAME", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LAST_NAME", txtLastName.Text);
                cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmd.Parameters.AddWithValue("@ADDRESS", txtDiaChi.Text);
                cmd.Parameters.AddWithValue("@PHONE", txtSDT.Text);
                cmd.Parameters.AddWithValue("@STATUS", rblStatus.SelectedValue);

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
            else if (oldPassword != "" && newPassword == "")
            {
                if (oldPassword.Length < 3)
                {
                    lbThongBao.Text = "Current password is invalid";
                    Response.Write("<script>alert(\"Current password is invalid\")</script>");
                }
                else
                {
                    lbThongBao.Text = "New password is required";
                    Response.Write("<script>alert(\"New password is required\")</script>");
                }
            }
            else if (oldPassword == "" && newPassword != "")
            {
                if (newPassword.Length < 3)
                {
                    lbThongBao.Text = "New password is invalid";
                    Response.Write("<script>alert(\"New password is invalid\")</script>");
                }
                else
                {
                    lbThongBao.Text = "Current password is required";
                    Response.Write("<script>alert(\"Current password is required\")</script>");
                }
            }
            else if (oldPassword.Length < 3)
            {
                lbThongBao.Text = "Current password is invalid";
                Response.Write("<script>alert(\"Current password is invalid\")</script>");
            }
            else
            {
                if (newPassword.Length < 3)
                {
                    lbThongBao.Text = "Minimum password length is 3";
                    Response.Write("<script>alert(\"Minimum password length is 3\")</script>");
                }
                else
                {
                    dataAccess.MoKetNoiCSDL();

                    cmd = new SqlCommand("UPDATE_ACCOUNT_CHANGE_PASSWORD", dataAccess.getConnection());
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@OLD_PASSWORD", oldPassword);
                    cmd.Parameters.AddWithValue("@FIRST_NAME", firstName);
                    cmd.Parameters.AddWithValue("@LAST_NAME", lastName);
                    cmd.Parameters.AddWithValue("@EMAIL", email);
                    cmd.Parameters.AddWithValue("@PHONE", phoneNumber);
                    cmd.Parameters.AddWithValue("@NEW_PASSWORD", newPassword);
                    cmd.Parameters.AddWithValue("@AD_ADDRESS", address);
                    cmd.Parameters.AddWithValue("@STATUS", rblStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@ID_ACCOUNT", idAcc);

                    cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                    cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

                    int a = cmd.ExecuteNonQuery();
                    
                    dataAccess.DongKetNoiCSDL();


                    if (a > 0)
                    {
                        lbThongBao.Text = "Successfully updated";
                      
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
                        Response.Write("<script>alert(\"" + cmd.Parameters["@ERROR"].Value.ToString() + "\")</script>");
                    }

                    if (a > 0)
                    {

                    }
                    else
                    {
                        lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                    }

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