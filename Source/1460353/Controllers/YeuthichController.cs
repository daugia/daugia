using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    [Filters.LoginUser]
    public class YeuthichController : Controller
    {
        // GET: Yeuthich
        public ActionResult Index(int page=1)
        {
            ViewBag.page = page;
            ViewBag.pageTotal = Helpers.yeuthich.total() % 4 == 0 ? (Helpers.yeuthich.total() / 4) : (Helpers.yeuthich.total() /4) + 1;
            var listsanpham = Helpers.yeuthich.loaddanhsachsanpham();
            listsanpham = listsanpham.Skip((page - 1) * 4).Take(4).ToList();
            return View(listsanpham);
        }

        

        public ActionResult themyeuthich(int idsanpham)
        {
            using(var data=new Models.daugiaEntities()){
                var yeuthich = new Models.yeuthich()
                {
                    id_nguoidung=Helpers.Login.nguoidung().id,
                    id_sanpham=idsanpham
                };
                data.yeuthiches.Add(yeuthich);
                data.SaveChanges();
            }
            return Content("1", "text/plain");
        }
        public ActionResult xoayeuthich(int idsanpham)
        {
            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung=Helpers.Login.nguoidung().id;
                var yeuthich = data.yeuthiches.Where(yt => yt.id_sanpham == idsanpham && yt.id_nguoidung == idnguoidung).FirstOrDefault();
                data.yeuthiches.Remove(yeuthich);
                data.SaveChanges();
            }
            return Content("1", "text/plain");
        }
    }
}