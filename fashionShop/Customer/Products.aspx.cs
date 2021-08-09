using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace fashionShop.Customer
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                locationGender.Visible = false;
                locationCategory.Visible = false;
                locationMainCategory.Visible = false;

                //check filter (featured + size)
                CheckBoxFilter("featured","is_featured", cbIsFeatured, hplIsFeatured);
                CheckBoxFilter("featured","in_stock", cbInStock, hplInStock);
                CheckBoxFilter("size","S", cbS, hplS);
                CheckBoxFilter("size","M", cbM, hplM);
                CheckBoxFilter("size","L", cbL, hplL);
                CheckBoxFilter("size","XL", cbXL, hplXL);
                CheckBoxFilter("size","XXL", cbXXL, hplXXL);
                CheckBoxFilter("size","OverSize", cbOverSize, hplOverSize);

                //check link clear filter
                CheckClearBtnFilter("featured", hplClearFeatured);
                CheckClearBtnFilter("size", hlpClearSize);

                //check sort              
                SortFilter("newest", cbNewest, hplNewest);
                SortFilter("featured", cbOrderFeatured, hplOrderFeatured);
                SortFilter("priceAsc", cbPriceAsc, hplPriceAsc);
                SortFilter("priceDesc", cbPriceDesc, hplPriceDesc);

                SortInfo();


                //If no filter (no query string)
                //List all items
                if (Request.QueryString.Count == 0 &&
                    Request.QueryString.Get("mc") == null && 
                    Request.QueryString.Get("g") == null &&
                    Request.QueryString.Get("c") == null)
                {
                    FilterProduct();
                    locationMainCategory.Visible = true;
                    hplinkMainCategory.Text = "All New";
                }

                //has filters
                //Add filter (category + search)
                //Add route
                else
                {              
                    FilterProduct(
                        (Request.QueryString["mc"] != null) ? Request.QueryString["mc"].ToString() : "",
                        (Request.QueryString["g"] != null) ? Request.QueryString["g"].ToString() : "",
                        (Request.QueryString["c"] != null) ? Request.QueryString["c"].ToString().Replace(" and "," & ") : "",
                        (Request.QueryString["search"] != null) ? Request.QueryString["search"].ToString() : "",
                        (Request.QueryString["featured"] != null) ? Request.QueryString["featured"].ToString() : "",
                        (Request.QueryString["size"] != null) ? Request.QueryString["size"].ToString() : "",
                        (Request.QueryString["sort"] != null) ? Request.QueryString["sort"].ToString() : ""
                    );

                    //Add route
                    if (Request.QueryString["mc"] != null)
                    {
                        string mainCategoryName = Request.QueryString["mc"].ToString();
                        locationMainCategory.Visible = true;
                        hplinkMainCategory.NavigateUrl = "Products.aspx?mc=" + mainCategoryName;
                        hplinkMainCategory.Text = mainCategoryName;
                    }
                    if (Request.QueryString["g"] != null)
                    {
                        string genderName = Request.QueryString["g"].ToString();
                        locationGender.Visible = true;
                        hplGender.NavigateUrl = $"Products.aspx?{((Request.QueryString["mc"] != null) ? "mc=" + Request.QueryString["mc"].ToString() + "&" : "")}g={ genderName}";
                        hplGender.Text = genderName;
                    }
                    if (Request.QueryString["c"] != null)
                    {
                        string categoryName = Request.QueryString["c"].ToString().Replace(" and "," & ");
                        locationCategory.Visible = true;
                        hplinkCategory.NavigateUrl = $"Products.aspx?{((Request.QueryString["mc"] != null) ? "mc=" + Request.QueryString["mc"].ToString() + "&" : "")}{((Request.QueryString["g"] != null) ? "g=" + Request.QueryString["g"].ToString() + "&" : "")}c={categoryName}";
                        hplinkCategory.Text = categoryName;
                    }

                    //for search result response
                    if (Request.QueryString["search"] != null & Request.QueryString.Count == 1)
                    {
                        lbResultSearch.Text = "Result for '" + Request.QueryString["search"].ToString() + "'";
                        locationMainCategory.Visible = true;
                        hplinkMainCategory.Text = "Search";
                    }               
                }
            }
        }

        //--Function--
        //filter product via queryStrings
        protected void FilterProduct
        (
            string mainCategory = "", 
            string gender = "", 
            string category = "", 
            string search = "", 
            string featured = "", 
            string sizes = "", 
            string sort = ""
        )
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string[] featuredArr = featured.Split('-');
            string[] sizesArr = sizes.Split('-');

            SqlCommand cmd = new SqlCommand("FILTER_PRODUCT", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MAIN_CATEGORY_NAME", mainCategory);
            cmd.Parameters.AddWithValue("@GENDER_NAME", gender);
            cmd.Parameters.AddWithValue("@CATEGORY_NAME", category);
            cmd.Parameters.AddWithValue("@SEARCH_STRING", search);
            cmd.Parameters.AddWithValue("@SORT", sort);

            if(featuredArr.Length > 0 && featuredArr[0] != "")
            {
                foreach(string featuredItem in featuredArr)
                {
                    cmd.Parameters.AddWithValue("@" + featuredItem.ToUpper(), 1);
                }
            }
            
            if(sizesArr.Length > 0 && sizesArr[0] != "")
            {
                foreach(string sizeItem in sizesArr)
                {
                    cmd.Parameters.AddWithValue("@" + sizeItem, 1);
                }
            }
 
            rptProducts.DataSource = cmd.ExecuteReader();
            rptProducts.DataBind();

            dataAccess.DongKetNoiCSDL();
        }

        //check filter (featured + size)
        protected void CheckBoxFilter(string queryString, string value, HtmlInputCheckBox checkBox, HyperLink hyperLink)
        {
            //get current url (localhost:xxx/../..?queryStrings) & current path (/../..?..)
            //and separte url to host & queryStrings
            string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
            string currentPath = HttpContext.Current.Request.Url.AbsolutePath;

            string[] separateURL = currentUrl.Split('?');

            //if url not contain query string
            if (separateURL.Length == 1)
            {           
                checkBox.Checked = false;
                hyperLink.NavigateUrl = currentPath + "?" + queryString + "=" + value;
                checkBox.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
            }
            //already has query strings
            else
            {
                NameValueCollection queryStrings = HttpUtility.ParseQueryString(separateURL[1]);
                
                //if no filter added (size)
                if (Request.QueryString[queryString] == null)
                {
                    checkBox.Checked = false;
                    queryStrings[queryString] = value;
                    hyperLink.NavigateUrl = currentPath + "?" + queryStrings.ToString();
                    checkBox.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
                }
                else
                {
                    //if has filter added (size)
                    string[] valuesArr = Request.QueryString[queryString].ToString().Split('-');

                    foreach(string valueInArr in valuesArr)
                    {
                        //if filter value exists
                        //then remove from list filter (size)
                        if(valueInArr == value)
                        {
                            checkBox.Checked = true;
                            valuesArr = valuesArr.Where(val => val != value).ToArray();

                            //if no filter after remove (?size=null)
                            if(valuesArr.Length == 0)
                            {
                                queryStrings.Remove(queryString);                          
                            }
                            
                            //if still has filter (size)
                            else
                            {
                                string valuesAfterRemove = string.Join("-", valuesArr);
                                queryStrings[queryString] = valuesAfterRemove;
                            }

                            hyperLink.NavigateUrl = currentPath + "?" + queryStrings.ToString();
                            checkBox.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
                            return;
                        }
                    }

                    //if values not exists in filter query string 
                    queryStrings[queryString] += ("-" + value);
                    hyperLink.NavigateUrl = currentPath + "?" + queryStrings.ToString();
                    checkBox.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
                }
            }
        }

        //check clear button filter 
        protected void CheckClearBtnFilter(string queryString, HyperLink hyperLink)
        {
            string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
            string currentPath = HttpContext.Current.Request.Url.AbsolutePath;

            string[] separateURL = currentUrl.Split('?');

            if (separateURL.Length == 1)
            {
                hyperLink.Style.Add("display", "none");
            }
            else
            {
                NameValueCollection queryStrings = HttpUtility.ParseQueryString(separateURL[1]);

                //if no filter added (size)
                if (Request.QueryString[queryString] == null)
                {
                    hyperLink.Style.Add("display", "none");
                }
                else
                {
                    hyperLink.Style.Add("display", "initial");
                    queryStrings.Remove(queryString);
                    hyperLink.NavigateUrl = currentPath + "?" + queryStrings.ToString();
                    lbNotiyFilter.Text = "Filtered! Click to show your filter.";
                    lbNotiyFilter.Style.Add("color", "#333 !important");
                }
            }
        }

        //check sort
        protected void SortFilter(string valueQueryString, HtmlInputRadioButton radioButton, HyperLink hyperLink)
        {
            string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
            string currentPath = HttpContext.Current.Request.Url.AbsolutePath;

            string[] separateURL = currentUrl.Split('?');

            if (valueQueryString == "newest")
            {

                if (separateURL.Length == 1)
                {
                    hplNewest.NavigateUrl = currentPath;
                    radioButton.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
                    return;
                }
                else
                {
                    NameValueCollection queryStrings = HttpUtility.ParseQueryString(separateURL[1]);
                    queryStrings.Remove("sort");
                    hplNewest.NavigateUrl = currentPath + "?" + queryStrings.ToString();
                    radioButton.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
                    return;
                }
            }

            //if url not contain query string
            if (separateURL.Length == 1)
            {                     
                hyperLink.NavigateUrl = currentPath + "?sort=" + valueQueryString;
            }
            //already has query strings
            else
            {
                NameValueCollection queryStrings = HttpUtility.ParseQueryString(separateURL[1]);
                queryStrings["sort"] = valueQueryString;
                hyperLink.NavigateUrl = currentPath + "?" + queryStrings.ToString();
                radioButton.Attributes.Add("onclick", $"window.location.assign('{hyperLink.NavigateUrl}')");
            }   
        }

        
        //check title sort & selected sort
        protected void SortInfo()
        {
            if(Request.QueryString["sort"] == null)
            {
                cbNewest.Checked = true;
                lbSort.Text = "Newest Items";
            }
            else
            {
                string sort = Request.QueryString["sort"].ToString();
                if(sort == "featured")
                {
                    
                    cbOrderFeatured.Checked = true;
                    lbSort.Text = "Featured Items";
                }
                if (sort == "priceAsc")
                {
                    cbPriceAsc.Checked = true;
                    lbSort.Text = "Price: Ascending";
                }
                if (sort == "priceDesc")
                {
                    cbPriceDesc.Checked = true;
                    lbSort.Text = "Price: Descending";
                }
            }
        }
    }
}