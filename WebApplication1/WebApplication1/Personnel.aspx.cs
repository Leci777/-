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
    /// 个人主页：展示当前用户资料卡 + 自己发的微博列表，支持按内容搜索和删除微博。
    /// </summary>
    public partial class Personnel : System.Web.UI.Page
    {
        private int id;   // 当前登录用户 ID

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            id = Convert.ToInt32(Session["id"]);
            BindProfile();     // 绑定资料卡
            BindMyWeibo();     // 绑定我的微博列表
        }

        /// <summary>
        /// 绑定顶部资料卡（昵称、粉丝数、简介、注册时间、头像）。
        /// </summary>
        private void BindProfile()
        {
            UserInfo userInfo = UserInfoManager.SearchAllid(id);
            this.lbl_yhm.Text = userInfo.UserName;
            this.lbl_fs.Text = userInfo.UserFansNum.ToString();
            this.lbl_jianjie.Text = userInfo.UserAutograph;
            this.lbl_zctime.Text = userInfo.RegisterTime.ToLongDateString();
            this.Image2.ImageUrl = "images/" + userInfo.UserHeadPortrait;
        }

        /// <summary>
        /// 绑定我发的微博，按 tab 参数区分：wb 微博（默认）/ jx 精选 / photo 相册。
        /// </summary>
        private void BindMyWeibo()
        {
            string tab = Request.QueryString["tab"] ?? "wb";
            List<MicroBlog> mlist = MicroBlogManager.SearchAllBYID(id);

            switch (tab)
            {
                case "jx":    // 精选：按点赞数排序
                    mlist = mlist.OrderByDescending(x => x.Points_number).ToList();
                    break;
                case "photo": // 相册：只看带配图的
                    mlist = mlist.Where(x => !string.IsNullOrEmpty(x.Content_img)).ToList();
                    break;
            }

            this.Repeater3.DataSource = mlist;
            this.Repeater3.DataBind();
            this.lbl_munber.Text = mlist.Count.ToString();
        }

        /// <summary>个人主页 tab 当前项高亮</summary>
        protected string TabActive(string tab)
        {
            string cur = Request.QueryString["tab"] ?? "wb";
            return cur == tab ? "active" : "";
        }

        /// <summary>微博配图：有图输出图片标签，无图输出空字符串</summary>
        protected string ImgHtml(object img)
        {
            string s = img as string;
            if (string.IsNullOrEmpty(s)) return "";
            return "<img class=\"feed-img\" src=\"images/" + s + "\" alt=\"\" />";
        }

        /// <summary>
        /// 点击「搜索一下」：按关键字搜索我的微博内容。
        /// </summary>
        protected void btn_search_Click(object sender, EventArgs e)
        {
            string content_text = this.txt_keywords.Text.Trim();
            this.Repeater3.DataSource = MicroBlogManager.SearchByContent_text(content_text, id);
            this.Repeater3.DataBind();
        }

        // 输入框回车触发的搜索，逻辑和按钮点击一致
        protected void txt_keywords_TextChanged(object sender, EventArgs e)
        {
            string content_text = this.txt_keywords.Text.Trim();
            this.Repeater3.DataSource = MicroBlogManager.SearchByContent_text(content_text, id);
            this.Repeater3.DataBind();
        }

        /// <summary>
        /// 列表里的命令按钮：delete 删除微博、dianzan 点赞。
        /// </summary>
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int idd = Convert.ToInt32(e.CommandArgument);
                if (MicroBlogManager.deleteByID(idd))
                {
                    BindProfile();
                    BindMyWeibo();
                }
                else
                {
                    Response.Write("<script>alert('删除失败！')</script>");
                }
            }
            else if (e.CommandName == "dianzan")
            {
                int blogId = Convert.ToInt32(e.CommandArgument);
                if (MicroBlogManager.Updataa(blogId))
                {
                    BindMyWeibo();
                }
            }
        }
    }
}
