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
    public partial class CTMProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["id"] != null)
            {
                string idProduct = Request.QueryString["id"].ToString();

                DataTable dtProduct = GetProductFromId(idProduct);

                Server.HtmlDecode("&nbsp;");

                if (dtProduct != null && dtProduct.Rows.Count > 0)
                {
                    string[] arrImages = dtProduct.Rows[0]["IMAGES"].ToString().Split('|');


                    //show images
                    foreach (var img in arrImages)
                    {
                        PanelImage.Controls.Add(new Image { ImageUrl = "~/Uploads/" + img.ToString(), CssClass = "product__view-img" });
                    }

                    //show route
                    hplMainCategory.Text = dtProduct.Rows[0]["MAIN_CATEGORY_NAME"].ToString();
                    hplMainCategory.NavigateUrl = "Products.aspx?mc=" + dtProduct.Rows[0]["MAIN_CATEGORY_NAME"];

                    hplGender.Text = dtProduct.Rows[0]["GENDER_NAME"].ToString();
                    hplGender.NavigateUrl = "Products.aspx?mc=" + dtProduct.Rows[0]["MAIN_CATEGORY_NAME"] + "&g=" + dtProduct.Rows[0]["GENDER_NAME"];

                    hplCategory.Text = dtProduct.Rows[0]["CATEGORY_NAME"].ToString();
                    hplCategory.NavigateUrl = "Products.aspx?mc=" + dtProduct.Rows[0]["MAIN_CATEGORY_NAME"] + "&g=" + dtProduct.Rows[0]["GENDER_NAME"] + "&c=" + dtProduct.Rows[0]["CATEGORY_NAME"];

                    lbNameRoute.Text = dtProduct.Rows[0]["PRODUCT_NAME"].ToString();

                    if (!IsPostBack)
                    {
                        //show size available
                        DataAccess dataAccess = new DataAccess();
                        dataAccess.MoKetNoiCSDL();

                        string sqlSize = "SELECT S, M, L ,XL, XXL, OVERSIZE FROM PRODUCT WHERE ID_PRODUCT = " + idProduct;
                        DataTable dtSize = dataAccess.LayBangDuLieu(sqlSize);

                        ddlSize.Items.Insert(0, new ListItem("--Please Choose an Option--", "-1"));
                        foreach (DataColumn column in dtSize.Columns)
                        {
                            int sizeQuantiy = int.Parse(dtSize.Rows[0][column.ColumnName].ToString());

                            if (sizeQuantiy > 0)
                            {
                                if (column.ColumnName == "OVERSIZE")
                                {
                                    ddlSize.Items.Add(new ListItem(String.Format("No Size \xA0\xA0 (Available: {0})", sizeQuantiy), column.ColumnName));
                                }
                                else
                                {
                                    ddlSize.Items.Add(new ListItem(String.Format("Size {0} \xA0\xA0 (Available: {1})", column.ColumnName, sizeQuantiy), column.ColumnName));
                                }
                            }
                        }
                        
                        dataAccess.DongKetNoiCSDL();
                   }
                }           
            }              
        }

        //handle add to cart
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string idProduct = Request.QueryString["id"].ToString();
            DataTable dtProduct = GetProductFromId(idProduct);

            //get first image in images
            string[] imagesArr = dtProduct.Rows[0]["IMAGES"].ToString().Split('|');
            string firstImage = imagesArr[0];
            string selectedSize = ddlSize.SelectedValue;
            int orderQuantity = 1;

            //if user doesn't logging in
            //add product to session[cart]
            if (Session["username"] == null)
            {
                #region user doesn't logging in 

                DataTable cart = CreateOrGetSessionCart();

                //add product to session cart
                int selectedSizeInStock = int.Parse(dtProduct.Rows[0][ddlSize.SelectedValue].ToString());
                


                if (orderQuantity > selectedSizeInStock)
                {
                    Response.Write($"<script>alert(\"The available products you choose is {selectedSizeInStock}\")</script>");
                }
                else
                {
                    //check if product exists in session cart
                    bool isExisted = false;
                    foreach (DataRow dataRow in cart.Rows)
                    {
                        if (dataRow["ID_PRODUCT"].ToString() == idProduct)
                        {
                            dataRow[selectedSize] = int.Parse(dataRow[selectedSize].ToString()) + orderQuantity;
                            isExisted = true;
                            break;
                        }
                    }
                    
                    //if product not exists in session cart
                    //add product to sesstion cart
                    if (!isExisted)
                    {
                        DataRow dataRow = cart.NewRow();
                        dataRow["ID_PRODUCT"] = dtProduct.Rows[0]["ID_PRODUCT"];
                        dataRow["IMAGE"] = firstImage;
                        dataRow["NAME"] = dtProduct.Rows[0]["PRODUCT_NAME"];
                        dataRow["PRICE"] = dtProduct.Rows[0]["PRICE"];
                        dataRow[selectedSize] = orderQuantity;

                        cart.Rows.Add(dataRow);
                    }

                    //Update session cart
                    Session["cart"] = cart;

                }
                #endregion
            }
            
            //if user already logging in
            //add product to database cart_detail
            //the cart has been updated when you logging in
            else
            {
                #region user logging in

                DataTable cart = CreateOrGetSessionCart();

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                SqlCommand cmdCart = new SqlCommand("INSERT_CART_DETAIL", dataAccess.getConnection());
                cmdCart.CommandType = CommandType.StoredProcedure;

                cmdCart.Parameters.AddWithValue("@USERNAME", Session["username"].ToString());
                cmdCart.Parameters.AddWithValue("@ID_PRODUCT", int.Parse(idProduct));
                cmdCart.Parameters.AddWithValue("@CART_PRICE", decimal.Parse(dtProduct.Rows[0]["PRICE"].ToString()));
                cmdCart.Parameters.AddWithValue($"@CART_{selectedSize}", orderQuantity);

                cmdCart.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                #endregion
            }
        }

        protected DataTable GetProductFromId(string idProduct)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //get product
            string sqlProduct = "SELECT * FROM PRODUCT P, CATEGORY C, MAIN_CATEGORY MC, GENDER G WHERE P.ID_CATEGORY = C.ID_CATEGORY AND C.ID_MAIN_CATEGORY = MC.ID_MAIN_CATEGORY AND C.ID_GENDER = G.ID_GENDER AND ID_PRODUCT = " + idProduct;

            dataAccess.DongKetNoiCSDL();
            return dataAccess.LayBangDuLieu(sqlProduct);             
        }

        protected DataTable CreateOrGetSessionCart()
        {
            DataTable cart = new DataTable();
            //create session cart
            if (HttpContext.Current.Session["cart"] == null)
            {
                cart.Columns.Add("ID_PRODUCT");
                cart.Columns.Add("IMAGE");
                cart.Columns.Add("NAME");
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
    }
}