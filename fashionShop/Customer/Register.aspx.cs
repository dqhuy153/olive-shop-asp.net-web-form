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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                //Fill data vao dropdownlist
                string sqlCountry = "SELECT * FROM COUNTRY";
                SqlCommand cmd = new SqlCommand(sqlCountry, dataAccess.getConnection());

                DataTable dt = dataAccess.LayBangDuLieu(sqlCountry);

                ddlCountry.DataSource = cmd.ExecuteReader();
                ddlCountry.DataTextField = "NAME_CAP";
                ddlCountry.DataValueField = "ID_COUNTRY";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("Choose the country", "-1"));

                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("INSERT_CUSTOMER", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            int b = int.Parse(ddlCountry.SelectedValue);

            cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
            cmd.Parameters.AddWithValue("@PASSWORD", txtPassword.Text);
            cmd.Parameters.AddWithValue("@FIRST_NAME", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LAST_NAME", txtLastName.Text);
            cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
            cmd.Parameters.AddWithValue("@PHONE", txtPhoneNumber.Text);
            cmd.Parameters.AddWithValue("@STREET", txtAddress.Text);
            cmd.Parameters.AddWithValue("@CITY", txtCity.Text);
            cmd.Parameters.AddWithValue("@ZIP_CODE", txtZipCode.Text);
            cmd.Parameters.AddWithValue("@ID_COUNTRY", int.Parse(ddlCountry.SelectedValue));
            cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            int a = cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();
            //co the thu int a = cmd.ExecuteNonQuery(); de check so row effected
            if (a > 0)
            {
                lbNotify.Text = cmd.Parameters["@ERROR"].Value.ToString();

                if (cbRemember.Checked)
                {
                    Response.Cookies["username"].Value = txtUsername.Text;
                    Response.Cookies["password"].Value = txtPassword.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["username"].Expires = DateTime.Now.AddMinutes(15);
                    Response.Cookies["password"].Expires = DateTime.Now.AddMinutes(15);

                }
                else
                {
                    Response.Cookies["username"].Expires = DateTime.Now;
                    Response.Cookies["password"].Expires = DateTime.Now;
                }

                Session["username"] = txtUsername.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbNotify.Text = cmd.Parameters["@ERROR"].Value.ToString();
            }
        }
    }
}