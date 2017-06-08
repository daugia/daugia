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

            return View();
        }
        public ActionResult Carousel()//top 5 san pham co gia cao nhat
        {
            using (var data=new Models.daugiaEntities())
            {
                var date =DateTime.Now;
                var list = data.sanphams.Where(sp => sp.tinhtrang == 1 && sp.ngayketthuc>date).OrderByDescending(sp => sp.giahientai ).Take(5).ToList();
                return PartialView("Carousel", list);

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
                var list = ctx.lichsudaus.ToList();
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
    }
}