using BLL;
using Modles;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User us = new User();
            DataSet ds = new DataSet();
            us.Email = this.TextBox1.Text.Trim();
            us.Pwd = this.TextBox2.Text.Trim();
            us.intPwd = this.TextBox3.Text.Trim();
            us.Name = this.TextBox4.Text.Trim();
            if (this.RadioButton1.Checked)
            {
                us.Sex = 1;
            }
            else
            {
                us.Sex = 0;
            }
            if (UserManager.Insert(us))
            {
                Response.Write("<script>alert('注册成功')</script>");
            }
            if (this.TextBox8.Text=="Remcc")
            {
                
            }
            else
            {
                Response.Write("<script>alert('验证码不正确')</script>");
                this.TextBox8.Text= "";
            }
        }
    }
}