using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    public class ThongbaoController : Controller
    {
        // GET: Thongbao
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult list()
        {
            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung = Helpers.Login.nguoidung().id;
                var list = data.thongbaos.Where(tt => tt.id_nguoidung == idnguoidung).ToList();
                return PartialView("list",list);

            }
        }
    }
}