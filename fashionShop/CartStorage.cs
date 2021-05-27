using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace fashionShop
{
    public static class CartStorage
    {

        //cart for user logging in
        public static DataTable CreateOrGetCacheCart(string username)
        {
            DataTable userCart = new DataTable();
            //create session cart
            if (HttpContext.Current.Cache[$"{username}-cart"] == null)
            {
                userCart.Columns.Add("ID_PRODUCT");
                userCart.Columns.Add("IMAGE");
                userCart.Columns.Add("PRODUCT_NAME");
                userCart.Columns.Add("PRICE");
                userCart.Columns.Add("S").DefaultValue = 0;
                userCart.Columns.Add("M").DefaultValue = 0;
                userCart.Columns.Add("L").DefaultValue = 0;
                userCart.Columns.Add("XL").DefaultValue = 0;
                userCart.Columns.Add("XXL").DefaultValue = 0;
                userCart.Columns.Add("OVERSIZE").DefaultValue = 0;

                HttpContext.Current.Cache[$"{username}-cart"] = userCart;
                HttpContext.Current.Response.Cache.SetExpires(DateTime.Now.AddDays(30));
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.Public);
                HttpContext.Current.Response.Cache.SetValidUntilExpires(true);
            }
            //get session cart
            else
            {
                userCart = HttpContext.Current.Cache[$"{username}-cart"] as DataTable;
            }

            return userCart;
        }

        //cart for vistor
        public static DataTable CreateOrGetSessionCart()
        {
            DataTable cart = new DataTable();
            //create session cart
            if (HttpContext.Current.Session["cart"] == null)
            {
                cart.Columns.Add("ID_PRODUCT");
                cart.Columns.Add("IMAGE");
                cart.Columns.Add("PRODUCT_NAME");
                cart.Columns.Add("PRICE");
                cart.Columns.Add("S").DefaultValue = 0;
                cart.Columns.Add("M").DefaultValue = 0;
                cart.Columns.Add("L").DefaultValue = 0;
                cart.Columns.Add("XL").DefaultValue = 0;
                cart.Columns.Add("XXL").DefaultValue = 0;
                cart.Columns.Add("OVERSIZE").DefaultValue = 0;

                HttpContext.Current.Session["cart"] = cart;
            }
            //get session cart
            else
            {
                cart = HttpContext.Current.Session["cart"] as DataTable;
            }

            return cart;
        }

        public static DataTable getCurrentCart()
        {
            DataTable cart = new DataTable();

            if(HttpContext.Current.Session["username"] == null)
            {
                cart = CreateOrGetSessionCart();
            }
            else
            {
                cart = CreateOrGetCacheCart(HttpContext.Current.Session["username"].ToString());
            }

            return cart;

        }

        //for cart quantity and display cart
        public static DataTable getDetailCart()
        {
            DataTable dtCart = getCurrentCart();

            DataTable dtDetailCart = new DataTable();
            dtDetailCart.Columns.Add("ID_PRODUCT");
            dtDetailCart.Columns.Add("PRODUCT_NAME");
            dtDetailCart.Columns.Add("SIZE");
            dtDetailCart.Columns.Add("QUANTITY");
            dtDetailCart.Columns.Add("PRICE");
            dtDetailCart.Columns.Add("IMAGE");

            ArrayList sizes = new ArrayList() { "S", "M", "L", "XL", "XXL", "OVERSIZE" };

            foreach (DataRow dataRow in dtCart.Rows)
            {
                foreach (DataColumn dataColumn in dtCart.Columns)
                {
                    if (sizes.Contains(dataColumn.ColumnName) && int.Parse(dataRow[dataColumn].ToString()) > 0)
                    {
                        DataRow itemRow = dtDetailCart.NewRow();
                        itemRow["ID_PRODUCT"] = dataRow["ID_PRODUCT"];
                        itemRow["PRODUCT_NAME"] = dataRow["PRODUCT_NAME"];
                        itemRow["SIZE"] = dataColumn.ColumnName;
                        itemRow["QUANTITY"] = dataRow[dataColumn];
                        itemRow["PRICE"] = dataRow["PRICE"];
                        itemRow["IMAGE"] = dataRow["IMAGE"];

                        dtDetailCart.Rows.Add(itemRow);
                    }
                }
            }

            return dtDetailCart;
        }
    }
}
