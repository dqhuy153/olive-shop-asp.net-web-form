using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADAddressDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            CheckAuth.CheckAdmin();
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
            string idAccount = Request.QueryString.Get("idAcc");
            string sql = "SELECT ID_ADDRESS, FIRST_NAME, LAST_NAME, STREET, CITY, PHONE, ZIP_CODE, NAME_CAP FROM ADDRESSES AD, COUNTRY C WHERE AD.ID_COUNTRY = C.ID_COUNTRY AND ID_ACCOUNT = " + idAccount;

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            DataTable dt = dataAccess.LayBangDuLieu(sql);
            rptAddress.DataSource = dt;
            rptAddress.DataBind();

            if (rptAddress.Items.Count == 1)
            {
                RepeaterItem ritem = rptAddress.Items[0];

                Button btnDelete = ritem.FindControl("btnDelete") as Button;
                btnDelete.Enabled = false;
                btnDelete.CssClass = "address__item--btn-first";
            }
            
            dataAccess.DongKetNoiCSDL();
        }
    }
}