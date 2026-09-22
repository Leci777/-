using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    /// <summary>
    /// 发现页：展示可关注的好友列表，点击「关注」增加其关注数。
    /// 原代码的 LinkButton1_Command 里有一行写了一半（fens.id =）会编译失败，已补全。
    /// </summary>
    public partial class Guanzhu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        /// <summary>
        /// 绑定可关注好友列表（按关注数倒序，取前 11 条）。
        /// </summary>
        private void Bind()
        {
            using (blogWebsiteDBEntities7 db = new blogWebsiteDBEntities7())
            {
                this.Repeater1.DataSource = db.tb_fens.OrderByDescending(n => n.count).Skip(0).Take(11).ToList();
                this.Repeater1.DataBind();
                this.Label1.Text = db.tb_fens.Count().ToString();
            }
        }

        // 预留扩展，目前无内容
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }

        /// <summary>
        /// 点击「关注」：把对应记录的关注数 +1 并提示。
        /// （原代码只写了半句 fens.id = 就断了，这里补全成完整的更新逻辑）
        /// </summary>
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int idd = Convert.ToInt32(e.CommandArgument);
            using (blogWebsiteDBEntities7 db = new blogWebsiteDBEntities7())
            {
                var fens = db.tb_fens.SingleOrDefault(f => f.id == idd);
                if (fens != null)
                {
                    // count 是字符串类型，先转 int 再 +1 后存回
                    int tmp;
                    int cur = int.TryParse(fens.count, out tmp) ? tmp : 0;
                    fens.count = (cur + 1).ToString();
                    db.SaveChanges();
                    Response.Write("<script>alert('关注成功');</script>");
                }
            }
            Bind();
        }
    }
}
