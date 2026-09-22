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
    /// 编辑资料页：加载并修改用户资料（昵称、简介、头像、性别、生日等）。
    /// </summary>
    public partial class SetUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Session["UserEmail"] 在登录时写入，用来定位当前用户
            string name = Session["UserEmail"].ToString();
            if (!IsPostBack)
            {
                using (blogWebsiteDBEntities7 db = new blogWebsiteDBEntities7())
                {
                    var userInfo = db.tb_UserInfo.SingleOrDefault(p => p.UserEmail == name);
                    if (userInfo == null) return;

                    // 回填表单
                    this.txt_nc.Text = userInfo.UserName;
                    this.txt_jianjie.Text = userInfo.UserAutograph;
                    this.txt_geren.Text = userInfo.UserYM;
                    this.Image1.ImageUrl = "../images/" + userInfo.UserHeadPortrait;

                    // 性别回填
                    if (userInfo.UserSex == 1)
                        this.RadioButtonList1.Items[0].Selected = true;
                    else
                        this.RadioButtonList1.Items[1].Selected = true;

                    this.DropDownList4.SelectedValue = userInfo.UserGQ;
                    this.DropDownList5.SelectedValue = userInfo.UserRegion;
                    this.DropDownList6.Text = userInfo.UserJX;
                }
            }
        }

        /// <summary>
        /// 点击「保存修改」：组装用户对象、处理头像上传、调用更新。
        /// </summary>
        protected void Button1_Click(object sender, EventArgs e)
        {
            UserInfo userInfo = new UserInfo();
            string name = Session["UserEmail"].ToString();
            userInfo.UserName = this.txt_nc.Text.Trim();
            userInfo.UserAutograph = this.txt_jianjie.Text.Trim();
            userInfo.UserYM = this.txt_geren.Text.Trim();
            userInfo.UserSex = Convert.ToInt32(this.RadioButtonList1.SelectedValue);
            userInfo.UserBirthday = Convert.ToDateTime(this.Drop_year.Text + '-' + this.Drop_month.Text + '-' + Drop_day.Text);
            userInfo.UserGQ = this.DropDownList4.Text;
            userInfo.UserRegion = this.DropDownList5.Text;
            userInfo.UserJX = this.DropDownList6.Text;

            // 处理头像上传
            string fileName = FileUpload1.FileName;
            if (!string.IsNullOrEmpty(fileName))
            {
                string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
                if (fileFix != "png" && fileFix != "jpg" && fileFix != "jpeg" && fileFix != "pic")
                {
                    this.lbl.Text = "上传的文件不是图片类型文件！";
                    return;
                }
                FileUpload1.SaveAs(Server.MapPath(".") + "//images//" + fileName);
                this.Image1.ImageUrl = "~//images//" + fileName;
                userInfo.UserHeadPortrait = fileName;
            }

            if (UserInfoManager.UpdateAll(userInfo, name))
            {
                Response.Write("<script>alert('修改成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }
    }
}
