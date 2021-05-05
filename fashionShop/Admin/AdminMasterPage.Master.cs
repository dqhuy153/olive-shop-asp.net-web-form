using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class AdminMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();
        }
        public string ADName
        {
            get
            {
                return lbADName.Text;
            }
            set
            {
                lbADName.Text = value;
            }
        }
        public string ADName1
        {
            get
            {
                return lbADName1.Text;
            }
            set
            {
                lbADName1.Text = value;
            }
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session["usernameAD"] = null;
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetNoStore();
            Response.CacheControl = "no-cache";
            Response.Redirect("ADLogin.aspx");
        }
    }
}