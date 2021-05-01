using System;
using System.Collections.Generic;
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
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["usernameAD"] == null)
            {
                Response.Redirect("~/Admin/ADLogin.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString.Get("idGender") != null)
                {
                    string idGender = Request.QueryString.Get("idGender");

                    if(int.Parse(idGender) == 1)
                    {
                        lblGender.Text = "Woman";
                    }
                    else if (int.Parse(idGender) == 2)
                    {
                        lblGender.Text = "Man";
                    }
                    else if (int.Parse(idGender) == 3)
                    {
                        lblGender.Text = "Unisex";
                    }

                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    //Fill data vao dropdownlist
                    string sqlCategory = "SELECT * FROM CATEGORY WHERE ID_GENDER ="+idGender;
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
                    SqlCommand cmd = new SqlCommand("INSERT_PRODUCT", dataAccess.getConnection());
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PRODUCT_NAME", txtTenSP.Text);
                    cmd.Parameters.AddWithValue("@INFORMATION", txtInfo.Text);
                    cmd.Parameters.AddWithValue("@IMAGES", fileNamesToDtb.Trim().TrimEnd('|'));
                    cmd.Parameters.AddWithValue("@S", txtS.Text);
                    cmd.Parameters.AddWithValue("@M", txtM.Text);
                    cmd.Parameters.AddWithValue("@L", txtL.Text);
                    cmd.Parameters.AddWithValue("@XL", txtXL.Text);
                    cmd.Parameters.AddWithValue("@XXL", txtXXL.Text);
                    cmd.Parameters.AddWithValue("@OVERSIZE", txtOversize.Text);
                    cmd.Parameters.AddWithValue("@PRICE", int.Parse(txtGia.Text));
                    cmd.Parameters.AddWithValue("@SOLD_QUANTITY", int.Parse(txtSLDaBan.Text));
                    cmd.Parameters.AddWithValue("@PRODUCT_STATUS", int.Parse(rblTinhTrang.SelectedValue));
                    cmd.Parameters.AddWithValue("@ID_CATEGORY", int.Parse(ddlCategories.SelectedValue));

                    cmd.ExecuteNonQuery();
                    dataAccess.DongKetNoiCSDL();

                    Response.Redirect("ADMNProduct.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert(\"You must add at least one image\")</script>");
            }

            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADMNProduct.aspx");
        }

    }
}