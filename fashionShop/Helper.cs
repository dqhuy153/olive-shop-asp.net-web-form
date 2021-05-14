using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace fashionShop
{
    public static class Helper
    {
        
        public static void DisplayItem(HtmlGenericControl item)
        {
            item.Visible = false;
        }
        
    }
}