using DAL;
using Modles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserManager
    {
        public static bool Insert(User user)
        {
          return UserService.Insert(user);
        }
        }
}
