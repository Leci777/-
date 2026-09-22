<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <body bgcolor="#85BCE1">        
            <table align="center" width="896" height="186">
                <tr>
                    <td background="register/img/bg_reg_wave.png" align="center">
                        <img src="register/img/top.png" style="width: 714px">
                    </td>
                </tr>
            </table>
        </div>
        <form action="新浪.html">    
            <table border="30" bordercolor="FFFFFF" bgcolor="#FFFFFF" align="center" style="height: 333px; width: 566px">
                <tr>
                    <td colspan="2">
                        <font size="4" color="orange">
                            <b>账号登录  </b>
                        </font>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                    <td rowspan="5" width="28">
                    </td>
                    <td height="13">　
                      
                    </td>
                    
                </tr>
                <tr>
                    <td align="right">
                        <img src="register/img/email.png" />
                        <font color="red">*</font><b>账号：</b>
                    </td>
                   <td>
                       <asp:TextBox ID="TextBox1" required runat="server"></asp:TextBox>
                   </td>
                </tr>
                <tr>
                    <td align="right">
                        <font color="red">*</font><b>密码：</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" required runat="server" TextMode="Password"></asp:TextBox>
                   </td>
                </tr>
                
                <tr>
                    <td align="right">
                        <font color="red">*</font><b>验证码：</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" required runat="server"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Codee.ashx" Height="30px" Width="80px"/>
                        <asp:LinkButton ID="LinkButton3" runat="server">换一张</asp:LinkButton>
                   </td>
                </tr>
                <tr>
                    <td align="right">
                        
                    </td>
                   <td>
                       <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="下次自动登录" />
                   </td>
                    <td>
                       
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <!-- <span style="line-height: 40px; text-align: center; width: 160px;height: 40px;background-color: orange;display: block;">
                            <a href="" style="text-align: center;text-decoration: none;color: white;">立刻注册</a>
                        </span> -->
                       
                        <asp:Button ID="Button1" runat="server" Text="登录" BackColor="#FF9933" BorderColor="#FF9933" ForeColor="White" Height="37px" OnClick="Button1_Click" Width="170px" />
                        <br />
                       
                    </td>
                    
                 </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                         <asp:LinkButton ID="LinkButton2" OnCommand="LinkButton2_Command" runat="server">立即注册</asp:LinkButton>
                         <asp:LinkButton ID="LinkButton1" runat="server">忘记密码</asp:LinkButton>
                    </td>
                    <td>
                        
                    </td>
                </tr>
                </table>
           
        </form>
            
    </body>
  </form>      
</body>
</html>
