using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace WebTinTuc.admin
{
    public partial class list_posts : System.Web.UI.Page
    {
        NewsDataContext data = new NewsDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = data.Post_SelectAdmin();
                GridView1.DataBind();
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = data.Post_SelectAdmin();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            // Chi tiet
            if (e.CommandName.Equals("detail"))
            {
                int ID = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
                DetailsView1.DataSource = data.Post_SelectID(ID);
                DetailsView1.DataBind();
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(document).ready(function(){$('#detailModal').modal('show');});");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
            }

            // Sua bai viet
            if (e.CommandName.Equals("edit"))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(document).ready(function(){$('#editModal').modal('show');});");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }

            // Xoa bai viet
             if (e.CommandName.Equals("delete"))
                {
                    string code = GridView1.DataKeys[index].Value.ToString();
                    HfDeleteID.Value = code;
                    StringBuilder sb = new StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(document).ready(function(){$('#deleteModal').modal('show');});");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
                }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            data.Post_Delete(Convert.ToInt32( HfDeleteID ));
            GridView1.DataSource = data.Post_SelectAdmin();
            GridView1.DataBind();
            
            StringBuilder sb = new StringBuilder();

            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Xóa thành công');");
            sb.Append("$(document).ready(function(){$('#deleteModal').modal('hide');});");
            sb.Append(@"</script>");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delHideModalScript", sb.ToString(), false);
        }
    }
}