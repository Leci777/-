using DAL;
using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    /// <summary>
    /// 用户业务层：对 DAL 的 UserInfoService 做薄封装，供 Web 层调用。
    /// </summary>
    public class UserInfoManager
    {
        public static List<UserInfo> SelectNamePwd(string UserName, string UserPassword)
        {
            return UserInfoService.SelectNamePwd(UserName,UserPassword);
        }
        public static List<UserInfo> SearchAll()
        {
            return UserInfoService.SearchAll();
        }
            //public static DataSet SelectNamePwd(UserInfo user)
            //{
            //    return UserInfoService.SelectNamePwd(user);
            //}
            public static bool Insert(UserInfo user)
        {
            return UserInfoService.Insert(user);
        }
        public static bool UpdateAll(UserInfo userInfo, string name)
        {
            return UserInfoService.UpdateAll(userInfo,name);
        }
        public static UserInfo SelectIDByEmail(string email, int id)
        {
            return UserInfoService.SelectIDByEmail(email, id);
        }
        public static UserInfo SelecteEmail(string userEmail)
        {
            return UserInfoService.SelecteEmail(userEmail);
        }
        public static UserInfo SearchAllid(int id)
        {
            return UserInfoService.SearchAllid(id);
        }
        public static bool UpdatePwd(string pwd, int id)
        {
            return UserInfoService.UpdatePwd(pwd,id);
        }
    }
}
