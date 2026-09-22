<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- 三栏布局：左侧菜单 / 中间发微博+信息流 / 右侧热搜 --%>
    <div class="page-body">
        <%-- ====== 左侧菜单：点击切换信息源（?feed=） ====== --%>
        <div class="body-left">
            <div class="left-title">首页</div>
            <ul>
                <li class="left-item"><a href="Index.aspx?feed=all" class="left-item-link <%= FeedActive("all") %>">全部关注</a></li>
                <li class="left-item"><a href="Index.aspx?feed=new" class="left-item-link <%= FeedActive("new") %>">最新微博</a></li>
                <li class="left-item"><a href="Index.aspx?feed=special" class="left-item-link <%= FeedActive("special") %>">特别关注</a></li>
                <li class="left-item"><a href="Index.aspx?feed=friend" class="left-item-link <%= FeedActive("friend") %>">好友圈</a></li>
            </ul>
        </div>

        <%-- ====== 中间内容区 ====== --%>
        <div class="body-center">
            <%-- 欢迎语 --%>
            <div class="feed-tabs">
                <asp:Label ID="Label2" runat="server" Text="Label" style="float:left;padding-left:18px;color:#666;"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>

            <%-- 发微博框 --%>
            <div class="post-box">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="120px" Width="100%"
                    placeholder="有什么新鲜事想分享给大家？" BorderColor="#FF9900"></asp:TextBox>
                <div class="post-actions">
                    <asp:Button ID="Button1" runat="server" Text="发送这条微博"
                        OnClick="Button1_Click" CssClass="btn btn-primary" />
                </div>
            </div>

            <%-- 信息流分类标签（按微博分类筛选 ?cat=） --%>
            <div class="feed-tabs">
                <ul>
                    <li><a href="Index.aspx" class="<%= CatActive("") %>">全部</a></li>
                    <li><a href="Index.aspx?cat=热门" class="<%= CatActive("热门") %>">热门</a></li>
                    <li><a href="Index.aspx?cat=头条" class="<%= CatActive("头条") %>">头条</a></li>
                    <li><a href="Index.aspx?cat=视频" class="<%= CatActive("视频") %>">视频</a></li>
                    <li><a href="Index.aspx?cat=搞笑" class="<%= CatActive("搞笑") %>">搞笑</a></li>
                    <li><a href="Index.aspx?cat=体育" class="<%= CatActive("体育") %>">体育</a></li>
                </ul>
            </div>

            <%-- 微博信息流：Repeater 绑定微博 --%>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <dl class="news-time">
                        <dt class="news-time-img">
                            <asp:Image ID="Image1" runat="server" width="60" height="60"
                                ImageUrl='<%#Eval("UserInfo.UserHeadPortrait","images/{0}")%>' />
                        </dt>
                        <dd class="news-time-text">
                            <h2 class="news-time-title"><%#Eval("UserInfo.UserName") %></h2>
                            <time class="news-time-time"><%#Eval("ReleaseTime") %> 来自 新版微博 weibo.com</time>
                            <p style="margin-top:8px; font-size:14px; line-height:1.7;"><%#Eval("Content_text") %></p>
                            <%# ImgHtml(Eval("Content_img")) %>

                            <ul class="zfplz">
                                <%-- 转发：把原微博内容填进输入框 --%>
                                <li class="zfplz-item">
                                    <asp:LinkButton ID="LinkButton2" runat="server"
                                        OnCommand="LinkButton2_Command" CommandArgument='<%#Eval("ID") %>'>
                                        <img src="images/zhuanfa.PNG" alt="转发" title="转发" />
                                        <span>转发</span>
                                    </asp:LinkButton>
                                </li>
                                <%-- 评论：跳到评论页 --%>
                                <li class="zfplz-item">
                                    <a href='WebPL.aspx?id=<%#Eval("ID") %>'>
                                        <img src="images/pinglun.PNG" alt="评论" title="评论" />
                                        <span>评论</span>
                                    </a>
                                </li>
                                <%-- 赞：已赞的显示"已赞"并高亮，防止重复点赞 --%>
                                <li class="zfplz-item">
                                    <asp:LinkButton ID="LinkButton1" runat="server"
                                        OnCommand="LinkButton1_Command" CommandName="dz"
                                        CommandArgument='<%#Eval("ID") %>' CssClass='<%# ZanClass(Eval("ID")) %>'>
                                        <img src="images/dianzan.PNG" alt="赞" title="赞" />
                                        <span><%# ZanText(Eval("ID")) %>&nbsp;<%#Eval("Points_number")%></span>
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="feed-empty">
                这里暂时还没有微博~
            </asp:Label>
        </div>

        <%-- ====== 右侧热搜：点击搜索 ====== --%>
        <div class="boy-right">
            <h3>微博热搜</h3>
            <ul>
                <li>
                    <a href="Search.aspx?kw=%E4%BA%94%E4%B8%80%E8%B0%83%E4%BC%91">
                        <img src="images/QQ图片20220507212855.png" alt="" />
                        <span class="zz">五一调休</span>110.2万
                        <img style="width:20px;height:20px" src="images/20220507214228.png" alt="" />
                    </a>
                </li>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <li>
                            <a href='Search.aspx?kw=<%# Server.UrlEncode(Eval("name").ToString()) %>'>
                                <span class="zz"><%#Eval("id") %>.</span><%#Eval("name") %>
                            </a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</asp:Content>
