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
    /// 微博搜索页：按关键字模糊搜索全部微博，游客和登录用户都能使用。
    /// </summary>
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string kw = Request.QueryString["kw"];
                this.lblKw.Text = Server.HtmlEncode(kw ?? "");

                if (string.IsNullOrEmpty(kw))
                {
                    this.lblCount.Text = "0";
                    this.lblEmpty.Visible = true;
                    return;
                }

                List<MicroBlog> list = MicroBlogManager.SearchByKeyword(kw.Trim());
                this.rptResult.DataSource = list;
                this.rptResult.DataBind();
                this.lblCount.Text = list.Count.ToString();
                this.lblEmpty.Visible = list.Count == 0;
            }
        }

        /// <summary>
        /// 微博配图：有图输出图片标签，无图输出空字符串。
        /// </summary>
        protected string ImgHtml(object img)
        {
            string s = img as string;
            if (string.IsNullOrEmpty(s)) return "";
            return "<dt class=\"news-time-img1\"><img src=\"images/" + s + "\" alt=\"\" /></dt>";
        }
    }
}
