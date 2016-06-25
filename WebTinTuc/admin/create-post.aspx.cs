using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class createpost : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCateogries.DataTextField = "Cat_name";
                ddlCateogries.DataValueField = "ID_cat";
                ddlCateogries.DataSource = data.Cat_SelectAll();
                ddlCateogries.DataBind();
            }
        }

        protected void btnThemBai_Click(object sender, EventArgs e)
        {
            data.Post_Insert(txtTieuDe.Text, txtNoiDung.Text, DateTime.Now, Convert.ToInt32(ddlCateogries.SelectedValue), txtThumb.Text);
        }
    }
}