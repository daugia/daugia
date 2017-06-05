using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class nguoidung
    {
        public static Models.nguoidung find(int id)
        {
            using(var data=new Models.daugiaEntities()){
                return data.nguoidungs.Find(id);
            }
        }
    }
}