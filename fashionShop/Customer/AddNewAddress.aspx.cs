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
    public partial class AddAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("AddressBook");

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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string idAccount = Request.QueryString.Get("idAcc");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("INSERT_ADDRESS", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID_ACCOUNT", idAccount);
            cmd.Parameters.AddWithValue("@FIRST_NAME", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LAST_NAME", txtLastName.Text);
            cmd.Parameters.AddWithValue("@STREET", txtAddress.Text);
            cmd.Parameters.AddWithValue("@CITY", txtCity.Text);
            cmd.Parameters.AddWithValue("@PHONE", txtPhoneNumber.Text);
            cmd.Parameters.AddWithValue("@ZIP_CODE", txtZipCode.Text);
            cmd.Parameters.AddWithValue("@ID_COUNTRY", ddlCountry.SelectedValue);

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("AddressBook.aspx");
        }
    }
}