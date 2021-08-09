using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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

                DataAccess dataAccess = new DataAccess();
                DataTable dtProduct = GetProductFromId(idProduct);

                Server.HtmlDecode("&nbsp;");

                //set link of mycart(0)
                this.Master.CartQuantityHref = "Cart.aspx";

                if (dtProduct != null && dtProduct.Rows.Count > 0)
                {
                    //set page title
                    pageTitle.InnerText = dtProduct.Rows[0]["PRODUCT_NAME"].ToString();

                    //show images
                    string[] arrImages = dtProduct.Rows[0]["IMAGES"].ToString().Split('|');
                    
                    StringBuilder stringBuilder = new StringBuilder();
                    foreach (var img in arrImages)
                    {
                        stringBuilder.Append("<div class=\"product__detail-img\">");
                        stringBuilder.Append("<img src=\"../Uploads/" + img.ToString() + "\" alt=\"" + img.ToString() +"\">");
                        stringBuilder.Append("</div>");
                    }

                    PlaceHolderImages.Controls.Add(new Literal { Text = stringBuilder.ToString() });
                    //PanelImage.Controls.Add(new Image { ImageUrl = "~/Uploads/" + img.ToString(), CssClass = "product__view-img" });

                    //show route
                    hplMainCategory.Text = dtProduct.Rows[0]["MAIN_CATEGORY_NAME"].ToString();
                    hplMainCategory.NavigateUrl = "Products.aspx?mc=" + dtProduct.Rows[0]["MAIN_CATEGORY_NAME"];

                    hplGender.Text = dtProduct.Rows[0]["GENDER_NAME"].ToString();
                    hplGender.NavigateUrl = "Products.aspx?mc=" + dtProduct.Rows[0]["MAIN_CATEGORY_NAME"] + "&g=" + dtProduct.Rows[0]["GENDER_NAME"];

                    hplCategory.Text = dtProduct.Rows[0]["CATEGORY_NAME"].ToString();
                    hplCategory.NavigateUrl = "Products.aspx?mc=" + dtProduct.Rows[0]["MAIN_CATEGORY_NAME"] + "&g=" + dtProduct.Rows[0]["GENDER_NAME"] + "&c=" + dtProduct.Rows[0]["CATEGORY_NAME"].ToString().Replace(" & "," and ");

                    lbNameRoute.Text = dtProduct.Rows[0]["PRODUCT_NAME"].ToString();

                    //show product information
                    lbProductName.Text = dtProduct.Rows[0]["PRODUCT_NAME"].ToString();
                    lbPrice.Text = dtProduct.Rows[0]["PRICE"].ToString();
                    lbProductInfo.InnerText = dtProduct.Rows[0]["INFORMATION"].ToString();


                    if (!IsPostBack)
                    {
                        //show size available
                        dataAccess.MoKetNoiCSDL();

                        string sqlSize = "SELECT S, M, L ,XL, XXL, OVERSIZE FROM PRODUCT WHERE ID_PRODUCT = " + idProduct;
                        DataTable dtSize = dataAccess.LayBangDuLieu(sqlSize);

                        ddlSize.Items.Insert(0, new ListItem("-- Please Choose an Option --", "-1"));
                        foreach (DataColumn column in dtSize.Columns)
                        {
                            int sizeQuantiy = int.Parse(dtSize.Rows[0][column.ColumnName].ToString());

                            if (sizeQuantiy > 0)
                            {
                                if (column.ColumnName == "OVERSIZE")
                                {
                                    ddlSize.Items.Add(new ListItem(String.Format("One Size \xA0\xA0 (Available: {0})", sizeQuantiy), column.ColumnName));
                                }
                                else
                                {
                                    ddlSize.Items.Add(new ListItem(String.Format("Size {0} \xA0\xA0 (Available: {1})", column.ColumnName, sizeQuantiy), column.ColumnName));
                                }
                            }
                        }
                        
                        dataAccess.DongKetNoiCSDL();
                    }

                    //show info modal add to cart successful
                    imgModalAdd.ImageUrl = "~/Uploads/" + arrImages[0];
                    lbProductNameModalAdd.Text = dtProduct.Rows[0]["PRODUCT_NAME"].ToString();
                    
                    lbQuantityModalAdd.Text = "1";
                    lbPriceModalAdd.Text = dtProduct.Rows[0]["PRICE"].ToString();

                    //prevent save to wish list with visitor
                    if (Session["username"] == null)
                    {
                        btnAddToWishList.OnClientClick = null;
                    }

                    //show related items slide
                    dataAccess.MoKetNoiCSDL();

                    string sqlRelatedItems = "SELECT TOP 6 * FROM PRODUCT P, CATEGORY C WHERE P.ID_CATEGORY = C.ID_CATEGORY AND ID_GENDER = " + dtProduct.Rows[0]["ID_GENDER"] + " AND (P.ID_CATEGORY = "+ dtProduct.Rows[0]["ID_CATEGORY"] + " OR ID_MAIN_CATEGORY = " + dtProduct.Rows[0]["ID_MAIN_CATEGORY"] + ")";
                    DataTable dtRelatedItems = dataAccess.LayBangDuLieu(sqlRelatedItems);

                    rptRelatedProduct.DataSource = dtRelatedItems;
                    rptRelatedProduct.DataBind();

                    dataAccess.DongKetNoiCSDL();
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

            //********
            DataTable cart = CartStorage.getCurrentCart();
            //********

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
                    dataRow["PRODUCT_NAME"] = dtProduct.Rows[0]["PRODUCT_NAME"];
                    dataRow["PRICE"] = dtProduct.Rows[0]["PRICE"];
                    dataRow[selectedSize] = orderQuantity;

                    cart.Rows.Add(dataRow);
                }

                if (Session["username"] == null)
                {
                    //Update session cart
                    Session["cart"] = cart;
                    //btnAddToCart.OnClientClick = "handleAddToCart()";
                }
                else
                {
                    Cache[$"{Session["username"]}-cart"] = cart;
                }

                //this.Master.CartQuantity = $"({cart.Rows.Count})";
            }               
        }

        protected void btnAddToWishList_Click(object sender, EventArgs e)
        {
            string idProduct = Request.QueryString["id"].ToString();
            
            CheckAuth.CheckCustomer($"ProductDetail.aspx?id={idProduct}");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmdSave = new SqlCommand("INSERT_SAVE_DETAIL", dataAccess.getConnection());
            cmdSave.CommandType = CommandType.StoredProcedure;

            cmdSave.Parameters.AddWithValue("@USERNAME", Session["username"].ToString());
            cmdSave.Parameters.AddWithValue("@ID_PRODUCT", int.Parse(idProduct));

            cmdSave.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

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

        //protected void AddToCart(DataTable typeOfCart)
        //{
        //if (Session["username"] == null)
        //{
        //    AddToCart(CartStorage.CreateOrGetSessionCart());
        //}

        ////if user already logging in
        ////add product to cache cart_detail
        ////the cart has been updated when you logging in
        //else
        //{
        //    #region user logging in
        //    string username = Session["username"].ToString();

        //    DataTable dt = CartStorage.CreateOrGetCacheCart(username);

        //    AddToCart(dt);


        //    //int selectedSizeInStock = int.Parse(dtProduct.Rows[0][ddlSize.SelectedValue].ToString());

        //    //if (orderQuantity > selectedSizeInStock)
        //    //{
        //    //    Response.Write($"<script>alert(\"The available products you choose is {selectedSizeInStock}\")</script>");
        //    //}
        //    //else
        //    //{
        //    //    DataTable cart = CreateOrGetSessionCart();

        //    //    DataAccess dataAccess = new DataAccess();
        //    //    dataAccess.MoKetNoiCSDL();
        //    //    SqlCommand cmdCart = new SqlCommand("INSERT_CART_DETAIL", dataAccess.getConnection());
        //    //    cmdCart.CommandType = CommandType.StoredProcedure;

        //    //    cmdCart.Parameters.AddWithValue("@USERNAME", Session["username"].ToString());
        //    //    cmdCart.Parameters.AddWithValue("@ID_PRODUCT", int.Parse(idProduct));
        //    //    cmdCart.Parameters.AddWithValue("@CART_PRICE", decimal.Parse(dtProduct.Rows[0]["PRICE"].ToString()));
        //    //    cmdCart.Parameters.AddWithValue($"@CART_{selectedSize}", orderQuantity);

        //    //    cmdCart.ExecuteNonQuery();

        //    //    //btnAddToCart.OnClientClick = "handleAddToCart()";

        //    //    dataAccess.DongKetNoiCSDL();
        //    //}

        //    #endregion
        //}
        
    }
}