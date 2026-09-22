<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

<%-- 注册页：卡片式布局，保留所有服务端控件 ID 与校验控件
     register.aspx.cs 中的邮箱注册、验证码发送逻辑完全不用改 --%>
<!DOCTYPE html>
<html lang="zh-CN">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>注册 - 微博</title>
    <link rel="stylesheet" href="css/site.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-wrap">
            <div class="auth-layout">
                <%-- 右侧帮助说明 --%>
                <div class="auth-help">
                    <h3>加入微博，遇见更大的世界</h3>
                    <ul>
                        <li>注册即可拥有专属微博主页</li>
                        <li>关注感兴趣的人和话题</li>
                        <li>用文字、图片记录每一刻</li>
                    </ul>
                </div>

                <%-- 注册卡片 --%>
                <div class="auth-card">
                    <div class="auth-card-header">
                        <img src="images/logo_white.png" alt="微博">
                        <h1>个人注册</h1>
                    </div>
                    <div class="auth-card-body">
                        <p style="text-align:right; margin-bottom:18px; font-size:13px;">
                            已有账号，<a href="Login.aspx" style="color:#3c8dbc;">直接登录 &gt;&gt;</a>
                        </p>

                        <%-- 邮箱 --%>
                        <div class="auth-field">
                            <label>邮箱<span class="req">*</span></label>
                            <asp:TextBox ID="TextBox1" runat="server" required placeholder="请输入常用邮箱"
                                TextMode="Email" CssClass="form-input" style="width:100%;"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="TextBox1" ErrorMessage="请输入正确的邮箱"
                                ForeColor="Red" Display="Dynamic"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                        </div>

                        <%-- 设置密码 --%>
                        <div class="auth-field">
                            <label>设置密码<span class="req">*</span></label>
                            <asp:TextBox ID="TextBox2" runat="server" required placeholder="请设置密码"
                                TextMode="Password" CssClass="form-input" style="width:100%;"></asp:TextBox>
                        </div>

                        <%-- 微博昵称 --%>
                        <div class="auth-field">
                            <label>注册微博名<span class="req">*</span></label>
                            <asp:TextBox ID="TextBox3" runat="server" required placeholder="给自己起个昵称"
                                CssClass="form-input" style="width:100%;"></asp:TextBox>
                        </div>

                        <%-- 所在地 --%>
                        <div class="auth-field">
                            <label>所在地<span class="req">*</span></label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-input" style="width:100%;">
                                <asp:ListItem Value="1">重庆市</asp:ListItem>
                                <asp:ListItem Value="2">广东省</asp:ListItem>
                                <asp:ListItem Value="3">深圳市</asp:ListItem>
                                <asp:ListItem Value="4">湖北省</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <%-- 邮箱验证码 --%>
                        <div class="auth-field">
                            <label>验证码<span class="req">*</span></label>
                            <div class="auth-captcha">
                                <asp:TextBox ID="TextBox4" runat="server" placeholder="请输入收到的验证码"
                                    CssClass="form-input"></asp:TextBox>
                                <asp:Button ID="Button2" runat="server" Text="发送验证码"
                                    OnClick="Button2_Click" CssClass="btn btn-primary" style="width:120px;" />
                            </div>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </div>

                        <%-- 立刻注册 --%>
                        <asp:Button ID="Button1" runat="server" Text="立刻注册"
                            OnClick="Button1_Click" CssClass="auth-submit" />

                        <div class="auth-footer" style="line-height:1.8;">
                            注册即代表同意《微博服务使用协议》《微博个人信息保护政策》
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
