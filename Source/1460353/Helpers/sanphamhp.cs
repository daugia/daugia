using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class sanphamhp
    {
        public static bool getTimein(DateTime date)//xet thoi gian san pham moi dang trong 1 h dong ho
        {
            var datenow = DateTime.Now;
            var q = datenow - date;
            return q.TotalMinutes <= 60 ? true : false;
        }
        public static Models.sanpham find(int id)
        {
            using(var data=new Models.daugiaEntities()){
                return data.sanphams.Find(id);
            }
        }
        public static List<Models.chinhsuachitietsp> list_edit(int id){
            using(var data=new Models.daugiaEntities()){
                return data.chinhsuachitietsps.Where(ct => ct.id_sanpham == id).OrderByDescending(ct => ct.thoigian).ToList();
            }
        }
    }
}