<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="WebPL.aspx.cs" Inherits="WebApplication1.WebPL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:1000px; margin:70px auto 40px;">
        <%-- ====== 原微博（被评论的那条） ====== --%>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <dl class="news-time" style="background-color:#fff; margin-bottom:16px;">
                    <dt class="news-time-img">
                        <asp:Image ID="Image1" runat="server" width="60" height="60"
                            ImageUrl='<%#Eval("UserInfo.UserHeadPortrait","images/{0}")%>' />
                    </dt>
                    <dd class="news-time-text">
                        <h2 class="news-time-title"><%#Eval("UserInfo.UserName") %></h2>
                        <time class="news-time-time"><%#Eval("ReleaseTime") %></time>
                        <p style="margin-top:8px; line-height:1.7;"><%#Eval("Content_text") %></p>
                        <%# ImgHtml(Eval("Content_img")) %>
                    </dd>
                </dl>
            </ItemTemplate>
        </asp:Repeater>

        <%-- ====== 评论列表 ====== --%>
        <div class="card">
            <div class="card-title">全部评论</div>
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div style="display:flex; gap:12px; padding:12px 0; border-bottom:1px solid #f0f0f0;">
                        <img src='images/<%#Eval("UserInfo.UserHeadPortrait") %>' width="40" height="40"
                            style="border-radius:50%;" alt="头像" />
                        <div style="flex:1;">
                            <div style="font-weight:bold; color:var(--wb-orange); font-size:14px;">
                                <%#Eval("UserInfo.UserName") %>
                                <span style="color:#999; font-weight:normal; font-size:12px; margin-left:10px;">
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("PLTime") %>'></asp:Label>
                                </span>
                            </div>
                            <div style="margin-top:4px; font-size:14px; line-height:1.6;">
                                <%#Eval("Neirong") %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <%-- 如果没有评论，给个提示 --%>
            <asp:Label ID="lbl_nopl" runat="server" Visible="true" style="display:block; text-align:center; padding:20px; color:#999;">
                暂无评论，快来抢沙发吧~
            </asp:Label>
        </div>

        <%-- ====== 发布评论框 ====== --%>
        <div class="post-box" style="margin-top:16px;">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="90px" Width="100%"
                placeholder="发布你的评论..." BorderColor="#FF9900"></asp:TextBox>
            <div class="post-actions">
                <asp:LinkButton runat="server" OnCommand="Unnamed_Command" CssClass="btn btn-primary"
                    style="display:inline-block; height:36px; line-height:36px; padding:0 22px;">发送评论</asp:LinkButton>
            </div>
        </div>

        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
