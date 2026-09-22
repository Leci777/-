using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// 用户实体：对应 tb_UserInfo 表。
    /// </summary>
    public class UserInfo
    {
        public UserInfo()
        {
        }

        public UserInfo(int iD, string userName, string userEmail, string userPassword, int userSex,
            int userFansNum, DateTime userBirthday, string userRegion, string userHeadPortrait,
            string userAutograph, int states, DateTime registerTime, string userYM, string userGQ, string userJX)
        {
            ID = iD;
            UserName = userName;
            UserEmail = userEmail;
            UserPassword = userPassword;
            UserSex = userSex;
            UserFansNum = userFansNum;
            UserBirthday = userBirthday;
            UserRegion = userRegion;
            UserHeadPortrait = userHeadPortrait;
            UserAutograph = userAutograph;
            States = states;
            RegisterTime = registerTime;
            UserYM = userYM;
            UserGQ = userGQ;
            UserJX = userJX;
        }

        public int ID { get; set; }                  // 用户ID
        public string UserName { get; set; }         // 昵称
        public string UserEmail { get; set; }        // 邮箱（登录账号）
        public string UserPassword { get; set; }    // 密码
        public int UserSex { get; set; }             // 性别：1男 0女
        public int UserFansNum { get; set; }         // 粉丝数
        public DateTime UserBirthday { get; set; }   // 生日
        public string UserRegion { get; set; }        // 所在地
        public string UserHeadPortrait { get; set; } // 头像文件名
        public string UserAutograph { get; set; }    // 个性签名/简介
        public int States { get; set; }              // 账号状态
        public DateTime RegisterTime { get; set; }   // 注册时间
        public string UserYM { get; set; }           // 个人域名
        public string UserGQ { get; set; }           // 感情状态
        public string UserJX { get; set; }           // 家乡
    }
}
