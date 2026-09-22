<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="WebPL.aspx.cs" Inherits="WebApplication1.WebPL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="width:100%;min-height:600px;background-image: url(images/300cbdb91cb0d813847e4c2f898eccf3.jpeg);background-repeat: no-repeat;background-size: 100% 100%;">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <dl class="news-time" style="background-color:aliceblue;margin-top:70px;width:60%;margin:50px auto;opacity:0.8;padding-top:50px;">
                    <dt class="news-time-img">
                        <asp:Image ID="Image1" runat="server" style="border-radius: 50%;margin-left:30px" width="150px" height="150px"  ImageUrl='<%#Eval ("UserInfo.UserHeadPortrait","images/{0}")%>'/>
                    </dt>
                    <dd class="news-time-text bews-height">
                        <h2 class="news-time-title"><%#Eval("UserInfo.UserName") %> ​​​​
                            <br>
                        </h2>
                    </dd>
                    <dd class="news-time-text" style="color:gray;font-size:small;"><%#Eval("ReleaseTime") %></dd>
                    <dd class="news-time-text">
                        <time class="news-time-time"><%#Eval("Content_text") %></time>
                    </dd>
                    <dd>
                        <ul class="zfplz">
                            <li class="zfplz-item">
                                </li>
                            <li class="zfplz-item"><a href="#">
                                <img src="images/pinglun.PNG" alt="" width="20px" height="20px" title="评论"/><span>评论</span></a></li>
                            <li class="zfplz-item">
                            </li>
                        </ul>
                    </dd>
            </ItemTemplate>
        </asp:Repeater>

            <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                    <dd>
                        <span style="position:relative;top:70px;left:20px;"><img src='images/<%#Eval("UserInfo.UserHeadPortrait") %>'  width="50px" height="50px" style="border-radius:50%;"/></span>
                        <h2 class="news-time-title" style="padding-left:10px;margin-left:80px;"><%#Eval("UserInfo.UserName") %>
                            
                            <span style="color:grey;font-size:12px"><asp:Label ID="Label2" runat="server" Text='<%#Eval("PLTime") %>'></asp:Label></span>​​​
                            <br>
                        </h2>
                    </dd>
                    
                    <dd>
                        <time style="padding-left:30px;margin-left:80px;margin-top:10px">评论了：<%#Eval("Neirong") %></time></dd>
            </ItemTemplate>
        </asp:Repeater>


                    <dd>
                        <div style="width:100%;background-color:whitesmoke;margin-top:40px;">
                            <div style="margin-top:10px;">
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="90px" Width="100%" placeholder="发布你的评论" Font-Names="initial" BorderColor="#FF9900" Font-Size="Medium"></asp:TextBox>
                            </div>
                            <div style="margin-left:450px;margin-top:10px;margin-bottom:20px;">
                                <asp:LinkButton Height="30px" Width="105px" OnCommand="Unnamed_Command" runat="server" Font-Size="Medium" BackColor="#FF6600" ForeColor="White" style="text-align:center;padding-top:10px;" Text="发送"></asp:LinkButton>
                            </div>
                        </div>
                    </dd>
                </dl>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
</asp:Content>
