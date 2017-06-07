using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            if (TempData["Message"] != null)
            {
                ViewBag.Message = TempData["Message"].ToString();
                TempData.Remove("Message");
                return View();
            }
            using (var ctx = new Models.daugiaEntities())
            {
                var list = ctx.sanphams.OrderByDescending(p => p.giahientai).Take(5).ToList();
                return View(list);
            }

        }
        public PartialViewResult Top5SPGiaCao()
        {
            using (var ctx = new Models.daugiaEntities())
            {
                var list = ctx.sanphams.OrderByDescending(p => p.giahientai).Take(5).ToList();
                return PartialView("_Top05SPNhieuDauGia", list);
            }
        }
        public PartialViewResult Top5SPLuotDauCaoNhat()
        {
            using (var ctx = new Models.daugiaEntities())
            {
               // var list = ctx.lichsudaus.Where(p=> p.id_sanpham.)
                return PartialView("_SPCoNhieuLuotDaunhat", list);
            }
        }
        public PartialViewResult Top5SPGanKetThuc()
        {
            using (var ctx = new Models.daugiaEntities())
            {
                var list = ctx.sanphams.OrderByDescending(p => p.ngayketthuc).Take(5).ToList();
                return PartialView("_Top05SPGanHetHan", list);
            }
}