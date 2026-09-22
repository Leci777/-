<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Guanzhu.aspx.cs" Inherits="WebApplication1.Guanzhu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section>
        <div class="page-body">
            <ul class="body-left">
                <li class="left-title">个人主页</li>
                <li class="left-item"><a href="Personnel.aspx" class="left-item-link">我的主页</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的关注</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的粉丝</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的收藏</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的赞</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的管理中心</a></li>
            </ul>
            <div class="fans-center">
                <ul class="center-list">
                    <li class="list-item" style="color: rgb(56, 55, 55);font-size: 0.9em;">可关注的好友(<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>)</li>
                    <li class="list-item" style="color: gray;font-size: 0.8em;margin-top: 30px;">排序方式：当前排序条件每天更新一次，排序结果仅供参考。</li>
                </ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="fans-list">

                            <img src='images/<%#Eval("url") %>' alt="" style="border-radius: 50%; margin-left: -100px;" width="80px" height="80px">
                            <ul style="margin-left: -220px;">
                                <li style="font-size: 0.9em; font-weight: bold; height: 25px; line-height: 25px;">用户名:  <%#Eval("name") %></li>
                                <li style="font-size: 0.8em; color: gray; height: 25px; line-height: 25px;">简介:  <%#Eval("text") %></li>
                                <li style="font-size: 0.8em; color: gray; height: 25px; line-height: 25px;">粉丝:  <%#Eval("num") %>  关注:<%#Eval("count") %></li>
                                <li style="font-size: 0.8em; color: gray; height: 25px; line-height: 25px;">IP属地  :  <%#Eval("address") %></li>
                            </ul>
                            <asp:LinkButton ID="LinkButton1"  OnCommand="LinkButton1_Command" CommandArgument='<%#Eval("id") %>' runat="server"> <input type="button" value="关注" class="btn_hf"></asp:LinkButton>
                           
                            
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
