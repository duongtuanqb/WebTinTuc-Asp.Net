using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace WebTinTuc
{
    public partial class index : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var Cats = from cats in data.Categories select cats;

                rpCategories.DataSource = Cats;
                rpCategories.DataBind();

                rpSlideHome.DataSource = data.Post_slide();
                rpSlideHome.DataBind();

            }

        }

        protected void rpCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Repeater rpPosts = (Repeater)e.Item.FindControl("rpPosts");
                
                rpPosts.DataSource = data.Post_SelectHome(rpCategories.Controls.Count);
                rpPosts.DataBind();
                    
            }
        }
    }
}