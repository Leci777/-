using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    /// <summary>
    /// 用户数据访问层。
    /// 注意：方法多用字符串拼接 SQL（select * from tb_UserInfo ...），
    /// 按下标取列：[0]=ID [1]=UserName [2]=UserEmail [3]=UserPassword
    /// [5]=UserFansNum [7]=UserRegion [8]=UserHeadPortrait [9]=UserAutograph
    /// [11]=RegisterTime [12]=UserYM [13]=UserGQ [14]=UserJX。
    /// 表结构改动后需同步核对下标。
    /// </summary>
    public class UserInfoService
    {
        public static List<UserInfo> SelectNamePwd(string UserName, string UserPassword)
        {
            List<UserInfo> list = new List<UserInfo>();
            string sql = $"select * from tb_UserInfo where UserEmail='{UserName}'and UserPassword={UserPassword}";
            SqlDataReader dr = DBHelper.inat().GetReader(sql);
            while (dr.Read())
            {
                UserInfo info = new UserInfo();
                info.ID =Convert.ToInt32( dr[0]);
                info.UserEmail = dr.GetString(2);
                info.UserPassword = dr.GetString(3);
                list.Add(info);
            }
            dr.Close();
            return list;
        }
        public static UserInfo SelectIDByEmail(string email,int id)
        {
            string sql = $"select ID from tb_UserInfo where UserEmail='{email}'";
            DataSet ds = DBHelper.inat().Select(sql);

            UserInfo userInfo = new UserInfo();
            if (ds.Tables[0].Rows.Count>0)
            {
                userInfo.ID = Convert.ToInt32(id);
            }
            return userInfo;
        }
        public static List<UserInfo> SearchAll()
        {
            string sql = "select * from tb_UserInfo";
            DataSet ds = DBHelper.inat().Select(sql);
            List<UserInfo> list = new List<UserInfo>();
            //循环ds
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                UserInfo userInfo = new UserInfo();
                userInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
                userInfo.UserName = ds.Tables[0].Rows[i][1].ToString();
                userInfo.UserEmail = ds.Tables[0].Rows[i][2].ToString();
                userInfo.UserPassword = ds.Tables[0].Rows[i][3].ToString();
                //userInfo.UserSex = Convert.ToInt32(ds.Tables[0].Rows[i][4]);
                userInfo.UserFansNum = Convert.ToInt32(ds.Tables[0].Rows[i][5]);
                //userInfo.UserBirthday = Convert.ToDateTime(ds.Tables[0].Rows[i][6]);
                userInfo.UserRegion = ds.Tables[0].Rows[i][7].ToString();
                userInfo.UserHeadPortrait = ds.Tables[0].Rows[i][8].ToString();
                userInfo.UserAutograph = ds.Tables[0].Rows[i][9].ToString();
                //userInfo.States = Convert.ToInt32(ds.Tables[0].Rows[i][10]);
                //userInfo.RegisterTime = Convert.ToDateTime(ds.Tables[0].Rows[i][11]);
                userInfo.UserYM = ds.Tables[0].Rows[i][12].ToString();
                userInfo.UserGQ = ds.Tables[0].Rows[i][13].ToString();
                userInfo.UserJX = ds.Tables[0].Rows[i][14].ToString();
                list.Add(userInfo);
            }
            return list;
        }
        public static UserInfo SearchAllid(int id)
        {
            string sql = $"select * from tb_UserInfo where ID={id}";
            DataSet ds = DBHelper.inat().Select(sql);
            //循环ds
                UserInfo userInfo = new UserInfo();
                userInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                userInfo.UserName = ds.Tables[0].Rows[0][1].ToString();
                userInfo.UserEmail = ds.Tables[0].Rows[0][2].ToString();
                userInfo.UserPassword = ds.Tables[0].Rows[0][3].ToString();
                //userInfo.UserSex = Convert.ToInt32(ds.Tables[0].Rows[0][4]);
                userInfo.UserFansNum = Convert.ToInt32(ds.Tables[0].Rows[0][5]);
                //userInfo.UserBirthday = Convert.ToDateTime(ds.Tables[0].Rows[i][6]);
                userInfo.UserRegion = ds.Tables[0].Rows[0][7].ToString();
                userInfo.UserHeadPortrait = ds.Tables[0].Rows[0][8].ToString();
                userInfo.UserAutograph = ds.Tables[0].Rows[0][9].ToString();
                //userInfo.States = Convert.ToInt32(ds.Tables[0].Rows[i][10]);
                userInfo.RegisterTime = Convert.ToDateTime(ds.Tables[0].Rows[0][11]);
                userInfo.UserYM = ds.Tables[0].Rows[0][12].ToString();
                userInfo.UserGQ = ds.Tables[0].Rows[0][13].ToString();
                userInfo.UserJX = ds.Tables[0].Rows[0][14].ToString();
            return userInfo;
        }
        public static bool Insert(UserInfo user)
        {
            string sql = $"insert into tb_UserInfo (UserEmail,UserPassword,UserName,UserRegion,UserSex,UserFansNum,UserBirthday,UserHeadPortrait,UserAutograph,RegisterTime,UserYM,UserGQ,UserJX) values('{user.UserEmail}','{user.UserPassword}','{user.UserName}','{user.UserRegion}',1,0,'2000-1-1','liujie.jpg','暂无简介','{DateTime.Now}','123','未婚','重庆')";
            return DBHelper.inat().InsertUp(sql);
        }
        public static bool UpdateAll(UserInfo userInfo, string name)
        {
            string sql = $"update tb_UserInfo set UserName='{userInfo.UserName}',UserGQ='{userInfo.UserGQ}',UserRegion='{userInfo.UserRegion}',UserJX='{userInfo.UserJX}',UserHeadPortrait='{userInfo.UserHeadPortrait}' where UserEmail='{name}'";
            return DBHelper.inat().InsertUp(sql);
        }
        public static UserInfo SelecteEmail(string userEmail)
        {
            int num;
            string sql = $"select count(*) from tb_UserInfo where UserEmail='{userEmail}'";
            DataSet ds = DBHelper.inat().Select(sql);
            UserInfo gInfo = new UserInfo();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gInfo.UserEmail = ds.Tables[0].Rows[0][2].ToString();
            }
            return gInfo;
        }
        //修改密码
        public static bool UpdatePwd(string pwd, int id)
        {
            string sql = $"update tb_UserInfo set UserPassword='{pwd}' where ID={id}";
            return DBHelper.inat().InsertUp(sql);
        }
    }
}
