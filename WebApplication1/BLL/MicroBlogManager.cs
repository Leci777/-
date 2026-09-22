
using DAL;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    /// <summary>
    /// 微博业务层：对 DAL 的 MicroBlogService 做薄封装，供 Web 层调用。
    /// </summary>
    public class MicroBlogManager
    {
        public static List<MicroBlog> SearchAll()
        {
            return MicroBlogService.SearchAll();
        }
        public static List<MicroBlog> SearchAllPL(int id)
        {
            return MicroBlogService.SearchAllPL(id);
        }
        public static List<Pinglun> SearchAllPLQ(int id)
        {
            return MicroBlogService.SearchAllPLQ(id);
        }
        public static bool InsertPL(string uid, string neirong, int bid)
        {
            return MicroBlogService.InsertPL(uid,neirong,bid);
        }
        public static List<MicroBlog> SearchAllBYID(int id)
        {
            return MicroBlogService.SearchAllBYID(id);
        }
        //关键字搜索
        public static List<MicroBlog> SearchByContent_text(string Content_text,int id)
        {
            return MicroBlogService.SearchByContent_text(Content_text,id);
        }
        //全站关键字搜索
        public static List<MicroBlog> SearchByKeyword(string keyword)
        {
            return MicroBlogService.SearchByKeyword(keyword);
        }
        public static bool Insert(string id, string name)
        {
            return MicroBlogService.Insert(id,name);
        }
        public static bool deleteByID(int idd)
        {
            return MicroBlogService.deleteByID(idd);
        }
        public static bool Updataa(int id)
        {
            return MicroBlogService.Updataa(id);
        }
    }
}
