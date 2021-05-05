using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace fashionShop.Customer
{
    public partial class AddressBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("AddressBook");

            if (!IsPostBack)
            {
                ShowAddressList();
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            //Lay button xay ra su kien
            Button btnEdit = (Button)sender;

            //Lay repeaterItem chua button
            RepeaterItem rItem = (RepeaterItem)btnEdit.NamingContainer;

            HtmlGenericControl pIdAddress = rItem.FindControl("idAddress") as HtmlGenericControl;
            string idAddress = pIdAddress.InnerText;

            //get confirm from client by hiden input
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                string sql = "DELETE FROM ADDRESSES WHERE ID_ADDRESS = " + idAddress;

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());
                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();

                ShowAddressList();
            }
            
        }

        protected void ShowAddressList()
        {
            string username = Session["username"].ToString();
            string sql = "SELECT ID_ADDRESS, AD.FIRST_NAME, AD.LAST_NAME, STREET, CITY, AD.PHONE, ZIP_CODE, NAME_CAP, AC.ID_ACCOUNT FROM ADDRESSES AD, ACCOUNT AC, COUNTRY C WHERE AD.ID_COUNTRY = C.ID_COUNTRY AND AD.ID_ACCOUNT = AC.ID_ACCOUNT AND USERNAME = N'" + username + "'";

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            //lay thong tin address
            if (dt.Rows.Count > 0)
            {
                rptAddress.DataSource = dt;
                rptAddress.DataBind();

                if (rptAddress.Items.Count == 1)
                {
                    RepeaterItem ritem = rptAddress.Items[0];

                    Button btnDelete = ritem.FindControl("btnDelete") as Button;
                    btnDelete.Enabled = false;
                    btnDelete.CssClass = "address__item--btn-first";
                }       
                
                hplNewAddress.NavigateUrl = "AddNewAddress.aspx?idAcc=" + dt.Rows[0]["ID_ACCOUNT"].ToString();
            }
            //neu chua co address nao
            else
            {
                string sqlAccount = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
                DataTable dtAccount = dataAccess.LayBangDuLieu(sqlAccount);

                hplNewAddress.NavigateUrl = "AddNewAddress.aspx?idAcc=" + dtAccount.Rows[0]["ID_ACCOUNT"].ToString();
            }

            dataAccess.DongKetNoiCSDL();
        }
    }
}