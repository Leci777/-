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
    /// 游客首页：左侧分类筛选 + 中间轮播/信息流 + 右侧热搜，数据全部来自数据库。
    /// </summary>
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 一次性取出全部微博，轮播和信息流共用，避免重复查库
                List<MicroBlog> all = MicroBlogManager.SearchAll();
                // 老数据没有分类标签（Title 为空），统一显示为“推荐”
                foreach (var m in all)
                {
                    if (string.IsNullOrEmpty(m.Title)) m.Title = "推荐";
                }

                BindBanner(all);
                BindFeed(all);
                BindHot();
            }
        }

        /// <summary>
        /// 轮播图：从带配图的微博里取最多 8 张。
        /// </summary>
        private void BindBanner(List<MicroBlog> all)
        {
            var imgs = all.Where(x => !string.IsNullOrEmpty(x.Content_img)).Take(8).ToList();
            this.rptBanner.DataSource = imgs;
            this.rptBanner.DataBind();
        }

        /// <summary>
        /// 信息流：按 URL 上的 cat 参数筛选分类，没有则显示全部。
        /// </summary>
        private void BindFeed(List<MicroBlog> all)
        {
            string cat = Request.QueryString["cat"];
            if (!string.IsNullOrEmpty(cat))
            {
                all = all.Where(x => x.Title == cat).ToList();
            }

            this.rptFeed.DataSource = all;
            this.rptFeed.DataBind();
            this.lblEmpty.Visible = all.Count == 0;
            this.lblCat.Text = string.IsNullOrEmpty(cat) ? "全部微博" : ("分类 · " + cat);
        }

        /// <summary>
        /// 右侧热搜榜：取前 15 条。
        /// </summary>
        private void BindHot()
        {
            using (blogWebsiteDBEntities3 db = new blogWebsiteDBEntities3())
            {
                this.rptHot.DataSource = db.tb_Search.OrderBy(p => p.id).Skip(0).Take(15).ToList();
                this.rptHot.DataBind();
            }
        }

        /// <summary>
        /// 给左侧当前分类加高亮样式。
        /// </summary>
        protected string CatActive(string cat)
        {
            string cur = Request.QueryString["cat"] ?? "";
            return cur == cat ? "active" : "";
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
