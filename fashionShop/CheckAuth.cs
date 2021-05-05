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
    public static class CheckAuth
    {
        public static void CheckAdmin()
        {
            if (System.Web.HttpContext.Current.Session["usernameAD"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/ADLogin.aspx");
            }
            //kiem tra tai khoan co bi khoa hay khong
            #region kiem tra tai khoan bi khoa
            string username = System.Web.HttpContext.Current.Session["usernameAD"].ToString();
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlAccount = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
            DataTable dtAccount = dataAccess.LayBangDuLieu(sqlAccount);

            dataAccess.DongKetNoiCSDL();

            if (dtAccount.Rows[0]["STATUS"].ToString() == "0")
            {
                System.Web.HttpContext.Current.Response.Redirect("ADLogin.aspx");
            }
            #endregion
        }

        public static void CheckCustomer(string currentPage)
        {
            if (System.Web.HttpContext.Current.Session["username"] == null)
            {
                if (String.IsNullOrEmpty(currentPage))
                {
                    System.Web.HttpContext.Current.Response.Redirect("SignIn.aspx");
                }
                else
                {
                    System.Web.HttpContext.Current.Response.Redirect("SignIn.aspx?pp=" + currentPage);
                }
            }

            //kiem tra tai khoan co bi khoa hay khong
            #region kiem tra tai khoan bi khoa
            string username = System.Web.HttpContext.Current.Session["username"].ToString();
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlAccount = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
            DataTable dtAccount = dataAccess.LayBangDuLieu(sqlAccount);

            dataAccess.DongKetNoiCSDL();

            if (dtAccount.Rows[0]["STATUS"].ToString() == "0")
            {
                System.Web.HttpContext.Current.Response.Redirect("SignIn.aspx");
            }
            #endregion

        }
    }
}