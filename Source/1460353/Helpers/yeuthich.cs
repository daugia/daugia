using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class yeuthich
    {
        public static int total()
        {
            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung = Login.nguoidung().id;
                return data.yeuthiches.Where(yt => yt.id_nguoidung == idnguoidung).Count();
            }
        }
        public static bool isYeuthich(int idsanpham)
        {
            if (Helpers.Login.IsLogin())
            {
                using (var data = new Models.daugiaEntities())
                {
                    var idnguoidung = Login.nguoidung().id;
                    var yeuthich = data.yeuthiches.Where(yt => yt.id_nguoidung == idnguoidung && yt.id_sanpham == idsanpham).FirstOrDefault();
                    return yeuthich == null ? false : true;
                }
            }
            else
            {
                return false;
            }
            
        }
        public static List<Models.sanpham> loaddanhsachsanpham(){
            if(Helpers.Login.IsLogin()){
                var idnguoidung = Helpers.Login.nguoidung().id;
                using(var data=new Models.daugiaEntities()){
                    var listsanpham = data.yeuthiches.Join(data.sanphams, yt => yt.id_sanpham, sp => sp.id, (yt, sp) => new { yt, sp }).Where(l => l.yt.id_nguoidung == idnguoidung).Select(l=>l.sp).ToList();
                    return listsanpham;
                }
            }
            return null;
        }
    }
}