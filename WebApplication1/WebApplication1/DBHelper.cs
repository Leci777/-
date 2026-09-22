using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class DBHelper
    {
        private static string str = "server=.\\SQLEXPRESS;database=blogWebsiteDB;uid=sa;pwd=123456";

        public static SqlConnection Conn = null;
        private static void InitConnection()
        {
            Conn = new SqlConnection(str);
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }
            if (Conn.State == ConnectionState.Broken)
            {
                Conn.Close();
                Conn.Open();
            }
        }
        public DataSet Clogin(UserInfo userInfo)
        {
            DataSet ds = new DataSet();
            string sql = $"select * from tb_UserInfo where UserEmail='{userInfo.UserEmail}'";
            SqlDataAdapter sda = new SqlDataAdapter(sql, new SqlConnection(str));
            sda.Fill(ds);
            return ds;
        }
    }
}