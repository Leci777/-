using BLL;
using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    /// <summary>
    /// 登录页：校验图形验证码后比对邮箱+密码，成功则写 Session 并跳首页。
    /// </summary>
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 登录页本身不需要预加载内容
        }

        /// <summary>
        /// 点击「登录」按钮：先核对验证码，再查库比对账号密码。
        /// </summary>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string yzmm = this.TextBox5.Text.Trim();
            // 验证码统一存小写，输入也转小写后比较
            if (Session["vcode"] == null || Session["vcode"].ToString() != yzmm.ToLower())
            {
                Response.Write("<script>alert('验证码输入不正确！');</script>");
                return;
            }

            string userEmail = this.TextBox1.Text.Trim();
            string userPassword = this.TextBox2.Text.Trim();   // 注意：TextBox2 才是密码框
            Session["UserEmail"] = userEmail;
            Session["UserPassword"] = userPassword;             // 原代码这里写成了 TextBox1，已修正

            List<UserInfo> info = UserInfoManager.SelectNamePwd(userEmail, userPassword);
            foreach (var item in info)
            {
                Session["id"] = item.ID;   // 登录成功后把用户 ID 存进 Session，供后续页面取用
            }

            if (info.Count > 0)
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                Response.Write("<script>alert('邮箱或密码输入错误！')</script>");
                this.TextBox1.Text = "";
                this.TextBox2.Text = "";
            }
        }

        /// <summary>
        /// 点击「立即注册」：跳转到注册页。
        /// </summary>
        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}
