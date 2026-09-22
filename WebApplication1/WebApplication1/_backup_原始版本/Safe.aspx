<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Safe.aspx.cs" Inherits="WebApplication1.Safe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="safe-section" style="background-color:aliceblue;">
        <div class="safe-left">
            <div style="margin-left:-70px;">
                <ul class="shezhi_ul">
                    <li class="shezhi" style="padding-bottom:30px;margin-top:-30px;">设置</li>
                    <dl class="left-dll">
                        <dt class="safe-img">
                            <asp:Image ID="Image1" runat="server"  style="border-radius: 50%;" width="100px" height="100px" />
                        </dt>
                    </dl>
                    <li style="margin-left:50px;"><a class="one_li" href="SetUp.aspx">编辑资料</a></li>
                    <li style="margin-left:50px;"><a class="one_li" href="Safe.aspx" style="color:#f18621;">账号安全</a></li>
                    <li style="margin-left:50px;"><a class="one_li" href="#">隐私设置</a></li>
                    <li style="margin-left:50px;"><a class="one_li" href="#">消息设置</a></li>
                    <li style="margin-left:50px;"><a class="one_li" href="#">屏蔽设置</a></li>
                    <li style="margin-left:50px;"><a class="one_li" href="#">使用偏好</a></li>
                </ul>
            </div>
        </div>
        <div class="safe-right">
            <div style="margin-left:60px;margin-top:40px;margin-bottom:40px;">
                <span style="font-size: 1.5em;font-weight: bold;">登录名：</span>
                <span style="font-size: 1.2em;"><asp:Label ID="lbl_yhm" runat="server" Text="Label"></asp:Label></span>
            </div>
            <table class="right-table">
                <tr class="right-table-trr">
                    <td class="right-table-tdd-title">邮箱：</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_email" runat="server" class="right-table-tdd-input" placeholder="请输入您的邮箱" required></asp:TextBox>
                        <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator1" 
                            runat="server" 
                            ControlToValidate="txt_email"
                            ErrorMessage="请输入正确的邮箱" 
                            ForeColor="Red" 
                            Font-Size="Small"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="right-table-trr">
                    <td class="right-table-tdd-title">密码：</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_pwd" runat="server" class="right-table-tdd-input" placeholder="请输入您新的密码" required></asp:TextBox>
                    </td>
                </tr>
                <tr class="right-table-trr">
                    <td class="right-table-tdd-title">确认密码：</td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_repwd" runat="server" class="right-table-tdd-input" placeholder="请再次输入您新的密码" required></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="两次密码输入不一致"
                            ControlToValidate="txt_repwd"
                             ControlToCompare="txt_pwd"
                            ForeColor="Red"
                             Font-Size="Small"
                            ></asp:CompareValidator>
                    </td>
                </tr>
                <tr class="right-table-trr">
                    <td class="right-table-tdd-title">验证码：</td>
                    <td>
                        <asp:TextBox ID="txt_yzm" runat="server" class="right-table-tdd-input" placeholder="验证码"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btn_yzm" runat="server" Text="发送验证码" class="safe-btn-send"/>
                    </td>
                </tr>
                <tr class="right-table-trr">
                    <td colspan="3" style="text-align: center;padding-top: 30px;">
                        <asp:Button ID="btn_qrUpdate" runat="server" Text="确认修改" class="safe-btn-send" OnClick="btn_qrUpdate_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_fanhui" runat="server" Text="取&nbsp;&nbsp;&nbsp;&nbsp;消" class="safe-btn-send" OnClick="btn_fanhui_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="safe-null"></div>
    </section>
</asp:Content>
