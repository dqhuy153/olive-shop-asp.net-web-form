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
    public partial class WishLists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("WishLists.aspx");
            if (!IsPostBack)
            {
                ShowWishList();

            }   
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //get button sender
            Button btnEdit = (Button)sender;

            //find repeaterItem contains button
            RepeaterItem rItem = (RepeaterItem)btnEdit.NamingContainer;

            HtmlGenericControl pidProduct = rItem.FindControl("idProduct") as HtmlGenericControl;
            string idProduct = pidProduct.InnerText;        

            //get confirm from client by hiden input
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                //get id of customer
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string username = Session["username"].ToString();
                string sqlAccount = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
                DataTable dtAccount = dataAccess.LayBangDuLieu(sqlAccount);
                int idAccount = (int)dtAccount.Rows[0]["ID_ACCOUNT"];

                string sqlDelete = $"DELETE FROM SAVE_DETAIL WHERE ID_PRODUCT = {idProduct} AND ID_ACCOUNT = {idAccount}";

                SqlCommand cmd = new SqlCommand(sqlDelete, dataAccess.getConnection());
                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();

                ShowWishList();
            }
        }

        protected void ShowWishList()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT * FROM SAVE_DETAIL S, ACCOUNT A, PRODUCT P WHERE S.ID_PRODUCT = P.ID_PRODUCT AND S.ID_ACCOUNT = A.ID_ACCOUNT AND USERNAME = N'" + Session["username"] + "'";
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            rptProducts.DataSource = dt;
            rptProducts.DataBind();

            lbQuantityWishList.Text = $"({dt.Rows.Count})";

            dataAccess.DongKetNoiCSDL();
        }
    }
}