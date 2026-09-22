<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Guanzhu.aspx.cs" Inherits="WebApplication1.Guanzhu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="page-body">
            <%-- ====== 左侧菜单 ====== --%>
            <ul class="body-left">
                <li class="left-title">个人主页</li>
                <li class="left-item"><a href="Personnel.aspx" class="left-item-link">我的主页</a></li>
                <li class="left-item"><a href="Guanzhu.aspx" class="left-item-link active">我的关注</a></li>
                <li class="left-item"><a href="Fans.aspx" class="left-item-link">我的粉丝</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的收藏</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的赞</a></li>
                <li class="left-item"><a href="SetUp.aspx" class="left-item-link">我的管理中心</a></li>
            </ul>

            <%-- ====== 中间：可关注的好友列表 ====== --%>
            <div class="fans-center">
                <ul class="center-list">
                    <li class="list-item">可关注的好友（<asp:Label ID="Label1" runat="server"></asp:Label>）</li>
                    <li class="list-item text-gray" style="font-size:12px; margin-top:8px;">
                        排序方式：当前排序条件每天更新一次，排序结果仅供参考。
                    </li>
                </ul>

                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="fans-list">
                            <img src='images/<%#Eval("url") %>' alt="头像" />
                            <ul>
                                <li style="font-size:14px; font-weight:bold;">用户名：<%#Eval("name") %></li>
                                <li class="text-gray" style="font-size:13px;">简介：<%#Eval("text") %></li>
                                <li class="text-gray" style="font-size:13px;">粉丝：<%#Eval("num") %> 关注：<%#Eval("count") %></li>
                                <li class="text-gray" style="font-size:13px;">IP属地：<%#Eval("address") %></li>
                            </ul>
                            <div style="flex-shrink:0;">
                                <asp:LinkButton ID="LinkButton1" OnCommand="LinkButton1_Command"
                                    CommandArgument='<%#Eval("id") %>' runat="server">
                                    <input type="button" value="关注" class="btn_hf" />
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
