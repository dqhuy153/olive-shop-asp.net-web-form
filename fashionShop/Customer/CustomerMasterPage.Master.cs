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
            DataTable cart = CartStorage.getDetailCart();
            lbCartQuantity.Text = $"{cart.Rows.Count}";

            //cart review item
            if(cart.Rows.Count > 0)
            {
                cartReviewEmpty.Visible = false;
                cartReview.Visible = true;

                rptCartPreview.DataSource = cart;
                rptCartPreview.DataBind();
            }
            else
            {
                cartReviewEmpty.Visible = true;
                cartReview.Visible = false;
            }

            //show login logout btn
            if (Session["username"] == null)
            {
                btnSignOut.Visible = false;
                btnAccount.Visible = false;
            }
            else
            {
                btnSignIn.Visible = false;
                DataTable dtAccount = CheckAuth.GetInfoAccount(false);
                txtEmail.Text = dtAccount.Rows[0]["EMAIL"].ToString();
            }

            dataAccess.DongKetNoiCSDL();
          
        }

        protected void btnSearch_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx?search=" + txtSearch.Text.Trim());
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session.Clear();
            //Response.Cookies.Clear();
            //Response.Cache.SetNoStore();
            //Response.CacheControl = "no-cache";
            Response.Redirect("SignIn.aspx?action=logout");
        }

        protected void btnSubcribe_Click(object sender, EventArgs e)
        {
            Response.Write("<script>");
            Response.Write("window.open('http://www.gmail.com','_blank')");
            Response.Write("</script>");
        }

        public string CartQuantity
        {
            get
            {
                return lbCartQuantity.Text;
            }
            set
            {
                lbCartQuantity.Text = value;
            }
        }

        public string CartQuantityHref
        {
            get { return cartQuantityLink.HRef; }
            set { cartQuantityLink.HRef = value; }
        }
        
    }
}