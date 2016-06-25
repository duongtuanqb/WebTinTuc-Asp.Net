using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class index : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblBaiViet.Text = data.Post1s.Count().ToString();
                lblDanhMuc.Text = data.Categories.Count().ToString();
            }
        }
    }
}