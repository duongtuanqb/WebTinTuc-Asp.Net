using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class category : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpBreadcrumb.DataSource = data.Cat_SelectID(Convert.ToInt32(Request["idcat"]));
                rpBreadcrumb.DataBind();

                rpPost.DataSource = data.Post_SelectIDcat(Convert.ToInt32(Request["idcat"]));
                rpPost.DataBind();

                var catName = data.Cat_SelectID(Convert.ToInt32(Request["idcat"]));

                foreach (var t in catName)
                {
                    Session["title"] = t.Cat_name.ToString();
                }
            }
        }
    }
}