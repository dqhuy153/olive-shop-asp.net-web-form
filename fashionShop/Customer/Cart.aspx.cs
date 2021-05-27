using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Customer
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //cart empty
            if (!IsPostBack)
            {
                if (Session["username"] == null && Session["cart"] == null)
                {
                    lbEmptyCart.Text = "Cart's empty";
                }
                else if (Cache[$"{Session["username"]}-cart"] == null)
                {
                    lbEmptyCart.Text = "Cart's empty";
                }

                DtDetailCart();
            }
        }

        //show cart items detail
        protected void DtDetailCart()
        {
            DataTable dtDetailCart = CartStorage.getDetailCart();

            rptProducts.DataSource = dtDetailCart;
            rptProducts.DataBind();
            rptProducts.Visible = true;

            this.Master.CartQuantity = $"({dtDetailCart.Rows.Count})";

            Decimal totalCart = 0;

            foreach (DataRow dataRow in dtDetailCart.Rows)
            {
                foreach (RepeaterItem item in rptProducts.Items)
                {
                    Label lbID = (Label)item.FindControl("lbID");
                    Label lbSize = (Label)item.FindControl("lbSize");

                    if (!String.IsNullOrEmpty(lbID.Text))
                    {
                        continue;
                    }
                    else
                    {
                        lbID.Text = dataRow["ID_PRODUCT"].ToString();
                        lbSize.Text = dataRow["SIZE"].ToString();
                        break;
                    }
                }

                totalCart += (Decimal.Parse(dataRow["PRICE"].ToString()) * int.Parse(dataRow["QUANTITY"].ToString()));
            }

            lbTotalCart.Text = String.Format("{0:n2}", Decimal.Parse(totalCart.ToString()));
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            //Find the button control
            LinkButton btn = (LinkButton)sender;
            //Get the repeater selected row
            RepeaterItem ritem = (RepeaterItem)btn.NamingContainer;

            DataTable dtCart = CartStorage.getCurrentCart();

            Label lbId = (Label)ritem.FindControl("lbID");
            Label lbSize = (Label)ritem.FindControl("lbSize");
            string idProduct = lbId.Text;
            string size = lbSize.Text;

            foreach (DataRow dataRow in dtCart.Rows)
            {
                if (dataRow["ID_PRODUCT"].ToString() == idProduct)
                {
                    dataRow[size] = int.Parse(dataRow[size].ToString()) + 1;
                    break;
                }
            }

            DtDetailCart();
        }

        protected void btnDescrease_Click(object sender, EventArgs e)
        {
            //Find the button control
            LinkButton btn = (LinkButton)sender;
            //Get the repeater selected row
            RepeaterItem ritem = (RepeaterItem)btn.NamingContainer;

            DataTable dtCart = CartStorage.getCurrentCart();

            Label lbId = (Label)ritem.FindControl("lbID");
            Label lbSize = (Label)ritem.FindControl("lbSize");
            string idProduct = lbId.Text;
            string size = lbSize.Text;

            foreach (DataRow dataRow in dtCart.Rows)
            {
                if (dataRow["ID_PRODUCT"].ToString() == idProduct)
                {
                    int quantity = int.Parse(dataRow[size].ToString());
                    if(quantity > 1)
                    {
                        dataRow[size] = quantity - 1;
                    }
                    break;
                }
            }

            DtDetailCart();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                //Find the button control
                LinkButton btn = (LinkButton)sender;
                //Get the repeater selected row
                RepeaterItem ritem = (RepeaterItem)btn.NamingContainer;

                DataTable dtCart = CartStorage.getCurrentCart();

                Label lbId = (Label)ritem.FindControl("lbID");
                Label lbSize = (Label)ritem.FindControl("lbSize");
                string idProduct = lbId.Text;
                string size = lbSize.Text;

                foreach (DataRow dataRow in dtCart.Rows)
                {
                    if (dataRow["ID_PRODUCT"].ToString() == idProduct)
                    {
                        dataRow[size] = 0;
                        break;
                    }
                }

                DtDetailCart();
            }
        }
    }
}