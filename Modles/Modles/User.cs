using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modles
{
    public class User
    {
        public User()
        {
        }

        public User(int iD, string email, string pwd, string intPwd, string name, int sex)
        {
            ID = iD;
            Email = email;
            Pwd = pwd;
            this.intPwd = intPwd;
            Name = name;
            Sex = sex;
        }

        public int ID { get; set; }
        public string Email { get; set; }
        public string Pwd { get; set; }
        public string intPwd { get; set; }
        public string Name { get; set; }
        public int Sex { get; set; }
    }
}
