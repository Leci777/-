<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 36px;
        }
    </style>
</head>
    <body>
    <form id="form1" runat="server">
       <body bgcolor="#85BCE1">        
            <table align="center" width="896" height="186">
                <tr>
                    <td background="register/img/bg_reg_wave.png" align="center">
                        <img src="register/img/top.png">
                    </td>
                </tr>
            </table>
        <form action="新浪.html">    
            <table border="30" bordercolor="FFFFFF" bgcolor="#FFFFFF" align="center">
                <tr>
                    <td colspan="2">
                        <font size="4" color="orange">
                            <b>个人注册  </b>
                        </font>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                    <td rowspan="7" width="28">
                    </td>
                    <td height="13">　
                        <br>
                        已有账号，
                        <font color="#0F8ED3">
                            <a href="Login.aspx">直接登录>></a>
                        </font>
                        <br>
                    </td>
                    
                </tr>
                <tr>
                    <td align="right">
                        <img src="register/img/email.png" />
                        <font color="red">*</font><b>邮箱：</b>
                    </td>
                    <td>
                           <asp:TextBox ID="TextBox1" required runat="server"></asp:TextBox>
                        
                        <font color="#ff0000">
                        
                            <img src="register/img/error.png" />
                            请输入常用邮箱
                        </font>
                        <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator1" 
                            runat="server" 
                            ControlToValidate="TextBox1"
                            ErrorMessage="请输入正确的邮箱" 
                            ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <b><font size="4">微博注册帮助</font></b>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <font color="red">*</font><b>设置密码：</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" required runat="server"></asp:TextBox>
                        <img src="register/img/error.png" />
                        <font color="#ff0000">请输入密码</font>
                    </td>
                    <td>
                        <font color="#0F8ED3">
                            <img src="register/img/one.png" />注册微博账号的常见问题
                        </font>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <font color="red">*</font>
                        <b>注册微博名：</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" required runat="server"></asp:TextBox>
                        <img src="register/img/error.png" />
                        <font color="#ff0000">请输入昵称</font>
                    </td>
                    <td>
                        <font color="#0F8ED3"><img src="register/img/two.png" />手机号/邮箱在注册微博时提示已被注册</font>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="auto-style2">
                        <font color="red">*</font>
                        <b>所在地：</b>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="1">重庆市</asp:ListItem>
                            <asp:ListItem Value="2">广东省</asp:ListItem>
                            <asp:ListItem Value="3">深圳市</asp:ListItem>
                            <asp:ListItem Value="3">湖北省</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td class="auto-style2">
                        <font color="#0F8ED3"><img src="register/img/three.png" />进行短信验证时没有收到验证码，该怎么办？</font>
                    </td>
                </tr>
                <%--<tr>
                    <td colspan="2" style="padding-left:30px" class="auto-style1">
                        <asp:Button ID="Button2" runat="server" Text="发送验证码" OnClick="Button2_Click" />
                    </td>
                </tr>--%>
                <tr>
                    <td align="right">
                        <font color="red">*</font>
                        <b>验证码：</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" Text="发送验证码" OnClick="Button2_Click" BackColor="#FFCC00" />
                        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        <%--<img src="/Images/yanzgengma.png" width="80px" height="30px" alt="pic" id="img" onclick="changePic()"/>
                        <asp:Label ID="Label1" runat="server" Text="看不清楚？点击图片切换一张" Height="10px" Width="120px"></asp:Label>--%>
                    </td>
                    <%--<td>
                        <font color="#0F8ED3"></font>
                    </td>--%>
                    <td>
                        <font color="#0F8ED3"><img src="register/img/four.png" />注册提示频繁怎么办？<br />　　<br>　更多帮助>></font>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td rowspan="2">
                        <!-- <span style="line-height: 40px; text-align: center; width: 160px;height: 40px;background-color: orange;display: block;">
                            <a href="" style="text-align: center;text-decoration: none;color: white;">立刻注册</a>
                        </span> -->
                        <asp:Button ID="Button1" runat="server" Text="立刻注册" BackColor="#FF9933" ForeColor="White" OnClick="Button1_Click" />
                        <br />
                        <font color="#0F8ED3">
                            微博服务使用协议<br>
                            微博个人信息保护政策<br>
                            全国人大常委会关于加强网络信息保护的决策
                        </font>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </table>
        </form>
            <table align="center" style="font-size: 13px;">
                <tr>
                    <td><img src="register/img/logos.png" style="width: 40px;height: 40px;" /></td>
                    <td>北京微梦创科网络技术有限公司　　　 <td>京网文〔2020〕4754-886号　　</td>
                    <td>京ICP备12002058号-2</td>
                    <td>　　　　　Copyright © 2009-2022 WEIBO　　　　　　</td>
                </tr>
            </table>
    </body>

   </form>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
            //var imgs = [//定义数组用来存储图片的路径
            //    '/Images/yanzhengma.png',
            //    '/Images/yanzhengma1.png',
            //    '/Images/yanzhengma2.png',
            //    '/Images/yanzhengma3.png',
            //    '/Images/yanzhengma4.png',
            //    '/Images/yanzhengma5.png'
            //];
            //var index = 0;//设置第一张图片的索引值为0
            //var len = imgs.length;//获取存储图片数组的长度
            //$('.btn').on('click', function () {//绑定点击事件
            //    if ($(this).data('control') === "last") {
            //        //如果写成 $(this).data('control') === 'last'是对的
            //        //如果写成 $(this).data('control') = 'last'那就始终为真了，没意义
            //        //如果写成 'last' === $(this).data('control')是对的
            //        //如果写成 'last' = $(this).data('control')语句就会报一个错误
            //        // index--;
            //        // if(index<0){
            //        // index = 0;
            //        // }
            //        // index--;
            //        index = Math.max(0, --index);//如果index的值小于0，使index为0
            //    } else
            //        index = Math.min(len - 1, ++index);//如果index大于了数组长度 ，使index等于数组长度减一的值
            //    document.title = (index + 1) + '/' + len;//改变标题内容
            //    $('#img').attr('src', imgs[index]);//动态改变图片的路径
            //});
            //function changePic() {
            //    undefined          
            //    var num = Math.ceil(Math.random() * 30);
            //    document.getElementById("img").src = "Images/yanzgengma" + num + ".png";
            //}
            //window.onload = choosePic;
            //function choosePic() {
            //    var img = new Array("images/lion.jpg", "images/tiger.jpg", "images/bear.jpg");
            //    var randomNum = Math.floor((Math.random() * img.length));
            //    document.getElementById("myPicture").src = img[randomNum];
            //}
        </script>
</body>
</html>
