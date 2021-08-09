using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionShop.Admin
{
    public partial class AddNewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();

            if (!IsPostBack)
            {
                if (Request.QueryString.Get("idGender") != null)
                {
                    string idGender = Request.QueryString.Get("idGender");

                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    String sqlGender = "SELECT * FROM GENDER WHERE ID_GENDER = " + idGender;
                    DataTable dtGender = dataAccess.LayBangDuLieu(sqlGender);

                    if (dtGender != null && dtGender.Rows.Count > 0)
                    {
                        lblGender.Text = dtGender.Rows[0]["GENDER_NAME"].ToString();
                    }

                    //Fill data vao dropdownlist
                    string sqlCategory = "SELECT * FROM CATEGORY WHERE ID_GENDER =" + idGender;
                    //string sqlSize = "SELECT * FROM SIZE";

                    SqlCommand cmdCategory = new SqlCommand(sqlCategory, dataAccess.getConnection());
                    //SqlCommand cmdSize = new SqlCommand(sqlSize, dataAccess.getConnection());

                    //Bind dl tu dtb vao dropdownlist
                    ddlCategories.DataSource = cmdCategory.ExecuteReader();
                    ddlCategories.DataTextField = "CATEGORY_NAME";
                    ddlCategories.DataValueField = "ID_CATEGORY";
                    ddlCategories.DataBind();

                    ddlCategories.Items.Insert(0, new ListItem("---Pick a category---", "-1"));

                    dataAccess.DongKetNoiCSDL();
                }
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //khai bao path va file name de luu hinh uploaded
            string path = Server.MapPath("~/Uploads");
            string fileNamesToDtb = "";

            if (FileUploadImg.PostedFiles != null && FileUploadImg.PostedFile != null && FileUploadImg.PostedFile.FileName != "")
            {
                foreach (var file in FileUploadImg.PostedFiles)
                {
                    //save each image user's upload to /Uploads file
                    string fileName = "";
                    fileName = Path.GetFileName(file.FileName).Trim();

                    file.SaveAs(string.Format("{0}/{1}", path, fileName));

                    //add filename to string fileNameToDtb
                    fileNamesToDtb += (fileName + "|");
                }
                fileNamesToDtb.Trim().TrimEnd('|');
            }
            else
            {
                Response.Write("<script>alert(\"You must add at least one image\")</script>");
                return;
            }

            if (String.IsNullOrEmpty(txtS.Text)
                && String.IsNullOrEmpty(txtM.Text)
                && String.IsNullOrEmpty(txtL.Text)
                && String.IsNullOrEmpty(txtXL.Text)
                && String.IsNullOrEmpty(txtXXL.Text)
                && String.IsNullOrEmpty(txtOversize.Text)
            )
            {
                Response.Write("<script>alert(\"You must add at least one size\")</script>");
            }
            else
            {
                string imgParams = (fileNamesToDtb.Trim() != "") ? fileNamesToDtb.Trim().TrimEnd('|') : "";

                SqlCommand cmd = new SqlCommand("INSERT_PRODUCT", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PRODUCT_NAME", txtTenSP.Text);
                cmd.Parameters.AddWithValue("@INFORMATION", txtInfo.Text);
                cmd.Parameters.AddWithValue("@IMAGES", imgParams);
                cmd.Parameters.AddWithValue("@S", txtS.Text);
                cmd.Parameters.AddWithValue("@M", txtM.Text);
                cmd.Parameters.AddWithValue("@L", txtL.Text);
                cmd.Parameters.AddWithValue("@XL", txtXL.Text);
                cmd.Parameters.AddWithValue("@XXL", txtXXL.Text);
                cmd.Parameters.AddWithValue("@OVERSIZE", txtOversize.Text);
                cmd.Parameters.AddWithValue("@PRICE", double.Parse(txtGia.Text));
                cmd.Parameters.AddWithValue("@SOLD_QUANTITY", int.Parse(txtSLDaBan.Text));
                cmd.Parameters.AddWithValue("@PRODUCT_STATUS", int.Parse(rblTinhTrang.SelectedValue));
                cmd.Parameters.AddWithValue("@ID_CATEGORY", int.Parse(ddlCategories.SelectedValue));

                cmd.ExecuteNonQuery();
                dataAccess.DongKetNoiCSDL();

                Response.Redirect("ADMNProduct.aspx");
            }



            


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADMNProduct.aspx");
        }

    }
}