using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DBHelper
    {
        public string Constr = "server=.;database=WeBolognDB;uid=sa;pwd=1";
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlDataAdapter sda;
        private DataSet ds;
        public static DBHelper helper;

        public DBHelper()
        {
            conn = new SqlConnection(Constr);
        }
        public static DBHelper inat()
        {
            if (helper == null)
            {
                helper = new DBHelper();
            }
            return helper;
        }
        public void DBOpen()
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        public void DBClose()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Open();
            }
        }
        //增加，删除，修改 方法
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
        //查询方法
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
        public SqlDataReader GetReader(string sql)
        {
            DBOpen();
            cmd = new SqlCommand(sql, conn);
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
    }
}

