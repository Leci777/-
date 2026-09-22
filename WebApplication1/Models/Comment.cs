using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Comment
    {
        public Comment()
        {
        }

        public Comment(int id, int commentatorUserID, int beCommentatorUserID, string content_text, string content_img, string content_video, string content_sound, DateTime commentTime)
        {
            Id = id;
            CommentatorUserID = commentatorUserID;
            BeCommentatorUserID = beCommentatorUserID;
            Content_text = content_text;
            Content_img = content_img;
            Content_video = content_video;
            Content_sound = content_sound;
            CommentTime = commentTime;
        }

        public int Id { get; set; }
        public int CommentatorUserID { get; set; }
        public int BeCommentatorUserID { get; set; }
        public string Content_text { get; set; }
        public string Content_img { get; set; }
        public string Content_video { get; set; }
        public string Content_sound { get; set; }
        public DateTime CommentTime { get; set; }

    }
}
