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
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                {
                    txtUsername.Text = Request.Cookies["username"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["password"].Value;

                    cbRemember.Checked = true;
                }
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("CHECK_LOGIN_CUSTOMER",dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@PASSWORD", txtPassword.Text.Trim());

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            //lay ket qua trong dt de doi chieu
            if (dt.Rows.Count > 0)
            {
                //neu tai khoan bi khoa
                if (int.Parse(dt.Rows[0]["STATUS"].ToString()) == 0)
                {
                    lbWarning.Text = "This account has been closed by Admin. If there is any mistake, please contact us via email OliveAdmin@gmail.com";
                }
                else
                {
                    //Ghi nho dang nhap
                    if (cbRemember.Checked)
                    {
                        //Dung cookies
                        Response.Cookies["username"].Value = txtUsername.Text.Trim();
                        Response.Cookies["password"].Value = txtPassword.Text.Trim();

                        //Thoi gian ghi nho
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);

                    }
                    else
                    {
                        Response.Cookies["username"].Expires = DateTime.Now;
                        Response.Cookies["password"].Expires = DateTime.Now;
                    }

                    Session["visitorEmail"] = null;
                    Session["checkoutIdAddress"] = null;
                    Session["idShippingFee"] = null;
                    Session["orderNote"] = null;
                    Session["username"] = txtUsername.Text.Trim();

                    //get cart from cache, then update
                    //if has product in cart session, add all into database cart_detail
                    if (Session["cart"] != null)
                    {
                        DataTable sessionCart = Session["cart"] as DataTable;
                        DataTable userCacheCart = CartStorage.CreateOrGetCacheCart(txtUsername.Text.Trim());

                        foreach (DataRow dataRow in sessionCart.Rows)
                        {
                            userCacheCart.ImportRow(dataRow);
                        }
                    }

                    //back to page where click login
                    if (Request.QueryString.Get("pp") != null)
                    {
                        Response.Redirect(Request.QueryString.Get("pp"));
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                        Session.RemoveAll();
                    }
                }           
            }
            else
            {
                lbWarning.Text = "<i class=\"fas fa-times\"></i> The username or password is incorrect";
            }
        }
    }
}