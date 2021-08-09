using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Customer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckCustomer("OrderLists.aspx");

            if (Request.QueryString["idOrder"] != null)
            {
                int idOrder = int.Parse(Request.QueryString["idOrder"].ToString());
                //show order's item detail

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "SELECT *, DBO.TOTAL_ORDER(O.ID_ORDER) AS TOTAL, DBO.GET_USERNAME_FROM_ID_ACCOUNT(O.ID_ACCOUNT) AS USERNAME, DBO.STATUS_ORDER_TEXT(ORDER_STATUS) AS STATUS " +
                    "FROM ORDERS O, ORDER_DETAIL OD, PRODUCT P, COUNTRY C " +
                    "WHERE O.ID_ORDER = OD.ID_ORDER " +
                        "AND O.ID_COUNTRY = C.ID_COUNTRY " +
                        "AND OD.ID_PRODUCT = P.ID_PRODUCT " +
                        "AND O.ID_ORDER = " + idOrder;

                DataTable dtOrder = dataAccess.LayBangDuLieu(sql);

                dataAccess.DongKetNoiCSDL();
                
                if (dtOrder != null && dtOrder.Rows.Count > 0)
                {
                    //check if customer access to their order or not
                    if (Session["username"].ToString() != dtOrder.Rows[0]["USERNAME"].ToString())
                    {
                        Response.Redirect("Home.aspx");
                    }

                    //Check status of order => show button suitable
                    int idStatus = int.Parse(dtOrder.Rows[0]["ORDER_STATUS"].ToString());
                    //canceled order
                    if (idStatus == 0)
                    {
                        
                    }
                    //pending order
                    else if(idStatus == 1)
                    {
                        btnCancelOrder.Visible = true;
                    }
                    //delivering order
                    else if(idStatus == 2)
                    {
                        btnTrackingOrder.Visible = true;
                    }
                    //successful order
                    else if(idStatus == 10)
                    {
                        btnRating.Visible = true;
                    }

                    //seprate order detail => each product with their size
                    DataTable dtDetailOrder = new DataTable();
                    dtDetailOrder.Columns.Add("ID_PRODUCT");
                    dtDetailOrder.Columns.Add("PRODUCT_NAME");
                    dtDetailOrder.Columns.Add("SIZE");
                    dtDetailOrder.Columns.Add("QUANTITY");
                    dtDetailOrder.Columns.Add("PRICE");
                    dtDetailOrder.Columns.Add("IMAGE");

                    ArrayList sizes = new ArrayList() { "DETAIL_S", "DETAIL_M", "DETAIL_L", "DETAIL_XL", "DETAIL_XXL", "DETAIL_OVERSIZE" };

                    foreach (DataRow dataRow in dtOrder.Rows)
                    {
                        foreach (DataColumn dataColumn in dtOrder.Columns)
                        {
                            if (sizes.Contains(dataColumn.ColumnName) && int.Parse(dataRow[dataColumn].ToString()) > 0)
                            {
                                DataRow itemRow = dtDetailOrder.NewRow();
                                itemRow["ID_PRODUCT"] = dataRow["ID_PRODUCT"];
                                itemRow["PRODUCT_NAME"] = dataRow["PRODUCT_NAME"];
                                itemRow["SIZE"] = dataColumn.ColumnName.Replace("DETAIL_", "");
                                itemRow["QUANTITY"] = dataRow[dataColumn];
                                itemRow["PRICE"] = dataRow["DETAIL_PRICE"];
                                itemRow["IMAGE"] = dataRow["IMAGES"].ToString().Split('|')[0];

                                dtDetailOrder.Rows.Add(itemRow);
                            }
                        }
                    }

                    rptOrderDetail.DataSource = dtDetailOrder;
                    rptOrderDetail.DataBind();

                    //show total
                    double total = double.Parse(dtOrder.Rows[0]["TOTAL"].ToString());
                    double shippingFee = double.Parse(dtOrder.Rows[0]["SHIPPING_FEE"].ToString());

                    lbSubtotal.Text = "$" + (total - shippingFee).ToString();
                    lbShippingFee.Text = "$" + shippingFee.ToString();
                    lbTotal.Text = "$" + total.ToString();

                    //show status, note and date
                    lbIdOrder.Text = dtOrder.Rows[0]["ID_ORDER"].ToString();
                    lbStatus.Text = dtOrder.Rows[0]["STATUS"].ToString();
                    lbDate.Text = dtOrder.Rows[0]["ORDER_DATE"].ToString();

                    if (dtOrder.Rows[0]["ORDER_NOTE"] != null && dtOrder.Rows[0]["ORDER_NOTE"].ToString().Trim() != "")
                    {
                        lbNote.Text = dtOrder.Rows[0]["ORDER_NOTE"].ToString();
                    }
                    else
                    {
                        lbNote.Text = "None";
                    }

                    //show address
                    lbFullName.Text = $"{dtOrder.Rows[0]["ORDER_FULL_NAME"]}";
                    lbPhone.Text = $"{dtOrder.Rows[0]["ORDER_PHONE"]}";
                    lbStreet.Text = $"{dtOrder.Rows[0]["ORDER_STREET"]}";
                    lbAddressDetail.Text = $"{dtOrder.Rows[0]["ORDER_CITY"]}, {dtOrder.Rows[0]["ORDER_ZIP_CODE"]} / {dtOrder.Rows[0]["NAME_CAP"]}";
                }
            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                if (Request.QueryString["idOrder"] != null)
                {
                    string idOrder = Request.QueryString["idOrder"].ToString();
                    string sql = "UPDATE ORDERS SET ORDER_STATUS = 0 WHERE ID_ORDER = " + idOrder;

                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());
                    cmd.ExecuteNonQuery();

                    dataAccess.DongKetNoiCSDL();

                    Response.Redirect("OrderLists.aspx");
                }                
            }
        }      
    }
}