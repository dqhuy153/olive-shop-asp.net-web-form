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
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
            cmd.Parameters.AddWithValue("@PASSWORD", txtPassword.Text);

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
                        Response.Cookies["username"].Value = txtUsername.Text;
                        Response.Cookies["password"].Value = txtPassword.Text;

                        //Thoi gian ghi nho
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);

                    }
                    else
                    {
                        Response.Cookies["username"].Expires = DateTime.Now;
                        Response.Cookies["password"].Expires = DateTime.Now;
                    }

                    Session["username"] = txtUsername.Text;

                    //get cart from database, then update
                    //if has product in cart session, add all into database cart_detail
                    if(Session["cart"] != null)
                    {
                        DataTable cart = Session["cart"] as DataTable;
                        string selectedSize = "";

                        foreach(DataRow dataRow in cart.Rows)
                        {
                            dataAccess.MoKetNoiCSDL();
                            SqlCommand cmdCart = new SqlCommand("INSERT_CART_DETAIL", dataAccess.getConnection());
                            cmdCart.CommandType = CommandType.StoredProcedure;

                            cmdCart.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                            cmdCart.Parameters.AddWithValue("@ID_PRODUCT", int.Parse(dataRow["ID_PRODUCT"].ToString()));
                            cmdCart.Parameters.AddWithValue("@CART_PRICE", decimal.Parse(dataRow["PRICE"].ToString()));

                            //check size name of item
                            if (int.Parse(dataRow["S"].ToString()) > 0) selectedSize = "S";
                            if (int.Parse(dataRow["M"].ToString()) > 0) selectedSize = "M";
                            if (int.Parse(dataRow["L"].ToString()) > 0) selectedSize = "L";
                            if (int.Parse(dataRow["XL"].ToString()) > 0) selectedSize = "XL";
                            if (int.Parse(dataRow["XXL"].ToString()) > 0) selectedSize = "XXL";
                            if (int.Parse(dataRow["OVERSIZE"].ToString()) > 0) selectedSize = "OVERSIZE";
                            
                            cmdCart.Parameters.AddWithValue($"@CART_{selectedSize}", int.Parse(dataRow[selectedSize].ToString()));

                            cmdCart.ExecuteNonQuery();
                            dataAccess.DongKetNoiCSDL();
                        }                  
                    }

                    //back to page where click login
                    if (Request.QueryString.Get("pp") != null)
                    {
                        Response.Redirect(Request.QueryString.Get("pp") + ".aspx");
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