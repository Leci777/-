using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// 微博实体：对应 tb_MicroBlog 表。
    /// 内部持有一个 UserInfo，用于联表查询时一并带出博主信息。
    /// </summary>
    public class MicroBlog
    {
        // 关联的博主信息（联表查询时填充）
        private UserInfo userInfo = new UserInfo();

        public MicroBlog()
        {
        }

        public MicroBlog(int id, int userID, string title, string content_text, string content_img,
            string content_video, string content_sound, int points_number, string place,
            int cansee_states, DateTime releaseTime)
        {
            ID = id;
            UserID = userID;
            Title = title;
            Content_text = content_text;
            Content_img = content_img;
            Content_video = content_video;
            Content_sound = content_sound;
            Points_number = points_number;
            Place = place;
            Cansee_states = cansee_states;
            ReleaseTime = releaseTime;
        }

        public int ID { get; set; }                  // 微博ID
        public int UserID { get; set; }               // 发布者ID
        public string Title { get; set; }             // 标题
        public string Content_text { get; set; }      // 正文
        public string Content_img { get; set; }        // 配图
        public string Content_video { get; set; }     // 视频
        public string Content_sound { get; set; }     // 音频
        public int Points_number { get; set; }        // 点赞数
        public string Place { get; set; }             // 定位
        public int Cansee_states { get; set; }        // 可见范围
        public DateTime ReleaseTime { get; set; }     // 发布时间
        public UserInfo UserInfo { get => userInfo; set => userInfo = value; }   // 博主
    }
}
