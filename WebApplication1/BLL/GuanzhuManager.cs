using DAL;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class GuanzhuManager
    {
        public static bool InsertGz(Guanzhu guanzhu)
        {
            return GuanzhuService.InsertGz(guanzhu);
        }
        }
}
