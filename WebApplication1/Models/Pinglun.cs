using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Pinglun
    {
        private UserInfo userInfo = new UserInfo();

        public Pinglun()
        {
        }

        public Pinglun(int iD, int userID, string neirong, int blogID, UserInfo userInfo, DateTime pLTime)
        {
            ID = iD;
            UserID = userID;
            Neirong = neirong;
            BlogID = blogID;
            UserInfo = userInfo;
            PLTime = pLTime;
        }

        public int ID { get; set; }
        public int UserID { get; set; }
        public string Neirong { get; set; }
        public int BlogID { get; set; }
        public UserInfo UserInfo { get => userInfo; set => userInfo = value; }
        public DateTime PLTime { get; set; }
    }
}
