using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                //man clothes categories
                string sqlMenClothes = "SELECT * FROM CATEGORY WHERE ID_MAIN_CATEGORY = 1 AND ID_GENDER = 2 AND CATEGORY_STATUS = 1";
                DataTable dtMenClothes = dataAccess.LayBangDuLieu(sqlMenClothes);

                rptMenClothes.DataSource = dtMenClothes;
                rptMenClothes.DataBind();

                //women accessories 
                string sqlWomenAccessories = "SELECT * FROM CATEGORY WHERE ID_MAIN_CATEGORY = 2 AND ID_GENDER = 1 AND CATEGORY_STATUS = 1";
                DataTable dtWomenAccessories = dataAccess.LayBangDuLieu(sqlWomenAccessories);

                rptWomenAccessories.DataSource = dtWomenAccessories;
                rptWomenAccessories.DataBind();

                //women jewelleries 
                string sqlWomenJewellery = "SELECT * FROM CATEGORY WHERE ID_MAIN_CATEGORY = 3 AND ID_GENDER = 1 AND CATEGORY_STATUS = 1";
                DataTable dtWomenJewellery = dataAccess.LayBangDuLieu(sqlWomenJewellery);

                rptWomenJewellery.DataSource = dtWomenJewellery;
                rptWomenJewellery.DataBind();

                //cart quantity
                //for user not login
                if(Session["username"] == null)
                {
                    if (Session["cart"] != null)
                    {
                        DataTable cart = Session["cart"] as DataTable;
                        lbCartQuantity.Text = $"({cart.Rows.Count})";
                    }
                }
                //for user logged in
                else
                {
                    string sqlCart = "SELECT COUNT(*) AS NUMBER_IN_CART FROM CART_DETAIL CD, ACCOUNT A WHERE CD.ID_ACCOUNT = A.ID_ACCOUNT AND USERNAME = N'" + Session["username"].ToString() + "'";
                    DataTable dtCart = dataAccess.LayBangDuLieu(sqlCart);

                    lbCartQuantity.Text = $"({dtCart.Rows[0]["NUMBER_IN_CART"]})";
                }
                dataAccess.DongKetNoiCSDL();
            //}
        }

        protected void btnSearch_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx?search=" + txtSearch.Text.Trim());
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetNoStore();
            Response.CacheControl = "no-cache";
            Response.Redirect("Home.aspx");
        }

        protected void btnSubcribe_Click(object sender, EventArgs e)
        {
            Response.Write("<script>");
            Response.Write("window.open('http://www.gmail.com','_blank')");
            Response.Write("</script>");
        }
    }
}