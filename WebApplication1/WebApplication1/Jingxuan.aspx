<%@ Page Title="" Language="C#" MasterPageFile="~/NewAll.Master" AutoEventWireup="true" CodeBehind="Jingxuan.aspx.cs" Inherits="WebApplication1.Jingxuan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- 微博精选：按点赞数为你精选的高人气微博 --%>
    <div class="jx-page">
        <div class="jx-head">
            <h2>微博精选</h2>
            <p>根据点赞数为你精选的高人气微博，实时更新</p>
        </div>

        <div class="jx-list">
            <asp:Repeater ID="rptJx" runat="server">
                <ItemTemplate>
                    <a href='WebPL.aspx?id=<%#Eval("ID") %>'>
                        <dl class="news-time1">
                            <span class="jx-rank <%# (Container.ItemIndex < 3 ? "jx-rank-top" : "") %>"><%# Container.ItemIndex + 1 %></span>
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

            <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="feed-empty">
                暂时还没有精选内容~
            </asp:Label>
        </div>
    </div>
</asp:Content>
