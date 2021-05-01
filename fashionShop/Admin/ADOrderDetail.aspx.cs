using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class ADOrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usernameAD"] == null)
            {
                Response.Redirect("~/Admin/ADLogin.aspx");
            }
            if (!IsPostBack)
            {

                if (Request.QueryString.Get("idOrder") != null)
                {
                    string idOrder = Request.QueryString.Get("idOrder");
                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    string sql = "SELECT P.ID_PRODUCT, PRODUCT_NAME, DETAIL_PRICE, IMAGES, DETAIL_S, DETAIL_M, DETAIL_L, DETAIL_XL, DETAIL_XXL, DETAIL_OVERSIZE, DBO.TOTAL_MONEY_ORDER(O.ID_ORDER) AS TOTAL_MONEY, DBO.SHOW_STATUS(ORDER_STATUS) AS SHOW_STATUS, ORDER_STATUS FROM ORDERS O, ORDER_DETAIL OD, PRODUCT P WHERE O.ID_ORDER = OD.ID_ORDER AND OD.ID_PRODUCT = P.ID_PRODUCT AND O.ID_ORDER = " + idOrder;

                    DataTable dtDH = dataAccess.LayBangDuLieu(sql);

                    if (dtDH != null && dtDH.Rows.Count > 0)
                    {
                        int trangThai = int.Parse(dtDH.Rows[0]["ORDER_STATUS"].ToString());

                        this.rptSP.DataSource = dtDH;
                        this.rptSP.DataBind();

                        lblTong.Text = String.Format("{0:n0}", int.Parse(dtDH.Rows[0]["TOTAL_MONEY"].ToString())) + " vnd";

                        if (trangThai == 0)
                        {
                            lbDaGiao.Style.Add("display", "none");
                            btnDuyetSangCho.Style.Add("display", "none");
                            btnHuy.Style.Add("display", "none");
                            btnDuyet.Style.Add("display", "none");
                        }
                        else if (trangThai == 1)
                        {
                            btnHuySangCho.Style.Add("display", "none");
                            lbDaGiao.Style.Add("display", "none");
                            btnDuyetSangCho.Style.Add("display", "none");
                        }
                        else if (trangThai == 2)
                        {
                            btnDuyet.Style.Add("display", "none");
                            btnHuy.Style.Add("display", "none");
                            btnHuySangCho.Style.Add("display", "none");
                        }
                    }

                    string sqlKH = "SELECT FULLNAME, O.EMAIL, O.PHONE, O.ADDRESS FROM ACCOUNT A, ORDER O WHERE A.ID_ACCOUNT = O.ID_ACCOUNT AND ID_ORDER=" + idOrder;
                    DataTable dt = dataAccess.LayBangDuLieu(sqlKH);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtTen.Text = dt.Rows[0]["FULLNAME"].ToString();
                        //txtMatKhauCu.Text = dt.Rows[0]["MATKHAU"].ToString();
                        txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                        txtDiaChi.Text = dt.Rows[0]["ADDRESS"].ToString();
                        txtSDT.Text = dt.Rows[0]["PHONE"].ToString();
                    }
                    dataAccess.DongKetNoiCSDL();
                }
            }
        }
        protected void btnChoSangHuy_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idOrder") != null && Request.QueryString.Get("p") != null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("p"));
                string idOrder = Request.QueryString.Get("idOrder");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("CANCEL_ORDER", dataAccess.getConnection());

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID_ORDER", int.Parse(idOrder));

                cmd.ExecuteNonQuery();


                dataAccess.DongKetNoiCSDL();
                if (trangTruoc == 0)
                {
                    Response.Redirect("ADCanceledOrders.aspx");

                }
                if (trangTruoc == 1)
                {
                    Response.Redirect("ADPendingOrders.aspx");
                }
                if (trangTruoc == 2)
                {
                    Response.Redirect("ADSuccessedOrders.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADHome.aspx");
                }
            }

        }

        protected void btnHuySangCho_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idOrder") != null && Request.QueryString.Get("p") != null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("p"));
                string idOrder = Request.QueryString.Get("idOrder");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("CANCEL_TO_PENDING_ORDER", dataAccess.getConnection());

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID_ORDER", int.Parse(idOrder));

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                if (trangTruoc == 0)
                {
                    Response.Redirect("ADCanceledOrder.aspx");

                }
                if (trangTruoc == 1)
                {
                    Response.Redirect("ADPendingOrder.aspx");
                }
                if (trangTruoc == 2)
                {
                    Response.Redirect("ADSuccessedOrder.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADHome.aspx");
                }
            }
        }

        protected void btnChoSangDuyet_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idOrder") != null && Request.QueryString.Get("p") != null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("p"));
                string idOrder = Request.QueryString.Get("idOrder");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("APPROVE_ORDER", dataAccess.getConnection());

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID_ORDER", int.Parse(idOrder));

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                if (trangTruoc == 0)
                {
                    Response.Redirect("ADCanceledOrder.aspx");

                }
                if (trangTruoc == 1)
                {
                    Response.Redirect("ADPendingOrder.aspx");
                }
                if (trangTruoc == 2)
                {
                    Response.Redirect("ADSuccessedOrder.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADHome.aspx");
                }
            }
        }
        protected void btnDuyetSangCho_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idOrder") != null && Request.QueryString.Get("p") != null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("p"));
                string idOrder = Request.QueryString.Get("idOrder");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "UPDATE ORDER SET ORDER_STATUS = 1 WHERE ID_ORDER =" + idOrder;

                SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                if (trangTruoc == 0)
                {
                    Response.Redirect("ADCanceledOrder.aspx");

                }
                if (trangTruoc == 1)
                {
                    Response.Redirect("ADPendingOrder.aspx");
                }
                if (trangTruoc == 2)
                {
                    Response.Redirect("ADSuccessedOrder.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADHome.aspx");
                }
            }
        }
    }
}