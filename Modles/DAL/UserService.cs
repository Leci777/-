using Modles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserService
    {
        public static bool Insert(User user)
        {
            string sql = $"insert into User values('{user.Email}',{user.Pwd},{user.intPwd},{user.Name},{user.Sex})";
            return DBHelper.inat().InsertUp(sql);
        }
    }
}
