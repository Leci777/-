using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
     public class Guanzhu
    {
        public Guanzhu()
        {
        }

        public Guanzhu(int id, int userId, string name, string num, string count, string tt, string adderss, string url)
        {
            this.id = id;
            this.userId = userId;
            this.name = name;
            this.num = num;
            this.count = count;
            this.tt = tt;
            this.adderss = adderss;
            this.url = url;
        }

        public  int id { get; set; }
        public int userId { get; set; }
        public string name { get; set; }
        public string num { get; set; }
        public string count { get; set; }
        public string tt { get; set; }
        public string adderss { get; set; }
        public string url { get; set; }
    }
}
