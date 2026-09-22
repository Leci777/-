using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    /// <summary>
    /// 数据访问基础类：单例方式管理一个 SqlConnection，
    /// 对外提供查询（Select / GetReader）和增删改（InsertUp）方法。
    /// </summary>
    public class DBHelper
    {
        // 连接字符串：改成你的本机 SQLEXPRESS 实例 + sa 密码
        public string Constr = "server=.\\SQLEXPRESS;database=blogWebsiteDB;uid=sa;pwd=123456";
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlDataAdapter sda;
        private DataSet ds;
        public static DBHelper helper;   // 单例实例

        public DBHelper()
        {
            conn = new SqlConnection(Constr);
        }

        /// <summary>
        /// 获取单例（inat 是 init 的笔误，为兼容旧代码保留此名）。
        /// </summary>
        public static DBHelper inat()
        {
            if (helper == null)
            {
                helper = new DBHelper();
            }
            return helper;
        }

        /// <summary>打开连接（已打开则不重复打开）。</summary>
        public void DBOpen()
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }

        /// <summary>关闭连接（已关闭则不重复关闭）。</summary>
        public void DBClose()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }

        /// <summary>
        /// 增删改通用方法。
        /// </summary>
        /// <returns>受影响行数大于 0 返回 true。</returns>
        public bool InsertUp(string sql)
        {
            DBOpen();
            cmd = new SqlCommand(sql, conn);
            try
            {
                return cmd.ExecuteNonQuery() > 0;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                DBClose();
            }
        }

        /// <summary>
        /// 查询返回 DataSet（断开式，查询完即关连接）。
        /// </summary>
        public DataSet Select(string sql)
        {
            DBOpen();
            sda = new SqlDataAdapter(sql, conn);
            ds = new DataSet();
            try
            {
                sda.Fill(ds);
                return ds;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                DBClose();
            }
        }

        /// <summary>
        /// 查询返回 SqlDataReader（连接式，读完自动关连接）。
        /// </summary>
        public SqlDataReader GetReader(string sql)
        {
            DBOpen();
            cmd = new SqlCommand(sql, conn);
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
    }
}
