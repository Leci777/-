<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="boy">
            <div class="boy-z" style="opacity:0.8">
                <div class="boy-left" style="opacity:0.9">
                    <h2 style="padding:20px">首页</h2>
                    <ul>
                        <li style="margin-left:30px;"><a href="Guanzhu.aspx">全部关注</a></li>
                        <li style="margin-left:30px;"><a href="">最新微博</a></li>
                        <li style="margin-left:30px;"><a href="">特别关注</a></li>
                        <li style="margin-left:30px;"><a href="">好友圈</a></li>
                    </ul>
                </div>
                <div class="boy-cent">
                    <div class="h" style="margin-top:10px;">
                    <asp:Label ID="Label2" runat="server" Text="Label" style="margin-right: 200px;color:white;"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
                <div style="width:100%;background-color:whitesmoke;margin-top:20px;opacity:1;">
                    <div style="margin-top:10px;">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="200px" Width="100%" placeholder="有什么新鲜事想分享给大家？" Font-Names="initial" BorderColor="#FF9900" Font-Size="Medium" ForeColor="Black"></asp:TextBox>
                    </div>
                     <div style="margin-left:450px;margin-top:10px;padding-bottom:10px">
                        <asp:Button ID="Button1"  runat="server" Text="发送这条微博" BackColor="#FF6600" ForeColor="White" Height="40px" Width="190px" BorderColor="#FF6600" Font-Size="Medium" OnClick="Button1_Click" />
                    </div>
                </div>
                <div class="boy-cent-s3">
                    <ul style="margin-top:-20px">
                        <li><a href="">全部</a></li>
                        <li><a href="">原创</a></li>
                        <li><a href="">视频</a></li>
                        <li><a href="">超话社区</a></li>
                        <li><a href="">V+微博</a></li>
                        <li><a href="">群微博</a></li>
                        <li><a href="">新鲜事</a></li>
                    </ul>
                </div>
                <div style="width:100%;opacity:1;">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <dl class="news-time" style="background-color:aliceblue;">
                                <dt class="news-time-img">
                                    <asp:Image ID="Image1" runat="server" style="border-radius: 50%;margin-left:30px;margin-top:10px;" width="140px" height="140px"  ImageUrl='<%#Eval ("UserInfo.UserHeadPortrait","images/{0}")%>'/>
                                </dt>
                                <dd class="news-time-text bews-height">
                                    <h2 class="news-time-title"><%#Eval("UserInfo.UserName") %> ​​​​
                                        <br>
                                    </h2>
                                </dd>
                                <dd class="news-time-text" style="color:gray;font-size:small;"><%#Eval("ReleaseTime") %>来自 新版微博 weibo.com</dd>
                                <dd class="news-time-text" style="height:80px;">
                                    <time class="news-time-time" style="font-size:0.8em"><%#Eval("Content_text") %></time>
                                </dd>
                                <dd>
                                    <ul class="zfplz">
                                        <li class="zfplz-item"><a href="#">
                                            <img src="images/zhuanfa.PNG" alt="" width="20px" height="20px" title="转发" style="margin-left:40px;"/> <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="LinkButton2_Command" CommandArgument='<%#Eval("ID") %>'><span>转发</span></asp:LinkButton></a></li>
                                        <li class="zfplz-item">
                                            <a href='WebPL.aspx?id=<%#Eval("ID") %>'>
                                            <%--<asp:LinkButton ID="LinkButton3" OnCommand="LinkButton1_Command" CommandName="pl" runat="server">--%>
                                            <img src="images/pinglun.PNG" alt="" width="20px" height="20px" title="评论"/><span>评论</span></a>
                                        </li>
                                        <li class="zfplz-item">
                                            <asp:LinkButton ID="LinkButton1" OnCommand="LinkButton1_Command" CommandName="dz" CommandArgument='<%#Eval("ID") %>' runat="server">
                                                <img src="images/dianzan.PNG" alt="" width="20px" height="20px" title="赞"/><span>赞</span>&nbsp;&nbsp;<span><%#Eval("Points_number")%></span>
                                            </asp:LinkButton>
                                        </li>
                                    </ul
                                </dd>
                            </dl>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
                <div style="width:25%;margin:10px;background-color:white;opacity:1;min-height:500px;">
                    <h3 style="padding:20px"">微博热搜</h3>
                    <div>
                        <ul style="padding:10px">
                                <li><a href="#" ><img src="images/QQ图片20220507212855.png" /><span style="font-size:0.8em" class="zz">五一调休....110.2万        <img style="width:26px;height:27px" src="images/20220507214228.png" /></a></li>
                         </ul>
                        
                    </div>
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <ul style="padding:15px;width:250px;">
                                <li><a href="#" style="font-size:0.8em"><span class="zz" "><%#Eval("id") %>.</span><%#Eval("name") %></a></li>
                            </ul>
                        </ItemTemplate>
                    </asp:Repeater>
                   
               </div>
        </div>
   </div>
        </span>
</asp:Content>
