<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<%-- 登录页：用卡片式布局替换原来的 table + font 老写法
     所有服务端控件 ID 保持不变，Login.aspx.cs 无需改动 --%>
<!DOCTYPE html>
<html lang="zh-CN">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>登录 - 微博</title>
    <link rel="stylesheet" href="css/site.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-wrap">
            <div class="auth-layout">
                <%-- 左侧帮助说明（可选展示，弱化存在感） --%>
                <div class="auth-help">
                    <h3>随时随地，分享身边的新鲜事</h3>
                    <ul>
                        <li>记录生活，遇见有趣的人</li>
                        <li>关注话题，紧跟热点动态</li>
                        <li>转发评论，和好友一起聊</li>
                    </ul>
                </div>

                <%-- 登录卡片 --%>
                <div class="auth-card">
                    <div class="auth-card-header">
                        <img src="images/logo_white.png" alt="微博">
                        <h1>账号登录</h1>
                    </div>
                    <div class="auth-card-body">
                        <%-- 邮箱/账号 --%>
                        <div class="auth-field">
                            <label>账号<span class="req">*</span></label>
                            <asp:TextBox ID="TextBox1" runat="server" required placeholder="请输入邮箱"
                                TextMode="Email" CssClass="form-input" style="width:100%;"></asp:TextBox>
                        </div>

                        <%-- 密码 --%>
                        <div class="auth-field">
                            <label>密码<span class="req">*</span></label>
                            <asp:TextBox ID="TextBox2" runat="server" required placeholder="请输入密码"
                                TextMode="Password" CssClass="form-input" style="width:100%;"></asp:TextBox>
                        </div>

                        <%-- 验证码 --%>
                        <div class="auth-field">
                            <label>验证码<span class="req">*</span></label>
                            <div class="auth-captcha">
                                <asp:TextBox ID="TextBox5" runat="server" required placeholder="请输入验证码"
                                    CssClass="form-input"></asp:TextBox>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Codee.ashx"
                                    AlternateText="验证码" ToolTip="点击换一张"
                                    onclick="refreshCaptcha()" style="cursor:pointer;" />
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="change-link"
                                    OnClientClick="refreshCaptcha(); return false;">换一张</asp:LinkButton>
                            </div>
                        </div>

                        <%-- 自动登录 + 忘记密码 --%>
                        <div class="auth-options">
                            <label style="margin:0;">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="true" /> 下次自动登录
                            </label>
                            <asp:LinkButton ID="LinkButton1" runat="server">忘记密码？</asp:LinkButton>
                        </div>

                        <%-- 登录按钮 --%>
                        <asp:Button ID="Button1" runat="server" Text="登 录"
                            OnClick="Button1_Click" CssClass="auth-submit" />

                        <div class="auth-footer">
                            还没有账号？<asp:LinkButton ID="LinkButton2" runat="server"
                                OnCommand="LinkButton2_Command">立即注册 &gt;&gt;</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        // 点击验证码图片或「换一张」时，重新请求 Codee.ashx 刷新图片
        function refreshCaptcha() {
            var img = document.getElementById('<%= Image1.ClientID %>');
            if (img) img.src = 'Codee.ashx?t=' + new Date().getTime();
        }
    </script>
</body>
</html>
