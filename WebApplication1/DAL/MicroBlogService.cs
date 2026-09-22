using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    /// <summary>
    /// 微博数据访问层。
    /// 注意：本类所有方法都用 select *,m.ID 联表查询，再按下标取列。
    /// 列顺序：tb_UserInfo(0~15) + tb_MicroBlog(16~25) + m.ID(26)，其中
    ///   [17]=Title [18]=Content_text [19]=Content_img [20]=Content_video
    ///   [21]=Content_sound [22]=Points_number [23]=Place [25]=ReleaseTime [26]=微博ID
    /// 因此下标写死、很脆弱，表结构一改就要同步改这里。
    /// </summary>
   public class MicroBlogService
    {
        public static List<MicroBlog> SearchAll()
        {
            string sql = $"select *,m.ID from tb_UserInfo u,tb_MicroBlog m where u.ID=m.UserID order by ReleaseTime desc";
            DataSet ds = DBHelper.inat().Select(sql);
            List<MicroBlog> list = new List<MicroBlog>();
            //循环ds
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                MicroBlog microBlog = new MicroBlog();
                microBlog.UserInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
                microBlog.UserInfo.UserName = ds.Tables[0].Rows[i][1].ToString();
                microBlog.UserInfo.UserHeadPortrait = ds.Tables[0].Rows[i][8].ToString();
                microBlog.Title = ds.Tables[0].Rows[i][17].ToString();
                microBlog.Content_text = ds.Tables[0].Rows[i][18].ToString();
                microBlog.Content_img = ds.Tables[0].Rows[i][19].ToString();
                microBlog.Content_video = ds.Tables[0].Rows[i][20].ToString();
                microBlog.Content_sound = ds.Tables[0].Rows[i][21].ToString();
                microBlog.Points_number = Convert.ToInt32(ds.Tables[0].Rows[i][22]);
                microBlog.Place = ds.Tables[0].Rows[i][23].ToString();
                //microBlog.Cansee_states = Convert.ToInt32(ds.Tables[0].Rows[i][24]);
                microBlog.ReleaseTime = Convert.ToDateTime(ds.Tables[0].Rows[i][25]);
                microBlog.ID = Convert.ToInt32(ds.Tables[0].Rows[i][26]);
                list.Add(microBlog);
            }
            return list;
        }
        public static List<MicroBlog> SearchAllPL(int id)
        {
            string sql = $"select *,m.ID from tb_UserInfo u,tb_MicroBlog m where u.ID=m.UserID and m.ID={id}";
            DataSet ds = DBHelper.inat().Select(sql);
            List<MicroBlog> list = new List<MicroBlog>();
            //循环ds
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                MicroBlog microBlog = new MicroBlog();
                microBlog.UserInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
                microBlog.UserInfo.UserName = ds.Tables[0].Rows[i][1].ToString();
                microBlog.UserInfo.UserHeadPortrait = ds.Tables[0].Rows[i][8].ToString();
                microBlog.Title = ds.Tables[0].Rows[i][17].ToString();
                microBlog.Content_text = ds.Tables[0].Rows[i][18].ToString();
                microBlog.Content_img = ds.Tables[0].Rows[i][19].ToString();
                microBlog.Content_video = ds.Tables[0].Rows[i][20].ToString();
                microBlog.Content_sound = ds.Tables[0].Rows[i][21].ToString();
                microBlog.Points_number = Convert.ToInt32(ds.Tables[0].Rows[i][22]);
                microBlog.Place = ds.Tables[0].Rows[i][23].ToString();
                //microBlog.Cansee_states = Convert.ToInt32(ds.Tables[0].Rows[i][24]);
                microBlog.ReleaseTime = Convert.ToDateTime(ds.Tables[0].Rows[i][25]);
                microBlog.ID = Convert.ToInt32(ds.Tables[0].Rows[i][26]);
                list.Add(microBlog);
            }
            return list;
        }
        public static List<Pinglun> SearchAllPLQ(int id)
        {
            string sql = $"select  p.id,Neirong,u.UserName,PLTime, u.UserHeadPortrait from tb_Pinglun p,tb_MicroBlog m,tb_UserInfo u where u.id=p.UserID and m.ID=p.BlogID and BlogID={id}";
            DataSet ds = DBHelper.inat().Select(sql);
            List<Pinglun> list = new List<Pinglun>();
            //循环ds
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Pinglun pinglun = new Pinglun();
                pinglun.UserInfo.UserName = ds.Tables[0].Rows[i][2].ToString();
                pinglun.Neirong = ds.Tables[0].Rows[i][1].ToString();
                pinglun.PLTime=Convert.ToDateTime(ds.Tables[0].Rows[i][3]);
                pinglun.UserInfo.UserHeadPortrait = ds.Tables[0].Rows[i][4].ToString();
                list.Add(pinglun);
            }
            return list;
        }
        public static bool InsertPL(string uid, string neirong,int bid)
        {
            string sql = $"insert into tb_Pinglun values('{uid}','{neirong}',{bid},'{DateTime.Now}')";
            return DBHelper.inat().InsertUp(sql);
        }
        public static List<MicroBlog> SearchAllBYID(int id)
        {
            string sql = $"select *,m.ID from tb_UserInfo u,tb_MicroBlog m where u.ID=m.UserID and UserID={id} order by ReleaseTime desc";
            DataSet ds = DBHelper.inat().Select(sql);
            List<MicroBlog> list = new List<MicroBlog>();
            //循环ds
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                MicroBlog microBlog = new MicroBlog();
                microBlog.UserInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
                microBlog.UserInfo.UserName = ds.Tables[0].Rows[i][1].ToString();
                microBlog.UserInfo.UserHeadPortrait = ds.Tables[0].Rows[i][8].ToString();
                microBlog.Title = ds.Tables[0].Rows[i][17].ToString();
                microBlog.Content_text = ds.Tables[0].Rows[i][18].ToString();
                microBlog.Content_img = ds.Tables[0].Rows[i][19].ToString();
                microBlog.Content_video = ds.Tables[0].Rows[i][20].ToString();
                microBlog.Content_sound = ds.Tables[0].Rows[i][21].ToString();
                microBlog.Points_number = Convert.ToInt32(ds.Tables[0].Rows[i][22]);
                microBlog.Place = ds.Tables[0].Rows[i][23].ToString();
                //microBlog.Cansee_states = Convert.ToInt32(ds.Tables[0].Rows[i][24]);
                microBlog.ReleaseTime = Convert.ToDateTime(ds.Tables[0].Rows[i][25]);
                microBlog.ID = Convert.ToInt32(ds.Tables[0].Rows[i][26]);
                list.Add(microBlog);
            }
            return list;
        }

        //关键字搜索
        public static List<MicroBlog> SearchByContent_text(string Content_text,int id)
        {
            string sql = $"select *,m.ID from tb_UserInfo u,tb_MicroBlog m where u.ID=m.UserID and Content_text like '%{Content_text}%' and UserID={id} order by ReleaseTime desc";
            DataSet ds = DBHelper.inat().Select(sql);
            List<MicroBlog> list = new List<MicroBlog>();
            //循环ds
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                MicroBlog microBlog = new MicroBlog();
                microBlog.UserInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
                microBlog.UserInfo.UserName = ds.Tables[0].Rows[i][1].ToString();
                microBlog.UserInfo.UserHeadPortrait = ds.Tables[0].Rows[i][8].ToString();
                microBlog.Title = ds.Tables[0].Rows[i][17].ToString();
                microBlog.Content_text = ds.Tables[0].Rows[i][18].ToString();
                microBlog.Content_img = ds.Tables[0].Rows[i][19].ToString();
                microBlog.Content_video = ds.Tables[0].Rows[i][20].ToString();
                microBlog.Content_sound = ds.Tables[0].Rows[i][21].ToString();
                microBlog.Points_number = Convert.ToInt32(ds.Tables[0].Rows[i][22]);
                microBlog.Place = ds.Tables[0].Rows[i][23].ToString();
                //microBlog.Cansee_states = Convert.ToInt32(ds.Tables[0].Rows[i][24]);
                microBlog.ReleaseTime = Convert.ToDateTime(ds.Tables[0].Rows[i][25]);
                microBlog.ID = Convert.ToInt32(ds.Tables[0].Rows[i][26]);
                list.Add(microBlog);
            }
            return list;
        }

     
        /// <summary>
        /// 全站关键字搜索：按微博正文模糊匹配（游客和登录用户都能用）。
        /// </summary>
        public static List<MicroBlog> SearchByKeyword(string keyword)
        {
            string safe = keyword.Replace("'", "''");   // 简单转义，降低注入风险
            string sql = $"select *,m.ID from tb_UserInfo u,tb_MicroBlog m where u.ID=m.UserID and Content_text like '%{safe}%' order by ReleaseTime desc";
            DataSet ds = DBHelper.inat().Select(sql);
            List<MicroBlog> list = new List<MicroBlog>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                MicroBlog microBlog = new MicroBlog();
                microBlog.UserInfo.ID = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
                microBlog.UserInfo.UserName = ds.Tables[0].Rows[i][1].ToString();
                microBlog.UserInfo.UserHeadPortrait = ds.Tables[0].Rows[i][8].ToString();
                microBlog.Title = ds.Tables[0].Rows[i][17].ToString();
                microBlog.Content_text = ds.Tables[0].Rows[i][18].ToString();
                microBlog.Content_img = ds.Tables[0].Rows[i][19].ToString();
                microBlog.Points_number = Convert.ToInt32(ds.Tables[0].Rows[i][22]);
                microBlog.Place = ds.Tables[0].Rows[i][23].ToString();
                microBlog.ReleaseTime = Convert.ToDateTime(ds.Tables[0].Rows[i][25]);
                microBlog.ID = Convert.ToInt32(ds.Tables[0].Rows[i][26]);
                list.Add(microBlog);
            }
            return list;
        }

        public static bool Insert (string id,string name)
        {
            string sql = $"insert into tb_MicroBlog (UserID ,Content_text,Points_number) values({id},'{name}',0)" ;
            return DBHelper.inat().InsertUp(sql);
        }

        public static bool deleteByID(int idd)
        {
            string sql = $"delete from tb_MicroBlog where ID={idd}";
            return DBHelper.inat().InsertUp(sql);
        }
        public static bool Updataa(int id)
        {
            string sql = $"update tb_MicroBlog set Points_number=Points_number+1 where ID={id}";
            return DBHelper.inat().InsertUp(sql);
        }
    }
}
