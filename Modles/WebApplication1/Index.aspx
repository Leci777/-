<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="width:68%; background-color:aqua; height: 492px;">
                <h3>开通微博账号</h3>
                <table style="padding:10px">
                    <tr>
                        <td>我的邮箱：</td>
                        <td colspan="3">
                            <asp:TextBox ID="TextBox1" required runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td colspan="3">
                            <asp:TextBox ID="TextBox2" required runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>确认密码：</td>
                        <td colspan="3">
                            <asp:TextBox ID="TextBox3" required runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>昵称：</td>
                        <td colspan="3">
                            <asp:TextBox ID="TextBox4" required runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td colspan="3">
                            <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Text="男" /><asp:RadioButton ID="RadioButton2" runat="server" Text="女" />
                        </td>
                    </tr>
                   <tr>
                        <td>密保问题：</td>
                        <td colspan="3">
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>答案：</td>
                        <td colspan="3">
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>验证码：</td>
                        <td>
                            <asp:TextBox ID="TextBox8" required runat="server"></asp:TextBox>
                        </td>
                        <td colspan="2"></td>

                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="立即开通" OnClick="Button1_Click" />
                        </td>
                        <td></td>
                    </tr>
                     <tr>
                         <td></td>
                        <td colspan="2">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="《微博网站使用协议》" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
