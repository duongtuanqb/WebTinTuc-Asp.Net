using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class dang_nhap : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
         
            var dl = data.User_Search(txtUsername.Text.Trim(), txtUserpass.Text.Trim());
            var kt = dl.Count();

            if (kt > 0)
            {
                Session["user"] = true;
                Session["user_name"] = txtUsername.Text;
                Response.Redirect("/admin");
            }
            else
            {
                lblThongBaoDangNhap.Text = "Đăng nhập thất bại";
                txtUsername.Focus();
            }
            
        }
    }
}