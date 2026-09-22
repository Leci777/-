<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Safe.aspx.cs" Inherits="WebApplication1.Safe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="safe-section">
            <%-- ====== 左侧设置菜单 ====== --%>
            <div class="safe-left">
                <ul class="shezhi_ul">
                    <li class="shezhi">设置</li>
                    <dl class="left-dll">
                        <asp:Image ID="Image1" runat="server" AlternateText="头像" />
                    </dl>
                    <li><a class="one_li" href="SetUp.aspx">编辑资料</a></li>
                    <li><a class="one_li" href="Safe.aspx" style="color:var(--wb-orange);">账号安全</a></li>
                    <li><a class="one_li" href="#">隐私设置</a></li>
                    <li><a class="one_li" href="#">消息设置</a></li>
                    <li><a class="one_li" href="#">屏蔽设置</a></li>
                    <li><a class="one_li" href="#">使用偏好</a></li>
                </ul>
            </div>

            <%-- ====== 右侧：账号安全表单 ====== --%>
            <div class="safe-right">
                <div style="margin-bottom:24px;">
                    <span style="font-size:16px; font-weight:bold;">登录名：</span>
                    <span style="font-size:15px;"><asp:Label ID="lbl_yhm" runat="server"></asp:Label></span>
                </div>

                <table class="right-table">
                    <tr class="right-table-trr">
                        <td class="right-table-tdd-title">邮箱：</td>
                        <td colspan="2">
                            <asp:TextBox ID="txt_email" runat="server" CssClass="right-table-tdd-input"
                                placeholder="请输入您的邮箱" required></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="txt_email" ErrorMessage="请输入正确的邮箱" ForeColor="Red"
                                Font-Size="Small" Display="Dynamic"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="right-table-trr">
                        <td class="right-table-tdd-title">密码：</td>
                        <td colspan="2">
                            <asp:TextBox ID="txt_pwd" runat="server" CssClass="right-table-tdd-input"
                                placeholder="请输入您新的密码" required></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="right-table-trr">
                        <td class="right-table-tdd-title">确认密码：</td>
                        <td colspan="2">
                            <asp:TextBox ID="txt_repwd" runat="server" CssClass="right-table-tdd-input"
                                placeholder="请再次输入您新的密码" required></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ErrorMessage="两次密码输入不一致" ControlToValidate="txt_repwd"
                                ControlToCompare="txt_pwd" ForeColor="Red" Font-Size="Small" Display="Dynamic"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr class="right-table-trr">
                        <td class="right-table-tdd-title">验证码：</td>
                        <td>
                            <asp:TextBox ID="txt_yzm" runat="server" CssClass="right-table-tdd-input"
                                placeholder="验证码" style="width:180px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btn_yzm" runat="server" Text="发送验证码" CssClass="safe-btn-send" />
                        </td>
                    </tr>
                    <tr class="right-table-trr">
                        <td colspan="3" style="text-align:center; padding-top:30px;">
                            <asp:Button ID="btn_qrUpdate" runat="server" Text="确认修改"
                                CssClass="safe-btn-send" OnClick="btn_qrUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btn_fanhui" runat="server" Text="取&nbsp;&nbsp;&nbsp;&nbsp;消"
                                CssClass="btn_yc" OnClick="btn_fanhui_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</asp:Content>
