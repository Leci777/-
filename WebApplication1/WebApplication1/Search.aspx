<%@ Page Title="" Language="C#" MasterPageFile="~/NewAll.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication1.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- 微博搜索页：从顶部搜索框或热搜点击进入，?kw=关键字 --%>
    <div class="search-page">
        <div class="search-head">
            <h2>微博搜索</h2>
            <div class="search-bar">
                <input type="text" id="kwInput" placeholder="输入关键字，回车搜索"
                    value="<%= Server.HtmlEncode(Request.QueryString["kw"] ?? "") %>"
                    onkeydown="if(event.keyCode==13){location.href='Search.aspx?kw='+encodeURIComponent(this.value);}" />
                <button type="button"
                    onclick="location.href='Search.aspx?kw='+encodeURIComponent(document.getElementById('kwInput').value);">
                    搜索
                </button>
            </div>
            <p class="search-summary">
                关键字“<b><asp:Label ID="lblKw" runat="server"></asp:Label></b>”
                共找到 <b><asp:Label ID="lblCount" runat="server"></asp:Label></b> 条相关微博
            </p>
        </div>

        <%-- 搜索结果列表 --%>
        <div class="search-result">
            <asp:Repeater ID="rptResult" runat="server">
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

            <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="feed-empty">
                没有找到相关微博，换个词试试~
            </asp:Label>
        </div>
    </div>
</asp:Content>
