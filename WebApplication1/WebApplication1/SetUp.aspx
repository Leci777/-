<%@ Page Title="" Language="C#" MasterPageFile="~/All.Master" AutoEventWireup="true" CodeBehind="SetUp.aspx.cs" Inherits="WebApplication1.SetUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="safe-section">
            <%-- ====== 左侧设置菜单 ====== --%>
            <div class="safe-left">
                <ul class="shezhi_ul">
                    <li class="shezhi">设置</li>
                    <li><a class="one_li" href="SetUp.aspx" style="color:var(--wb-orange);">编辑资料</a></li>
                    <li><a class="one_li" href="Safe.aspx">账号安全</a></li>
                    <li><a class="one_li" href="#">隐私设置</a></li>
                    <li><a class="one_li" href="#">消息设置</a></li>
                    <li><a class="one_li" href="#">屏蔽设置</a></li>
                    <li><a class="one_li" href="#">使用偏好</a></li>
                </ul>
            </div>

            <%-- ====== 右侧：编辑资料表单 ====== --%>
            <div class="set-two">
                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
                    <span style="font-size:18px; font-weight:bold;">账号信息设置</span>
                    <a href="Index.aspx" style="color:#666;">＜ 返回</a>
                </div>

                <ul>
                    <%-- 头像上传 --%>
                    <li class="zhanghao_img">
                        <asp:Image ID="Image1" runat="server" width="100" height="100" />
                        <div style="margin-top:10px;">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Label ID="lbl" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                    </li>

                    <%-- 昵称 --%>
                    <li class="zhanghao_li">昵称：
                        <asp:TextBox ID="txt_nc" runat="server" CssClass="li-txt"></asp:TextBox>
                    </li>
                    <li class="text-gray" style="margin-left:60px; font-size:12px; font-weight:normal;">4~30个字符、支持中英文、数字</li>

                    <%-- 简介 --%>
                    <li class="zhanghao_li">简介：
                        <asp:TextBox ID="txt_jianjie" runat="server" CssClass="li-txt"></asp:TextBox>
                    </li>
                    <li class="text-gray" style="margin-left:60px; font-size:12px; font-weight:normal;">4~30个字符、支持中英文、数字</li>

                    <%-- 个人域名 --%>
                    <li class="zhanghao_li">个人域名：
                        <asp:TextBox ID="txt_geren" runat="server" CssClass="li-txt" style="width:330px;"></asp:TextBox>
                    </li>
                    <li class="text-gray" style="margin-left:60px; font-size:12px; font-weight:normal;">4~30个字符、支持中英文、数字</li>

                    <%-- 个人基本资料分割线 --%>
                    <li class="geren">个人基本资料</li>

                    <%-- 性别 --%>
                    <li class="zhanghao_li">性别：
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" style="display:inline-block; vertical-align:middle; margin-left:8px;">
                            <asp:ListItem Value="1">男</asp:ListItem>
                            <asp:ListItem Value="0">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </li>

                    <%-- 生日：年/月/日 --%>
                    <li class="zhanghao_li">生日：
                        <asp:DropDownList ID="Drop_year" runat="server" CssClass="li-txt" style="width:110px;">
                            <asp:ListItem>1888</asp:ListItem>
                            <asp:ListItem>1999</asp:ListItem>
                            <asp:ListItem>2000</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
                            <asp:ListItem>2003</asp:ListItem>
                            <asp:ListItem>2004</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drop_month" runat="server" CssClass="li-txt" style="width:100px; margin-left:8px;">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drop_day" runat="server" CssClass="li-txt" style="width:100px; margin-left:8px;">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem><asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                    </li>

                    <%-- 感情状态 --%>
                    <li class="zhanghao_li">感情状态：
                        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="li-txt" style="width:160px;">
                            <asp:ListItem>已婚</asp:ListItem>
                            <asp:ListItem>未婚</asp:ListItem>
                        </asp:DropDownList>
                    </li>

                    <%-- 所在地 --%>
                    <li class="zhanghao_li">所在地：
                        <asp:DropDownList ID="DropDownList5" runat="server" CssClass="li-txt" style="width:160px;">
                            <asp:ListItem>重庆市</asp:ListItem>
                            <asp:ListItem>贵州省</asp:ListItem>
                            <asp:ListItem>北京市</asp:ListItem>
                            <asp:ListItem>上海市</asp:ListItem>
                        </asp:DropDownList>
                    </li>

                    <%-- 家乡 --%>
                    <li class="zhanghao_li">家乡：
                        <asp:DropDownList ID="DropDownList6" runat="server" CssClass="li-txt" style="width:160px;">
                            <asp:ListItem>重庆市</asp:ListItem>
                            <asp:ListItem>北京市</asp:ListItem>
                            <asp:ListItem>上海市</asp:ListItem>
                            <asp:ListItem>贵州省</asp:ListItem>
                            <asp:ListItem>成都市</asp:ListItem>
                        </asp:DropDownList>
                    </li>

                    <%-- 提交按钮 --%>
                    <li class="zhanghao_li" style="text-align:center; margin-top:30px;">
                        <asp:Button ID="Button1" runat="server" Text="保存修改"
                            OnClick="Button1_Click" CssClass="btn btn-primary" style="width:160px; height:42px; font-size:15px;" />
                    </li>
                </ul>
            </div>
        </div>
    </section>
</asp:Content>
