using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
   public class Grouping
    {
        public Grouping()
        {
        }

        public Grouping(int id, string groupName, int friendUserID, int myUserID)
        {
            Id = id;
            GroupName = groupName;
            FriendUserID = friendUserID;
            MyUserID = myUserID;
        }

        public int Id { get; set; }
        public string GroupName { get; set; }
        public int FriendUserID { get; set; }
        public int MyUserID { get; set; }
    }
}
