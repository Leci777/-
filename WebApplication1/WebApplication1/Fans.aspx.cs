using BLL;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    /// <summary>
    /// 粉丝页：展示当前用户的全部粉丝，可回粉或移除。
    /// </summary>
    public partial class Fans : System.Web.UI.Page
    {
        private int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        /// <summary>
        /// 绑定当前用户的粉丝列表及粉丝数量。
        /// </summary>
        private void Bind()
        {
            using (blogWebsiteDBEntities7 db = new blogWebsiteDBEntities7())
            {
                id = Convert.ToInt32(Session["id"]);
                this.Repeater1.DataSource = db.tb_fens.Where(n => n.userID == id).ToList();
                this.Repeater1.DataBind();
                this.Label1.Text = db.tb_fens.Where(n => n.userID == id).Count().ToString();
            }
        }

        /// <summary>
        /// 点击「移除粉丝」：从 tb_fens 删除对应记录。
        /// </summary>
        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            using (blogWebsiteDBEntities7 db = new blogWebsiteDBEntities7())
            {
                int fid = Convert.ToInt32(e.CommandArgument);
                var pd = db.tb_fens.SingleOrDefault(p => p.id == fid);
                if (pd != null)
                {
                    db.tb_fens.Remove(pd);
                    db.SaveChanges();
                    Response.Write("<script>alert('移除成功')</script>");
                }
                Bind();
            }
        }

        /// <summary>
        /// 点击「回粉」：预留，目前为空实现。
        /// </summary>
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            // 回粉逻辑待实现
        }
    }
}
