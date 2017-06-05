using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class yeucaubanhang
    {
        public static bool kiemtrayeucau()//kiem tra xem nguoi dung da gui yeu cau hay
        {

            using (var data = new Models.daugiaEntities())
            {
                var yeucau = data.yeucaus.Where(yc => yc.tinhtrang == 1 && yc.id_nguoidung == Helpers.Login.nguoidung().id).FirstOrDefault();
                if (yeucau == null)
                    return false;
                return true;
            }

           
        }
    }
}