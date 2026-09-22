
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public  class GuanzhuService
    {
        public static bool InsertGz(Guanzhu guanzhu)
        {
            string sql = $"insert into tb_Guanzhu (name,num,count,tt,adderss,url) values('{guanzhu.name}',{guanzhu.num}','{guanzhu.count}','{guanzhu.tt}','{guanzhu.adderss}','{guanzhu.url}')";
            return DBHelper.inat().InsertUp(sql);
        }
    }
}
