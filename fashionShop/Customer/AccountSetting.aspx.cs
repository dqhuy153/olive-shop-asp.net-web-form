using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Customer
{
    public partial class AccountSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("AccountSetting.aspx");

            if (!IsPostBack)
            {
                DataAccess data = new DataAccess();
                data.MoKetNoiCSDL();
                string username = Session["username"].ToString();
                string sql = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";

                DataTable dt = data.LayBangDuLieu(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    txtFirstName.Text = dt.Rows[0]["FIRST_NAME"].ToString();
                    txtLastName.Text = dt.Rows[0]["LAST_NAME"].ToString();
                    txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                    txtPhoneNumber.Text = dt.Rows[0]["PHONE"].ToString();
                }
                data.DongKetNoiCSDL();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string currentPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;

            string sql = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string idAcc = dt.Rows[0]["ID_ACCOUNT"].ToString();

            SqlCommand cmd;

            if (String.IsNullOrEmpty(currentPassword) && String.IsNullOrEmpty(newPassword))
            {
                cmd = new SqlCommand();
                cmd.CommandText = "UPDATE ACCOUNT " +
                    "SET FIRST_NAME=N'" + firstName + "'," +
                    "LAST_NAME=N'" + lastName + "'," +
                    "EMAIL= N'" + email + "'," +
                    "PHONE = '" + phoneNumber + "' " +
                    "WHERE ID_ACCOUNT =" + idAcc;

                cmd.Connection = dataAccess.getConnection();

                cmd.ExecuteNonQuery();

                lbNotify.Text = "Successfully updated";
                Response.Write("<script>alert(\"Successfully updated\")</script>");

            }
            else if (currentPassword != "" && newPassword == "")
            {
                if(currentPassword.Length < 6)
                {
                    lbNotify.Text = "Current password is invalid";
                    Response.Write("<script>alert(\"Current password is invalid\")</script>");
                }
                else
                {
                    lbNotify.Text = "New password is required";
                    Response.Write("<script>alert(\"New password is required\")</script>");
                }
            }
            else if (currentPassword == "" && newPassword != "")
            {
                if (newPassword.Length < 6)
                {
                    lbNotify.Text = "New password is invalid";
                    Response.Write("<script>alert(\"New password is invalid\")</script>");
                }
                else
                {
                    lbNotify.Text = "Current password is required";
                    Response.Write("<script>alert(\"Current password is required\")</script>");
                }
            }
            else if (currentPassword.Length < 6)
            {
                lbNotify.Text = "Current password is invalid";
                Response.Write("<script>alert(\"Current password is invalid\")</script>");
            }

            else
            {
                if (newPassword.Length < 6)
                {
                    lbNotify.Text = "Minimum password length is 6";
                    Response.Write("<script>alert(\"Minimum password length is 6\")</script>");
                }
                else
                {
                    cmd = new SqlCommand("UPDATE_ACCOUNT_CHANGE_PASSWORD", dataAccess.getConnection());
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@OLD_PASSWORD", currentPassword);
                    cmd.Parameters.AddWithValue("@FIRST_NAME", firstName);
                    cmd.Parameters.AddWithValue("@LAST_NAME", lastName);
                    cmd.Parameters.AddWithValue("@EMAIL", email);
                    cmd.Parameters.AddWithValue("@PHONE", phoneNumber);
                    cmd.Parameters.AddWithValue("@NEW_PASSWORD", newPassword);
                    cmd.Parameters.AddWithValue("@ID_ACCOUNT", idAcc);

                    cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                    cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                    int a = cmd.ExecuteNonQuery();

                    if (a > 0)
                    {
                        lbNotify.Text = "Successfully updated";
                        Response.Write("<script>alert(\"Successfully updated\")</script>");

                    }
                    else
                    {
                        lbNotify.Text = cmd.Parameters["@ERROR"].Value.ToString();
                        Response.Write("<script>alert(\"" + cmd.Parameters["@ERROR"].Value.ToString() +"\")</script>");
                    }
                }
            }
        }
    }
}