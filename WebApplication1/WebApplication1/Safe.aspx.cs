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
    /// 账号安全页：校验邮箱后修改密码。
    /// </summary>
    public partial class Safe : System.Web.UI.Page
    {
        private int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["id"]);
            UserInfo userInfo = UserInfoManager.SearchAllid(id);
            this.lbl_yhm.Text = userInfo.UserName;
            this.Image1.ImageUrl = "images/" + userInfo.UserHeadPortrait;
        }

        /// <summary>
        /// 点击「取消」：清空输入框并返回设置页。
        /// </summary>
        protected void btn_fanhui_Click(object sender, EventArgs e)
        {
            this.txt_email.Text = "";
            this.txt_pwd.Text = "";
            this.txt_repwd.Text = "";
            Response.Redirect("SetUp.aspx");
        }

        /// <summary>
        /// 点击「确认修改」：先核对邮箱是否与登录邮箱一致，一致才改密码。
        /// </summary>
        protected void btn_qrUpdate_Click(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["id"]);
            UserInfo userInfo = UserInfoManager.SearchAllid(id);
            string email = txt_email.Text.Trim();
            string repwd = txt_repwd.Text.Trim();

            if (userInfo.UserEmail != email)
            {
                Response.Write("<script>alert('邮箱输入不正确！')</script>");
                return;
            }

            if (UserInfoManager.UpdatePwd(repwd, id))
            {
                Response.Write("<script>alert('修改密码成功')</script>");
                Response.Redirect("SetUp.aspx");
            }
            else
            {
                Response.Write("<script>alert('修改密码失败')</script>");
            }
        }
    }
}
