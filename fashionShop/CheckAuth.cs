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
            if (HttpContext.Current.Session["usernameAD"] == null)
            {
                HttpContext.Current.Response.Redirect("~/Admin/ADLogin.aspx");
            }
            CheckAcountClosedOrBanned("usernameAD");
        }

        public static void CheckCustomer(string currentPage)
        {
            if (HttpContext.Current.Session["username"] == null)
            {
                if (String.IsNullOrEmpty(currentPage))
                {
                    HttpContext.Current.Response.Redirect("SignIn.aspx");
                }
                else
                {
                    HttpContext.Current.Response.Redirect("SignIn.aspx?pp=" + currentPage);
                }
            }
            CheckAcountClosedOrBanned("username");     
        }

        //kiem tra tai khoan co bi khoa hay khong
        //(statusAccount = banned/closed)
        static void CheckAcountClosedOrBanned(string sessionName)
        {
            #region kiem tra tai khoan bi khoa
            

            string username = System.Web.HttpContext.Current.Session[sessionName].ToString();
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlAccount = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
            DataTable dtAccount = dataAccess.LayBangDuLieu(sqlAccount);

            dataAccess.DongKetNoiCSDL();

            if (dtAccount.Rows[0]["STATUS"].ToString() == "0")
            {
                HttpContext.Current.Response.Redirect("SignIn.aspx");
            }
            #endregion
        }

        public static DataTable GetInfoAccount(bool isAdmin)
        {
            string sessionName = isAdmin ? "usernameAD" : "username";
            string username = System.Web.HttpContext.Current.Session[sessionName].ToString();
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlAccount = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + username + "'";
            DataTable dtAccount = dataAccess.LayBangDuLieu(sqlAccount);

            return dtAccount;
        }
    }
}