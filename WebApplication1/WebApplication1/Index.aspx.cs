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
    /// 我的首页（登录后）：发微博 + 信息流（左侧菜单切换信息源 / 分类标签筛选）+ 热搜。
    /// </summary>
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // 右侧热搜：取前 10 条
                using (blogWebsiteDBEntities3 db = new blogWebsiteDBEntities3())
                {
                    this.Repeater2.DataSource = db.tb_Search.OrderBy(n => n.id).Skip(0).Take(10).ToList();
                    this.Repeater2.DataBind();
                }

                this.Label2.Text = "欢迎 [" + Session["UserEmail"].ToString() + "] 登录";
                BindFeed();
            }
        }

        /// <summary>当前登录用户 ID</summary>
        private int CurId { get { return Convert.ToInt32(Session["id"]); } }

        /// <summary>已赞过的微博 ID 列表，放在 Session 里防止重复点赞</summary>
        private List<int> ZanList
        {
            get
            {
                if (Session["zanList"] == null) Session["zanList"] = new List<int>();
                return (List<int>)Session["zanList"];
            }
        }

        /// <summary>
        /// 绑定信息流：按左侧菜单(feed) 和 分类标签(cat) 筛选。
        /// feed: all 全部关注 / new 最新微博 / special 特别关注 / friend 好友圈
        /// </summary>
        private void BindFeed()
        {
            string feed = Request.QueryString["feed"] ?? "all";
            string cat = Request.QueryString["cat"];
            List<MicroBlog> list = MicroBlogManager.SearchAll();

            switch (feed)
            {
                case "new":      // 最新微博：按发布时间倒序
                    list = list.OrderByDescending(x => x.ReleaseTime).ToList();
                    break;
                case "special":  // 特别关注：点赞最多的前 5 条
                    list = list.OrderByDescending(x => x.Points_number).Take(5).ToList();
                    break;
                case "friend":   // 好友圈：只看别人的微博
                    list = list.Where(x => x.UserInfo.ID != CurId).ToList();
                    break;
                default:         // 全部关注
                    break;
            }

            if (!string.IsNullOrEmpty(cat))
            {
                list = list.Where(x => x.Title == cat).ToList();
            }

            this.Repeater1.DataSource = list;
            this.Repeater1.DataBind();
            this.lblEmpty.Visible = list.Count == 0;
        }

        /// <summary>左侧菜单当前项高亮</summary>
        protected string FeedActive(string feed)
        {
            string cur = Request.QueryString["feed"] ?? "all";
            return cur == feed ? "active" : "";
        }

        /// <summary>分类标签当前项高亮</summary>
        protected string CatActive(string cat)
        {
            string cur = Request.QueryString["cat"] ?? "";
            return cur == cat ? "active" : "";
        }

        /// <summary>点赞按钮文字：已赞显示“已赞”</summary>
        protected string ZanText(object id)
        {
            return ZanList.Contains(Convert.ToInt32(id)) ? "已赞" : "赞";
        }

        /// <summary>点赞按钮样式类：已赞加 zaned</summary>
        protected string ZanClass(object id)
        {
            return ZanList.Contains(Convert.ToInt32(id)) ? "zaned" : "";
        }

        /// <summary>微博配图：有图输出图片标签，无图输出空字符串</summary>
        protected string ImgHtml(object img)
        {
            string s = img as string;
            if (string.IsNullOrEmpty(s)) return "";
            return "<img class=\"feed-img\" src=\"images/" + s + "\" alt=\"\" />";
        }

        /// <summary>
        /// 点击「发送这条微博」：写入 tb_MicroBlog 并刷新信息流。
        /// </summary>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string content = this.TextBox1.Text.Trim();
            if (string.IsNullOrEmpty(content)) return;   // 空内容不发

            if (MicroBlogManager.Insert(Session["id"].ToString(), content))
            {
                BindFeed();
                this.TextBox1.Text = "";
            }
        }

        /// <summary>
        /// 点赞：已在 Session 里赞过的会提示，不重复加赞。
        /// </summary>
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "dz")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                if (ZanList.Contains(id))
                {
                    Response.Write("<script>alert('你已经赞过这条微博啦~')</script>");
                    return;
                }
                if (MicroBlogManager.Updataa(id))
                {
                    ZanList.Add(id);
                    BindFeed();
                }
            }
        }

        /// <summary>
        /// 转发：把原博主昵称 + 原文填到输入框。
        /// </summary>
        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            using (blogWebsiteDBEntities7 db = new blogWebsiteDBEntities7())
            {
                var microBlog = db.tb_MicroBlog.SingleOrDefault(p => p.ID == id);
                if (microBlog != null)
                {
                    this.TextBox1.Text = "转至：" + microBlog.tb_UserInfo.UserName + " " + microBlog.Content_text;
                }
            }
        }
    }
}
