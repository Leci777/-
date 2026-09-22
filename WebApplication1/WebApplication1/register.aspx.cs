using BLL;
using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    /// <summary>
    /// 注册页：先校验邮箱是否已注册，再发邮箱验证码，校验通过后写库。
    /// </summary>
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 注册页无预加载内容
        }

        /// <summary>
        /// 点击「立刻注册」：邮箱查重 -> 校验验证码 -> 写入用户表。
        /// </summary>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = this.TextBox1.Text.Trim();
            UserInfo userr = new UserInfo { UserEmail = email };
            DBHelper dB = new DBHelper();
            DataSet ds = dB.Clogin(userr);

            // 邮箱已存在则直接提示并清空
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>alert('邮箱已存在');</script>");
                ClearInputs();
                return;
            }

            // 未填验证码
            if (this.TextBox4.Text.Trim() == "")
            {
                Response.Write("<script>alert('未输入验证码，请重试');</script>");
                ClearInputs();
                return;
            }

            // 验证码不匹配（Label1 存放 Button2_Click 生成的随机码）
            if (this.TextBox4.Text.Trim() != Label1.Text)
            {
                this.Label2.Text = "验证码输入错误";
                return;
            }

            // 校验通过，组装用户对象并写入
            UserInfo user = new UserInfo();
            user.UserEmail = this.TextBox1.Text.Trim();
            user.UserPassword = this.TextBox2.Text.Trim();
            user.UserName = this.TextBox3.Text.Trim();
            user.UserRegion = this.DropDownList1.Text;
            user.RegisterTime = DateTime.Now;

            if (UserInfoManager.Insert(user))
            {
                Response.Write("<script>alert('注册成功');</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('注册失败');</script>");
            }
        }

        /// <summary>
        /// 清空四个输入框，方便用户重新填写。
        /// </summary>
        private void ClearInputs()
        {
            this.TextBox1.Text = "";
            this.TextBox2.Text = "";
            this.TextBox3.Text = "";
            this.TextBox4.Text = "";
        }

        /// <summary>
        /// 点击「发送验证码」：用 163 邮箱 SMTP 把随机码发到用户邮箱，
        /// 同时把该随机码暂存在 Label1 里供 Button1_Click 比对。
        /// 注意：发件账号密码硬编码在此仅作演示，正式项目应移到配置文件。
        /// </summary>
        protected void Button2_Click(object sender, EventArgs e)
        {
            string email = this.TextBox1.Text.Trim();
            SmtpClient client = new SmtpClient("smtp.163.com", 25);
            Random Rdm = new Random();
            int iRdm = Rdm.Next(0, 99999);
            MailMessage msg = new MailMessage("lx2042426989@163.com", email, "验证码", $"验证码为:{iRdm.ToString()}");
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential basicAuthenticationInfo =
                new System.Net.NetworkCredential("lx2042426989@163.com", "VSWGWHMNWTYGYXZG");
            client.Credentials = basicAuthenticationInfo;
            client.EnableSsl = true;
            client.Send(msg);
            this.Label1.Text = iRdm.ToString();
        }
    }
}
