using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
   public class GoodFriend
    {
        public GoodFriend()
        {
        }

        public GoodFriend(int id, int myUserID, int followUserID, int fansUserID, DateTime establish, string friendRemarks, int aitemeUserID)
        {
            Id = id;
            MyUserID = myUserID;
            FollowUserID = followUserID;
            FansUserID = fansUserID;
            Establish = establish;
            FriendRemarks = friendRemarks;
            AitemeUserID = aitemeUserID;
        }

        public int Id { get; set; }
        public int MyUserID { get; set; }
        public int FollowUserID { get; set; }
        public int FansUserID { get; set; }
        public DateTime Establish { get; set; }
        public string FriendRemarks { get; set; }
        public int AitemeUserID { get; set; }
    }
}
