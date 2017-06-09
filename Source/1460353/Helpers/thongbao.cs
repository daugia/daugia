using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class thongbao
    {
        public static void create(string noidung)
        {
            if (Helpers.Login.IsLogin())
            {
                using (var data = new Models.daugiaEntities())
                {
                    var idnguoidung = Helpers.Login.nguoidung().id;
                    var thongbao = new Models.thongbao()
                    {
                        id=0,
                        id_nguoidung = idnguoidung,
                        ngaytao = DateTime.Now,
                        noidung = noidung,
                        daxem=0
                    };
                    data.thongbaos.Add(thongbao);
                    data.SaveChanges();

                }
            }
        }
        public static int total()
        {
            if (Helpers.Login.IsLogin())
            {
                using (var data = new Models.daugiaEntities())
                {
                    var idnguoidung = Helpers.Login.nguoidung().id;
                    var total = data.thongbaos.Where(tt => tt.id_nguoidung == idnguoidung && tt.daxem == 0).Count();
                    return total;
                }
            }
            return 0;

        }
    }
}