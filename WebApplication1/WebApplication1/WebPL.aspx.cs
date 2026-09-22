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
    /// 评论页：展示某条微博及其评论列表，并可发表新评论。
    /// URL 参数 id 指定是哪条微博。
    /// </summary>
    public partial class WebPL : System.Web.UI.Page
    {
        private string UID;   // 当前登录用户 ID（字符串形式）

        protected void Page_Load(object sender, EventArgs e)
        {
            // 注意：登录页存的是小写 Session["id"]，这里也要用小写，
            // 原 GUI 用的是大写 "ID"，取不到会报空引用，已修正。
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            UID = Session["id"].ToString();
            this.Label1.Text = UID;

            // 通过 URL 参数 ?id=xxx 指定微博
            if (Request.QueryString["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"]);
                // 绑定被评论的那条微博
                this.Repeater1.DataSource = MicroBlogManager.SearchAllPL(pid);
                this.Repeater1.DataBind();
                // 绑定该微博下的所有评论
                this.Repeater2.DataSource = MicroBlogManager.SearchAllPLQ(pid);
                this.Repeater2.DataBind();
            }
        }

        // 这个方法目前没有用到，预留扩展
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }

        /// <summary>
        /// 原微博配图：有图输出图片标签，无图输出空字符串。
        /// </summary>
        protected string ImgHtml(object img)
        {
            string s = img as string;
            if (string.IsNullOrEmpty(s)) return "";
            return "<img class=\"feed-img\" src=\"images/" + s + "\" alt=\"\" />";
        }

        /// <summary>
        /// 点击「发送评论」：把评论内容写入 tb_Pinglun，成功后刷新评论列表。
        /// </summary>
        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            string neirong = this.TextBox1.Text.Trim();
            if (string.IsNullOrEmpty(neirong)) return;   // 空评论不发

            if (Request.QueryString["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"]);
                if (MicroBlogManager.InsertPL(UID, neirong, pid))
                {
                    this.Repeater2.DataSource = MicroBlogManager.SearchAllPLQ(pid);
                    this.Repeater2.DataBind();
                    this.TextBox1.Text = "";
                }
            }
        }
    }
}
