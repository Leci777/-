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
    /// 微博精选：展示点赞数最高的微博（Top 榜）。
    /// </summary>
    public partial class Jingxuan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<MicroBlog> list = MicroBlogManager.SearchAll()
                    .OrderByDescending(x => x.Points_number)
                    .Take(10)
                    .ToList();
                // 老数据没有分类标签的显示为“推荐”
                foreach (var m in list)
                {
                    if (string.IsNullOrEmpty(m.Title)) m.Title = "推荐";
                }

                this.rptJx.DataSource = list;
                this.rptJx.DataBind();
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
