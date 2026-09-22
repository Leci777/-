<%@ Page Title="" Language="C#" MasterPageFile="~/NewAll.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- 游客首页：内容全部从数据库动态读取 --%>
    <div class="all">
        <div class="boy1">
            <div class="boy_z1">
                <%-- ====== 左侧分类导航：点击按分类筛选（?cat=分类名） ====== --%>
                <div class="boy_left1">
                    <ul class="ul2">
                        <li><a href="Default.aspx" class="<%= CatActive("") %>">全部</a></li>
                        <li><a href="Default.aspx?cat=热门" class="<%= CatActive("热门") %>">热门</a></li>
                        <li><a href="Default.aspx?cat=头条" class="<%= CatActive("头条") %>">头条</a></li>
                        <li><a href="Default.aspx?cat=视频" class="<%= CatActive("视频") %>">视频</a></li>
                        <li><a href="Default.aspx?cat=榜单" class="<%= CatActive("榜单") %>">榜单</a></li>
                        <li><a href="Default.aspx?cat=搞笑" class="<%= CatActive("搞笑") %>">搞笑</a></li>
                        <li><a href="Default.aspx?cat=社会" class="<%= CatActive("社会") %>">社会</a></li>
                        <li><a href="Default.aspx?cat=时尚" class="<%= CatActive("时尚") %>">时尚</a></li>
                        <li><a href="Default.aspx?cat=电影" class="<%= CatActive("电影") %>">电影</a></li>
                        <li><a href="Default.aspx?cat=体育" class="<%= CatActive("体育") %>">体育</a></li>
                        <li><a href="Default.aspx?cat=动漫" class="<%= CatActive("动漫") %>">动漫</a></li>
                    </ul>
                </div>

                <%-- ====== 中间：轮播图 + 动态信息流 ====== --%>
                <div class="boy_cent1">
                    <%-- 轮播图：图片 + 对应微博配文，一起切换 --%>
                    <div class="box">
                        <div class="imgBox">
                            <asp:Repeater ID="rptBanner" runat="server">
                                <ItemTemplate>
                                    <a class="banner-item" href='WebPL.aspx?id=<%#Eval("ID") %>'>
                                        <img src='images/<%#Eval("Content_img") %>' alt="" />
                                        <span class="banner-cap"><%#Eval("Content_text") %></span>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <%-- 当前分类提示 --%>
                    <div class="feed-head">
                        <asp:Label ID="lblCat" runat="server"></asp:Label>
                    </div>

                    <%-- 动态信息流：绑定微博（联表用户） --%>
                    <asp:Repeater ID="rptFeed" runat="server">
                        <ItemTemplate>
                            <a href='WebPL.aspx?id=<%#Eval("ID") %>'>
                                <dl class="news-time1">
                                    <%# ImgHtml(Eval("Content_img")) %>
                                    <dd class="news-time-text1">
                                        <h3 class="news-time-title1"><%#Eval("Content_text") %></h3>
                                        <div class="nc-meta">
                                            <img class="nc-avatar" src='images/<%#Eval("UserInfo.UserHeadPortrait") %>' alt="" />
                                            <span class="nc-name"><%#Eval("UserInfo.UserName") %></span>
                                            <span class="nc-cat"><%#Eval("Title") %></span>
                                            <span class="nc-time"><%# Convert.ToDateTime(Eval("ReleaseTime")).ToString("MM-dd HH:mm") %></span>
                                            <span class="nc-zan">赞 <%#Eval("Points_number") %></span>
                                        </div>
                                    </dd>
                                </dl>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>

                    <%-- 无数据提示 --%>
                    <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="feed-empty">
                        这个分类下暂时还没有内容~
                    </asp:Label>
                </div>

                <%-- ====== 右侧热搜：点击去搜索 ====== --%>
                <div class="boy-right">
                    <h3>微博热搜</h3>
                    <ul>
                        <asp:Repeater ID="rptHot" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href='Search.aspx?kw=<%# Server.UrlEncode(Eval("name").ToString()) %>'>
                                        <span class="zz"><%# Container.ItemIndex + 1 %>.</span><%#Eval("name") %>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
