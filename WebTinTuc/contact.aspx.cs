using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class contact : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpCategories.DataSource = data.Cat_SelectAll();
                rpCategories.DataBind();

                iframe.Attributes["src"] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6701026814544!2d106.67226091478798!3d10.836538561044465!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529aae6841d9b%3A0xe81b0cfd3edc8017!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBUcuG6p24gxJDhuqFpIE5naMSpYQ!5e0!3m2!1svi!2s!4v1466533055714";
                iframe.Attributes["width"] = "100%";
                iframe.Attributes["height"] = "450px";
                iframe.Attributes["frameborder"] = "0";
            }
        }
    }
}