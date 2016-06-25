using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class single : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idCat = Convert.ToInt32(Request["idcat"]);
                int idPost = Convert.ToInt32(Request["id"]);

                rpBreadcrumb.DataSource = data.Cat_SelectID(idCat);
                rpBreadcrumb.DataBind();

                rpContent.DataSource = data.Post_SelectID(idPost);
                rpContent.DataBind();

                rpPostsRandom.DataSource = data.Post_SelectRandom(idCat);
                rpPostsRandom.DataBind();

                var titlePost = data.Post_SelectID(idPost);

                foreach (var t in titlePost)
                {
                    Session["title"] = t.Post_title.ToString();
                }
            }
        }
    }
}