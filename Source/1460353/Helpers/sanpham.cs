using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class sanpham
    {
        public static Models.sanpham  get(int id)
        {
            using (var data=new Models.daugiaEntities())
            {
                var sanpham = data.sanphams.Find(id);
                return sanpham;
            }
           
        }
    }
}