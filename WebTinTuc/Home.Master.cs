using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebTinTuc
{
    public partial class Home : System.Web.UI.MasterPage
    {
        NewsDataContext data = new NewsDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpCategories.DataSource = data.Cat_SelectAll();
                rpCategories.DataBind();
                rpBaiQuanTam.DataSource = data.Post_slide();
                rpBaiQuanTam.DataBind();
            }
        }
    }
}