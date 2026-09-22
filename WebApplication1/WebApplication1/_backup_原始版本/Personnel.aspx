<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="Personnel.aspx.cs" Inherits="WebApplication1.Personnel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="page-body" style="opacity:0.85;">
            <ul class="body-left">
                <li class="left-title">个人主页</li>
                <li class="left-item"><a href="#" class="left-item-link" style="color:#f18621;">我的主页</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的关注</a></li>
                <li class="left-item"><a href="Fans.aspx" class="left-item-link">我的粉丝</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的收藏</a></li>
                <li class="left-item"><a href="#" class="left-item-link">我的赞</a></li>
                <li class="left-item"><a href="SetUp.aspx" class="left-item-link">我的管理中心</a></li>
            </ul>
            <div class="body-center">
                <div class="bg-img">
                    <img src="images/bg.png" alt="" width="650px" height="300px"/>
                </div>
                <div class="messages">
                    <span style="position: relative;top: -190px;left: 20px;"><a href="Index.aspx" style="color: white;font-weight: bold;font-size: 1.3em;">＜ 返回</a></span>
                    <div style="position: relative;top: -60px;left: 20px;">
                        <span>
                            <a href="SetUp.aspx"><asp:Image ID="Image2" runat="server"  style="border-radius: 50%;" width="100px" height="100px"/></a></span>
                        <div style="position: relative;top: -40px;left: 90px;">
                            <span style="margin:40px;font-weight: bold;font-size: 1.2em;">
                                <asp:Label ID="lbl_yhm" runat="server" Text=""></asp:Label>
                            </span><br/>
                            <span class="fs"><a href="#" style="margin-left: 40px;font-size: 0.9em;">粉丝 <asp:Label ID="lbl_fs" runat="server" Text=""></asp:Label></a></span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="fs"><a href="#" style="font-size: 0.9em;">关注 6</a></span>
                        </div>
                    </div>
                    <div style="position: relative;top: -60px;left: 40px;">
                        <span style="font-size: 0.8em;color: gray;"><asp:Label ID="lbl_jianjie" runat="server" Text="Label"></asp:Label></span><br/>
                        <span style="font-size: 0.8em;color: gray;"><asp:Label ID="lbl_zctime" runat="server" Text=""></asp:Label>  加入微博</span>
                    </div>
                    <div style="background-color: gray;height: 1px;width: 647px;margin-top: -30px;"></div>
                    <ul class="bottom-three">
                        <li class="three-item"><a href="#" style="color: black;">精选</a></li>
                        <li class="three-item"><a href="#" style="color: black;">微博</a></li>
                        <li class="three-item"><a href="#" style="color: black;">相册</a></li>
                    </ul>
                    <div style="background-color: rgb(243, 242, 242);height: 40px;line-height: 40px;">
                        <span style="font-size: 0.9em;">全部微博 （<asp:Label ID="lbl_munber" runat="server" Text="Label"></asp:Label>）</span>
                    </div>
                </div>
                <div style="min-height:400px;width:550px;">
                    <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div style="position: relative;top: 30px;left: 20px;">
                            <span>
                                <asp:Image ID="Image1" runat="server" style="border-radius: 50%;" width="50px" height="50px"  ImageUrl='<%#Eval ("UserInfo.UserHeadPortrait","images/{0}")%>'/>
                            </span>
                            <span style="font-weight: bold;font-size: 0.9em;position: relative;top: -25px;left: 15px;"><asp:Label ID="lbl_yhm" runat="server" Text='<%#Eval("UserInfo.UserName") %>'></asp:Label></span><br>
                            <span style="font-size: 0.8em;position: relative;top: -27px;left: 70px;color: gray;"><asp:Label ID="lbl_fbtime" runat="server" Text='<%#Eval("ReleaseTime") %>'></asp:Label>发布</span><br>
                            <span style="font-size: 1.0em;position: relative;top: -10px;left: 70px;"><%#Eval("Content_text") %></span><br>
                            <ul class="zfplz" style="margin-left:60px;">
                                <li class="zfplz-item"><a href="#"><img src="images/zhuanfa.PNG" alt="" width="20px" height="20px" title="转发"/><span>转发</span></a></li>
                                <li class="zfplz-item">
                                    <a href='WebPL.aspx?id=<%#Eval("ID") %>'><img src="images/pinglun.PNG" alt="" width="20px" height="20px" title="评论"/><span>评论</span></a>
                                </li>
                                <li class="zfplz-item">
                                    <asp:LinkButton ID="LinkButton2" OnCommand="LinkButton1_Command" CommandName="dianzan" CommandArgument='<%#Eval("ID") %>' runat="server">
                                        <img src="images/dianzan.PNG" alt="" width="20px" height="20px" title="赞"/><span>赞</span>&nbsp;&nbsp;<span><%#Eval("Points_number")%></span>
                                    </asp:LinkButton>
                                </li>
                                <li class="zfplz-item">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" OnClientClick="return confirm('您确定要删除该微博吗？')" CommandArgument='<%#Eval("ID") %>' OnCommand="LinkButton1_Command">
                                        <img src="images/close1.png" alt="" width="20px" height="20px" title="删除"/>
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
            </div>
            <div class="body-right">
                <span style="font-size: 1.5em;padding-top: 10px;">按内容搜索</span><br/>
                <div style="margin-top: 20px;">
                    <span style="font-size: 0.9em;">关键字：</span>
                    <asp:TextBox ID="txt_keywords" runat="server" class="right-input" OnTextChanged="txt_keywords_TextChanged"></asp:TextBox>
                    <asp:Button ID="btn_search" runat="server" Text="搜索一下"  style="width: 90px;height: 30px;margin-top: 10px;border-radius: 10px;background-color: orange;color: white;border: none;" OnClick="btn_search_Click"/>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
