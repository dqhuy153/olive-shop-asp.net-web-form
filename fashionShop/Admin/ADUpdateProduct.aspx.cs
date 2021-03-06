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
    public partial class ADUpdateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckAuth.CheckAdmin();

            if (!IsPostBack)
            {
                //Lay id san pham tu duoi website
                string idSP = Request.QueryString.Get("idProduct").ToString();

                //Tao nhanh connection va cac phuong thuc voi connection nho class DataAccess
                DataAccess dataAccess = new DataAccess();

                //sql doc du lieu tu dtb
                string sqlSP = "SELECT ID_PRODUCT, P.ID_CATEGORY, PRODUCT_NAME, INFORMATION, IMAGES, S, M, L, XL, XXL, OVERSIZE, PRICE, SOLD_QUANTITY, PRODUCT_STATUS, CATEGORY_NAME FROM PRODUCT P, CATEGORY C WHERE P.ID_CATEGORY = C.ID_CATEGORY AND ID_PRODUCT="+idSP;
                string sqlCategory = "SELECT ID_CATEGORY, CATEGORY_NAME, ID_GENDER FROM CATEGORY C WHERE ID_GENDER = (SELECT ID_GENDER FROM CATEGORY C, PRODUCT P WHERE P.ID_CATEGORY = C.ID_CATEGORY AND ID_PRODUCT ="+idSP+")";

                dataAccess.MoKetNoiCSDL();

                DataTable dtSP = dataAccess.LayBangDuLieu(sqlSP);

                if (dtSP != null && dtSP.Rows.Count > 0)
                {
                    //Set du lieu cho cac field html
                    txtTenSP.Text = dtSP.Rows[0]["PRODUCT_NAME"].ToString();

                    //Tao command de lay du lieu tu dtb
                    SqlCommand cmdCategory = new SqlCommand(sqlCategory, dataAccess.getConnection());

                    string[] arrImages = dtSP.Rows[0]["IMAGES"].ToString().Split('|');
                    //ket noi link anh cho img (ImageUrl="~/Uploads/ip11.jpg") 

                    foreach(var img in arrImages)
                    {
                        PanelImage.Controls.Add(new Image { ImageUrl = "~/Uploads/" + img.ToString()});
                     }

                    DataTable dtGender = dataAccess.LayBangDuLieu(sqlCategory);

                    int idGender = int.Parse(dtGender.Rows[0]["ID_GENDER"].ToString());

                    String sqlGender = "SELECT * FROM GENDER WHERE ID_GENDER = " + idGender;
                    DataTable dtgd = dataAccess.LayBangDuLieu(sqlGender);

                    if (dtgd != null && dtgd.Rows.Count > 0)
                    {
                        lblGender.Text = dtgd.Rows[0]["GENDER_NAME"].ToString();
                    }

                    //Bind dl tu dtb vao dropdownlist
                    ddlCategories.DataSource = cmdCategory.ExecuteReader();
                    ddlCategories.DataTextField = "CATEGORY_NAME";
                    ddlCategories.DataValueField = "ID_CATEGORY";
                    ddlCategories.DataBind();

                    ddlCategories.Items.Insert(0, new ListItem("---Pick a category---", "-1"));

                    //Xet du lieu nhan vao tu QueryString
                    ddlCategories.Items.FindByValue(dtSP.Rows[0]["ID_CATEGORY"].ToString()).Selected = true;

                    string price = dtSP.Rows[0]["PRICE"].ToString().Replace(',','.');

                    //fill text tu dtb vao cac textarea
                    txtTenSP.Text = dtSP.Rows[0]["PRODUCT_NAME"].ToString();
                    txtInfo.Text = dtSP.Rows[0]["INFORMATION"].ToString();
                    txtGia.Text = price;
                    txtS.Text = dtSP.Rows[0]["S"].ToString();
                    txtM.Text = dtSP.Rows[0]["M"].ToString();
                    txtL.Text = dtSP.Rows[0]["L"].ToString();
                    txtXL.Text = dtSP.Rows[0]["XL"].ToString();
                    txtXXL.Text = dtSP.Rows[0]["XXL"].ToString();
                    txtOversize.Text = dtSP.Rows[0]["OVERSIZE"].ToString();
                    txtSLDaBan.Text = dtSP.Rows[0]["SOLD_QUANTITY"].ToString();
                    txtXL.Text = dtSP.Rows[0]["XL"].ToString();

                    if (dtSP.Rows[0]["IMAGES"].ToString() != "")
                    {
                        FileUploadImg.ToolTip = "Ảnh đã lưu trước đó: " + dtSP.Rows[0]["IMAGES"].ToString();
                    }

                    //status
                    rblTinhTrang.Items.FindByValue((dtSP.Rows[0]["PRODUCT_STATUS"].Equals(true)) ? 1 + "" : 0 + "").Selected = true;
                }

                //dong connection
                dataAccess.DongKetNoiCSDL();
            }
        }
        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idProduct").ToString();

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
            
            string imgParams = (fileNamesToDtb.Trim() != "") ? fileNamesToDtb.Trim().TrimEnd('|') : "";

            SqlCommand cmd = new SqlCommand("UPDATE_PRODUCT", dataAccess.getConnection());

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ID_PRODUCT", int.Parse(idSP));
            cmd.Parameters.AddWithValue("@ID_CATEGORY", int.Parse(ddlCategories.SelectedValue));
            cmd.Parameters.AddWithValue("@PRODUCT_NAME", txtTenSP.Text.Trim());
            cmd.Parameters.AddWithValue("@INFORMATION", txtInfo.Text.Trim());
            cmd.Parameters.AddWithValue("@S", txtS.Text.Trim());
            cmd.Parameters.AddWithValue("@M", txtM.Text.Trim());
            cmd.Parameters.AddWithValue("@L", txtL.Text.Trim());
            cmd.Parameters.AddWithValue("@XL", txtXL.Text.Trim());
            cmd.Parameters.AddWithValue("@XXL", txtXXL.Text.Trim());
            cmd.Parameters.AddWithValue("@OVERSIZE", txtOversize.Text.Trim());
            cmd.Parameters.AddWithValue("@IMAGES", imgParams);
            cmd.Parameters.AddWithValue("@PRICE", txtGia.Text.Trim());
            cmd.Parameters.AddWithValue("@SOLD_QUANTITY", int.Parse(txtSLDaBan.Text));
            cmd.Parameters.AddWithValue("@PRODUCT_STATUS", rblTinhTrang.SelectedValue);
           
            cmd.ExecuteNonQuery();
            dataAccess.DongKetNoiCSDL();

            Response.Redirect("ADMNProduct.aspx");                     
            
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADMNProduct.aspx");
        }
    }
    
}