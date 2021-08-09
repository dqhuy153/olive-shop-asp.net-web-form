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
    public partial class Checkout : System.Web.UI.Page
    {
        public bool checkAuth { get; set; }
        public bool checkShippingDetail { get; set; }
        public bool checkBilling { get; set; }
        public bool checkPayment { get; set; }
        public double shippingFee { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PreviewCart();

            //Step 1: check authentication
            CheckAuthSection();

            //Step 2: check shipping information
            CheckShippingSection();

            //Step 3: check billing information
            CheckBillingSection();

            //Step 4: check payment -> finish payment -> create new order -> redirect to ordersList page
            CheckPaymentSection();

        }

        private void PreviewCart()
        {
            DataTable dtCart = CartStorage.getDetailCart();
            if(dtCart.Rows.Count > 0 && dtCart != null)
            {
                //n items
                lbTotalItemInCart.Text = dtCart.Rows.Count != 1 
                    ? $"{dtCart.Rows.Count} items"
                    : $"{dtCart.Rows.Count} item";

                //items detail
                rptPreviewCart.DataSource = dtCart;
                rptPreviewCart.DataBind();

                //sub total
                Double subTotalCart = 0;
                foreach(DataRow dr in dtCart.Rows)
                {
                    subTotalCart += (int.Parse(dr["QUANTITY"].ToString()) * Double.Parse(dr["PRICE"].ToString()));
                }
                lbSubTotalCart.Text = subTotalCart.ToString();

                //shipping fee
                Double shippingFee = 0;
                if(Session["idShippingFee"] != null)
                {
                    int idShippingFee = int.Parse(Session["idShippingFee"].ToString());
                    if(idShippingFee == 1)
                    {
                        shippingFee = 1.9;
                        lbShippingFeeCart.Text = "$1,9";
                    }
                    else if(idShippingFee == 2)
                    {
                        shippingFee = 6.5;
                        lbShippingFeeCart.Text = "$6,5";
                    }
                    else if(idShippingFee == 3)
                    {
                        shippingFee = 10;
                        lbShippingFeeCart.Text = "$10";
                    }
                }

                //total
                double total = subTotalCart + shippingFee;
                lbTotalCart.Text = total.ToString();

            }
        }

        //Step 1: check authentication
        protected void CheckAuthSection()
        {
            //auth section for visitor
            if (Session["username"] == null && Session["visitorEmail"] == null)
            {
                visitorAuthSection.Visible = true;
                customerAuthSection.Visible = false;
                if (Session["ppVisitorEmail"] != null)
                {
                    txtVistorEmail.Text = Session["ppVisitorEmail"].ToString();

                }
                checkAuth = false;
            }
            //auto fill email -> move to step 2
            else
            {
                visitorAuthSection.Visible = false;
                customerAuthSection.Visible = true;

                checkAuth = true;
                //auth section for customer
                if (Session["username"] != null)
                {
                    lbCustomerEmail.Text = Session["username"].ToString();
                    btnLogoutCustomerAuth.Visible = true;
                }
                //auth for vistor who filled in step 1
                else if (Session["visitorEmail"] != null)
                {
                    lbCustomerEmail.Text = Session["visitorEmail"].ToString();
                    btnEditVistorEmailAuth.Visible = true;
                }
            }
        }
        protected void btnLogoutCustomerAuth_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session.Clear();

            Response.Redirect("SignIn.aspx?action=logout");
        }
        protected void btnContinueVistorAuth_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT * FROM ACCOUNT WHERE USERNAME = N'" + txtVistorEmail.Text.Trim() + "'";
            DataTable dataTable = dataAccess.LayBangDuLieu(sql);
            dataAccess.DongKetNoiCSDL();

            //email 
            if (dataTable.Rows.Count > 0)
            {
                txtEmailWarning.Text = "This email has been registered. Please sign in to continue or enter another email!";
            }
            else
            {
                Session["visitorEmail"] = txtVistorEmail.Text.Trim();
                Session["ppVisitorEmail"] = txtVistorEmail.Text.Trim();
                Response.Redirect("Checkout.aspx");
            }
        }
        protected void btnEditVistorEmailAuth_Click(object sender, EventArgs e)
        {
            Session["visitorEmail"] = null;
            Session["checkoutIdAddress"] = null;
            checkAuth = false;

            Response.Redirect("Checkout.aspx");
        }



        //Step 2: Check shipping information
        protected void CheckShippingSection()
        {
            checkShippingDetail = false;

            if (!checkAuth)
            {
                vistorShippingSection.Visible = false;
                customerShippingSection.Visible = false;
                btnEditShippingSection.Visible = false;
            }
            else
            {
                if (!IsPostBack)
                {
                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    //Fill data vao dropdownlist
                    string sqlCountry = "SELECT * FROM COUNTRY";
                    SqlCommand cmd = new SqlCommand(sqlCountry, dataAccess.getConnection());

                    ddlCountry.DataSource = cmd.ExecuteReader();
                    ddlCountry.DataTextField = "NAME_CAP";
                    ddlCountry.DataValueField = "ID_COUNTRY";
                    ddlCountry.DataBind();
                    ddlCountry.Items.Insert(0, new ListItem("Choose the country", "-1"));

                    dataAccess.DongKetNoiCSDL();
                }
                //visitor address section
                if (Session["username"] == null)
                {
                    customerShippingSection.Visible = false;
                    vistorShippingSection.Visible = true;
                    lbEmailRegister.Text = Session["visitorEmail"].ToString();
                }
                //customer address section
                else
                {
                    customerShippingSection.Visible = true;
                    vistorShippingSection.Visible = false;

                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    string sql = "SELECT ID_ADDRESS, AD.FIRST_NAME, AD.LAST_NAME, STREET, CITY, AD.PHONE, ZIP_CODE, NAME_CAP " +
                        "FROM ADDRESSES AD, ACCOUNT AC, COUNTRY C " +
                        "WHERE AC.ID_ACCOUNT = AD.ID_ACCOUNT AND AD.ID_COUNTRY = C.ID_COUNTRY AND USERNAME = N'" + Session["username"].ToString() + "'";
                    DataTable dt = dataAccess.LayBangDuLieu(sql);
                    dataAccess.DongKetNoiCSDL();

                    rptCustomerAddress.DataSource = dt;
                    rptCustomerAddress.DataBind();
                }
            }
        }
        protected void txtRegisterVisitorShipping_Click(object sender, EventArgs e)
        {
            if (Session["visitorEmail"] != null)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("INSERT_CUSTOMER", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                int b = int.Parse(ddlCountry.SelectedValue);

                cmd.Parameters.AddWithValue("@USERNAME", Session["visitorEmail"].ToString());
                cmd.Parameters.AddWithValue("@PASSWORD", txtPassword.Text);
                cmd.Parameters.AddWithValue("@FIRST_NAME", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LAST_NAME", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", Session["visitorEmail"].ToString());
                cmd.Parameters.AddWithValue("@PHONE", txtPhoneNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@STREET", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@CITY", $"{txtCity.Text.Trim()} {txtState.Text.Trim()}".Trim());
                cmd.Parameters.AddWithValue("@ZIP_CODE", txtZipCode.Text.Trim());
                cmd.Parameters.AddWithValue("@ID_COUNTRY", int.Parse(ddlCountry.SelectedValue));
                cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                //co the thu int a = cmd.ExecuteNonQuery(); de check so row effected
                if (a > 0)
                {
                    lbNotify.Text = cmd.Parameters["@ERROR"].Value.ToString();

                    Session["username"] = Session["visitorEmail"].ToString();

                    //get cart from cache, then update
                    //if has product in cart session, add all into database cart_detail
                    if (Session["cart"] != null)
                    {
                        DataTable sessionCart = Session["cart"] as DataTable;
                        DataTable userCacheCart = CartStorage.CreateOrGetCacheCart(Session["visitorEmail"].ToString());

                        foreach (DataRow dataRow in sessionCart.Rows)
                        {
                            userCacheCart.ImportRow(dataRow);
                        }
                    }
                    Session["visitorEmail"] = null;
                    Response.Redirect("Checkout.aspx");
                }
                else
                {
                    lbNotify.Text = cmd.Parameters["@ERROR"].Value.ToString();
                }
            }
            else
            {
                Response.Write("<script>alert(\"Something goes wrong! Please reload your page.\")</script>");
            }
        }
        protected void btnChooseAddress_Click(object sender, EventArgs e)
        {
            if (Request.Form["customerAddress"] != null)
            {
                string idAddress = Request.Form["customerAddress"].ToString();

                Session["checkoutIdAddress"] = idAddress;

                checkShippingDetail = true;
                Response.Redirect("Checkout.aspx");
            }
        }
        protected void btnEditShippingSection_Click(object sender, EventArgs e)
        {
            Session["checkoutIdAddress"] = null;
            Session["idShippingFee"] = null;

            Response.Redirect("Checkout.aspx");
        }

        //Step 3: Check billing information

        //right now just use dummy data for shipping fee
        //will update shipping id if shipping information added to database
        //or embed API of shipping company
        protected void CheckBillingSection()
        {
            checkBilling = false;

            //show info of address step2
            if (Session["checkoutIdAddress"] == null)
            {
                checkShippingDetail = false;
            }
            else
            {
                checkShippingDetail = true;
                addressShippingInformation.Visible = true;

                string idAddressShipping = Session["checkoutIdAddress"].ToString();

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                string sql = "SELECT * FROM ADDRESSES AD, COUNTRY C WHERE AD.ID_COUNTRY = C.ID_COUNTRY AND ID_ADDRESS = " + idAddressShipping;
                DataTable dt = dataAccess.LayBangDuLieu(sql);
                dataAccess.DongKetNoiCSDL();

                if(dt.Rows.Count > 0)
                {
                    lbFullNameShipping.Text = dt.Rows[0]["FIRST_NAME"].ToString() + " " + dt.Rows[0]["LAST_NAME"].ToString();
                    lbPhoneShipping.Text = dt.Rows[0]["PHONE"].ToString();
                    lbStreetShipping.Text = dt.Rows[0]["STREET"].ToString();
                    lbAddressShipping.Text = $"{dt.Rows[0]["CITY"]}, {dt.Rows[0]["ZIP_CODE"]} / {dt.Rows[0]["NAME_CAP"]}";
                }
            }

            //handle step 3
            if (!checkShippingDetail)
            {
                customerBillingSection.Visible = false;
                btnEditBillingSection.Visible = false;
            }
            else
            {
                btnEditShippingSection.Visible = true;
                customerShippingSection.Visible = false;
                vistorShippingSection.Visible = false;

                if(Session["orderNote"] != null)
                {
                    txtOrderComments.Text = Session["orderNote"].ToString();
                }

                customerBillingSection.Visible = true;
            }
        }
        protected void btnEditBillingSection_Click(object sender, EventArgs e)
        {
            Session["idShippingFee"] = null;

            Response.Redirect("Checkout.aspx");
        }

        protected void btnContinueBillingSection_Click(object sender, EventArgs e)
        {
            
            if (Request.Form["idShippingFee"] != null)
            {
                string idShippingFee = Request.Form["idShippingFee"].ToString();

                Session["idShippingFee"] = idShippingFee;
            }
            if (!String.IsNullOrEmpty(txtOrderComments.Text.Trim()))
            {
                Session["orderNote"] = txtOrderComments.Text.Trim();
            }

            Response.Redirect("Checkout.aspx");
        }

        //Step 4: Check payment information
        //use dummy visa checker
        protected void CheckPaymentSection()
        {
            checkPayment = false;

            //show billing information
            if(Session["idShippingFee"] != null)
            {
                checkPayment = true;

                billingInformationSection.Visible = true;
                int idShippingFee = int.Parse(Session["idShippingFee"].ToString());
                if (idShippingFee == 1)
                {
                    lbShippingMethod.Text = "Postal Service (Express 3-10 Days)";
                    lbShippingFee.Text = "$1.9";
                    shippingFee = 1.9;
                }
                else if (idShippingFee == 2)
                {
                    lbShippingMethod.Text = "DHL Courier (Express 1-2 Days, Monday - Friday)";
                    lbShippingFee.Text = "$6.5";
                    shippingFee = 6.5;
                }
                else if (idShippingFee == 3)
                {
                    lbShippingMethod.Text = "DHL Courier (Express - Weekend Delivery)";
                    lbShippingFee.Text = "$10";
                    shippingFee = 10;
                }

                if(Session["orderNote"] != null)
                {
                    lbOrderComments.Text = "Note: " + Session["orderNote"].ToString();
                }
            }
            else
            {
                checkPayment = false;
            }

            //handle payment section
            if (!checkPayment)
            {
                customerPaymentSection.Visible = false;
            }
            else
            {
                btnEditBillingSection.Visible = true;
                customerBillingSection.Visible = false;
                
                customerPaymentSection.Visible = true;
            }
        }

        protected void txtConfirmPayment_Click(object sender, EventArgs e)
        {

            if (!checkAllInfoAfterInsertOrder())
            {
                Response.Write("<script>alert(\"Something goes wrong! Please try again.\")</script>");
            }
            else
            {
                //insert new order
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string orderNote = "";
                if (Session["orderNote"] != null)
                {
                    orderNote = Session["orderNote"].ToString();
                }

                DataTable dtCart = CartStorage.getCurrentCart();

                string sqlAddress = "SELECT * FROM ADDRESSES WHERE ID_ADDRESS = " + Session["checkoutIdAddress"].ToString();
                DataTable dtAddress = dataAccess.LayBangDuLieu(sqlAddress);

                if(dtAddress != null && dtAddress.Rows.Count > 0)
                {
                    SqlCommand cmdInsertOrder = new SqlCommand("INSERT_ORDER", dataAccess.getConnection());
                    cmdInsertOrder.CommandType = CommandType.StoredProcedure;

                    cmdInsertOrder.Parameters.AddWithValue("@USERNAME", Session["username"].ToString());
                    cmdInsertOrder.Parameters.AddWithValue("@ORDER_FULL_NAME", $"{dtAddress.Rows[0]["FIRST_NAME"]} {dtAddress.Rows[0]["LAST_NAME"]}");
                    cmdInsertOrder.Parameters.AddWithValue("@ORDER_STREET", dtAddress.Rows[0]["STREET"]);
                    cmdInsertOrder.Parameters.AddWithValue("@ORDER_CITY", dtAddress.Rows[0]["CITY"]);
                    cmdInsertOrder.Parameters.AddWithValue("@ORDER_PHONE", dtAddress.Rows[0]["PHONE"]);
                    cmdInsertOrder.Parameters.AddWithValue("@ORDER_ZIP_CODE", dtAddress.Rows[0]["ZIP_CODE"]);
                    cmdInsertOrder.Parameters.AddWithValue("@ORDER_NOTE", orderNote);
                    cmdInsertOrder.Parameters.AddWithValue("@SHIPPING_FEE", shippingFee);
                    cmdInsertOrder.Parameters.AddWithValue("@ID_COUNTRY", dtAddress.Rows[0]["ID_COUNTRY"]);

                    cmdInsertOrder.Parameters.Add("@ID_ORDER", SqlDbType.Int);
                    cmdInsertOrder.Parameters["@ID_ORDER"].Direction = ParameterDirection.Output;

                    cmdInsertOrder.ExecuteNonQuery();

                    dataAccess.DongKetNoiCSDL();

                    if (cmdInsertOrder.Parameters["@ID_ORDER"] == null)
                    {
                        Response.Write("<script>alert(\"Something goes wrong! Please try again.\")</script>");
                    }
                    else
                    {
                        string idOrder = cmdInsertOrder.Parameters["@ID_ORDER"].Value.ToString();

                        if (dtCart != null && dtCart.Rows.Count > 0)
                        {
                            foreach (DataRow dr in dtCart.Rows)
                            {
                                using (SqlCommand cmdInserOrderDetail = new SqlCommand("INSERT_ORDER_DETAIL"))
                                {
                                    cmdInserOrderDetail.CommandType = CommandType.StoredProcedure;

                                    dataAccess.MoKetNoiCSDL();
                                    cmdInserOrderDetail.Connection = dataAccess.getConnection();

                                    cmdInserOrderDetail.Parameters.AddWithValue("@ID_ORDER", idOrder);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@ID_PRODUCT", dr["ID_PRODUCT"]);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_PRICE", Decimal.Parse(dr["PRICE"].ToString()));
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_S", dr["S"]);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_M", dr["M"]);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_L", dr["L"]);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_XL", dr["XL"]);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_XXL", dr["XXL"]);
                                    cmdInserOrderDetail.Parameters.AddWithValue("@DETAIL_OVERSIZE", dr["OVERSIZE"]);

                                    cmdInserOrderDetail.ExecuteNonQuery();

                                    dataAccess.DongKetNoiCSDL();
                                }
                            }
                        }

                        CartStorage.resetCart();

                        Response.Redirect("OrderLists.aspx");
                    }
                }
            }
        }

        protected bool checkAllInfoAfterInsertOrder()
        {
            if (Session["username"] == null) return false;
            if (Session["checkoutIdAddress"] == null) return false;
            if (Session["idShippingFee"] == null) return false;

            DataTable dtCart = CartStorage.getCurrentCart();
            if (dtCart == null && dtCart.Rows.Count == 0) return false;

            return true;
        }
    }
}