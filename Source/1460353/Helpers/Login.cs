using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class Login
    {
        public static bool IsLogin()
        {
            var slogin = HttpContext.Current.Session["slogin"];// session login
            var clogin = HttpContext.Current.Request.Cookies["clogin"]; //cookie login
            if (slogin != null)
            {
                return true;
            }
            else
            {
                if (clogin != null)
                {
                    HttpContext.Current.Session["slogin"] = HttpContext.Current.Request.Cookies["clogin"].Value.ToString();
                    HttpContext.Current.Session["slogin_id"] = int.Parse(HttpContext.Current.Request.Cookies["clogin_id"].Value);
                    return true;
                }
            }
            return false;

        }
        public static Models.nguoidung nguoidung()
        {
            using (var data = new Models.daugiaEntities())
            {
                if (HttpContext.Current.Session["slogin"] != null)
                {
                    return data.nguoidungs.Find(HttpContext.Current.Session["slogin_id"]);
                }
                else
                {
                    return data.nguoidungs.Find(int.Parse(HttpContext.Current.Request.Cookies["clogin_id"].Value));
                }

            }
        }
        public static void Destroy()
        {

            HttpContext.Current.Session["slogin"] = null;
            HttpContext.Current.Session["slogin_id"] = null;
            HttpContext.Current.Response.Cookies["clogin"].Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies["clogin_id"].Expires = DateTime.Now.AddDays(-1);

        }
        public static List<Models.sanpham> listsell()
        {
            if (IsLogin())
            {
                using (var data = new Models.daugiaEntities())
                {
                    var idnguoidung = nguoidung().id;
                    var list = data.sanphams.Where(sp => sp.id_nguoidung == idnguoidung && sp.tinhtrang == 1 && sp.ngayketthuc >= DateTime.Now).OrderByDescending(sp=>sp.ngayketthuc).ToList();
                    return list;

                }
            }
            return null;
        }
    }
}