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
    public partial class UpdateAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("AddressBook");

            if (!IsPostBack)
            {

                if (Request.QueryString.Get("idAddress") != null)
                {
                    string idAddress = Request.QueryString.Get("idAddress");
                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    //SQL
                    string sqlCountry = "SELECT * FROM COUNTRY";
                    string sqlAddress = "SELECT * FROM ADDRESSES WHERE ID_ADDRESS = " + idAddress;

                    //Fill data vao dropdownlist
                    SqlCommand cmd = new SqlCommand(sqlCountry, dataAccess.getConnection());

                    ddlCountry.DataSource = cmd.ExecuteReader();
                    ddlCountry.DataTextField = "NAME_CAP";
                    ddlCountry.DataValueField = "ID_COUNTRY";
                    ddlCountry.DataBind();
                    ddlCountry.Items.Insert(0, new ListItem("Choose the country", "-1"));

                    //Address information
                    DataTable dtAddress = dataAccess.LayBangDuLieu(sqlAddress);

                    txtFirstName.Text = dtAddress.Rows[0]["FIRST_NAME"].ToString();
                    txtLastName.Text = dtAddress.Rows[0]["LAST_NAME"].ToString();
                    txtAddress.Text = dtAddress.Rows[0]["STREET"].ToString();
                    txtCity.Text = dtAddress.Rows[0]["CITY"].ToString();
                    txtPhoneNumber.Text = dtAddress.Rows[0]["PHONE"].ToString();
                    txtZipCode.Text = dtAddress.Rows[0]["ZIP_CODE"].ToString();
                    ddlCountry.Items.FindByValue(dtAddress.Rows[0]["ID_COUNTRY"].ToString()).Selected = true;

                    dataAccess.DongKetNoiCSDL();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string idAddress = Request.QueryString.Get("idAddress");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("UPDATE_ADDRESS", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID_ADDRESS", idAddress);
            cmd.Parameters.AddWithValue("@FIRST_NAME", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@LAST_NAME", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@STREET", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@CITY", txtCity.Text.Trim());
            cmd.Parameters.AddWithValue("@PHONE", txtPhoneNumber.Text.Trim());
            cmd.Parameters.AddWithValue("@ZIP_CODE", txtZipCode.Text.Trim());
            cmd.Parameters.AddWithValue("@ID_COUNTRY", ddlCountry.SelectedValue);

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("AddressBook.aspx");

        }
    }
}