<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="SetUp.aspx.cs" Inherits="WebApplication1.SetUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="grid-cell-6 set-one" style="margin-left:150px;opacity:0.6;">
            <ul class="shezhi_ul">
                <li class="shezhi">设置</li>
                <li style="margin-left:50px;"><a class="one_li" href="Safe.aspx" style="font-weight:bold;color:#f18621;">编辑资料</a></li>
                <li style="margin-left:50px;"><a class="one_li" href="Safe.aspx" style="font-weight:bold;">账号安全</a></li>
                <li style="margin-left:50px;"><a class="one_li" href="#" style="font-weight:bold;">隐私设置</a></li>
                <li style="margin-left:50px;"><a class="one_li" href="#" style="font-weight:bold;">消息设置</a></li>
                <li style="margin-left:50px;"><a class="one_li" href="#" style="font-weight:bold;">屏蔽设置</a></li>
                <li style="margin-left:50px;"><a class="one_li" href="#" style="font-weight:bold;">使用偏好</a></li>
            </ul>
        </div>
    <div class="grid-cell-6 set-two" style="margin:40px auto;background-color:aliceblue">
        <span style="position: relative;top: 0px;left: 10px;"><a href="Index.aspx" style="color: black;font-size: 1.3em;">＜ 返回</a></span>
            <ul style="margin-top:20px;margin-left:50px">
                  <li style="font-size:1.5em;font-weight:bold;margin-left:200px;margin-bottom:40px">账号信息设置</li>
                  <li class="zhanghao_img" style="margin-left:130px;">
                      <asp:Image width="100px" height="100px" ID="Image1" runat="server" /><asp:FileUpload ID="FileUpload1" runat="server" />
                      <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                  </li>
                  <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">昵称：
                      <asp:TextBox class="li-txt" ID="txt_nc" runat="server" Width="500px" Height="40px"></asp:TextBox>
                  </li>
                  <li style="margin-left: 60px;color:gray;font-size:0.8em;">4~30个字符、支持中英文、数字</li>
                  <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">简介：
                      <asp:TextBox Text="" class="li-txt" ID="txt_jianjie" runat="server" Width="500px" Height="40px"></asp:TextBox>
                  </li>
                  <li style="margin-left: 60px;color:gray;font-size:0.8em;">4~30个字符、支持中英文、数字</li>
                  <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">个人域名：
                      <asp:TextBox  class="li-txt" ID="txt_geren" runat="server" Width="470px" Height="40px"></asp:TextBox>
                  </li>
                  <li style="margin-left: 60px;color:gray;font-size:0.8em;">4~30个字符、支持中英文、数字</li>
                  <li class="geren" style="font-size:1.2em;font-weight:bold;">个人基本资料</li>
                  <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">性别：
                      <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" Width="42px">
                          <asp:ListItem Value="1">男</asp:ListItem>
                          <asp:ListItem Value="0">女</asp:ListItem>
                      </asp:RadioButtonList>
                  </li>
                  <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">生日：
                      <asp:DropDownList ID="Drop_year" runat="server" Height="28px" Width="124px">
                          <asp:ListItem>1888</asp:ListItem>
                          <asp:ListItem>1999</asp:ListItem>
                          <asp:ListItem>2000</asp:ListItem>
                          <asp:ListItem>2001</asp:ListItem>
                          <asp:ListItem>2002</asp:ListItem>
                          <asp:ListItem>2003</asp:ListItem>
                          <asp:ListItem>2004</asp:ListItem>
                          <asp:ListItem>2005</asp:ListItem>
                      </asp:DropDownList>
                    <asp:DropDownList ID="Drop_month" runat="server" Height="27px" Width="116px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                      </asp:DropDownList>
                  <asp:DropDownList ID="Drop_day" runat="server" Height="29px" Width="131px">
                      <asp:ListItem>1</asp:ListItem>
                      <asp:ListItem>2</asp:ListItem>
                      <asp:ListItem>3</asp:ListItem>
                      <asp:ListItem>4</asp:ListItem>
                      <asp:ListItem>5</asp:ListItem>
                      <asp:ListItem>6</asp:ListItem>
                      <asp:ListItem>7</asp:ListItem>
                      <asp:ListItem>8</asp:ListItem>
                      <asp:ListItem>9</asp:ListItem>
                      <asp:ListItem>10</asp:ListItem>
                      <asp:ListItem></asp:ListItem>
                      </asp:DropDownList>
                </li>
                <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">感情状态： <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem>已婚</asp:ListItem>
                    <asp:ListItem>未婚</asp:ListItem>
                    </asp:DropDownList></li>
                <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">所在地： <asp:DropDownList ID="DropDownList5" runat="server">
                    <asp:ListItem>重庆市</asp:ListItem>
                    <asp:ListItem>贵州省</asp:ListItem>
                    <asp:ListItem>北京市</asp:ListItem>
                    <asp:ListItem>上海市</asp:ListItem>
                    </asp:DropDownList></li>
                <li class="zhanghao_li" style="font-size:1.0em;font-weight:bold;">家乡： <asp:DropDownList ID="DropDownList6" runat="server">
                    <asp:ListItem>重庆市</asp:ListItem>
                    <asp:ListItem>北京市</asp:ListItem>
                    <asp:ListItem>上海市</asp:ListItem>
                    <asp:ListItem>贵州省</asp:ListItem>
                    <asp:ListItem>成都市</asp:ListItem>
                    </asp:DropDownList></li>
                <li class="zhanghao_li">
                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="修改"  Width="120px" Height="40px" BackColor="Orange" ForeColor="White" Font-Size="Large" BorderStyle="None"/>
                </li>
            </ul>
        </div>
    </section>
</asp:Content>
