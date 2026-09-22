<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Personnel.aspx.cs" Inherits="WebApplication1.Personnel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="page-body">
            <%-- ====== 左侧菜单 ====== --%>
            <ul class="body-left">
                <li class="left-title">个人主页</li>
                <li class="left-item"><a href="Personnel.aspx" class="left-item-link active">我的主页</a></li>
                <li class="left-item"><a href="Guanzhu.aspx" class="left-item-link">我的关注</a></li>
                <li class="left-item"><a href="Fans.aspx" class="left-item-link">我的粉丝</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的收藏</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的赞</a></li>
                <li class="left-item"><a href="SetUp.aspx" class="left-item-link">我的管理中心</a></li>
            </ul>

            <%-- ====== 中间：封面 + 资料卡 + 微博列表 ====== --%>
            <div class="body-center">
                <div class="bg-img">
                    <img src="images/bg.png" alt="个人主页封面" />
                </div>
                <div class="messages">
                    <div style="display:flex; justify-content:space-between; align-items:center; padding:14px 0 8px;">
                        <a href="Index.aspx" style="color:#fff; font-weight:bold;">＜ 返回</a>
                    </div>

                    <%-- 头像 + 昵称 + 粉丝/关注 --%>
                    <div style="display:flex; align-items:flex-end; gap:14px; margin-top:-50px;">
                        <a href="SetUp.aspx">
                            <asp:Image ID="Image2" runat="server" width="100" height="100"
                                style="border-radius:50%; border:3px solid #fff;" />
                        </a>
                        <div style="padding-bottom:8px;">
                            <span style="font-size:20px; font-weight:bold;">
                                <asp:Label ID="lbl_yhm" runat="server"></asp:Label>
                            </span>
                            <div class="fs" style="margin-top:6px;">
                                <a href="Fans.aspx">粉丝 <asp:Label ID="lbl_fs" runat="server"></asp:Label></a>
                                &nbsp;&nbsp;关注 6
                            </div>
                        </div>
                    </div>

                    <%-- 简介 + 注册时间 --%>
                    <div style="margin-top:10px; color:gray; font-size:13px;">
                        <asp:Label ID="lbl_jianjie" runat="server"></asp:Label><br />
                        <asp:Label ID="lbl_zctime" runat="server"></asp:Label> 加入微博
                    </div>

                    <%-- 精选/微博/相册 tab：点击切换 ?tab= --%>
                    <ul class="bottom-three">
                        <li class="three-item"><a href="Personnel.aspx?tab=jx" class="<%= TabActive("jx") %>">精选</a></li>
                        <li class="three-item"><a href="Personnel.aspx?tab=wb" class="<%= TabActive("wb") %>">微博</a></li>
                        <li class="three-item"><a href="Personnel.aspx?tab=photo" class="<%= TabActive("photo") %>">相册</a></li>
                    </ul>

                    <div style="background-color:#fafafa; height:40px; line-height:40px; padding-left:16px; font-size:13px; color:#666;">
                        全部微博 （<asp:Label ID="lbl_munber" runat="server"></asp:Label>）
                    </div>
                </div>

                <%-- 个人微博列表 --%>
                <div style="margin-top:16px;">
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <dl class="news-time">
                                <dt class="news-time-img">
                                    <asp:Image ID="Image1" runat="server" width="50" height="50"
                                        ImageUrl='<%#Eval("UserInfo.UserHeadPortrait","images/{0}")%>' />
                                </dt>
                                <dd class="news-time-text">
                                    <h2 class="news-time-title" style="font-size:14px;">
                                        <asp:Label ID="lbl_yhm" runat="server" Text='<%#Eval("UserInfo.UserName") %>'></asp:Label>
                                        <span style="color:gray; font-size:12px; font-weight:normal; margin-left:10px;">
                                            <asp:Label ID="lbl_fbtime" runat="server" Text='<%#Eval("ReleaseTime") %>'></asp:Label> 发布
                                        </span>
                                    </h2>
                                    <p style="margin:8px 0; line-height:1.7;"><%#Eval("Content_text") %></p>
                                    <%# ImgHtml(Eval("Content_img")) %>

                                    <ul class="zfplz">
                                        <li class="zfplz-item"><a href="#"><img src="images/zhuanfa.PNG" alt="转发" title="转发" /><span>转发</span></a></li>
                                        <li class="zfplz-item">
                                            <a href='WebPL.aspx?id=<%#Eval("ID") %>'><img src="images/pinglun.PNG" alt="评论" title="评论" /><span>评论</span></a>
                                        </li>
                                        <li class="zfplz-item">
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="dianzan"
                                                CommandArgument='<%#Eval("ID") %>' OnCommand="LinkButton1_Command">
                                                <img src="images/dianzan.PNG" alt="赞" title="赞" /><span>赞&nbsp;<%#Eval("Points_number")%></span>
                                            </asp:LinkButton>
                                        </li>
                                        <li class="zfplz-item">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete"
                                                OnClientClick="return confirm('您确定要删除该微博吗？')"
                                                CommandArgument='<%#Eval("ID") %>' OnCommand="LinkButton1_Command">
                                                <img src="images/close1.png" alt="删除" title="删除" /><span>删除</span>
                                            </asp:LinkButton>
                                        </li>
                                    </ul>
                                </dd>
                            </dl>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <%-- ====== 右侧：按内容搜索 ====== --%>
            <div class="body-right">
                <span>按内容搜索</span>
                <div style="margin-top:14px;">
                    <div style="font-size:13px; color:#666; margin-bottom:6px;">关键字：</div>
                    <asp:TextBox ID="txt_keywords" runat="server" CssClass="right-input"
                        style="width:100%;" OnTextChanged="txt_keywords_TextChanged"></asp:TextBox>
                    <asp:Button ID="btn_search" runat="server" Text="搜索一下"
                        OnClick="btn_search_Click" CssClass="btn btn-primary"
                        style="width:100%; margin-top:10px;" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
